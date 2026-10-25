import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { parkEnrichment } from "../data/park-enrichment.mjs";

const GENERIC = /green pause and time away|best experienced slowly|walkable pocket with local texture|distinctive London building|atmospheric architectural stop|rewards wandering|headline museums/i;

test("the original park enrichment remains unique, bilingual and place-specific", async () => {
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  const parks = snapshot.places.filter((place) => place.category === "PARK");
  const sourceIds = new Set(parkEnrichment.map((place) => place.id));
  const enrichedParks = parks.filter((place) => sourceIds.has(place.id));
  assert.equal(sourceIds.size, 81);
  assert.deepEqual(new Set(enrichedParks.map((place) => place.id)), sourceIds);
  for (const field of ["description", "descriptionIt", "hook", "hookIt"]) {
    assert.equal(new Set(enrichedParks.map((place) => place[field])).size, enrichedParks.length, `${field} must be unique`);
  }
  for (const place of enrichedParks) {
    assert.ok(place.description.length >= 180, `${place.id} needs a richer English description`);
    assert.ok(place.descriptionIt.length >= 180, `${place.id} needs a richer Italian description`);
    assert.ok(place.hook.length >= 60, `${place.id} needs a specific English hook`);
    assert.ok(place.hookIt.length >= 60, `${place.id} needs a specific Italian hook`);
    assert.doesNotMatch(place.description, GENERIC, `${place.id} still has generic English copy`);
    assert.doesNotMatch(place.descriptionIt, GENERIC, `${place.id} still has generic Italian copy`);
    assert.doesNotMatch(place.hook, GENERIC, `${place.id} still has a generic English hook`);
    assert.doesNotMatch(place.hookIt, GENERIC, `${place.id} still has a generic Italian hook`);
    assert.ok(["2026-10-15", "2026-10-25"].includes(place.lastVerified));
  }
});

test("the park migration updates every record and stores a research source", async () => {
  const migration = await readFile("migrations/0009_park_editorial_enrichment.sql", "utf8");
  assert.match(migration, /CREATE TABLE IF NOT EXISTS place_editorial_sources/);
  for (const { id, sourceUrl } of parkEnrichment) {
    assert.match(migration, new RegExp(`WHERE id='${id}' AND category='PARK'`));
    assert.ok(migration.includes(sourceUrl.replaceAll("'", "''")), `${id} source is missing`);
  }
});

test("closed and restricted park-like pins cannot be presented as open public parks", () => {
  const byId = new Map(parkEnrichment.map((place) => [place.id, place]));
  assert.match(byId.get("LA-054E8E36").descriptionEn, /closed.*2026/i);
  assert.match(byId.get("LA-4B293650").descriptionEn, /closed.*September 2025/i);
  assert.match(byId.get("LA-20262752").descriptionEn, /no general public right of access/i);
  assert.match(byId.get("LA-AA9918B2").descriptionEn, /nursery.*not a freely accessible public garden/i);
});
