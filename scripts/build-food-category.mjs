import { createHash } from "node:crypto";
import { readFile, writeFile } from "node:fs/promises";
import { foodPlaces } from "../data/food-enrichment.mjs";

const VERIFIED_ON = "2026-10-25";
const SOURCE_NAME = "London Tour 2023- Food 20261025(1).csv";
const SNAPSHOT_PATH = "public/pois-snapshot.json";
const MIGRATION_PATH = "migrations/0013_food_category.sql";
const EXISTING_IDS = new Map([
  ["oldeaglepub", "LA-6B9A4DFD"],
  ["stapleinn", "LA-A0081CBE"],
  ["dawattooting", "LA-53DEB44D"],
]);

const ACCESS = {
  pub: ["Pub hours, food service and bookings can change; check the venue before travelling.", "Orari del pub, servizio cucina e prenotazioni possono cambiare: controlla il locale prima di partire."],
  bar: ["Opening hours, admission rules and bookings can change; check the venue before travelling.", "Orari, regole d’ingresso e prenotazioni possono cambiare: controlla il locale prima di partire."],
  cafe: ["Opening hours and service days can change; check the venue before travelling.", "Orari e giorni di servizio possono cambiare: controlla il locale prima di partire."],
  bakery: ["Opening hours and product availability can change; check the venue before travelling.", "Orari e disponibilità dei prodotti possono cambiare: controlla il locale prima di partire."],
  restaurant: ["Menus, opening hours and booking arrangements can change; check the venue before travelling.", "Menu, orari e prenotazioni possono cambiare: controlla il locale prima di partire."],
  shop: ["Opening hours and stock can change; check the business before travelling.", "Orari e assortimento possono cambiare: controlla l’attività prima di partire."],
  market: ["Trading hours and the operator line-up can change; check the current programme before travelling.", "Orari e operatori possono cambiare: controlla il programma attuale prima di partire."],
  brewery: ["Tours, taproom hours and booking arrangements can change; check the brewery before travelling.", "Visite, orari della taproom e prenotazioni possono cambiare: controlla il birrificio prima di partire."],
  experience: ["Sessions, admission and food service require current confirmation; check and book before travelling.", "Sessioni, ingresso e ristorazione richiedono una verifica aggiornata: controlla e prenota prima di partire."],
  historic: ["This record is primarily a historic-location reference; verify what can currently be visited before travelling.", "Questa scheda è soprattutto un riferimento storico: verifica cosa sia attualmente visitabile prima di partire."],
};

const TIME = {
  pub: [0,5,10,40,80,75,0,5,10,45,90,85,0,10,25,55,85,80],
  bar: [0,0,5,20,75,85,0,0,5,25,85,90,0,5,15,40,80,90],
  cafe: [0,60,80,70,25,0,0,65,85,70,30,0,0,65,85,75,35,0],
  bakery: [10,75,85,65,35,15,10,80,85,65,40,20,15,80,85,70,45,20],
  restaurant: [0,5,35,70,85,55,0,5,40,75,90,70,0,10,55,80,90,70],
  shop: [0,20,65,75,45,5,0,20,65,75,50,10,0,20,75,80,55,10],
  market: [0,10,65,80,55,15,0,10,65,85,65,20,0,15,80,90,65,20],
  brewery: [0,5,20,45,75,65,0,5,20,50,85,80,0,10,30,65,85,75],
  experience: [0,5,25,45,75,65,0,5,25,50,85,80,0,10,40,70,85,75],
  historic: [0,15,60,65,45,10,0,15,60,65,50,10,0,20,70,70,50,10],
};

const TIME_KEYS = ["mon_thu_00_05","mon_thu_06_10","mon_thu_10_13","mon_thu_13_17","mon_thu_17_20","mon_thu_20_24",
  "friday_00_05","friday_06_10","friday_10_13","friday_13_17","friday_17_20","friday_20_24",
  "weekend_00_05","weekend_06_10","weekend_10_13","weekend_13_17","weekend_17_20","weekend_20_24"];

const normal = value => String(value || "").normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/[^a-z0-9]+/g, "");
const slugify = value => String(value || "").normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 145);
const sql = value => `'${String(value ?? "").replaceAll("'", "''")}'`;
const stableId = place => `LA-${createHash("sha256").update(`${normal(place.name)}|${place.lat.toFixed(7)}|${place.lon.toFixed(7)}`).digest("hex").slice(0, 8).toUpperCase()}`;

function attributes(place) {
  const daytime = ["cafe", "bakery", "shop", "market", "historic"].includes(place.kind);
  const lively = ["pub", "bar", "market", "experience"].includes(place.kind) ? 3 : 2;
  const atmospheric = ["pub", "bar", "historic", "brewery"].includes(place.kind) ? 3 : 2;
  const touristIntensity = place.kind === "market" ? 55 : place.kind === "historic" ? 30 : ["bar", "experience"].includes(place.kind) ? 50 : 40;
  const visitMinutes = place.kind === "historic" ? 20 : ["cafe", "bakery", "shop"].includes(place.kind) ? 40 : place.kind === "market" ? 60 : 75;
  return { daytime, lively, atmospheric, touristIntensity, visitMinutes };
}

function validate() {
  if (foodPlaces.length !== 97) throw new Error(`Expected 97 distinct Food records, found ${foodPlaces.length}`);
  const keys = new Set();
  for (const place of foodPlaces) {
    const key = `${normal(place.name)}|${place.lat.toFixed(7)}|${place.lon.toFixed(7)}`;
    if (keys.has(key)) throw new Error(`Duplicate Food record: ${place.name}`);
    keys.add(key);
    if (!ACCESS[place.kind] || !TIME[place.kind]) throw new Error(`${place.name} has unsupported kind ${place.kind}`);
    for (const field of ["descriptionEn", "descriptionIt"]) {
      if (!place[field] || place[field].length < 75) throw new Error(`${place.name} has under-detailed ${field}`);
    }
    for (const field of ["hookEn", "hookIt"]) {
      if (!place[field] || place[field].length < 35) throw new Error(`${place.name} has under-detailed ${field}`);
    }
    if (!Number.isFinite(place.lat) || !Number.isFinite(place.lon)) throw new Error(`${place.name} has invalid coordinates`);
  }
}

function resolvedRecords(snapshot) {
  const snapshotById = new Map(snapshot.places.map(place => [place.id, place]));
  const usedSlugs = new Set(snapshot.places.map(place => place.slug));
  return foodPlaces.map(place => {
    const existingId = EXISTING_IDS.get(normal(place.name));
    const id = existingId || stableId(place);
    if (existingId && !snapshotById.has(existingId)) throw new Error(`Snapshot is missing existing Food migration target ${existingId}`);
    let slug = existingId ? snapshotById.get(existingId).slug : slugify(place.name);
    if (!existingId && usedSlugs.has(slug)) slug = `${slug}-${id.slice(-8).toLowerCase()}`;
    usedSlugs.add(slug);
    return { ...place, id, slug, existing: Boolean(existingId), ...attributes(place) };
  });
}

function buildMigration(records) {
  const lines = [
    "-- Introduce Food as a first-class place category and publish the user-supplied Food layer.",
    `-- Source: ${SOURCE_NAME}; 98 source rows, 97 distinct locations, one exact duplicate removed.`,
    `-- Editorial copy prepared and source data reviewed on ${VERIFIED_ON}.`,
    "UPDATE categories SET display_order=9 WHERE code='VIEWPOINT' AND display_order=8;",
    "INSERT OR IGNORE INTO categories(code,label_en,label_it,display_order) VALUES ('FOOD','Food','Cibo',8);",
    "",
  ];
  for (const place of records) {
    const access = ACCESS[place.kind];
    const time = TIME[place.kind];
    const mapUrl = `https://www.google.com/maps?q=${place.lat},${place.lon}`;
    const common = [
      `slug=${sql(place.slug)}`, `name=${sql(place.name)}`, "category='FOOD'", `latitude=${place.lat}`, `longitude=${place.lon}`,
      "status='published'", `description_en=${sql(place.descriptionEn)}`, `description_it=${sql(place.descriptionIt)}`,
      `editorial_hook_en=${sql(place.hookEn)}`, `editorial_hook_it=${sql(place.hookIt)}`,
      `official_url=${sql(place.officialUrl)}`, `google_maps_url=${sql(mapUrl)}`, "price_text='Check venue'", "access_type='VARIABLE'",
      `access_notes_en=${sql(access[0])}`, `access_notes_it=${sql(access[1])}`, "opening_hours_json='{}'",
      `tourist_intensity=${place.touristIntensity}`, "crowd_scope='VENUE'", `visit_minutes=${place.visitMinutes}`,
      `best_time='${place.daytime ? "DAY" : "EVENING"}'`, "weather_fit='RAIN_FRIENDLY'", `visit_mode='${place.kind === "market" ? "EXPLORE" : "STOP"}'`,
      "mood_quiet=1", "mood_unexpected=2", "mood_beautiful=1", "mood_weird=0", "mood_local=3", "mood_green=0",
      `mood_atmospheric=${place.atmospheric}`, `mood_lively=${place.lively}`, "mood_reviewed=1", "mood_confidence='MEDIUM'",
      "mood_basis='USER_CURATED_SOURCE+PLACE_SPECIFIC_EDITORIAL_REVIEW+FOOD_CATEGORY'",
      "source_type='user-csv'", `source_ref=${sql(`${SOURCE_NAME}#${place.lat},${place.lon}`)}`,
      `last_verified_at='${VERIFIED_ON}'`, "published_at=COALESCE(published_at,CURRENT_TIMESTAMP)", "updated_at=CURRENT_TIMESTAMP",
    ];
    if (place.existing) {
      lines.push(`UPDATE places SET ${common.join(", ")} WHERE id=${sql(place.id)};`);
    } else {
      const cols = ["id", ...common.map(part => part.split("=")[0])];
      const vals = [sql(place.id), ...common.map(part => part.slice(part.indexOf("=") + 1).replace("COALESCE(published_at,CURRENT_TIMESTAMP)", "CURRENT_TIMESTAMP"))];
      lines.push(`INSERT INTO places(${cols.join(",")}) VALUES (${vals.join(",")});`);
    }
    lines.push(
      `INSERT INTO place_time_affinity(place_id,${TIME_KEYS.join(",")}) VALUES (${sql(place.id)},${time.join(",")})`,
      `ON CONFLICT(place_id) DO UPDATE SET ${TIME_KEYS.map((key, index) => `${key}=${time[index]}`).join(",")};`,
      "",
    );
  }
  lines.push(
    "INSERT INTO app_meta(key,value,updated_at) VALUES ('food_category_version','2026-10-25',CURRENT_TIMESTAMP)",
    "ON CONFLICT(key) DO UPDATE SET value=excluded.value,updated_at=CURRENT_TIMESTAMP;",
    "UPDATE app_meta SET value=CAST(CAST(value AS INTEGER)+1 AS TEXT),updated_at=CURRENT_TIMESTAMP WHERE key='data_version';",
    "",
  );
  return lines.join("\n");
}

function snapshotRecord(place, previous = {}) {
  const access = ACCESS[place.kind];
  const time = Object.fromEntries(TIME_KEYS.map((key, index) => [key, TIME[place.kind][index]]));
  return {
    ...previous,
    id: place.id, slug: place.slug, name: place.name, category: "FOOD", lat: place.lat, lon: place.lon,
    status: "published", description: place.descriptionEn, descriptionIt: place.descriptionIt,
    touristIntensity: place.touristIntensity, crowdScope: "VENUE", visitMinutes: place.visitMinutes,
    officialUrl: place.officialUrl, guideUrl: "", mapUrl: `https://www.google.com/maps?q=${place.lat},${place.lon}`,
    price: "Check venue", accessType: "VARIABLE", accessNotes: access[0], accessNotesIt: access[1], openingHours: {},
    lastVerified: VERIFIED_ON, stations: previous.stations || [], timeAffinity: time,
    moods: { quiet: 1, unexpected: 2, beautiful: 1, weird: 0, local: 3, green: 0, atmospheric: place.atmospheric, lively: place.lively },
    hook: place.hookEn, hookIt: place.hookIt, bestTime: place.daytime ? "DAY" : "EVENING", weatherFit: "RAIN_FRIENDLY",
    visitMode: place.kind === "market" ? "EXPLORE" : "STOP", reviewed: true, confidence: "MEDIUM",
    moodBasis: "USER_CURATED_SOURCE+PLACE_SPECIFIC_EDITORIAL_REVIEW+FOOD_CATEGORY",
    sourceType: "user-csv", sourceRef: `${SOURCE_NAME}#${place.lat},${place.lon}`,
    source: { type: "user-csv", ref: `${SOURCE_NAME}#${place.lat},${place.lon}`, row: null, code: "" },
    createdAt: previous.createdAt || `${VERIFIED_ON} 00:00:00`, updatedAt: `${VERIFIED_ON} 00:00:00`,
  };
}

async function main() {
  validate();
  const snapshot = JSON.parse(await readFile(SNAPSHOT_PATH, "utf8"));
  const records = resolvedRecords(snapshot);
  const byId = new Map(snapshot.places.map(place => [place.id, place]));
  for (const place of records) byId.set(place.id, snapshotRecord(place, byId.get(place.id)));
  snapshot.places = [...byId.values()];
  snapshot.count = snapshot.places.length;
  snapshot.generatedAt = `${VERIFIED_ON}T00:00:00.000Z`;
  await writeFile(MIGRATION_PATH, buildMigration(records));
  await writeFile(SNAPSHOT_PATH, `${JSON.stringify(snapshot)}\n`);
  console.log(`Generated ${MIGRATION_PATH}; snapshot now contains ${snapshot.count} places including ${records.length} Food records.`);
}

await main();
