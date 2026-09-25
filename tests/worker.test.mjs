import assert from "node:assert/strict";
import test, { afterEach } from "node:test";

import worker, { __test } from "../src/worker.js";

const originalFetch = globalThis.fetch;
const originalCaches = globalThis.caches;

afterEach(() => {
  globalThis.fetch = originalFetch;
  if (originalCaches === undefined) delete globalThis.caches;
  else globalThis.caches = originalCaches;
});

function context() {
  return { waitUntil() {}, passThroughOnException() {} };
}

function assets() {
  return { fetch: async () => new Response("<!doctype html>", { headers: { "Content-Type": "text/html", "X-Frame-Options": "DENY" } }) };
}

test("health reports the D1 data version", async () => {
  const DB = {
    prepare(sql) {
      assert.match(sql, /app_meta/);
      return { first: async () => ({ value: "7" }) };
    },
  };
  const response = await worker.fetch(new Request("https://example.com/health"), { DB, ASSETS: assets() }, context());
  assert.equal(response.status, 200);
  assert.deepEqual(await response.json(), { ok: true, service: "london-places", database: "d1", dataVersion: "7" });
});

test("public POI reads chunk station lookups below D1's 100-bind limit", async () => {
  const rows = Array.from({ length: 205 }, (_, index) => ({
    id: `LA-${index}`, slug: `place-${index}`, name: `Place ${index}`, category: "AREA",
    latitude: 51.5, longitude: -0.1, status: "published", opening_hours_json: "{}",
  }));
  const stationChunkSizes = [];
  const DB = {
    prepare(sql) {
      return {
        bind(...values) {
          return {
            all: async () => {
              if (sql.includes("FROM places p")) return { results: rows };
              if (sql.includes("FROM place_stations")) {
                stationChunkSizes.push(values.length);
                return { results: values.map((id) => ({ place_id: id, position: 1, station_id: "S", station_name: "Station", distance_metres: 100 })) };
              }
              throw new Error(`Unexpected SQL: ${sql}`);
            },
          };
        },
      };
    },
  };
  const response = await worker.fetch(new Request("https://example.com/api/pois"), { DB, ASSETS: assets() }, context());
  const payload = await response.json();
  assert.equal(response.status, 200);
  assert.equal(payload.count, 205);
  assert.deepEqual(stationChunkSizes, [80, 80, 45]);
  assert.equal(payload.places[0].stations[0].name, "Station");
});

test("admin endpoints reject unauthenticated requests", async () => {
  const response = await worker.fetch(
    new Request("https://example.com/api/admin/places"),
    { DB: {}, ADMIN_TOKEN: "dev-secret", ASSETS: assets() },
    context(),
  );
  assert.equal(response.status, 401);
  assert.equal((await response.json()).error, "Admin authentication required");
});

test("address search is explicit, London-bounded and returns coordinates", async () => {
  let requestedUrl;
  let requestedHeaders;
  globalThis.fetch = async (request, init) => {
    requestedUrl = new URL(request);
    requestedHeaders = new Headers(init.headers);
    return Response.json([{ display_name: "Westminster, London, SW1A 1AA, United Kingdom", lat: "51.501009", lon: "-0.141588" }]);
  };
  const response = await worker.fetch(
    new Request("https://example.com/api/geocode?q=SW1A%201AA"),
    { GEOCODING_API_URL: "https://nominatim.openstreetmap.org/search", ASSETS: assets() },
    context(),
  );
  const payload = await response.json();
  assert.equal(response.status, 200);
  assert.equal(payload.result.lat, 51.501009);
  assert.equal(requestedUrl.searchParams.get("bounded"), "1");
  assert.equal(requestedUrl.searchParams.get("countrycodes"), "gb");
  assert.match(requestedHeaders.get("user-agent"), /LondonAdvanced-Places/);
});

test("Google Maps coordinate formats are accepted", () => {
  assert.deepEqual(__test.coordinatesFromText("https://maps.google.com/@51.501,-0.142,16z"), { lat: 51.501, lon: -0.142 });
  assert.deepEqual(__test.coordinatesFromText("https://maps.google.com/?q=51.501%2C-0.142"), { lat: 51.501, lon: -0.142 });
  assert.deepEqual(__test.coordinatesFromText("https://maps.google.com/?q=51.501,-0.142"), { lat: 51.501, lon: -0.142 });
});

test("place validation preserves editorial fields and defaults", () => {
  const place = __test.validatePlace({ name: "  Test place  ", category: "park", lat: 51.5, lon: -0.1, status: "draft", openingHours: { monday: "10–17" } }, null);
  assert.equal(place.name, "Test place");
  assert.equal(place.category, "PARK");
  assert.equal(place.visitMinutes, 30);
  assert.deepEqual(place.openingHours, { monday: "10–17" });
});

test("My Maps CSV parsing preserves quoted descriptions and coordinates", () => {
  const csv = 'WKT,name,description\r\n"POINT (-0.1269 51.5194)",The British Museum,"History, art and culture"\r\n';
  const parsed = __test.parseCsv(csv);
  assert.deepEqual(parsed.headers, ["WKT", "name", "description"]);
  assert.equal(parsed.rows[0][2], "History, art and culture");
  assert.deepEqual(__test.parseWktPoint(parsed.rows[0][0]), { lat: 51.5194, lon: -0.1269 });
});

test("CSV duplicate matching recognises renamed places at the same point", () => {
  const match = __test.closestPlaceMatch("Home of Charles Darwin - Down House", 51.331, 0.054, [
    { id: "P1", name: "Home of Charles Darwin", latitude: 51.331, longitude: 0.054 },
  ]);
  assert.equal(match.classification, "existing");
  assert.equal(match.place.id, "P1");
});

test("static HTML remains embeddable by Google Sites", async () => {
  const response = await worker.fetch(new Request("https://example.com/"), { ASSETS: assets() }, context());
  assert.equal(response.headers.has("x-frame-options"), false);
  assert.equal(response.headers.get("content-security-policy"), "frame-ancestors *");
});
