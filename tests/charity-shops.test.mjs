import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const migrationPath = new URL("../migrations/0020_charity_shops.sql", import.meta.url);
const expansionPath = new URL("../migrations/0021_charity_shop_network_expansion.sql", import.meta.url);
const workerPath = new URL("../src/worker.js", import.meta.url);

test("charity shop migration adds a normalized category and 245 bilingual places", async () => {
  const sql = await readFile(migrationPath, "utf8");
  const placeRows = sql.match(/INSERT INTO places\s*\(/g) || [];
  const detailRows = sql.match(/INSERT INTO charity_shop_details\s*\(/g) || [];

  assert.match(sql, /CREATE TABLE IF NOT EXISTS charity_shop_details/);
  assert.match(sql, /'CHARITY_SHOP'/);
  assert.equal(placeRows.length, 245);
  assert.equal(detailRows.length, 245);
  assert.match(sql, /British Heart Foundation/);
  assert.match(sql, /Oxfam/);
  assert.match(sql, /Mary/);
  assert.match(sql, /curated-charity-inventory/);
});

test("charity shop expansion adds Cancer Research UK and British Red Cross", async () => {
  const sql = await readFile(expansionPath, "utf8");
  const placeRows = sql.match(/INSERT INTO places\s*\(/g) || [];
  const detailRows = sql.match(/INSERT INTO charity_shop_details\s*\(/g) || [];

  assert.equal(placeRows.length, 53);
  assert.equal(detailRows.length, 53);
  assert.equal((sql.match(/'Cancer Research UK'/g) || []).length, 39);
  assert.equal((sql.match(/'British Red Cross'/g) || []).length, 14);
  assert.match(sql, /british-red-cross-palmers-green-bookshop/);
  assert.match(sql, /'books_music'/);
  assert.match(sql, /british-red-cross-fulham-furniture-and-electrical/);
  assert.match(sql, /'furniture_electrical'/);
});

test("the public catalogue limit cannot truncate the charity-shop category", async () => {
  const worker = await readFile(workerPath, "utf8");
  assert.match(worker, /const DEFAULT_LIMIT = 2000/);
  assert.match(worker, /const MAX_LIMIT = 2000/);
});
