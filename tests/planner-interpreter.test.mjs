import assert from "node:assert/strict";
import test, { afterEach } from "node:test";

import { normalizePlannerIntent, PLANNER_INTENT_SCHEMA_VERSION } from "../src/planner-interpreter.js";
import { buildPlan } from "../public/planner/planner-core.js";
import worker from "../src/worker.js";

const originalFetch = globalThis.fetch;
const originalCaches = globalThis.caches;

afterEach(() => {
  globalThis.fetch = originalFetch;
  if (originalCaches === undefined) delete globalThis.caches;
  else globalThis.caches = originalCaches;
});

test("AI output is normalised without a neighbourhood or concept phrase dictionary", () => {
  const intent = normalizePlannerIntent(rawIntent({
    geography: [{ day: 0, role: "SCOPE", relation: "NEAR", query: "Hampstead", label: "Hampstead", radiusKm: 2.5 }],
    categoryPreferences: [{ category: "RELIGIOUS", strength: "PRIMARY", minStops: 4, maxStops: 6 }],
    experience: { label: "historic meeting houses", semanticTerms: ["meeting house", "chapel", "church"], strictCategory: true, strictConcept: true, compact: true },
  }));

  assert.equal(intent.schemaVersion, PLANNER_INTENT_SCHEMA_VERSION);
  assert.equal(intent.geography[0].query, "Hampstead");
  assert.equal(intent.geography[0].relation, "NEAR");
  assert.equal(intent.primaryCategory, "RELIGIOUS");
  assert.deepEqual(intent.experience.semanticTerms, ["meeting house", "chapel", "church"]);
});

test("AI contract preserves narrow primary concepts and exact category exclusions", () => {
  const intent = normalizePlannerIntent(rawIntent({
    categoryPreferences: [{ category: "SHOPPING", strength: "PRIMARY", minStops: 2, maxStops: 5 }],
    experience: { label: "market day", semanticTerms: ["market"], strictCategory: true, strictConcept: true, compact: false },
    exclusions: ["MUSEUM", "crowded places"],
  }));

  assert.equal(intent.experience.strictCategory, true);
  assert.equal(intent.experience.strictConcept, true);
  assert.equal(intent.marketFocus, true);
  assert.ok(intent.excludedCategories.includes("MUSEUM"));
  assert.deepEqual(intent.avoidTerms, ["crowded places"]);
});

test("a sole strict required category is normalised as the primary concept", () => {
  const intent = normalizePlannerIntent(rawIntent({
    categoryPreferences: [{ category: "RELIGIOUS", strength: "REQUIRED", minStops: 3, maxStops: 5 }],
    experience: { label: "church walk", semanticTerms: ["churches"], strictCategory: true, strictConcept: true, compact: true },
  }));
  assert.equal(intent.primaryCategory, "RELIGIOUS");
  assert.equal(intent.experience.strictCategory, true);
  assert.equal(intent.experience.strictConcept, true);
});

test("AI date, time-of-day and multiple refinement questions survive normalisation", () => {
  const intent = normalizePlannerIntent(rawIntent({
    days: 2,
    visitDate: "2026-11-07",
    timeOfDay: "morning",
    preferredWeekdays: ["saturday"],
    preferredMonths: ["november"],
    clarifications: [
      { id: "focus", question: "Which focus?", reason: "It changes the route.", options: [{ value: "markets", label: "Markets" }, { value: "parks", label: "Parks" }] },
      { id: "pace", question: "How intensive?", reason: "It changes stop count.", options: [{ value: "relaxed", label: "Relaxed" }, { value: "full", label: "Full" }] },
    ],
  }));
  assert.equal(intent.days, 1);
  assert.equal(intent.visitDate, "2026-11-07");
  assert.equal(intent.timeOfDay, "morning");
  assert.deepEqual(intent.preferredMonths, [11]);
  assert.equal(intent.clarifications.length, 2);
});

test("alternative broad areas and a multi-theme day remain distinct intent", () => {
  const intent = normalizePlannerIntent(rawIntent({
    scopeMode: "ANY",
    geography: [
      { day: 0, role: "SCOPE", relation: "NEAR", query: "Chiswick", label: "West London option", radiusKm: 4 },
      { day: 0, role: "SCOPE", relation: "NEAR", query: "Hampstead", label: "North-west London option", radiusKm: 4 },
    ],
    categoryPreferences: [
      { category: "RELIGIOUS", strength: "REQUIRED", minStops: 1, maxStops: 6, maxStopsExplicit: false },
      { category: "PARK", strength: "REQUIRED", minStops: 1, maxStops: 6, maxStopsExplicit: false },
      { category: "SHOPPING", strength: "REQUIRED", minStops: 1, maxStops: 6, maxStopsExplicit: false },
    ],
    experience: { label: "quiet contemplative day", semanticTerms: ["secondhand bookshop", "used books", "antiquarian books"], strictCategory: false, strictConcept: false, compact: true },
    breaks: [{ type: "LUNCH", required: true, durationMinutes: 90, earliestTime: "12:00", latestTime: "14:30", preference: "a long lunch alone" }],
    clarifications: [{ id: "area-anchor", question: "Which area should anchor the day?", reason: "It keeps the route coherent.", options: [
      { value: "west", label: "West London, in one compact neighbourhood" },
      { value: "north-west", label: "North-west London, in one compact neighbourhood" },
      { value: "best", label: "Use your best judgement" },
    ] }],
  }));

  assert.equal(intent.scopeMode, "ANY");
  assert.deepEqual(intent.categories.sort(), ["PARK", "RELIGIOUS", "SHOPPING"]);
  assert.equal(intent.primaryCategory, undefined);
  assert.equal(intent.experience.strictConcept, false);
  assert.equal(intent.breaks[0].durationMinutes, 90);
  assert.equal(intent.clarifications.length, 1);
});

test("alternative geographic scopes are treated as alternatives rather than an intersection", () => {
  const places = [
    fixture("w-church", "West Church", "RELIGIOUS", 51.5000, -0.2000, "A quiet parish church."),
    fixture("w-garden", "West Garden", "PARK", 51.5010, -0.2000, "A contemplative garden."),
    fixture("nw-books", "North-west Books", "SHOPPING", 51.5100, -0.2000, "A secondhand bookshop."),
    fixture("nw-garden", "North-west Garden", "PARK", 51.5110, -0.2000, "A quiet garden."),
  ];
  const scopes = [
    { day: 0, relation: "NEAR", label: "West", radiusKm: .4, center: { lat: 51.5000, lon: -.2000 } },
    { day: 0, relation: "NEAR", label: "North-west", radiusKm: .4, center: { lat: 51.5100, lon: -.2000 } },
  ];
  const plan = buildPlan(places, {
    days: 1, startDate: "2026-10-26", startTime: "09:00", endTime: "19:00", pace: "relaxed", transport: "walking",
    scopeMode: "ANY", geoScopes: scopes,
    categories: ["RELIGIOUS", "PARK", "SHOPPING"],
    categoryPreferences: [
      { category: "RELIGIOUS", strength: "REQUIRED", minStops: 1, maxStops: 6 },
      { category: "PARK", strength: "REQUIRED", minStops: 1, maxStops: 6 },
      { category: "SHOPPING", strength: "REQUIRED", minStops: 1, maxStops: 6 },
    ],
    experience: { semanticTerms: ["secondhand bookshop"], strictCategory: false, strictConcept: false, compact: true },
  });

  assert.equal(plan.days.length, 1);
  assert.ok(plan.days[0].stops.some((stop) => stop.place.id.startsWith("w-")));
  assert.ok(plan.days[0].stops.some((stop) => stop.place.id.startsWith("nw-")));
  assert.equal(plan.days[0].areaLabel, "West or North-west");
});

test("AI output preserves an explicit first visit as first-visitor context", () => {
  const intent = normalizePlannerIntent(rawIntent({
    familiarity: "first",
    pace: "balanced",
    transport: "mixed",
    geography: [
      { day: 0, role: "START", relation: "NEAR", query: "St Pancras International", label: "St Pancras", radiusKm: .5 },
      { day: 0, role: "END", relation: "NEAR", query: "St Pancras International", label: "St Pancras", radiusKm: .5 },
    ],
    categoryPreferences: [],
    experience: { label: "London essentials without a checklist", semanticTerms: [], strictCategory: false, strictConcept: false, compact: true },
    routePolicy: { style: "COMPACT", maxWalkingKm: 0 },
    insights: ["first visit", "London essentials", "selective, coherent route"],
  }));

  assert.equal(intent.familiarity, "first");
  assert.equal(intent.pace, "balanced");
  assert.equal(intent.transport, "mixed");
  assert.deepEqual(intent.categories, []);
  assert.deepEqual(intent.geography.map((item) => item.role), ["START", "END"]);
});

test("AI contract preserves a direct endpoint route, oddity focus and required lunch break", () => {
  const intent = normalizePlannerIntent(rawIntent({
    geography: [
      { day: 0, role: "START", relation: "NEAR", query: "Westminster Abbey", label: "Westminster Abbey", radiusKm: .5 },
      { day: 0, role: "END", relation: "NEAR", query: "Old Street Station", label: "Old Street", radiusKm: .5 },
    ],
    categoryPreferences: [{ category: "ODDITY", strength: "PRIMARY", minStops: 2, maxStops: 6 }],
    experience: { label: "oddities along the walk", semanticTerms: ["oddity", "curiosity"], strictCategory: true, strictConcept: false, compact: false },
    routePolicy: { style: "DIRECT", maxWalkingKm: 0 },
    breaks: [{ type: "LUNCH", required: true, durationMinutes: 60, earliestTime: "12:00", latestTime: "14:30", preference: "a nice lunch break" }],
  }));

  assert.deepEqual(intent.geography.map((item) => [item.role, item.query]), [
    ["START", "Westminster Abbey"], ["END", "Old Street Station"],
  ]);
  assert.equal(intent.primaryCategory, "ODDITY");
  assert.deepEqual(intent.routePolicy, { style: "DIRECT", maxWalkingKm: 0 });
  assert.deepEqual(intent.breaks, [{
    type: "LUNCH", required: true, durationMinutes: 60, earliestTime: "12:00", latestTime: "14:30", preference: "a nice lunch break",
  }]);
});

test("endpoint streets define the corridor without geocoding an invented between-area", () => {
  const intent = normalizePlannerIntent(rawIntent({
    geography: [
      { day: 0, role: "START", relation: "IN", query: "Baker Street", label: "Baker Street", radiusKm: .5 },
      { day: 0, role: "END", relation: "IN", query: "Lower Marsh", label: "Lower Marsh", radiusKm: .5 },
      { day: 0, role: "SCOPE", relation: "IN", query: "area between Baker Street and Lower Marsh", label: "area between Baker Street and Lower Marsh", radiusKm: 3 },
    ],
    categoryPreferences: [{ category: "RELIGIOUS", strength: "PRIMARY", minStops: 2, maxStops: 6 }],
  }));

  assert.deepEqual(intent.geography.map((item) => [item.role, item.query]), [
    ["START", "Baker Street"], ["END", "Lower Marsh"],
  ]);
  assert.equal(intent.primaryCategory, "RELIGIOUS");
});

test("an independently named area remains valid alongside route endpoints", () => {
  const intent = normalizePlannerIntent(rawIntent({
    geography: [
      { day: 0, role: "START", relation: "NEAR", query: "Baker Street", label: "Baker Street", radiusKm: .5 },
      { day: 0, role: "SCOPE", relation: "IN", query: "Bloomsbury", label: "Bloomsbury", radiusKm: 2 },
      { day: 0, role: "END", relation: "NEAR", query: "Lower Marsh", label: "Lower Marsh", radiusKm: .5 },
    ],
  }));

  assert.equal(intent.geography.find((item) => item.role === "SCOPE")?.query, "Bloomsbury");
});

test("AI category minimums do not become accidental stop ceilings", () => {
  const openEnded = normalizePlannerIntent(rawIntent({
    categoryPreferences: [{ category: "ODDITY", strength: "REQUIRED", minStops: 2, maxStops: 2, maxStopsExplicit: false }],
  }));
  const explicitlyCapped = normalizePlannerIntent(rawIntent({
    categoryPreferences: [{ category: "ODDITY", strength: "REQUIRED", minStops: 2, maxStops: 2, maxStopsExplicit: true }],
  }));

  assert.equal(openEnded.categoryPreferences[0].maxStops, 6);
  assert.equal(explicitlyCapped.categoryPreferences[0].maxStops, 2);
});

test("generic resolved geography and AI semantic terms are enforced without falling back elsewhere", () => {
  const kensingtonChurch = fixture("k1", "St Mary Abbots Church", "RELIGIOUS", 51.5008, -0.191, "A historic parish church in Kensington.");
  const kensingtonCemetery = fixture("k2", "Kensington Memorial Garden", "RELIGIOUS", 51.501, -0.195, "A landscaped cemetery and memorial garden.");
  const cityChurch = fixture("c1", "St Stephen Walbrook Church", "RELIGIOUS", 51.512, -0.09, "A church in the City of London.");
  const intent = normalizePlannerIntent(rawIntent({
    geography: [{ day: 0, role: "SCOPE", relation: "IN", query: "Kensington", label: "Kensington", radiusKm: 3 }],
    categoryPreferences: [{ category: "RELIGIOUS", strength: "PRIMARY", minStops: 3, maxStops: 6 }],
    experience: { label: "church walk", semanticTerms: ["church", "chapel", "cathedral", "abbey"], strictCategory: true, strictConcept: true, compact: true },
  }));
  const plan = buildPlan([kensingtonChurch, kensingtonCemetery, cityChurch], {
    ...intent,
    startDate: "2026-10-05",
    geoScopes: [{ ...intent.geography[0], center: { lat: 51.5008, lon: -0.191 },
      bounds: { south: 51.48, north: 51.52, west: -0.23, east: -0.15 } }],
  });

  assert.equal(plan.days.length, 1);
  assert.deepEqual(plan.days[0].stops.map((stop) => stop.place.id), ["k1"]);
  assert.ok(plan.warnings.some((warning) => /will not substitute another part of London/i.test(warning)));
});

test("planner interpretation endpoint uses Workers AI structured output and resolves arbitrary geography", async () => {
  let modelRequest;
  const geocodeQueries = [];
  globalThis.fetch = async (url) => {
    const requested = new URL(url);
    assert.equal(requested.hostname, "nominatim.openstreetmap.org");
    geocodeQueries.push(requested.searchParams.get("q"));
    if (/Kensington area/i.test(requested.searchParams.get("q"))) return Response.json([]);
    assert.match(requested.searchParams.get("q"), /Kensington, London, UK/i);
    return Response.json([{ display_name: "Kensington, London, United Kingdom", lat: "51.5008", lon: "-0.191",
      boundingbox: ["51.480", "51.520", "-0.230", "-0.150"], type: "suburb" }]);
  };
  const AI = { run: async (_model, request) => { modelRequest = request; return { response: rawIntent({
    geography: [{ day: 0, role: "SCOPE", relation: "IN", query: "Kensington area", label: "Kensington", radiusKm: 3 }],
    categoryPreferences: [{ category: "RELIGIOUS", strength: "PRIMARY", minStops: 4, maxStops: 6 }],
    experience: { label: "compact church walk", semanticTerms: ["church", "chapel", "cathedral", "abbey"], strictCategory: true, strictConcept: true, compact: true },
    insights: ["compact church walk", "in Kensington"],
  }) }; } };

  const response = await worker.fetch(new Request("https://example.com/api/planner/interpret", {
    method: "POST", headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ prompt: "A compact one day walk across the best churches in Kensington area" }),
  }), { PLANNER_ENABLED: "true", AI, GEOCODING_API_URL: "https://nominatim.openstreetmap.org/search", ASSETS: assets() }, context());
  const payload = await response.json();

  assert.equal(response.status, 200);
  assert.equal(payload.intent.primaryCategory, "RELIGIOUS");
  assert.equal(payload.intent.geoScopes[0].label, "Kensington");
  assert.equal(payload.intent.resolvedGeography[0].label, "Kensington");
  assert.deepEqual(payload.intent.geoScopes[0].bounds, { south: 51.48, north: 51.52, west: -0.23, east: -0.15 });
  assert.equal(payload.intent.routeStart, undefined);
  assert.deepEqual(geocodeQueries, ["Kensington area, London, UK", "Kensington, London, UK"]);
  assert.equal(modelRequest.response_format.type, "json_schema");
  assert.ok(modelRequest.response_format.json_schema.properties.routePolicy);
  assert.ok(modelRequest.response_format.json_schema.properties.breaks);
  assert.match(modelRequest.messages[0].content, /Do not invent a SCOPE/);
  assert.match(modelRequest.messages[0].content, /routePolicy=DIRECT/);
  assert.match(modelRequest.messages[0].content, /plural or collective request/);
  assert.match(modelRequest.messages[0].content, /First time.*familiarity=first/i);
  assert.match(modelRequest.messages[0].content, /not a checklist/i);
  assert.match(modelRequest.messages[0].content, /anchored loop/i);
  assert.match(modelRequest.messages[0].content, /scopeMode=ANY/);
  assert.match(modelRequest.messages[0].content, /multi-theme request/i);
  assert.match(modelRequest.messages[0].content, /long lunch.*75-90/i);
  assert.match(modelRequest.messages[1].content, /Kensington area/);
});

test("AI interpretation preserves an intermediate destination as a route waypoint", async () => {
  globalThis.fetch = async (url) => {
    const query = new URL(url).searchParams.get("q");
    const locations = {
      "Millbank Pier, London, UK": [51.4917, -.1248],
      "Greenwich, London, UK": [51.4821, -.0045],
      "Battersea Power Station, London, UK": [51.4818, -.1446],
    };
    const [lat, lon] = locations[query] || [];
    return Response.json(lat ? [{ display_name: query, lat: String(lat), lon: String(lon), boundingbox: [String(lat - .02), String(lat + .02), String(lon - .02), String(lon + .02)], type: "suburb" }] : []);
  };
  const AI = { run: async () => ({ response: rawIntent({
    transport: "river",
    geography: [
      { day: 0, role: "START", relation: "NEAR", query: "Millbank Pier", label: "Millbank Pier", radiusKm: .5 },
      { day: 0, role: "VIA", relation: "NEAR", query: "Greenwich", label: "Greenwich", radiusKm: .5 },
      { day: 0, role: "SCOPE", relation: "IN", query: "Greenwich", label: "Greenwich", radiusKm: 5 },
      { day: 0, role: "END", relation: "NEAR", query: "Battersea Power Station", label: "Battersea Power Station", radiusKm: .5 },
    ],
    categoryPreferences: [
      { category: "PARK", strength: "PREFERRED", minStops: 1, maxStops: 5 },
      { category: "VIEWPOINT", strength: "PREFERRED", minStops: 1, maxStops: 5 },
    ],
  }) }) };
  const response = await worker.fetch(new Request("https://example.com/api/planner/interpret", {
    method: "POST", headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ prompt: "Start at Millbank Pier, visit Greenwich parks, then finish at Battersea Power Station" }),
  }), { PLANNER_ENABLED: "true", AI, GEOCODING_API_URL: "https://nominatim.openstreetmap.org/search", ASSETS: assets() }, context());
  const payload = await response.json();
  assert.equal(response.status, 200);
  assert.equal(payload.intent.transport, "river");
  assert.equal(payload.intent.routeWaypoints[0].label, "Greenwich");
  assert.equal(payload.intent.geoScopes[0].label, "Greenwich");
  assert.equal(payload.intent.routeStart.label, "Millbank Pier");
  assert.equal(payload.intent.routeEnd.label, "Battersea Power Station");
});

test("planner interpretation fails explicitly when the AI binding is absent", async () => {
  const response = await worker.fetch(new Request("https://example.com/api/planner/interpret", {
    method: "POST", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ prompt: "A day around Richmond" }),
  }), { PLANNER_ENABLED: "true", ASSETS: assets() }, context());
  const payload = await response.json();
  assert.equal(response.status, 503);
  assert.equal(payload.code, "AI_INTERPRETER_UNAVAILABLE");
});

function rawIntent(overrides = {}) {
  return {
    days: 1, visitDate: "", timeOfDay: "flexible", startTime: "", endTime: "", pace: "balanced", transport: "walking", familiarity: "returning",
    scopeMode: "ALL", geography: [], categoryPreferences: [],
    experience: { label: "London day", semanticTerms: [], strictCategory: false, strictConcept: false, compact: false },
    routePolicy: { style: "UNSPECIFIED", maxWalkingKm: 0 }, breaks: [],
    moods: [], exclusions: [], mustInclude: [], outdoorMode: "ANY", museumScale: "ANY", crowdPreference: "ANY",
    touristPreference: "ANY", season: "unspecified", preferredWeekdays: [], preferredMonths: [], openEnded: false,
    assumptions: [], insights: [], clarifications: [], confidence: .92,
    ...overrides,
  };
}

function fixture(id, name, category, lat, lon, description) {
  return { id, name, category, lat, lon, description, hook: description, visitMinutes: 35, touristIntensity: 20,
    mapUrl: `https://maps.example/${id}`, officialUrl: `https://official.example/${id}`, moods: {},
    planning: { dataConfidence: "HIGH", plannerReady: true, accessType: "EXTERIOR_ONLY", descriptionQuality: "SPECIFIC",
      hoursStatus: "NOT_APPLICABLE", sourceUrl: `https://official.example/${id}`, openingPeriods: [], openingExceptions: [] } };
}

function assets() { return { fetch: async () => new Response("<!doctype html>") }; }
function context() { return { waitUntil() {}, passThroughOnException() {} }; }
