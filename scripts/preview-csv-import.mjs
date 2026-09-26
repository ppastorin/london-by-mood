import { readFile } from "node:fs/promises";
import { basename } from "node:path";
import { Miniflare, convertV4MiniflareOptions } from "miniflare";

const csvPath = process.argv[2];
if (!csvPath) throw new Error("Usage: node scripts/preview-csv-import.mjs /path/to/google-mymaps.csv");

const mf = new Miniflare(convertV4MiniflareOptions({
  workers: [{
    name: "london-places-csv-preview",
    modules: true,
    scriptPath: "src/worker.js",
    compatibilityDate: "2026-09-03",
    d1Databases: { DB: "london-advanced-places-csv-preview" },
    bindings: { ADMIN_TOKEN: "csv-preview-token" },
    assets: { directory: "public", binding: "ASSETS", run_worker_first: true, routerConfig: { has_user_worker: true } },
  }],
}));

try {
  const db = await mf.getD1Database("DB", "london-places-csv-preview");
  await applySql(db, await readFile("migrations/0001_places.sql", "utf8"));
  await applySql(db, await readFile("migrations/0002_imports.sql", "utf8"));
  await applySql(db, await readFile("db/seed.sql", "utf8"));
  const csv = await readFile(csvPath, "utf8");
  const response = await mf.dispatchFetch("http://local.test/admin/api/imports/preview", {
    method: "POST",
    headers: { Authorization: "Bearer csv-preview-token", "Content-Type": "application/json" },
    body: JSON.stringify({ filename: basename(csvPath), sourceName: basename(csvPath).replace(/\.csv$/i, ""), csv }),
  });
  const payload = await response.json();
  if (!response.ok) throw new Error(JSON.stringify(payload));
  const attention = payload.candidates
    .filter((candidate) => candidate.classification !== "existing")
    .map(({ rowNumber, name, classification, matchName, matchReason, distanceMetres }) =>
      ({ rowNumber, name, classification, matchName, matchReason, distanceMetres }));
  console.log(JSON.stringify({ batchId: payload.batchId, counts: payload.counts, attention }, null, 2));
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
  return statements;
}
