import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import { Miniflare, convertV4MiniflareOptions } from "miniflare";
import { buildPlan, interpretPrompt } from "../public/planner/planner-core.js";

const integrationToken = crypto.randomUUID();
const mf = new Miniflare(convertV4MiniflareOptions({
  workers: [{
    name: "london-places-integration",
    modules: [
      { type: "ESModule", path: "src/worker.js" },
      { type: "ESModule", path: "src/data-quality.js" },
    ],
    modulesRoot: ".",
    compatibilityDate: "2026-09-03",
    d1Databases: { DB: "london-advanced-places-dev" },
    bindings: {
      ADMIN_TOKEN: integrationToken,
      PLANNER_ENABLED: "true",
      GEOCODING_API_URL: "https://nominatim.openstreetmap.org/search",
    },
    assets: { directory: "public", binding: "ASSETS", run_worker_first: true, routerConfig: { has_user_worker: true } },
  }],
}));

const auth = { Authorization: `Bearer ${integrationToken}` };

try {
  const db = await mf.getD1Database("DB", "london-places-integration");
  await applySql(db, await readFile("migrations/0001_places.sql", "utf8"));
  await applySql(db, await readFile("migrations/0002_imports.sql", "utf8"));
  await applySql(db, await readFile("migrations/0003_planner_data_foundation.sql", "utf8"));
  await seedSnapshot(db, JSON.parse(await readFile("public/pois-snapshot.json", "utf8")));
  await applySql(db, await readFile("data/enrichment/generated/batch-1-candidates.sql", "utf8"));
  await applySql(db, await readFile("data/enrichment/generated/batch-2-candidates.sql", "utf8"));
  await applySql(db, await readFile("data/enrichment/generated/bermondsey-putney-corridor.sql", "utf8"));
  await applySql(db, await readFile("data/enrichment/generated/market-planner-candidates.sql", "utf8"));
  await applySql(db, await readFile("data/enrichment/generated/city-church-planner-candidates.sql", "utf8"));

  const health = await mf.dispatchFetch("http://local.test/health");
  const healthPayload = await health.json();
  assert.equal(health.status, 200, JSON.stringify(healthPayload));
  assert.equal(healthPayload.database, "d1");

  const publicResponse = await mf.dispatchFetch("http://local.test/api/pois");
  const publicPayload = await publicResponse.json();
  assert.equal(publicResponse.status, 200);
  assert.equal(publicPayload.count, 881);
  assert.equal(publicPayload.places.reduce((sum, place) => sum + place.stations.length, 0), 2128);

  const denied = await mf.dispatchFetch("http://local.test/admin/api/places?limit=1");
  assert.equal(denied.status, 401);

  const draft = {
    name: "Integration Test Place",
    category: "ODDITY",
    lat: 51.5074,
    lon: -0.1278,
    status: "draft",
    description: "Created by the local integration smoke test.",
    mapUrl: "https://www.google.com/maps?q=51.5074,-0.1278",
    moods: { unexpected: 3, local: 2 },
  };
  const created = await mf.dispatchFetch("http://local.test/admin/api/places", {
    method: "POST",
    headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify(draft),
  });
  const createdPayload = await created.json();
  assert.equal(created.status, 201);
  assert.match(createdPayload.id, /^LA-/);

  const edited = await mf.dispatchFetch(`http://local.test/admin/api/places/${createdPayload.id}`, {
    method: "PUT",
    headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify({ status: "published", hook: "A verified local test." }),
  });
  assert.equal(edited.status, 200);

  const saved = await mf.dispatchFetch(`http://local.test/admin/api/places/${createdPayload.id}`, { headers: auth });
  const savedPayload = await saved.json();
  assert.equal(savedPayload.place.status, "published");
  assert.equal(savedPayload.place.name, draft.name);
  assert.equal(savedPayload.place.hook, "A verified local test.");

  const smart = await mf.dispatchFetch("http://local.test/smart-navigation/");
  assert.equal(smart.status, 200);
  assert.match(await smart.text(), /Smart Navigation/);

  const plannerPage = await mf.dispatchFetch("http://local.test/planner/");
  assert.equal(plannerPage.status, 200);
  assert.match(await plannerPage.text(), /Planner · Increment 1/);
  const plannerResponse = await mf.dispatchFetch("http://local.test/api/planner/places?limit=1200");
  const plannerPayload = await plannerResponse.json();
  assert.equal(plannerResponse.status, 200, JSON.stringify(plannerPayload));
  assert.ok(plannerPayload.count >= 50, `Expected a useful curated pool, received ${plannerPayload.count}`);
  assert.ok(plannerPayload.places.every((place) => ["MEDIUM", "HIGH"].includes(place.planning.dataConfidence)));
  assert.ok(plannerPayload.places.every((place) => place.officialUrl));
  const detailedIntent = interpretPrompt("I want to spend two full days during the week, one west of Hyde Park and the second east of Holborn. I like small museums, parks and quirky things. I have already visited all the major destinations. I like walking, but I am confident to jump on a tube. I start very early and go back after dinner.");
  const detailedPlan = buildPlan(plannerPayload.places, { ...detailedIntent, startDate: "2026-10-05" });
  assert.equal(detailedPlan.days.length, 2);
  assert.ok(detailedPlan.days.every((day) => day.stops.length >= 3));
  assert.ok(detailedPlan.days[0].stops.every((stop) => stop.place.lon < -0.165));
  assert.ok(detailedPlan.days[1].stops.every((stop) => stop.place.lon > -0.118));

  const basicIntent = interpretPrompt("Recommend a two full days itinerary, avoiding the core areas around Piccadilly/Oxford St, no big museum, nice and uncommon places.");
  const basicPlan = buildPlan(plannerPayload.places, { ...basicIntent, startDate: "2026-10-05", areas: ["ANY", "ANY"] });
  assert.equal(basicPlan.days.length, 2);
  assert.ok(basicPlan.days.flatMap((day) => day.stops).every((stop) => !insideWestEndCore(stop.place)));

  const westIntent = interpretPrompt("I would like a plan for one day in west London, west of South Kensington. I like walking, nice areas and buildings, maybe some gardens and parks, and possibly an interesting museum, not the big ones. I like walking");
  const westPlan = buildPlan(plannerPayload.places, { ...westIntent, startDate: "2026-10-05" });
  assert.equal(westPlan.days.length, 1);
  assert.equal(westPlan.days[0].area, "WEST_SOUTH_KENSINGTON");
  assert.ok(westPlan.days[0].stops.length >= 3);
  assert.ok(westPlan.days[0].stops.every((stop) => stop.place.lon < -0.17));
  assert.ok(westPlan.days[0].stops.every((stop) => stop.place.name !== "Alexandra Palace"));
  assert.ok(westPlan.days[0].stops.filter((stop) => stop.place.category === "BUILDING" && stop.place.planning.accessType !== "EXTERIOR_ONLY")
    .every((stop) => stop.visitMinutes >= 60));

  const routeIntent = interpretPrompt('I want a one day itinerary south of the Thames, starting from Bermondsey and ending in Putney. Use a mix of walking and public transportation. Look for "wow" places, whether they are churches, areas, oddities, buildings. I need to be impressed');
  const routeStart = { label: "Bermondsey", lat: 51.4979, lon: -0.0637 };
  const routeEnd = { label: "Putney", lat: 51.4613, lon: -0.2161 };
  const routePlan = buildPlan(plannerPayload.places, { ...routeIntent, startDate: "2026-10-22", routeStart, routeEnd });
  assert.equal(routePlan.days.length, 1);
  assert.equal(routePlan.days[0].area, "SOUTH_THAMES");
  assert.equal(routePlan.days[0].routeLabel, "Bermondsey → Putney");
  assert.ok(routePlan.days[0].stops.length >= 4);
  assert.ok(routePlan.days[0].stops.some((stop) => ["Garden Museum", "Battersea Power Station", "The London Peace Pagoda", "Albert Bridge"].includes(stop.place.name)));
  assert.equal(new URL(routePlan.days[0].routeUrl).searchParams.get("destination"), `${routeEnd.lat},${routeEnd.lon}`);

  const northboundIntent = interpretPrompt("I need a one day itinerary starting from wimbledon and ending around st john's wood. No museums, just parks, uncommon places, historical locations and something that can be enjoyed more in autumn. I live walking, but the distances may be big, so happy to jump on the tube");
  const northboundPlan = buildPlan(plannerPayload.places, { ...northboundIntent, startDate: "2026-10-22",
    routeStart: { label: "Wimbledon", lat: 51.4214787, lon: -0.2064027 },
    routeEnd: { label: "St John's Wood", lat: 51.531726, lon: -0.1741901 } });
  assert.equal(northboundIntent.routeStartQuery, "Wimbledon");
  assert.equal(northboundIntent.routeEndQuery, "St John's Wood");
  assert.equal(northboundPlan.days.length, 1);
  assert.ok(northboundPlan.days[0].stops.length >= 3);
  assert.ok(northboundPlan.days[0].stops.every((stop) => stop.place.category !== "MUSEUM"));

  const startOnlyIntent = interpretPrompt("I need a one-day itinerary starting around Liverpool Street Station, without anything indoor, possibly with viewpoints not crowded and places where I can do some local shopping in a nice market");
  const liverpoolStreet = { label: "Liverpool Street Station", lat: 51.5178, lon: -0.0823 };
  const startOnlyPlan = buildPlan(plannerPayload.places, { ...startOnlyIntent, startDate: "2026-10-10", routeStart: liverpoolStreet });
  assert.equal(startOnlyIntent.routeStartQuery, "Liverpool Street Station");
  assert.equal(startOnlyIntent.routeEndQuery, undefined);
  assert.equal(startOnlyPlan.days.length, 1);
  assert.ok(startOnlyPlan.days[0].stops.length >= 3);
  assert.equal(startOnlyPlan.days[0].routeLabel, "From Liverpool Street Station");
  assert.ok(startOnlyPlan.days[0].stops.every((stop) => stop.place.planning.accessType === "EXTERIOR_ONLY"
    || (stop.place.planning.accessType === "ALWAYS_ACCESSIBLE" && ["AREA", "PARK", "VIEWPOINT"].includes(stop.place.category))
    || stop.place.category === "PARK" || (stop.place.category === "SHOPPING" && /market/i.test(`${stop.place.name} ${stop.place.description} ${stop.place.hook}`))));
  assert.equal(new URL(startOnlyPlan.days[0].routeUrl).searchParams.get("origin"), `${liverpoolStreet.lat},${liverpoolStreet.lon}`);

  const victoriaIntent = interpretPrompt("I want an itinerary for only one day, mainly outdoors, possibly with something green, not too crowded, but possibly with something artistic. It's ok to start anywhere around victoria, with no specific final destination");
  const victoria = { label: "Victoria", lat: 51.4950525, lon: -0.1448455 };
  const victoriaPlan = buildPlan(plannerPayload.places, { ...victoriaIntent, startDate: "2026-10-10", routeStart: victoria });
  assert.equal(victoriaIntent.routeStartQuery, "Victoria");
  assert.equal(victoriaIntent.routeEndQuery, undefined);
  assert.deepEqual(victoriaIntent.categories.sort(), ["MUSEUM", "PARK"]);
  assert.equal(victoriaIntent.needsIndoorClarification, true);
  assert.equal(victoriaPlan.days.length, 1);
  assert.ok(victoriaPlan.days[0].stops.length >= 3);
  assert.ok(victoriaPlan.days[0].stops.every((stop) => stop.place.name !== "Wilton's Music Hall"));
  assert.equal(new URL(victoriaPlan.days[0].routeUrl).searchParams.get("origin"), `${victoria.lat},${victoria.lon}`);
  assert.equal(new URL(victoriaPlan.days[0].routeUrl).searchParams.get("travelmode"), "walking");

  const marketIntent = interpretPrompt("I want to spend one day going through the best, non-touristic markets in London. I can do it on a Saturday or a Sunday and I can take the tube between places.");
  const marketPlan = buildPlan(plannerPayload.places, { ...marketIntent, startDate: "2026-10-10" });
  const marketNames = new Set(["Camden Passage", "Alfies Antique Market", "Primrose Hill Food Market", "Shepherd's Bush Market", "Victoria Park Market", "Wood Street Indoor Market", "Maltby Street Market", "Netil Market", "Broadway Market"]);
  assert.equal(marketIntent.marketFocus, true);
  assert.equal(marketIntent.weekendFlexible, true);
  assert.equal(marketPlan.days.length, 1);
  assert.ok(marketPlan.days[0].stops.length >= 4);
  assert.ok(marketPlan.days[0].stops.every((stop) => marketNames.has(stop.place.name)));
  assert.ok(marketPlan.days[0].stops.every((stop) => stop.place.name !== "Shepherd Market"));
  assert.ok(marketPlan.days[0].stops.every((stop) => stop.place.name !== "Victoria Park Market"));
  assert.ok(marketPlan.days[0].stops.slice(1).every((stop) => new URL(stop.legUrl).searchParams.get("travelmode") === "transit"));

  const sundayMarketPlan = buildPlan(plannerPayload.places, { ...marketIntent, startDate: "2026-10-11" });
  assert.equal(sundayMarketPlan.days.length, 1);
  assert.ok(sundayMarketPlan.days[0].stops.length >= 4,
    JSON.stringify(sundayMarketPlan.days[0].stops.map((stop) => `${stop.startTime}-${stop.endTime} ${stop.place.name}`)));
  assert.ok(sundayMarketPlan.days[0].stops.every((stop) => marketNames.has(stop.place.name)));
  assert.ok(sundayMarketPlan.days[0].stops.every((stop) => !["Alfies Antique Market", "Primrose Hill Food Market", "Shepherd's Bush Market", "Wood Street Indoor Market"].includes(stop.place.name)));

  const churchIntent = interpretPrompt("A nice a compact one day long walk across the best churches in the City");
  const churchPlan = buildPlan(plannerPayload.places, { ...churchIntent, startDate: "2026-10-06" });
  assert.deepEqual(churchIntent.areas, ["CITY_OF_LONDON"]);
  assert.equal(churchIntent.churchFocus, true);
  assert.equal(churchIntent.compactRoute, true);
  assert.equal(churchPlan.days.length, 1);
  assert.ok(churchPlan.days[0].stops.length >= 5);
  assert.ok(churchPlan.days[0].stops.every((stop) => stop.place.category === "RELIGIOUS"));
  assert.ok(churchPlan.days[0].stops.every((stop) => stop.place.lon >= -.1125 && stop.place.lon <= -.073));

  const revisions = await db.prepare("SELECT action FROM place_revisions WHERE place_id = ? ORDER BY revision_id").bind(createdPayload.id).all();
  assert.deepEqual(revisions.results.map((row) => row.action), ["create", "publish"]);

  const csv = `WKT,name,description\n"POINT (-0.1269566 51.5194133)",The British Museum,\n"POINT (0.4001 51.3001)",Integration CSV Place,A draft from the importer\n`;
  const preview = await mf.dispatchFetch("http://local.test/admin/api/imports/preview", {
    method: "POST", headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify({ filename: "integration.csv", sourceName: "Integration", csv }),
  });
  const previewPayload = await preview.json();
  assert.equal(preview.status, 200, JSON.stringify(previewPayload));
  assert.equal(previewPayload.counts.existing, 1);
  assert.equal(previewPayload.counts.new, 1);
  const newRow = previewPayload.candidates.find((candidate) => candidate.classification === "new").rowNumber;

  const committed = await mf.dispatchFetch("http://local.test/admin/api/imports/commit", {
    method: "POST", headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify({ batchId: previewPayload.batchId, rows: [newRow], category: "MUSEUM" }),
  });
  const committedPayload = await committed.json();
  assert.equal(committed.status, 201, JSON.stringify(committedPayload));
  assert.equal(committedPayload.created, 1);
  const imported = await db.prepare("SELECT status, source_type FROM places WHERE id = ?").bind(committedPayload.places[0].id).first();
  assert.deepEqual(imported, { status: "draft", source_type: "google-mymaps-csv" });

  const secondPreview = await mf.dispatchFetch("http://local.test/admin/api/imports/preview", {
    method: "POST", headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify({ filename: "integration.csv", sourceName: "Integration", csv }),
  });
  const secondPayload = await secondPreview.json();
  assert.equal(secondPayload.counts.new, 0);
  assert.equal(secondPayload.counts.existing, 2);

  console.log(JSON.stringify({
    places: publicPayload.count, plannerPlaces: plannerPayload.count, stations: 2128,
    adminCycle: "pass", csvImport: "pass", smartNavigator: "pass", planner: "pass",
    detailedExample: detailedPlan.days.map((day) => day.stops.map((stop) => stop.place.name)),
    basicExample: basicPlan.days.map((day) => day.stops.map((stop) => stop.place.name)),
    westExample: westPlan.days[0].stops.map((stop) => `${stop.startTime}-${stop.endTime} ${stop.place.name}`),
    routeExample: routePlan.days[0].stops.map((stop) => `${stop.startTime}-${stop.endTime} ${stop.place.name}`),
    northboundExample: northboundPlan.days[0].stops.map((stop) => `${stop.startTime}-${stop.endTime} ${stop.place.name}`),
    startOnlyExample: startOnlyPlan.days[0].stops.map((stop) => `${stop.startTime}-${stop.endTime} ${stop.place.name}`),
    victoriaExample: victoriaPlan.days[0].stops.map((stop) => `${stop.startTime}-${stop.endTime} ${stop.place.name}`),
    marketExample: marketPlan.days[0].stops.map((stop) => `${stop.startTime}-${stop.endTime} ${stop.place.name}`),
    sundayMarketExample: sundayMarketPlan.days[0].stops.map((stop) => `${stop.startTime}-${stop.endTime} ${stop.place.name}`),
    cityChurchExample: churchPlan.days[0].stops.map((stop) => `${stop.startTime}-${stop.endTime} ${stop.place.name}`),
  }));
} finally {
  await mf.dispose();
}

async function applySql(db, source) {
  const statements = splitSql(source).filter((statement) => !/^(?:BEGIN|COMMIT)(?:\s+TRANSACTION)?$/i.test(statement));
  for (let start = 0; start < statements.length; start += 75) {
    await db.batch(statements.slice(start, start + 75).map((statement) => db.prepare(statement)));
  }
}

function insideWestEndCore(place) {
  return place.lat >= 51.505 && place.lat <= 51.526 && place.lon >= -0.185 && place.lon <= -0.105;
}

async function seedSnapshot(db, snapshot) {
  const places = snapshot.places || [];
  const placeSql = `INSERT INTO places(id,slug,name,category,latitude,longitude,status,description_en,editorial_hook_en,
    official_url,guide_url,google_maps_url,access_type,access_notes_en,tourist_intensity,crowd_scope,visit_minutes,
    best_time,weather_fit,visit_mode,mood_quiet,mood_unexpected,mood_beautiful,mood_weird,mood_local,mood_green,
    mood_atmospheric,mood_lively,mood_reviewed,mood_confidence,last_verified_at)
    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;
  const affinityKeys = ["mon_thu_00_05", "mon_thu_06_10", "mon_thu_10_13", "mon_thu_13_17", "mon_thu_17_20",
    "mon_thu_20_24", "friday_00_05", "friday_06_10", "friday_10_13", "friday_13_17", "friday_17_20",
    "friday_20_24", "weekend_00_05", "weekend_06_10", "weekend_10_13", "weekend_13_17", "weekend_17_20",
    "weekend_20_24"];
  const affinitySql = `INSERT INTO place_time_affinity(place_id,${affinityKeys.join(",")}) VALUES (${affinityKeys.map(() => "?").join(",")},?)`;
  const stationSql = "INSERT INTO place_stations(place_id,position,station_id,station_name,distance_metres) VALUES (?,?,?,?,?)";
  for (let start = 0; start < places.length; start += 20) {
    const statements = [];
    for (const place of places.slice(start, start + 20)) {
      statements.push(db.prepare(placeSql).bind(
        place.id, `${slug(place.name)}-${place.id.toLowerCase().replace(/[^a-z0-9]+/g, "-")}`, place.name, place.category,
        place.lat, place.lon, "published", place.description || "", place.hook || "", place.officialUrl || "",
        place.guideUrl || "", place.mapUrl || `https://www.google.com/maps?q=${place.lat},${place.lon}`,
        place.accessType || "VARIABLE", place.accessNotes || "", place.touristIntensity ?? 30, place.crowdScope || "VENUE",
        place.visitMinutes ?? 30, place.bestTime || "ANY", place.weatherFit || "ANY", place.visitMode || "STOP",
        place.moods?.quiet ?? 0, place.moods?.unexpected ?? 0, place.moods?.beautiful ?? 0, place.moods?.weird ?? 0,
        place.moods?.local ?? 0, place.moods?.green ?? 0, place.moods?.atmospheric ?? 0, place.moods?.lively ?? 0,
        place.reviewed ? 1 : 0, place.confidence || "LOW", place.lastVerified || null));
      const affinity = place.timeAffinity || {};
      statements.push(db.prepare(affinitySql).bind(place.id, ...affinityKeys.map((key) => affinity[key] ?? 50)));
      for (const [index, station] of (place.stations || []).slice(0, 3).entries()) {
        statements.push(db.prepare(stationSql).bind(place.id, index + 1, "", station.name, station.distanceM));
      }
    }
    await db.batch(statements);
  }
}

function splitSql(source) {
  source = source.replace(/^\s*--.*$/gm, "");
  const statements = [];
  let current = "";
  let quoted = false;
  for (let index = 0; index < source.length; index += 1) {
    const character = source[index];
    if (character === "'") {
      if (quoted && source[index + 1] === "'") {
        current += "''";
        index += 1;
        continue;
      }
      quoted = !quoted;
    }
    if (character === ";" && !quoted) {
      if (current.trim()) statements.push(current.trim());
      current = "";
    } else {
      current += character;
    }
  }
  if (current.trim()) statements.push(current.trim());
  return statements;
}

function slug(value) { return String(value).normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 120) || "place"; }
