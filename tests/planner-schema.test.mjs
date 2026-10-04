import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { Miniflare, convertV4MiniflareOptions } from "miniflare";

test("planner data migration is additive and preserves legacy place fields", async () => {
  const mf = new Miniflare(convertV4MiniflareOptions({
    workers: [{
      name: "planner-schema-test",
      modules: true,
      script: "export default { fetch(){ return new Response('ok') } }",
      compatibilityDate: "2026-09-03",
      d1Databases: { DB: "planner-schema" },
    }],
  }));
  try {
    const db = await mf.getD1Database("DB", "planner-schema-test");
    for (const migration of ["0001_places.sql", "0002_imports.sql", "0003_planner_data_foundation.sql"]) {
      await applySql(db, await readFile(`migrations/${migration}`, "utf8"));
    }
    await db.prepare(`INSERT INTO places(id,slug,name,category,latitude,longitude,status,access_type)
      VALUES ('LA-LEGACY','legacy-place','Legacy Place','AREA',51.5,-0.1,'published','24H')`).run();
    await db.prepare("UPDATE places SET access_type_v2='ALWAYS_ACCESSIBLE' WHERE id='LA-LEGACY'").run();
    const row = await db.prepare(`SELECT name, access_type, access_type_v2, data_confidence, planner_ready,
      booking_mode, admission_type, access_clarity, hours_status FROM places WHERE id='LA-LEGACY'`).first();
    assert.deepEqual(row, {
      name: "Legacy Place",
      access_type: "24H",
      access_type_v2: "ALWAYS_ACCESSIBLE",
      booking_mode: "UNKNOWN",
      admission_type: "UNKNOWN",
      data_confidence: "LOW",
      planner_ready: 0,
      access_clarity: "UNREVIEWED",
      hours_status: "UNKNOWN",
    });
    const tables = await db.prepare(`SELECT name FROM sqlite_master WHERE type='table' AND name IN
      ('place_experiences','place_opening_periods','place_opening_exceptions','place_review_issues','enrichment_batches','enrichment_batch_places')`).all();
    assert.equal(tables.results.length, 6);
    assert.equal((await db.prepare("SELECT value FROM app_meta WHERE key='schema_version'").first()).value, "3");
  } finally {
    await mf.dispose();
  }
});

test("curated access decisions use supported independent access dimensions", async () => {
  const payload = JSON.parse(await readFile("data/enrichment/access-decisions.json", "utf8"));
  const ids = payload.records.map((record) => record.id);
  assert.equal(new Set(ids).size, ids.length);
  const accessTypes = new Set(["ALWAYS_ACCESSIBLE", "TIMETABLED", "SEASONAL", "BOOKING_REQUIRED",
    "EVENT_ONLY", "APPOINTMENT_ONLY", "EXTERIOR_ONLY", "CUSTOMER_ONLY", "PRIVATE_NO_PUBLIC_ACCESS", "UNKNOWN"]);
  const bookingModes = new Set(["NONE", "OPTIONAL", "RECOMMENDED", "REQUIRED", "UNKNOWN"]);
  const admissionTypes = new Set(["FREE", "PAID", "MIXED", "UNKNOWN"]);
  const decisionConfidences = new Set(["LOW", "MEDIUM", "HIGH"]);
  for (const record of payload.records) {
    assert.equal(accessTypes.has(record.accessType), true, record.id);
    assert.equal(bookingModes.has(record.bookingMode), true, record.id);
    assert.equal(admissionTypes.has(record.admissionType), true, record.id);
    assert.equal(decisionConfidences.has(record.decisionConfidence), true, record.id);
    assert.match(record.sourceUrl, /^https:\/\//, record.id);
    assert.match(record.checkedAt, /^\d{4}-\d{2}-\d{2}$/, record.id);
    assert.ok(record.rationale.length >= 40, record.id);
  }
});

async function applySql(db, source) {
  for (const statement of splitSql(source)) await db.prepare(statement).run();
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
