import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { buildingEnrichment } from "../data/building-enrichment.mjs";

const GENERIC = /distinctive London building worth noticing|walkable pocket with local texture|architectural detail and a strong sense of place|green pause and time away|best experienced slowly|source says 24\/7/i;

test("the original building enrichment remains unique, bilingual and place-specific", async () => {
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  const buildings = snapshot.places.filter((place) => place.category === "BUILDING");
  const sourceIds = new Set(buildingEnrichment.map((place) => place.id));
  const activeSourceIds = new Set([...sourceIds].filter(id => id !== "LA-A0081CBE"));
  const enrichedBuildings = buildings.filter((place) => activeSourceIds.has(place.id));

  assert.equal(sourceIds.size, 75);
  assert.deepEqual(new Set(enrichedBuildings.map((place) => place.id)), activeSourceIds);
  assert.equal(new Set(enrichedBuildings.map((place) => place.description)).size, enrichedBuildings.length);
  assert.equal(new Set(enrichedBuildings.map((place) => place.hook)).size, enrichedBuildings.length);

  for (const place of enrichedBuildings) {
    assert.ok(place.description.length >= 180, `${place.id} needs a richer English description`);
    assert.ok(place.descriptionIt.length >= 180, `${place.id} needs a richer Italian description`);
    assert.ok(place.hook.length >= 60, `${place.id} needs a specific English hook`);
    assert.ok(place.hookIt.length >= 60, `${place.id} needs a specific Italian hook`);
    assert.doesNotMatch(place.description, GENERIC, `${place.id} still has generic copy`);
    assert.doesNotMatch(place.hook, GENERIC, `${place.id} still has a generic hook`);
    assert.doesNotMatch(place.accessNotes, GENERIC, `${place.id} still has unsafe access notes`);
    assert.ok(["2026-10-14", "2026-10-25"].includes(place.lastVerified));
  }
});

test("the production migration updates every building and records available sources", async () => {
  const migration = await readFile("migrations/0005_building_editorial_enrichment.sql", "utf8");
  assert.match(migration, /CREATE TABLE IF NOT EXISTS place_editorial_sources/);
  for (const { id, sourceUrl } of buildingEnrichment) {
    assert.match(migration, new RegExp(`WHERE id='${id}' AND category='BUILDING'`));
    if (sourceUrl) assert.ok(migration.includes(sourceUrl), `${id} source is missing from migration`);
  }
});
