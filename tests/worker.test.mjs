import assert from "node:assert/strict";
import test, { afterEach } from "node:test";

import worker from "../src/worker.js";

const originalFetch = globalThis.fetch;

afterEach(() => {
  globalThis.fetch = originalFetch;
});

function context() {
  return { waitUntil() {}, passThroughOnException() {} };
}

test("health endpoint responds without the data source", async () => {
  const response = await worker.fetch(
    new Request("https://example.com/health"),
    { ASSETS: { fetch: async () => new Response("unused") } },
    context(),
  );
  assert.equal(response.status, 200);
  assert.deepEqual(await response.json(), { ok: true, service: "london-by-mood" });
});

test("POI endpoint validates and normalises the Google payload", async () => {
  globalThis.fetch = async () => Response.json({
    ok: true,
    schemaVersion: 1,
    generatedAt: "2026-09-03T12:00:00.000Z",
    count: 1,
    places: [{ id: "A1", name: "Test Place", lat: 51.5, lon: -0.1 }],
  });

  const response = await worker.fetch(
    new Request("https://example.com/api/pois"),
    {
      GOOGLE_SHEET_API_URL: "https://example.com/sheet",
      DATA_CACHE_SECONDS: "300",
      ASSETS: { fetch: async () => new Response("unused") },
    },
    context(),
  );
  const payload = await response.json();
  assert.equal(response.status, 200);
  assert.equal(response.headers.get("x-london-data-cache"), "MISS");
  assert.equal(payload.ok, true);
  assert.equal(payload.count, 1);
  assert.equal(payload.places[0].name, "Test Place");
});

test("address search is explicit, London-bounded and returns coordinates", async () => {
  let requestedUrl;
  let requestedHeaders;
  globalThis.fetch = async (request, init) => {
    requestedUrl = new URL(request);
    requestedHeaders = new Headers(init.headers);
    return Response.json([{
      display_name: "Westminster, London, SW1A 1AA, United Kingdom",
      lat: "51.501009",
      lon: "-0.141588",
    }]);
  };

  const response = await worker.fetch(
    new Request("https://example.com/api/geocode?q=SW1A%201AA"),
    {
      GEOCODING_API_URL: "https://nominatim.openstreetmap.org/search",
      GEOCODING_CACHE_SECONDS: "86400",
      ASSETS: { fetch: async () => new Response("unused") },
    },
    context(),
  );
  const payload = await response.json();
  assert.equal(response.status, 200);
  assert.equal(payload.ok, true);
  assert.equal(payload.result.lat, 51.501009);
  assert.equal(payload.result.lon, -0.141588);
  assert.equal(requestedUrl.searchParams.get("bounded"), "1");
  assert.equal(requestedUrl.searchParams.get("countrycodes"), "gb");
  assert.match(requestedHeaders.get("user-agent"), /LondonAdvanced-LondonByMood/);
});

test("static HTML is embeddable by the Google Sites validation and render origins", async () => {
  const response = await worker.fetch(
    new Request("https://example.com/"),
    {
      ASSETS: {
        fetch: async () => new Response("<!doctype html>", {
          headers: { "Content-Type": "text/html", "X-Frame-Options": "DENY" },
        }),
      },
    },
    context(),
  );
  const policy = response.headers.get("content-security-policy");
  assert.equal(response.headers.has("x-frame-options"), false);
  assert.equal(policy, "frame-ancestors *");
});
