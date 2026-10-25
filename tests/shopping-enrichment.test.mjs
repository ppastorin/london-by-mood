import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { shoppingEnrichment } from "../data/shopping-enrichment.mjs";

const GENERIC = /suits slow browsing|quieter,? more local encounter|brings together browsing, people-watching|everyday sense of London|more character and local texture|conventional shopping stop|chance to step back from street level|best experienced slowly|walkable pocket with local texture/i;

test("all shopping places have unique bilingual place-specific editorial copy", async () => {
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  const places = snapshot.places.filter((place) => place.category === "SHOPPING");
  const activeSourceIds = new Set(shoppingEnrichment.map((place) => place.id).filter(id => id !== "LA-53DEB44D"));
  assert.equal(places.length, 69);
  assert.deepEqual(new Set(places.map((place) => place.id)), activeSourceIds);
  for (const field of ["description", "descriptionIt", "hook", "hookIt"]) assert.equal(new Set(places.map((place) => place[field])).size, 69, `${field} must be unique`);
  for (const place of places) {
    assert.ok(place.description.length >= 180, `${place.id} needs a richer English description`);
    assert.ok(place.descriptionIt.length >= 180, `${place.id} needs a richer Italian description`);
    assert.ok(place.hook.length >= 60, `${place.id} needs a specific English hook`);
    assert.ok(place.hookIt.length >= 60, `${place.id} needs a specific Italian hook`);
    for (const field of ["description", "descriptionIt", "hook", "hookIt"]) assert.doesNotMatch(place[field], GENERIC);
    assert.equal(place.lastVerified, "2026-10-18");
  }
});

test("the shopping migration updates and sources all records", async () => {
  const migration = await readFile("migrations/0011_shopping_editorial_enrichment.sql", "utf8");
  for (const { id, sourceUrl } of shoppingEnrichment) {
    assert.match(migration, new RegExp(`WHERE id='${id}' AND category='SHOPPING'`));
    assert.ok(migration.includes(sourceUrl.replaceAll("'", "''")), `${id} source is missing`);
  }
});

test("working, duplicate and misclassified locations are explicit", () => {
  const byId = new Map(shoppingEnrichment.map((place) => [place.id, place]));
  assert.match(byId.get("LA-CE3D5929").descriptionEn, /working wholesale/i);
  assert.match(byId.get("LA-5D7BD6DF").descriptionEn, /working wholesale/i);
  assert.match(byId.get("LA-4E68E539").descriptionEn, /same historic market, not a separate attraction/i);
  assert.match(byId.get("LA-B46237A3").descriptionEn, /same independent business/i);
  assert.match(byId.get("LA-53DEB44D").descriptionEn, /restaurant.*not.*retail market/i);
  assert.match(byId.get("LA-C5062EB0").descriptionEn, /no reliable current public retail presence/i);
});
