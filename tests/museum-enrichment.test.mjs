import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { museumEnrichment } from "../data/museum-enrichment.mjs";

const GENERIC = /focused cultural story beyond London|headline museums|walkable pocket with local texture|distinctive London building|best experienced slowly|source says 24\/7/i;

test("all museum places have unique, bilingual, place-specific editorial copy", async () => {
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  const museums = snapshot.places.filter((place) => place.category === "MUSEUM");
  const sourceIds = new Set(museumEnrichment.map((place) => place.id));
  assert.equal(museums.length, 206);
  assert.equal(sourceIds.size, 206);
  assert.deepEqual(new Set(museums.map((place) => place.id)), sourceIds);
  assert.equal(new Set(museums.map((place) => place.description)).size, 206);
  assert.equal(new Set(museums.map((place) => place.descriptionIt)).size, 206);
  assert.equal(new Set(museums.map((place) => place.hook)).size, 206);
  assert.equal(new Set(museums.map((place) => place.hookIt)).size, 206);
  for (const place of museums) {
    assert.ok(place.description.length >= 180, `${place.id} needs a richer English description`);
    assert.ok(place.descriptionIt.length >= 180, `${place.id} needs a richer Italian description`);
    assert.ok(place.hook.length >= 60, `${place.id} needs a specific English hook`);
    assert.ok(place.hookIt.length >= 60, `${place.id} needs a specific Italian hook`);
    assert.doesNotMatch(place.description, GENERIC, `${place.id} still has generic English copy`);
    assert.doesNotMatch(place.descriptionIt, GENERIC, `${place.id} still has generic Italian copy`);
    assert.doesNotMatch(place.hook, GENERIC, `${place.id} still has a generic hook`);
    assert.equal(place.lastVerified, "2026-10-14");
  }
});

test("the production migration updates every museum and records its source", async () => {
  const migration = await readFile("migrations/0006_museum_editorial_enrichment.sql", "utf8");
  assert.match(migration, /CREATE TABLE IF NOT EXISTS place_editorial_sources/);
  for (const { id, sourceUrl } of museumEnrichment) {
    assert.match(migration, new RegExp(`WHERE id='${id}' AND category='MUSEUM'`));
    assert.ok(migration.includes(sourceUrl.replaceAll("'", "''")), `${id} source is missing from migration`);
  }
});
