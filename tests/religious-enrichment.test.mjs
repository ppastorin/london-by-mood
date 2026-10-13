import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { religiousEnrichment } from "../data/religious-enrichment.mjs";

const GENERIC = /atmospheric architectural stop|green pause and time away|quiet, atmospheric landscape/i;

test("all religious places have unique, bilingual, sourced editorial copy", async () => {
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  const religious = snapshot.places.filter((place) => place.category === "RELIGIOUS");
  const sourceIds = new Set(religiousEnrichment.map((place) => place.id));

  assert.equal(religious.length, 98);
  assert.equal(sourceIds.size, 98);
  assert.deepEqual(new Set(religious.map((place) => place.id)), sourceIds);
  assert.equal(new Set(religious.map((place) => place.hook)).size, 98);
  assert.equal(new Set(religious.map((place) => place.description)).size, 98);

  for (const place of religious) {
    assert.ok(place.description.length >= 180, `${place.id} needs a richer English description`);
    assert.ok(place.descriptionIt.length >= 180, `${place.id} needs a richer Italian description`);
    assert.ok(place.hook.length >= 60, `${place.id} needs a specific English hook`);
    assert.ok(place.hookIt.length >= 60, `${place.id} needs a specific Italian hook`);
    assert.doesNotMatch(place.hook, GENERIC, `${place.id} still has a generic hook`);
    assert.doesNotMatch(place.accessNotes, /source says 24\/7/i, `${place.id} has unsafe placeholder access notes`);
    assert.equal(place.lastVerified, "2026-10-13");
  }
});

test("the production migration updates and sources every religious record", async () => {
  const migration = await readFile("migrations/0003_religious_editorial_enrichment.sql", "utf8");
  assert.match(migration, /CREATE TABLE IF NOT EXISTS place_editorial_sources/);
  for (const { id, sourceUrl } of religiousEnrichment) {
    assert.match(migration, new RegExp(`WHERE id='${id}' AND category='RELIGIOUS'`));
    assert.ok(migration.includes(sourceUrl), `${id} source is missing from migration`);
  }
});
