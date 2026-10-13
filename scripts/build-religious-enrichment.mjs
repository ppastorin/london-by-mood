import { readFile, writeFile } from "node:fs/promises";
import { religiousEnrichment } from "../data/religious-enrichment.mjs";

const VERIFIED_ON = "2026-10-13";
const MIGRATION_PATH = "migrations/0003_religious_editorial_enrichment.sql";
const SNAPSHOT_PATH = "public/pois-snapshot.json";

const sql = (value) => `'${String(value ?? "").replaceAll("'", "''")}'`;

function validate() {
  const ids = new Set();
  for (const place of religiousEnrichment) {
    if (ids.has(place.id)) throw new Error(`Duplicate enrichment id: ${place.id}`);
    ids.add(place.id);
    for (const field of ["descriptionEn", "descriptionIt", "hookEn", "hookIt", "sourceUrl", "en", "it"]) {
      if (!place[field]?.trim()) throw new Error(`${place.id} is missing ${field}`);
    }
    if (place.descriptionEn.length < 180 || place.descriptionIt.length < 180) {
      throw new Error(`${place.id} has an under-detailed description`);
    }
    if (/atmospheric architectural stop|green pause and time away|quiet, atmospheric landscape/i.test(place.hookEn)) {
      throw new Error(`${place.id} still contains a generic hook`);
    }
  }
  if (religiousEnrichment.length !== 98) {
    throw new Error(`Expected 98 religious places, found ${religiousEnrichment.length}`);
  }
}

function buildMigration() {
  const lines = [
    "-- Editorial enrichment for every published religious place.",
    `-- Research verified against the recorded sources on ${VERIFIED_ON}.`,
    "CREATE TABLE IF NOT EXISTS place_editorial_sources (",
    "  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,",
    "  source_url TEXT NOT NULL,",
    "  source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative',",
    "  verified_at TEXT NOT NULL,",
    "  PRIMARY KEY(place_id, source_url)",
    ");",
    "CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);",
    "",
  ];

  for (const place of religiousEnrichment) {
    lines.push(
      `UPDATE places SET description_en=${sql(place.descriptionEn)}, description_it=${sql(place.descriptionIt)},`,
      `  editorial_hook_en=${sql(place.hookEn)}, editorial_hook_it=${sql(place.hookIt)},`,
      `  official_url=${sql(place.officialUrl)}, access_notes_en=${sql(place.en)}, access_notes_it=${sql(place.it)},`,
      `  last_verified_at=${sql(VERIFIED_ON)}, updated_at=CURRENT_TIMESTAMP`,
      `WHERE id=${sql(place.id)} AND category='RELIGIOUS';`,
      `INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)`,
      `SELECT id,${sql(place.sourceUrl)},'official-or-authoritative',${sql(VERIFIED_ON)} FROM places WHERE id=${sql(place.id)}`,
      "ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;",
      "",
    );
  }

  lines.push(
    "INSERT INTO app_meta(key,value,updated_at) VALUES ('religious_editorial_version','2026-10-13',CURRENT_TIMESTAMP)",
    "ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;",
    "",
  );
  return lines.join("\n");
}

async function updateSnapshot() {
  const snapshot = JSON.parse(await readFile(SNAPSHOT_PATH, "utf8"));
  const byId = new Map(snapshot.places.map((place) => [place.id, place]));
  for (const enrichment of religiousEnrichment) {
    const place = byId.get(enrichment.id);
    if (!place || place.category !== "RELIGIOUS") {
      throw new Error(`Snapshot is missing religious place ${enrichment.id}`);
    }
    place.description = enrichment.descriptionEn;
    place.descriptionIt = enrichment.descriptionIt;
    place.hook = enrichment.hookEn;
    place.hookIt = enrichment.hookIt;
    place.officialUrl = enrichment.officialUrl;
    place.accessNotes = enrichment.en;
    place.accessNotesIt = enrichment.it;
    place.lastVerified = VERIFIED_ON;
  }
  snapshot.generatedAt = `${VERIFIED_ON}T00:00:00.000Z`;
  // Keep the production snapshot compact; it is downloaded on first page load.
  await writeFile(SNAPSHOT_PATH, `${JSON.stringify(snapshot)}\n`);
}

validate();
await writeFile(MIGRATION_PATH, buildMigration());
await updateSnapshot();
console.log(`Generated ${MIGRATION_PATH} and enriched ${religiousEnrichment.length} snapshot records.`);
