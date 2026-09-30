import assert from "node:assert/strict";
import test from "node:test";

import { MAX_STOPS, buildGoogleMapsUrl, insertByRoutePosition, moveItem } from "../public/smart-navigation/itinerary.js";

test("Google Maps URL contains nine ordered walking waypoints and requests navigation", () => {
  const start = { lat: 51.47, lon: -.22 };
  const end = { lat: 51.58, lon: -.01 };
  const stops = Array.from({ length: MAX_STOPS }, (_, index) => ({ lat: 51.48 + index * .01, lon: -.2 + index * .02 }));
  const url = new URL(buildGoogleMapsUrl({ start, end, stops }));
  assert.equal(url.origin, "https://www.google.com");
  assert.equal(url.pathname, "/maps/dir/");
  assert.equal(url.searchParams.get("api"), "1");
  assert.equal(url.searchParams.get("origin"), "51.47,-0.22");
  assert.equal(url.searchParams.get("destination"), "51.58,-0.01");
  assert.equal(url.searchParams.get("travelmode"), "walking");
  assert.equal(url.searchParams.get("dir_action"), "navigate");
  assert.deepEqual(url.searchParams.get("waypoints").split("|"), stops.map((point) => `${point.lat},${point.lon}`));
});

test("Google Maps URL rejects a tenth stop", () => {
  const stops = Array.from({ length: MAX_STOPS + 1 }, () => ({ lat: 51.5, lon: -.1 }));
  assert.throws(() => buildGoogleMapsUrl({ start: { lat: 51.4, lon: -.2 }, end: { lat: 51.6, lon: 0 }, stops }), /up to 9/);
});

test("new selections are inserted in their natural route order", () => {
  const placesById = new Map([
    ["a", { id: "a", routePosition: 2 }],
    ["b", { id: "b", routePosition: 1 }],
    ["c", { id: "c", routePosition: 3 }],
  ]);
  assert.deepEqual(insertByRoutePosition(["a", "c"], placesById.get("b"), placesById), ["b", "a", "c"]);
});

test("itinerary stops can be reordered without mutating the original list", () => {
  const original = ["a", "b", "c"];
  assert.deepEqual(moveItem(original, 1, -1), ["b", "a", "c"]);
  assert.deepEqual(original, ["a", "b", "c"]);
  assert.deepEqual(moveItem(original, 0, -1), original);
});
