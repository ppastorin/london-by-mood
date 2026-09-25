import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import { Miniflare, convertV4MiniflareOptions } from "miniflare";

const mf = new Miniflare(convertV4MiniflareOptions({
  workers: [{
    name: "london-places-integration",
    modules: true,
    scriptPath: "src/worker.js",
    compatibilityDate: "2026-09-03",
    d1Databases: { DB: "london-advanced-places-dev" },
    bindings: {
      ADMIN_TOKEN: "dev-test-token",
      GEOCODING_API_URL: "https://nominatim.openstreetmap.org/search",
    },
    assets: { directory: "public", binding: "ASSETS", run_worker_first: true, routerConfig: { has_user_worker: true } },
  }],
}));

const auth = { Authorization: "Bearer dev-test-token" };

try {
  const db = await mf.getD1Database("DB", "london-places-integration");
  await applySql(db, await readFile("migrations/0001_places.sql", "utf8"));
  await applySql(db, await readFile("migrations/0002_imports.sql", "utf8"));
  await applySql(db, await readFile("db/seed.sql", "utf8"));

  const health = await mf.dispatchFetch("http://local.test/health");
  const healthPayload = await health.json();
  assert.equal(health.status, 200, JSON.stringify(healthPayload));
  assert.equal(healthPayload.database, "d1");

  const publicResponse = await mf.dispatchFetch("http://local.test/api/pois");
  const publicPayload = await publicResponse.json();
  assert.equal(publicResponse.status, 200);
  assert.equal(publicPayload.count, 881);
  assert.equal(publicPayload.places.reduce((sum, place) => sum + place.stations.length, 0), 2128);

  const denied = await mf.dispatchFetch("http://local.test/api/admin/places?limit=1");
  assert.equal(denied.status, 401);

  const draft = {
    name: "Integration Test Place",
    category: "ODDITY",
    lat: 51.5074,
    lon: -0.1278,
    status: "draft",
    description: "Created by the local integration smoke test.",
    mapUrl: "https://www.google.com/maps?q=51.5074,-0.1278",
    moods: { unexpected: 3, local: 2 },
  };
  const created = await mf.dispatchFetch("http://local.test/api/admin/places", {
    method: "POST",
    headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify(draft),
  });
  const createdPayload = await created.json();
  assert.equal(created.status, 201);
  assert.match(createdPayload.id, /^LA-/);

  const edited = await mf.dispatchFetch(`http://local.test/api/admin/places/${createdPayload.id}`, {
    method: "PUT",
    headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify({ status: "published", hook: "A verified local test." }),
  });
  assert.equal(edited.status, 200);

  const saved = await mf.dispatchFetch(`http://local.test/api/admin/places/${createdPayload.id}`, { headers: auth });
  const savedPayload = await saved.json();
  assert.equal(savedPayload.place.status, "published");
  assert.equal(savedPayload.place.name, draft.name);
  assert.equal(savedPayload.place.hook, "A verified local test.");

  const smart = await mf.dispatchFetch("http://local.test/smart-navigation/");
  assert.equal(smart.status, 200);
  assert.match(await smart.text(), /Smart Navigation/);

  const revisions = await db.prepare("SELECT action FROM place_revisions WHERE place_id = ? ORDER BY revision_id").bind(createdPayload.id).all();
  assert.deepEqual(revisions.results.map((row) => row.action), ["create", "publish"]);

  const csv = `WKT,name,description\n"POINT (-0.1269566 51.5194133)",The British Museum,\n"POINT (0.4001 51.3001)",Integration CSV Place,A draft from the importer\n`;
  const preview = await mf.dispatchFetch("http://local.test/api/admin/imports/preview", {
    method: "POST", headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify({ filename: "integration.csv", sourceName: "Integration", csv }),
  });
  const previewPayload = await preview.json();
  assert.equal(preview.status, 200, JSON.stringify(previewPayload));
  assert.equal(previewPayload.counts.existing, 1);
  assert.equal(previewPayload.counts.new, 1);
  const newRow = previewPayload.candidates.find((candidate) => candidate.classification === "new").rowNumber;

  const committed = await mf.dispatchFetch("http://local.test/api/admin/imports/commit", {
    method: "POST", headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify({ batchId: previewPayload.batchId, rows: [newRow], category: "MUSEUM" }),
  });
  const committedPayload = await committed.json();
  assert.equal(committed.status, 201, JSON.stringify(committedPayload));
  assert.equal(committedPayload.created, 1);
  const imported = await db.prepare("SELECT status, source_type FROM places WHERE id = ?").bind(committedPayload.places[0].id).first();
  assert.deepEqual(imported, { status: "draft", source_type: "google-mymaps-csv" });

  const secondPreview = await mf.dispatchFetch("http://local.test/api/admin/imports/preview", {
    method: "POST", headers: { ...auth, "Content-Type": "application/json" },
    body: JSON.stringify({ filename: "integration.csv", sourceName: "Integration", csv }),
  });
  const secondPayload = await secondPreview.json();
  assert.equal(secondPayload.counts.new, 0);
  assert.equal(secondPayload.counts.existing, 2);

  console.log(JSON.stringify({ places: publicPayload.count, stations: 2128, adminCycle: "pass", csvImport: "pass", smartNavigator: "pass" }));
} finally {
  await mf.dispose();
}

async function applySql(db, source) {
  const statements = splitSql(source).filter((statement) => !/^(?:BEGIN|COMMIT)(?:\s+TRANSACTION)?$/i.test(statement));
  for (let start = 0; start < statements.length; start += 75) {
    await db.batch(statements.slice(start, start + 75).map((statement) => db.prepare(statement)));
  }
}

function splitSql(source) {
  const statements = [];
  let current = "";
  let quoted = false;
  for (let index = 0; index < source.length; index += 1) {
    const character = source[index];
    if (character === "'") {
      if (quoted && source[index + 1] === "'") {
        current += "''";
        index += 1;
        continue;
      }
      quoted = !quoted;
    }
    if (character === ";" && !quoted) {
      if (current.trim()) statements.push(current.trim());
      current = "";
    } else {
      current += character;
    }
  }
  if (current.trim()) statements.push(current.trim());
  return statements;
}
