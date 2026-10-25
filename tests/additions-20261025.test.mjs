import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { additions20261025 } from "../data/additions-20261025.mjs";

test("the 25 October checklist is unique, bilingual and category-complete", () => {
  assert.equal(additions20261025.length, 101);
  assert.equal(new Set(additions20261025.map(place => place.name.toLowerCase())).size, 101);
  assert.deepEqual(
    Object.fromEntries([...new Set(additions20261025.map(place => place.category))].sort().map(category => [category, additions20261025.filter(place => place.category === category).length])),
    { BUILDING: 5, MUSEUM: 26, ODDITY: 11, PARK: 10, RELIGIOUS: 13, SHOPPING: 29, VIEWPOINT: 7 },
  );
  for (const place of additions20261025) {
    assert.ok(place.en.length >= 80, `${place.name} needs English context`);
    assert.ok(place.it.length >= 80, `${place.name} needs Italian context`);
    assert.ok(!place.officialUrl || place.officialUrl.startsWith("https://"), `${place.name} needs a secure source URL`);
    if (place.market) assert.ok(Object.keys(place.hours || {}).length > 0, `${place.name} needs verified market hours`);
  }
});

test("the migration targets aliases, enriches every record and archives duplicates", async () => {
  const migration = await readFile("migrations/0014_all_category_additions_20261025.sql", "utf8");
  assert.equal((migration.match(/^-- (?!Publish|The imported)/gm) || []).length, 101);
  assert.equal((migration.match(/mood_reviewed=1/g) || []).length, 101);
  assert.equal((migration.match(/INSERT INTO place_time_affinity/g) || []).length, 101);
  assert.match(migration, /ROW_NUMBER\(\) OVER .*datetime\(created_at\) DESC,id DESC/);
  assert.match(migration, /UPDATE app_meta SET value=CAST\(CAST\(value AS INTEGER\)\+1 AS TEXT\)/);
});

test("market and shop schedules include the researched priority locations", () => {
  const expectedHours = [
    "High Street Kensington Farmers’ Market", "Blackheath Farmers’ Market", "Notting Hill Farmers’ Market",
    "Pimlico Road Farmers’ Market", "Wimbledon Farmers’ Market", "Queen’s Park Farmers’ Market",
    "Islington Farmers’ Market", "South Kensington Farmers’ Market", "Marylebone Farmers’ Market",
    "Any Amount of Books", "Henry Pordes Books", "Foster Books", "Northcote Road Antiques Market",
    "Portobello Road Market", "Church Street Market", "London Silver Vaults",
  ];
  for (const name of expectedHours) {
    const place = additions20261025.find(item => item.name === name);
    assert.ok(place, `${name} is missing`);
    assert.ok(Object.keys(place.hours || {}).length > 0, `${name} has no hours`);
  }
});
