import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { viewpointEnrichment } from "../data/viewpoint-enrichment.mjs";

const GENERIC = /chance to step back from street level|broader view of London|green pause and time away|best experienced slowly|walkable pocket with local texture|distinctive London building|atmospheric architectural stop|rewards wandering|headline museums/i;

test("the original viewpoint enrichment remains unique, bilingual and place-specific", async () => {
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  const viewpoints = snapshot.places.filter((place) => place.category === "VIEWPOINT");
  const sourceIds = new Set(viewpointEnrichment.map((place) => place.id));
  const enrichedViewpoints = viewpoints.filter((place) => sourceIds.has(place.id));
  assert.equal(sourceIds.size, 43);
  assert.deepEqual(new Set(enrichedViewpoints.map((place) => place.id)), sourceIds);
  for (const field of ["description", "descriptionIt", "hook", "hookIt"]) {
    assert.equal(new Set(enrichedViewpoints.map((place) => place[field])).size, enrichedViewpoints.length, `${field} must be unique`);
  }
  for (const place of enrichedViewpoints) {
    assert.ok(place.description.length >= 180, `${place.id} needs a richer English description`);
    assert.ok(place.descriptionIt.length >= 180, `${place.id} needs a richer Italian description`);
    assert.ok(place.hook.length >= 60, `${place.id} needs a specific English hook`);
    assert.ok(place.hookIt.length >= 60, `${place.id} needs a specific Italian hook`);
    for (const field of ["description", "descriptionIt", "hook", "hookIt"]) assert.doesNotMatch(place[field], GENERIC);
    assert.ok(["2026-10-16", "2026-10-25"].includes(place.lastVerified));
  }
});

test("the viewpoint migration updates every record and stores a research source", async () => {
  const migration = await readFile("migrations/0010_viewpoint_editorial_enrichment.sql", "utf8");
  for (const { id, sourceUrl } of viewpointEnrichment) {
    assert.match(migration, new RegExp(`WHERE id='${id}' AND category='VIEWPOINT'`));
    assert.ok(migration.includes(sourceUrl.replaceAll("'", "''")), `${id} source is missing`);
  }
});

test("restricted and seasonal viewpoints are described accurately", () => {
  const byId = new Map(viewpointEnrichment.map((place) => [place.id, place]));
  assert.match(byId.get("LA-EFD89C75").descriptionEn, /not a general public viewpoint/i);
  assert.match(byId.get("LA-F8A41048").descriptionEn, /closed.*April 2027/i);
  assert.match(byId.get("LA-866FB84F").descriptionEn, /2026 season.*ended/i);
  assert.match(byId.get("V5").descriptionEn, /not open for casual daily access/i);
  assert.match(byId.get("LA-1C199D84").descriptionEn, /outside Greater London/i);
});
