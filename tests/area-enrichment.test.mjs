import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { areaEnrichment } from "../data/area-enrichment.mjs";

const GENERIC = /best experienced slowly|walkable pocket with local texture|distinctive London area worth exploring|green pause and time away|chance to step back from street level|rewards wandering/i;

test("all area places have unique, bilingual, place-specific editorial copy", async () => {
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  const areas = snapshot.places.filter((place) => place.category === "AREA");
  const sourceIds = new Set(areaEnrichment.map((place) => place.id));

  assert.equal(areas.length, 143);
  assert.equal(sourceIds.size, 143);
  assert.deepEqual(new Set(areas.map((place) => place.id)), sourceIds);
  assert.equal(new Set(areas.map((place) => place.hook)).size, 143);
  assert.equal(new Set(areas.map((place) => place.description)).size, 143);

  for (const place of areas) {
    assert.ok(place.description.length >= 180, `${place.id} needs a richer English description`);
    assert.ok(place.descriptionIt.length >= 180, `${place.id} needs a richer Italian description`);
    assert.ok(place.hook.length >= 60, `${place.id} needs a specific English hook`);
    assert.ok(place.hookIt.length >= 60, `${place.id} needs a specific Italian hook`);
    assert.doesNotMatch(place.description, GENERIC, `${place.id} still has a generic description`);
    assert.doesNotMatch(place.hook, GENERIC, `${place.id} still has a generic hook`);
    assert.equal(place.lastVerified, "2026-10-14");
  }
});

test("the production migration updates every area record and records available sources", async () => {
  const migration = await readFile("migrations/0004_area_editorial_enrichment.sql", "utf8");
  assert.match(migration, /CREATE TABLE IF NOT EXISTS place_editorial_sources/);
  for (const { id, sourceUrl } of areaEnrichment) {
    assert.match(migration, new RegExp(`WHERE id='${id}' AND category='AREA'`));
    if (sourceUrl) assert.ok(migration.includes(sourceUrl), `${id} source is missing from migration`);
  }
});
