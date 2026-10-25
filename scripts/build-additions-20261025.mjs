import { writeFileSync } from "node:fs";
import { additions20261025 } from "../data/additions-20261025.mjs";

const output = new URL("../migrations/0014_all_category_additions_20261025.sql", import.meta.url);
const sql = (value) => `'${String(value).replaceAll("'", "''")}'`;
const list = (values) => values.map((value) => sql(value.toLowerCase())).join(",");
const hook = (text) => {
  const first = String(text).match(/^.*?[.!?](?:\s|$)/)?.[0]?.trim() || String(text);
  return first.length <= 260 ? first : `${first.slice(0, 257).trim()}…`;
};

const profiles = {
  ODDITY: { crowd: "VENUE", visit: 15, best: "DAY", mode: "STOP", intensity: 30, moods: [1,3,1,2,2,0,2,0] },
  BUILDING: { crowd: "VENUE", visit: 30, best: "DAY", mode: "STOP", intensity: 35, moods: [1,2,2,1,2,0,2,1] },
  RELIGIOUS: { crowd: "VENUE", visit: 30, best: "DAY", mode: "STOP", intensity: 35, moods: [3,1,2,0,2,0,3,0] },
  MUSEUM: { crowd: "VENUE", visit: 60, best: "DAY", mode: "EXPLORE", intensity: 45, moods: [2,2,2,1,2,0,2,1] },
  PARK: { crowd: "AREA", visit: 75, best: "DAY", mode: "EXPLORE", intensity: 35, moods: [3,1,2,0,2,3,2,1] },
  SHOPPING: { crowd: "AREA", visit: 45, best: "DAY", mode: "EXPLORE", intensity: 55, moods: [1,2,1,0,3,0,2,3] },
  VIEWPOINT: { crowd: "VIEWPOINT", visit: 30, best: "DUSK", mode: "STOP", intensity: 35, moods: [2,2,3,0,1,2,3,0] },
};

const accessNotes = (item) => {
  if (item.market) return {
    en: "Market dates, hours and trader attendance can change for holidays, weather and special events. Check the official organiser before making a special journey.",
    it: "Date, orari e presenza degli operatori possono cambiare per festività, meteo ed eventi. Controlla l’organizzatore ufficiale prima di partire appositamente.",
  };
  if (item.accessType === "24H") return {
    en: "Visible from publicly accessible outdoor space. Visit considerately and respect residents, worshippers, wildlife and other users of the site.",
    it: "Visibile da uno spazio esterno accessibile al pubblico. Visita con rispetto per residenti, fedeli, fauna e altri utenti del luogo.",
  };
  if (item.accessType === "EXTERIOR") return {
    en: "Best appreciated from the public realm; the building is not presented as generally open to visitors. Do not enter private or operational areas.",
    it: "Si apprezza soprattutto dallo spazio pubblico; l’edificio non è normalmente visitabile. Non entrare in aree private o operative.",
  };
  if (item.accessType === "BOOKING") return {
    en: "Advance booking or a scheduled tour is normally required. Check current dates, prices, accessibility and cancellation information before travelling.",
    it: "Di norma è richiesta la prenotazione o una visita programmata. Verifica date, prezzi, accessibilità e cancellazioni prima di partire.",
  };
  return {
    en: "Opening hours, services, exhibitions and access can change. Check the official source before travelling, particularly for interiors or a special journey.",
    it: "Orari, funzioni, mostre e accesso possono cambiare. Controlla la fonte ufficiale prima di partire, soprattutto per gli interni o un viaggio apposito.",
  };
};

const affinity = (category) => category === "PARK" || category === "VIEWPOINT"
  ? [5,25,50,65,75,35,8,25,50,65,80,45,10,35,65,75,80,50]
  : category === "SHOPPING"
    ? [0,10,45,75,70,20,0,10,50,80,80,30,0,20,75,85,70,25]
    : [0,15,55,70,65,25,0,15,55,70,70,35,0,20,60,75,65,30];

const lines = [
  "-- Publish, correct and enrich the 25 October 2026 all-category My Maps imports.",
  "-- The imported coordinates and source references are preserved; the latest category/name supplied by the editor wins.",
  "CREATE TABLE IF NOT EXISTS place_editorial_sources (place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE, source_url TEXT NOT NULL, source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative', verified_at TEXT NOT NULL, PRIMARY KEY(place_id, source_url));",
  "CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);",
];

for (const item of additions20261025) {
  const profile = profiles[item.category];
  const aliases = [...new Set([item.name, ...(item.aliases || [])])];
  const notes = accessNotes(item);
  const moods = [...profile.moods];
  if (item.green !== undefined) moods[5] = item.green;
  const values = {
    crowd: profile.crowd, visit: item.visitMinutes || profile.visit, best: profile.best,
    mode: profile.mode, intensity: profile.intensity, price: item.price || "Free",
    access: item.accessType || "VARIABLE", confidence: item.confidence || "HIGH",
  };
  lines.push(`\n-- ${item.name}`);
  lines.push(`UPDATE places SET name=${sql(item.name)}, category=${sql(item.category)}, status='published',`);
  lines.push(` description_en=${sql(item.en)}, description_it=${sql(item.it)}, editorial_hook_en=${sql(hook(item.en))}, editorial_hook_it=${sql(hook(item.it))},`);
  if (item.officialUrl) lines.push(` official_url=${sql(item.officialUrl)},`);
  lines.push(` price_text=${sql(values.price)}, access_type=${sql(values.access)}, access_notes_en=${sql(notes.en)}, access_notes_it=${sql(notes.it)}, opening_hours_json=${sql(JSON.stringify(item.hours || {}))},`);
  lines.push(` tourist_intensity=${values.intensity}, crowd_scope=${sql(values.crowd)}, visit_minutes=${values.visit}, best_time=${sql(values.best)}, weather_fit='ANY', visit_mode=${sql(values.mode)},`);
  lines.push(` mood_quiet=${moods[0]}, mood_unexpected=${moods[1]}, mood_beautiful=${moods[2]}, mood_weird=${moods[3]}, mood_local=${moods[4]}, mood_green=${moods[5]}, mood_atmospheric=${moods[6]}, mood_lively=${moods[7]},`);
  lines.push(` mood_reviewed=1, mood_confidence=${sql(values.confidence)}, mood_basis='EDITORIAL_RESEARCH+OFFICIAL_SOURCE+LATEST_IMPORT_CATEGORY', last_verified_at='2026-10-25', published_at=COALESCE(published_at,CURRENT_TIMESTAMP), updated_at=CURRENT_TIMESTAMP`);
  lines.push(` WHERE lower(trim(name)) IN (${list(aliases)});`);
  if (item.officialUrl) lines.push(`INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at) SELECT id,${sql(item.officialUrl)},'official-or-authoritative','2026-10-25' FROM places WHERE lower(trim(name))=${sql(item.name.toLowerCase())} ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;`);
  const a = affinity(item.category);
  lines.push(`INSERT INTO place_time_affinity(place_id,mon_thu_00_05,mon_thu_06_10,mon_thu_10_13,mon_thu_13_17,mon_thu_17_20,mon_thu_20_24,friday_00_05,friday_06_10,friday_10_13,friday_13_17,friday_17_20,friday_20_24,weekend_00_05,weekend_06_10,weekend_10_13,weekend_13_17,weekend_17_20,weekend_20_24) SELECT id,${a.join(",")} FROM places WHERE lower(trim(name))=${sql(item.name.toLowerCase())} ON CONFLICT(place_id) DO UPDATE SET mon_thu_00_05=excluded.mon_thu_00_05,mon_thu_06_10=excluded.mon_thu_06_10,mon_thu_10_13=excluded.mon_thu_10_13,mon_thu_13_17=excluded.mon_thu_13_17,mon_thu_17_20=excluded.mon_thu_17_20,mon_thu_20_24=excluded.mon_thu_20_24,friday_00_05=excluded.friday_00_05,friday_06_10=excluded.friday_06_10,friday_10_13=excluded.friday_10_13,friday_13_17=excluded.friday_13_17,friday_17_20=excluded.friday_17_20,friday_20_24=excluded.friday_20_24,weekend_00_05=excluded.weekend_00_05,weekend_06_10=excluded.weekend_06_10,weekend_10_13=excluded.weekend_10_13,weekend_13_17=excluded.weekend_13_17,weekend_17_20=excluded.weekend_17_20,weekend_20_24=excluded.weekend_20_24;`);
}

// The source checklist repeats High Street Kensington three times. Prefer the newest imported record and archive duplicates.
lines.push(`\nWITH ranked AS (SELECT id, ROW_NUMBER() OVER (PARTITION BY lower(trim(name)),category ORDER BY datetime(created_at) DESC,id DESC) AS rn FROM places WHERE lower(trim(name)) IN (${list(additions20261025.map((item) => item.name))})) UPDATE places SET status='archived',updated_at=CURRENT_TIMESTAMP WHERE id IN (SELECT id FROM ranked WHERE rn>1);`);
lines.push("UPDATE app_meta SET value=CAST(CAST(value AS INTEGER)+1 AS TEXT),updated_at=CURRENT_TIMESTAMP WHERE key='data_version';");

writeFileSync(output, `${lines.join("\n")}\n`, "utf8");
console.log(JSON.stringify({ records: additions20261025.length, output: output.pathname }, null, 2));
