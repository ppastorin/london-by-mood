import { readFile, writeFile } from "node:fs/promises";
import { viewpointEnrichment } from "../data/viewpoint-enrichment.mjs";

const VERIFIED_ON = "2026-10-16";
const MIGRATION_PATH = "migrations/0010_viewpoint_editorial_enrichment.sql";
const SNAPSHOT_PATH = "public/pois-snapshot.json";
const GENERIC = /chance to step back from street level|broader view of London|green pause and time away|best experienced slowly|walkable pocket with local texture|distinctive London building|atmospheric architectural stop|rewards wandering|headline museums/i;
const sql = (value) => `'${String(value ?? "").replaceAll("'", "''")}'`;

function validate() {
  const ids = new Set();
  for (const place of viewpointEnrichment) {
    if (ids.has(place.id)) throw new Error(`Duplicate enrichment id: ${place.id}`);
    ids.add(place.id);
    for (const field of ["descriptionEn", "descriptionIt", "hookEn", "hookIt", "en", "it", "sourceUrl"]) {
      if (!place[field]?.trim()) throw new Error(`${place.id} is missing ${field}`);
    }
    if (place.descriptionEn.length < 180 || place.descriptionIt.length < 180) throw new Error(`${place.id} has an under-detailed description`);
    if (place.hookEn.length < 60 || place.hookIt.length < 60) throw new Error(`${place.id} has an under-detailed hook`);
    for (const field of ["descriptionEn", "descriptionIt", "hookEn", "hookIt"]) {
      if (GENERIC.test(place[field])) throw new Error(`${place.id} still contains generic copy`);
    }
    for (const field of ["officialUrl", "sourceUrl"]) {
      if (!/^https:\/\/[^\s]+$/.test(place[field])) throw new Error(`${place.id} has an invalid ${field}`);
    }
  }
  if (viewpointEnrichment.length !== 43) throw new Error(`Expected 43 viewpoint places, found ${viewpointEnrichment.length}`);
}

function buildMigration() {
  const lines = [
    "-- Bilingual, place-specific editorial enrichment for every published viewpoint-category place.",
    `-- Research verified against the recorded official or authoritative sources on ${VERIFIED_ON}.`,
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
  for (const place of viewpointEnrichment) {
    lines.push(
      `UPDATE places SET description_en=${sql(place.descriptionEn)}, description_it=${sql(place.descriptionIt)},`,
      `  editorial_hook_en=${sql(place.hookEn)}, editorial_hook_it=${sql(place.hookIt)},`,
      `  official_url=${sql(place.officialUrl)}, access_notes_en=${sql(place.en)}, access_notes_it=${sql(place.it)},`,
      `  last_verified_at=${sql(VERIFIED_ON)}, updated_at=CURRENT_TIMESTAMP`,
      `WHERE id=${sql(place.id)} AND category='VIEWPOINT';`,
      "INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)",
      `SELECT id,${sql(place.sourceUrl)},'official-or-authoritative',${sql(VERIFIED_ON)} FROM places WHERE id=${sql(place.id)}`,
      "ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;",
      "",
    );
  }
  lines.push(
    "INSERT INTO app_meta(key,value,updated_at) VALUES ('viewpoint_editorial_version','2026-10-16',CURRENT_TIMESTAMP)",
    "ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;",
    "",
  );
  return lines.join("\n");
}

async function updateSnapshot() {
  const snapshot = JSON.parse(await readFile(SNAPSHOT_PATH, "utf8"));
  const byId = new Map(snapshot.places.map((place) => [place.id, place]));
  for (const enrichment of viewpointEnrichment) {
    const place = byId.get(enrichment.id);
    if (!place || place.category !== "VIEWPOINT") throw new Error(`Snapshot is missing viewpoint place ${enrichment.id}`);
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
console.log(`Generated ${MIGRATION_PATH} and enriched ${viewpointEnrichment.length} snapshot records.`);
