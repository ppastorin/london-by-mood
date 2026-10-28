import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { oddityEnrichment } from "../data/oddity-enrichment.mjs";

const GENERIC = /atmospheric stop|layered history|worth noticing|rewards wandering|best experienced slowly|local texture|everyday sense of London|offers a chance to|distinctive London/i;

test("all oddities have unique bilingual place-specific copy", async () => {
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  const places = snapshot.places.filter((place) => place.category === "ODDITY");
  assert.equal(places.length, 173);
  assert.deepEqual(new Set(places.map((place) => place.id)), new Set(oddityEnrichment.map((place) => place.id)));
  for (const field of ["description", "descriptionIt", "hook", "hookIt"]) assert.equal(new Set(places.map((place) => place[field])).size, 173, `${field} must be unique`);
  for (const place of places) {
    for (const field of ["description", "descriptionIt", "hook", "hookIt"]) { assert.ok(place[field]?.length >= 60, `${place.id} missing ${field}`); assert.doesNotMatch(place[field], GENERIC); }
    assert.ok(place.description.length >= 120); assert.ok(place.descriptionIt.length >= 120); assert.equal(place.lastVerified, "2026-10-28");
  }
});

test("oddity migration covers every record", async () => {
  const migration = await readFile("migrations/0018_oddity_editorial_enrichment.sql", "utf8");
  for (const { id } of oddityEnrichment) assert.match(migration, new RegExp(`WHERE id='${id}' AND category='ODDITY'`));
  assert.equal((migration.match(/UPDATE places SET/g) || []).length, 173);
});

test("private, closed and non-London records carry honest context", () => {
  const byId = new Map(oddityEnrichment.map((place) => [place.id, place]));
  assert.match(byId.get("LA-D05A4C05").descriptionEn, /private residence/i);
  assert.match(byId.get("LA-413EBC2E").descriptionEn, /no longer present/i);
  assert.match(byId.get("LA-8C880220").descriptionEn, /beyond Greater London/i);
  assert.match(byId.get("LA-E9371F5E").descriptionEn, /outside London/i);
});
