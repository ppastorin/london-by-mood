import { readFile, writeFile } from "node:fs/promises";
import { buildingEnrichment } from "../data/building-enrichment.mjs";

const VERIFIED_ON = "2026-10-14";
const MIGRATION_PATH = "migrations/0005_building_editorial_enrichment.sql";
const SNAPSHOT_PATH = "public/pois-snapshot.json";
const GENERIC = /distinctive London building worth noticing|walkable pocket with local texture|architectural detail and a strong sense of place|green pause and time away|best experienced slowly|source says 24\/7/i;
const sql = (value) => `'${String(value ?? "").replaceAll("'", "''")}'`;

function validate() {
  const ids = new Set();
  for (const place of buildingEnrichment) {
    if (ids.has(place.id)) throw new Error(`Duplicate enrichment id: ${place.id}`);
    ids.add(place.id);
    for (const field of ["descriptionEn", "descriptionIt", "hookEn", "hookIt", "en", "it"]) {
      if (!place[field]?.trim()) throw new Error(`${place.id} is missing ${field}`);
    }
    if (place.descriptionEn.length < 180 || place.descriptionIt.length < 180) {
      throw new Error(`${place.id} has an under-detailed description`);
    }
    if (GENERIC.test(place.descriptionEn) || GENERIC.test(place.hookEn) || GENERIC.test(place.en)) {
      throw new Error(`${place.id} still contains generic or unsafe copy`);
    }
    for (const field of ["officialUrl", "sourceUrl"]) {
      if (place[field] && !/^https:\/\/[^\s]+$/.test(place[field])) throw new Error(`${place.id} has an invalid ${field}`);
    }
  }
  if (buildingEnrichment.length !== 75) throw new Error(`Expected 75 building places, found ${buildingEnrichment.length}`);
}

function buildMigration() {
  const lines = [
    "-- Editorial enrichment for every published building place.",
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

  for (const place of buildingEnrichment) {
    lines.push(
      `UPDATE places SET description_en=${sql(place.descriptionEn)}, description_it=${sql(place.descriptionIt)},`,
      `  editorial_hook_en=${sql(place.hookEn)}, editorial_hook_it=${sql(place.hookIt)},`,
      `  official_url=${sql(place.officialUrl)}, access_notes_en=${sql(place.en)}, access_notes_it=${sql(place.it)},`,
      `  last_verified_at=${sql(VERIFIED_ON)}, updated_at=CURRENT_TIMESTAMP`,
      `WHERE id=${sql(place.id)} AND category='BUILDING';`,
    );
    if (place.sourceUrl?.trim()) {
      lines.push(
        "INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)",
        `SELECT id,${sql(place.sourceUrl)},'official-or-authoritative',${sql(VERIFIED_ON)} FROM places WHERE id=${sql(place.id)}`,
        "ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;",
      );
    }
    lines.push("");
  }
  lines.push(
    "INSERT INTO app_meta(key,value,updated_at) VALUES ('building_editorial_version','2026-10-14',CURRENT_TIMESTAMP)",
    "ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;",
    "",
  );
  return lines.join("\n");
}

async function updateSnapshot() {
  const snapshot = JSON.parse(await readFile(SNAPSHOT_PATH, "utf8"));
  const byId = new Map(snapshot.places.map((place) => [place.id, place]));
  for (const enrichment of buildingEnrichment) {
    const place = byId.get(enrichment.id);
    if (!place || place.category !== "BUILDING") throw new Error(`Snapshot is missing building place ${enrichment.id}`);
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
  await writeFile(SNAPSHOT_PATH, `${JSON.stringify(snapshot)}\n`);
}

validate();
await writeFile(MIGRATION_PATH, buildMigration());
await updateSnapshot();
console.log(`Generated ${MIGRATION_PATH} and enriched ${buildingEnrichment.length} snapshot records.`);
