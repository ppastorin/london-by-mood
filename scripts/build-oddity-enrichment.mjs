import { readFile, writeFile } from "node:fs/promises";
import { oddityEnrichment } from "../data/oddity-enrichment.mjs";

const VERIFIED_ON = "2026-10-28";
const MIGRATION_PATH = "migrations/0018_oddity_editorial_enrichment.sql";
const SNAPSHOT_PATH = "public/pois-snapshot.json";
const GENERIC = /atmospheric stop|layered history|worth noticing|rewards wandering|best experienced slowly|local texture|everyday sense of London|offers a chance to|distinctive London/i;
const sql = (value) => `'${String(value ?? "").replaceAll("'", "''")}'`;
const lead = (name, text) => {
  const sentences = text.split(/(?<=[.!?])\s/);
  return `${name}: ${sentences[0].length >= 65 ? sentences[0] : sentences.slice(0, 2).join(" ")}`;
};

const snapshot = JSON.parse(await readFile(SNAPSHOT_PATH, "utf8"));
const oddities = snapshot.places.filter((place) => place.category === "ODDITY");
const byId = new Map(oddities.map((place) => [place.id, place]));
const ids = new Set();
if (oddities.length !== 173 || oddityEnrichment.length !== 173) throw new Error(`Expected 173 oddities; snapshot=${oddities.length}, enrichment=${oddityEnrichment.length}`);
const lines = ["-- Bilingual, place-specific editorial enrichment for every published oddity-category place.", `-- Research reviewed on ${VERIFIED_ON}; private, closed, seasonal and scheduled-access sites are identified explicitly.`, "CREATE TABLE IF NOT EXISTS place_editorial_sources (place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE, source_url TEXT NOT NULL, source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative', verified_at TEXT NOT NULL, PRIMARY KEY(place_id, source_url));", "CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);", ""];

for (const enrichment of oddityEnrichment) {
  if (ids.has(enrichment.id)) throw new Error(`Duplicate id ${enrichment.id}`);
  ids.add(enrichment.id);
  const place = byId.get(enrichment.id);
  if (!place) throw new Error(`Snapshot missing ${enrichment.id}`);
  const hookEn = lead(place.name, enrichment.descriptionEn);
  const hookIt = lead(place.name, enrichment.descriptionIt);
  const sourceUrl = enrichment.sourceUrl || place.officialUrl || place.mapUrl;
  for (const [field, value] of Object.entries({ descriptionEn: enrichment.descriptionEn, descriptionIt: enrichment.descriptionIt, hookEn, hookIt, accessEn: enrichment.en, accessIt: enrichment.it, sourceUrl })) {
    if (!value?.trim()) throw new Error(`${enrichment.id} missing ${field}`);
    if (GENERIC.test(value)) throw new Error(`${enrichment.id} contains generic copy in ${field}`);
  }
  if (enrichment.descriptionEn.length < 120 || enrichment.descriptionIt.length < 120) throw new Error(`${enrichment.id} description too short (${enrichment.descriptionEn.length}/${enrichment.descriptionIt.length})`);
  place.description = enrichment.descriptionEn; place.descriptionIt = enrichment.descriptionIt;
  place.hook = hookEn; place.hookIt = hookIt;
  place.accessNotes = enrichment.en; place.accessNotesIt = enrichment.it; place.lastVerified = VERIFIED_ON;
  if (enrichment.sourceUrl) place.officialUrl = enrichment.sourceUrl;
  lines.push(`UPDATE places SET description_en=${sql(enrichment.descriptionEn)}, description_it=${sql(enrichment.descriptionIt)}, editorial_hook_en=${sql(hookEn)}, editorial_hook_it=${sql(hookIt)}, access_notes_en=${sql(enrichment.en)}, access_notes_it=${sql(enrichment.it)}, last_verified_at=${sql(VERIFIED_ON)}, updated_at=CURRENT_TIMESTAMP${enrichment.sourceUrl ? `, official_url=${sql(enrichment.sourceUrl)}` : ""} WHERE id=${sql(enrichment.id)} AND category='ODDITY';`, "INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)", `SELECT id,${sql(sourceUrl)},'official-or-authoritative',${sql(VERIFIED_ON)} FROM places WHERE id=${sql(enrichment.id)} ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;`, "");
}
if (ids.size !== 173 || [...byId.keys()].some((id) => !ids.has(id))) throw new Error("Enrichment IDs do not exactly match the oddity catalogue");
lines.push("INSERT INTO app_meta(key,value,updated_at) VALUES ('oddity_editorial_version','2026-10-28',CURRENT_TIMESTAMP) ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;", "");
snapshot.generatedAt = `${VERIFIED_ON}T00:00:00.000Z`;
await writeFile(MIGRATION_PATH, lines.join("\n"));
await writeFile(SNAPSHOT_PATH, `${JSON.stringify(snapshot)}\n`);
console.log(`Generated ${MIGRATION_PATH} and enriched ${ids.size} oddity records.`);
