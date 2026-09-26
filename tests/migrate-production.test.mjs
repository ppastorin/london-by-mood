import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";
import { Miniflare, convertV4MiniflareOptions } from "miniflare";

test("the temporary migrator copies only authorised Cloudflare-internal batches", async () => {
  const migrationToken = crypto.randomUUID();
  const mf = new Miniflare(convertV4MiniflareOptions({
    workers: [{
      name: "d1-migration-test",
      modules: true,
      scriptPath: "src/migrate-production.js",
      compatibilityDate: "2026-09-03",
      d1Databases: { DEV_DB: "migration-source", PROD_DB: "migration-target" },
      bindings: { MIGRATION_TOKEN: migrationToken },
    }],
  }));
  try {
    const source = await mf.getD1Database("DEV_DB", "d1-migration-test");
    const target = await mf.getD1Database("PROD_DB", "d1-migration-test");
    const schema = await readFile("migrations/0001_places.sql", "utf8");
    await applySql(source, schema);
    await applySql(target, schema);
    await source.prepare(`INSERT INTO places(id,slug,name,category,latitude,longitude,status)
      VALUES ('LA-TEST','migration-place','Migration Place','AREA',51.5,-0.1,'published')`).run();
    await source.prepare("INSERT INTO place_time_affinity(place_id) VALUES ('LA-TEST')").run();
    await source.prepare(`INSERT INTO place_stations(place_id,position,station_id,station_name,distance_metres)
      VALUES ('LA-TEST',1,'940GZZLUXXX','Test Station',100)`).run();

    const denied = await mf.dispatchFetch("http://local.test/migrate", { method: "POST", body: "{}" });
    assert.equal(denied.status, 401);

    for (const table of ["places", "place_time_affinity", "place_stations"]) {
      const response = await mf.dispatchFetch("http://local.test/migrate", {
        method: "POST",
        headers: { Authorization: `Bearer ${migrationToken}`, "Content-Type": "application/json" },
        body: JSON.stringify({ table, offset: 0, limit: 50 }),
      });
      const payload = await response.json();
      assert.equal(response.status, 200, JSON.stringify(payload));
      assert.equal(payload.done, true);
      assert.equal(payload.sourceCount, 1);
      assert.equal(payload.targetCount, 1);
    }
    assert.equal((await target.prepare("SELECT COUNT(*) AS count FROM places").first()).count, 1);
    assert.equal((await target.prepare("SELECT COUNT(*) AS count FROM place_stations").first()).count, 1);
  } finally {
    await mf.dispose();
  }
});

async function applySql(db, source) {
  const statements = source.split(";").map((statement) => statement.trim()).filter(Boolean);
  for (let start = 0; start < statements.length; start += 50) {
    await db.batch(statements.slice(start, start + 50).map((statement) => db.prepare(statement)));
  }
}
