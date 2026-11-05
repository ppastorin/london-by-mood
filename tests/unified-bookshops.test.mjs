import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const migrationPath = new URL("../migrations/0022_unified_place_collections_and_bookshops.sql", import.meta.url);
const overlappingTypesPath = new URL("../migrations/0023_bookshop_overlapping_types.sql", import.meta.url);
const workerPath = new URL("../src/worker.js", import.meta.url);

test("bookshops use one canonical many-to-many place model", async () => {
  const sql = await readFile(migrationPath, "utf8");
  const detailRows = sql.match(/INSERT INTO bookshop_details\s*\(/g) || [];
  const collectionRows = sql.match(/'BOOKSHOP'\);/g) || [];

  assert.match(sql, /CREATE TABLE IF NOT EXISTS place_collections/);
  assert.match(sql, /PRIMARY KEY\(place_id, collection_code\)/);
  assert.match(sql, /CREATE TABLE IF NOT EXISTS bookshop_details/);
  assert.equal(detailRows.length, 124);
  assert.ok(collectionRows.length >= 124);
  assert.match(sql, /CS-OXFAM-EALING-BOOKSHOP/);
  assert.match(sql, /CS-OXFAM-MUSWELL-HILL-BOOKSHOP/);
  assert.match(sql, /CS-OXFAM-KENTISH-TOWN-BOOKS-MUSIC/);
  assert.doesNotMatch(sql, /WANSTEAD.*BOOKSHOP/i);
  assert.match(sql, /UPDATE places SET status='archived'.*LA-B46237A3/);
});

test("public APIs read bookshops and charity shops from canonical D1", async () => {
  const worker = await readFile(workerPath, "utf8");

  assert.match(worker, /url\.pathname === "\/api\/bookshops"/);
  assert.match(worker, /url\.pathname === "\/api\/charity-shops"/);
  assert.match(worker, /JOIN place_collections pc ON pc\.place_id = p\.id AND pc\.collection_code = 'BOOKSHOP'/);
  assert.match(worker, /JOIN place_collections pc ON pc\.place_id = p\.id AND pc\.collection_code = 'CHARITY_SHOP'/);
  assert.match(worker, /EXISTS \(\s*SELECT 1 FROM place_collections pc/);
  assert.match(worker, /type_tags: parseJsonArray\(row\.type_tags_json\)/);
  assert.match(worker, /schema_version: "2\.1"/);
});

test("rare, antiquarian and second-hand classifications can overlap", async () => {
  const sql = await readFile(overlappingTypesPath, "utf8");

  assert.match(sql, /ADD COLUMN type_tags_json/);
  assert.match(sql, /\["rare-antiquarian","second-hand"\]/);
  assert.match(sql, /lower\(stock_json\) LIKE '%second-hand%'/);
  assert.match(sql, /2026-11-05-bookshop-overlapping-types/);
});
