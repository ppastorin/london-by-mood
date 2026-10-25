import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { foodPlaces } from "../data/food-enrichment.mjs";

test("Food is a complete first-class bilingual category", async () => {
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  const food = snapshot.places.filter(place => place.category === "FOOD");
  assert.equal(foodPlaces.length, 97);
  assert.equal(food.length, 97);
  assert.equal(new Set(food.map(place => `${place.name}|${place.lat}|${place.lon}`)).size, 97);
  for (const place of food) {
    assert.equal(place.status, "published");
    assert.ok(place.description.length >= 75, `${place.name} needs English editorial copy`);
    assert.ok(place.descriptionIt.length >= 75, `${place.name} needs Italian editorial copy`);
    assert.ok(place.hook.length >= 35, `${place.name} needs an English hook`);
    assert.ok(place.hookIt.length >= 35, `${place.name} needs an Italian hook`);
    assert.equal(place.lastVerified, "2026-10-25");
  }
});

test("the Food migration deduplicates the source and reclassifies existing places", async () => {
  const migration = await readFile("migrations/0013_food_category.sql", "utf8");
  assert.match(migration, /98 source rows, 97 distinct locations, one exact duplicate removed/);
  assert.match(migration, /VALUES \('FOOD','Food','Cibo',8\)/);
  assert.equal((migration.match(/INSERT INTO places\(/g) || []).length, 94);
  for (const id of ["LA-6B9A4DFD", "LA-A0081CBE", "LA-53DEB44D"]) {
    assert.match(migration, new RegExp(`UPDATE places SET [^\\n]+ WHERE id='${id}'`));
  }
});

test("Food is selectable in the editor and Smart Navigation", async () => {
  const [worker, admin, navigation] = await Promise.all([
    readFile("src/worker.js", "utf8"),
    readFile("public/admin/index.html", "utf8"),
    readFile("public/smart-navigation/app.js", "utf8"),
  ]);
  assert.match(worker, /"SHOPPING", "FOOD", "VIEWPOINT"/);
  assert.ok((admin.match(/<option>FOOD<\/option>/g) || []).length >= 2);
  assert.match(navigation, /FOOD:"Food"/);
  assert.match(navigation, /FOOD:"Cibo"/);
});

