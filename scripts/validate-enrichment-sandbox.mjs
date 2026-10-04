import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import { Miniflare, convertV4MiniflareOptions } from "miniflare";

const mf = new Miniflare(convertV4MiniflareOptions({
  workers: [{
    name: "enrichment-sandbox",
    modules: true,
    script: "export default { fetch(){ return new Response('sandbox') } }",
    compatibilityDate: "2026-09-03",
    d1Databases: { DB: "enrichment-sandbox" },
  }],
}));

try {
  const db = await mf.getD1Database("DB", "enrichment-sandbox");
  for (const migration of ["0001_places.sql", "0002_imports.sql", "0003_planner_data_foundation.sql"]) {
    await applySql(db, await readFile(`migrations/${migration}`, "utf8"));
  }
  const snapshot = JSON.parse(await readFile("public/pois-snapshot.json", "utf8"));
  await seedSnapshot(db, snapshot.places);
  const before = await db.prepare("SELECT COUNT(*) AS count FROM places").first();
  assert.equal(before.count, 881);
  const candidateSql = await Promise.all(["batch-1-candidates.sql", "batch-2-candidates.sql"]
    .map((filename) => readFile(`data/enrichment/generated/${filename}`, "utf8")));
  for (const sql of candidateSql) await applySql(db, sql);
  const after = await db.prepare("SELECT COUNT(*) AS count FROM places").first();
  assert.equal(after.count, 881, "candidate enrichment must not add or delete places");
  const batches = await db.prepare(`SELECT batch_code, COUNT(*) AS count FROM enrichment_batch_places
    GROUP BY batch_code ORDER BY batch_code`).all();
  assert.deepEqual(batches.results, [{ batch_code: "BATCH-1", count: 118 }, { batch_code: "BATCH-2", count: 330 }]);
  const legacy = await db.prepare("SELECT COUNT(*) AS count FROM places WHERE access_type IN ('24H','VARIABLE','TICKETED','SEASONAL')").first();
  assert.equal(legacy.count, 881, "legacy access values must remain unchanged");
  const quality = await db.prepare(`SELECT data_confidence, planner_ready, COUNT(*) AS count FROM places
    GROUP BY data_confidence, planner_ready ORDER BY data_confidence, planner_ready`).all();
  const integrity = await db.prepare("PRAGMA foreign_key_check").all();
  assert.equal(integrity.results.length, 0);
  const firstCounts = await enrichmentCounts(db);
  for (const sql of candidateSql) await applySql(db, sql);
  assert.deepEqual(await enrichmentCounts(db), firstCounts, "candidate enrichment must be safe to retry");
  console.log(JSON.stringify({ places: after.count, batches: batches.results, quality: quality.results,
    openReviewIssues: firstCounts.openReviewIssues, sources: firstCounts.sources,
    openingPeriods: firstCounts.openingPeriods, retrySafe: true,
    foreignKeyErrors: integrity.results.length }, null, 2));
} finally {
  await mf.dispose();
}

async function enrichmentCounts(db) {
  return {
    openReviewIssues: (await db.prepare("SELECT COUNT(*) AS count FROM place_review_issues WHERE status='OPEN'").first()).count,
    sources: (await db.prepare("SELECT COUNT(*) AS count FROM place_sources").first()).count,
    openingPeriods: (await db.prepare("SELECT COUNT(*) AS count FROM place_opening_periods").first()).count,
  };
}

async function seedSnapshot(db, places) {
  const sql = `INSERT INTO places(id,slug,name,category,latitude,longitude,status,description_en,editorial_hook_en,
    official_url,google_maps_url,access_type,access_notes_en,tourist_intensity,visit_minutes,best_time,weather_fit,
    visit_mode,mood_quiet,mood_unexpected,mood_beautiful,mood_weird,mood_local,mood_green,mood_atmospheric,
    mood_lively,mood_reviewed,mood_confidence,last_verified_at)
    VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;
  for (let start = 0; start < places.length; start += 50) {
    await db.batch(places.slice(start, start + 50).map((place) => db.prepare(sql).bind(
      place.id, `${slug(place.name)}-${place.id.toLowerCase().replace(/[^a-z0-9]+/g, "-")}`, place.name, place.category,
      place.lat, place.lon, "published", place.description || "", place.hook || "", place.officialUrl || "",
      place.mapUrl || `https://www.google.com/maps?q=${place.lat},${place.lon}`, place.accessType || "VARIABLE",
      place.accessNotes || "", place.touristIntensity ?? 30, place.visitMinutes ?? 30, place.bestTime || "ANY",
      place.weatherFit || "ANY", place.visitMode || "STOP", place.moods?.quiet ?? 0, place.moods?.unexpected ?? 0,
      place.moods?.beautiful ?? 0, place.moods?.weird ?? 0, place.moods?.local ?? 0, place.moods?.green ?? 0,
      place.moods?.atmospheric ?? 0, place.moods?.lively ?? 0, place.reviewed ? 1 : 0, place.confidence || "LOW",
      place.lastVerified || null,
    )));
  }
}

async function applySql(db, source) {
  for (const statements of chunks(splitSql(source), 50)) await db.batch(statements.map((statement) => db.prepare(statement)));
}

function splitSql(source) {
  source = source.replace(/^\s*--.*$/gm, "");
  const statements = [];
  let current = "", quoted = false;
  for (let index = 0; index < source.length; index += 1) {
    const character = source[index];
    if (character === "'") {
      if (quoted && source[index + 1] === "'") { current += "''"; index += 1; continue; }
      quoted = !quoted;
    }
    if (character === ";" && !quoted) { if (current.trim()) statements.push(current.trim()); current = ""; }
    else current += character;
  }
  if (current.trim()) statements.push(current.trim());
  return statements.filter((statement) => !/^PRAGMA\s+/i.test(statement));
}

function chunks(values, size) { const result = []; for (let index = 0; index < values.length; index += size) result.push(values.slice(index, index + size)); return result; }
function slug(value) { return String(value).normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 120) || "place"; }
