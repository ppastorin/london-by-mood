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

test("AI contract safeguards primary concepts and exact category exclusions generically", () => {
  const intent = normalizePlannerIntent(rawIntent({
    categoryPreferences: [{ category: "SHOPPING", strength: "PRIMARY", minStops: 2, maxStops: 5 }],
    experience: { label: "market day", semanticTerms: ["market"], strictCategory: false, strictConcept: false, compact: false },
    exclusions: ["MUSEUM", "crowded places"],
  }));

  assert.equal(intent.experience.strictCategory, true);
  assert.equal(intent.experience.strictConcept, true);
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
  assert.deepEqual(payload.intent.geoScopes[0].bounds, { south: 51.48, north: 51.52, west: -0.23, east: -0.15 });
  assert.equal(payload.intent.routeStart, undefined);
  assert.deepEqual(geocodeQueries, ["Kensington area, London, UK", "Kensington, London, UK"]);
  assert.equal(modelRequest.response_format.type, "json_schema");
  assert.match(modelRequest.messages[1].content, /Kensington area/);
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
    days: 1, startTime: "", endTime: "", pace: "balanced", transport: "walking", familiarity: "returning",
    geography: [], categoryPreferences: [],
    experience: { label: "London day", semanticTerms: [], strictCategory: false, strictConcept: false, compact: false },
    moods: [], exclusions: [], mustInclude: [], outdoorMode: "ANY", museumScale: "ANY", crowdPreference: "ANY",
    touristPreference: "ANY", season: "unspecified", preferredWeekdays: [], openEnded: false,
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
