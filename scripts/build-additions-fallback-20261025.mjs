import { writeFileSync } from "node:fs";
import { additions20261025 } from "../data/additions-20261025.mjs";

const coordinates = new Map(Object.entries({
  "Tiny Wee Gallery": [51.5198267,-0.0716239],
  "St Olaf House": [51.5063889,-0.0864386],
  "St Paul’s Church, Covent Garden": [51.5115563,-0.1237151],
  "All Souls Langham Place": [51.5181722,-0.1430256],
  "St Giles-in-the-Fields": [51.5153141,-0.1283993],
  "Christ Church Spitalfields": [51.5191219,-0.0737504],
  "Pollock’s Toy Museum, Leadenhall Market": [51.5127276,-0.0833953],
  "The Household Cavalry Museum": [51.5047764,-0.1272254],
  "Banqueting House": [51.5045543,-0.125914],
  "The Courtauld Gallery": [51.5116244,-0.1177002],
  "Charterhouse Square": [51.5207541,-0.0994431],
  "London Fields": [51.5410518,-0.0577737],
  "Severndroog Castle Producers Market": [51.4666281,0.0600528],
  "South Kensington Farmers’ Market": [51.4936148,-0.176323],
  "Marylebone Farmers’ Market": [51.5193068,-0.1530012],
  "Portobello Road Market": [51.5160858,-0.2051174],
  "Brockwell Park Viewpoint": [51.45082,-0.1076672],
  "The Terrace at One Leadenhall": [51.5130399,-0.08355],
}));

const names = new Set([...coordinates.keys(), "Duck Pond Market Richmond"]);
const items = additions20261025.filter(item => names.has(item.name));
if (items.length !== 19) throw new Error(`Expected 19 fallback targets, found ${items.length}`);

const q = value => `'${String(value).replaceAll("'", "''")}'`;
const qList = values => values.map(value => q(value.toLowerCase())).join(",");
const slugify = value => value.normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase()
  .replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 80);
const hook = text => String(text).match(/^.*?[.!?](?:\s|$)/)?.[0]?.trim() || String(text).slice(0, 260);
const profiles = {
  ODDITY: ["VENUE",15,"DAY","STOP",30,[1,3,1,2,2,0,2,0]],
  BUILDING: ["VENUE",30,"DAY","STOP",35,[1,2,2,1,2,0,2,1]],
  RELIGIOUS: ["VENUE",30,"DAY","STOP",35,[3,1,2,0,2,0,3,0]],
  MUSEUM: ["VENUE",60,"DAY","EXPLORE",45,[2,2,2,1,2,0,2,1]],
  PARK: ["AREA",75,"DAY","EXPLORE",35,[3,1,2,0,2,3,2,1]],
  SHOPPING: ["AREA",45,"DAY","EXPLORE",55,[1,2,1,0,3,0,2,3]],
  VIEWPOINT: ["VIEWPOINT",30,"DUSK","STOP",35,[2,2,3,0,1,2,3,0]],
};
const affinity = category => category === "PARK" || category === "VIEWPOINT"
  ? [5,25,50,65,75,35,8,25,50,65,80,45,10,35,65,75,80,50]
  : category === "SHOPPING"
    ? [0,10,45,75,70,20,0,10,50,80,80,30,0,20,75,85,70,25]
    : [0,15,55,70,65,25,0,15,55,70,70,35,0,20,60,75,65,30];
const notes = item => item.market ? {
  en: "Market dates, hours and trader attendance can change for holidays, weather and special events. Check the official organiser before making a special journey.",
  it: "Date, orari e presenza degli operatori possono cambiare per festività, meteo ed eventi. Controlla l’organizzatore ufficiale prima di partire appositamente.",
} : {
  en: "Opening hours, services, exhibitions and access can change. Check the official source before travelling, particularly for interiors or a special journey.",
  it: "Orari, funzioni, mostre e accesso possono cambiare. Controlla la fonte ufficiale prima di partire, soprattutto per gli interni o un viaggio apposito.",
};

const lines = [
  "-- Reconcile checklist locations that the CSV importer classified as review/colocated rather than creating.",
  "-- Coordinates are place-specific OpenStreetMap resolutions checked against official venue addresses on 2026-10-25.",
];
for (const [index,item] of items.entries()) {
  const aliases = [...new Set([item.name,...(item.aliases || []),...(item.name === "Duck Pond Market Richmond" ? ["Duck Pond Market"] : [])])];
  const point = coordinates.get(item.name);
  if (point) {
    const id = `LA-261025-${String(index + 1).padStart(2,"0")}`;
    lines.push(`INSERT INTO places(id,slug,name,category,latitude,longitude,status,source_type,source_ref) SELECT ${q(id)},${q(slugify(item.name))},${q(item.name)},${q(item.category)},${point[0]},${point[1]},'draft','editorial-research','OpenStreetMap and official-address reconciliation 2026-10-25' WHERE NOT EXISTS (SELECT 1 FROM places WHERE lower(trim(name)) IN (${qList(aliases)}));`);
  }
  const [crowd,visit,best,mode,intensity,baseMoods] = profiles[item.category];
  const moods = [...baseMoods]; if (item.green !== undefined) moods[5] = item.green;
  const access = item.accessType || "VARIABLE", n = notes(item);
  lines.push(`UPDATE places SET name=${q(item.name)},category=${q(item.category)},status='published',description_en=${q(item.en)},description_it=${q(item.it)},editorial_hook_en=${q(hook(item.en))},editorial_hook_it=${q(hook(item.it))},official_url=${q(item.officialUrl || "")},price_text=${q(item.price || "Free")},access_type=${q(access)},access_notes_en=${q(n.en)},access_notes_it=${q(n.it)},opening_hours_json=${q(JSON.stringify(item.hours || {}))},tourist_intensity=${intensity},crowd_scope=${q(crowd)},visit_minutes=${item.visitMinutes || visit},best_time=${q(best)},weather_fit='ANY',visit_mode=${q(mode)},mood_quiet=${moods[0]},mood_unexpected=${moods[1]},mood_beautiful=${moods[2]},mood_weird=${moods[3]},mood_local=${moods[4]},mood_green=${moods[5]},mood_atmospheric=${moods[6]},mood_lively=${moods[7]},mood_reviewed=1,mood_confidence=${q(item.confidence || "HIGH")},mood_basis='EDITORIAL_RESEARCH+OFFICIAL_SOURCE+CHECKLIST_RECONCILIATION',last_verified_at='2026-10-25',published_at=COALESCE(published_at,CURRENT_TIMESTAMP),updated_at=CURRENT_TIMESTAMP WHERE lower(trim(name)) IN (${qList(aliases)});`);
  if (item.officialUrl) lines.push(`INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at) SELECT id,${q(item.officialUrl)},'official-or-authoritative','2026-10-25' FROM places WHERE lower(trim(name))=${q(item.name.toLowerCase())} ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;`);
  const a = affinity(item.category);
  lines.push(`INSERT INTO place_time_affinity(place_id,mon_thu_00_05,mon_thu_06_10,mon_thu_10_13,mon_thu_13_17,mon_thu_17_20,mon_thu_20_24,friday_00_05,friday_06_10,friday_10_13,friday_13_17,friday_17_20,friday_20_24,weekend_00_05,weekend_06_10,weekend_10_13,weekend_13_17,weekend_17_20,weekend_20_24) SELECT id,${a.join(",")} FROM places WHERE lower(trim(name))=${q(item.name.toLowerCase())} ON CONFLICT(place_id) DO UPDATE SET mon_thu_00_05=excluded.mon_thu_00_05,mon_thu_06_10=excluded.mon_thu_06_10,mon_thu_10_13=excluded.mon_thu_10_13,mon_thu_13_17=excluded.mon_thu_13_17,mon_thu_17_20=excluded.mon_thu_17_20,mon_thu_20_24=excluded.mon_thu_20_24,friday_00_05=excluded.friday_00_05,friday_06_10=excluded.friday_06_10,friday_10_13=excluded.friday_10_13,friday_13_17=excluded.friday_13_17,friday_17_20=excluded.friday_17_20,friday_20_24=excluded.friday_20_24,weekend_00_05=excluded.weekend_00_05,weekend_06_10=excluded.weekend_06_10,weekend_10_13=excluded.weekend_10_13,weekend_13_17=excluded.weekend_13_17,weekend_17_20=excluded.weekend_17_20,weekend_20_24=excluded.weekend_20_24;`);
}
lines.push(`WITH ranked AS (SELECT id,ROW_NUMBER() OVER (PARTITION BY lower(trim(name)),category ORDER BY datetime(created_at) DESC,id DESC) AS rn FROM places WHERE lower(trim(name)) IN (${qList(items.map(item => item.name))})) UPDATE places SET status='archived',updated_at=CURRENT_TIMESTAMP WHERE id IN (SELECT id FROM ranked WHERE rn>1);`);
lines.push("UPDATE app_meta SET value=CAST(CAST(value AS INTEGER)+1 AS TEXT),updated_at=CURRENT_TIMESTAMP WHERE key='data_version';");

const output = new URL("../migrations/0015_reconcile_missing_additions_20261025.sql", import.meta.url);
writeFileSync(output, `${lines.join("\n\n")}\n`, "utf8");
console.log(JSON.stringify({ targets: items.length, insertedFallbacks: coordinates.size, output: output.pathname }, null, 2));
