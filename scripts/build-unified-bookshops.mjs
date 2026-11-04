import { readFile, writeFile } from "node:fs/promises";
import path from "node:path";

const [bookshopsPath, charityPath, outputPath = "migrations/0022_unified_place_collections_and_bookshops.sql", fallbackPath, charityFallbackPath] = process.argv.slice(2);
if (!bookshopsPath || !charityPath) {
  throw new Error("Usage: node scripts/build-unified-bookshops.mjs <bookshops.json> <charity-shops.json> [migration.sql] [fallback.json]");
}

const bookPayload = JSON.parse(await readFile(bookshopsPath, "utf8"));
const charityPayload = JSON.parse(await readFile(charityPath, "utf8"));
// Generated fail-safe exports can be fed back into the builder safely.
const sourceBookshops = (bookPayload.shops || []).filter((shop) => !String(shop.id).startsWith("book-oxfam-"));
const charityShops = charityPayload.shops || [];

const existingPlaceByBookId = new Map(Object.entries({
  bk003: "LA-752A55AC",
  bk014: "LA-0E09FC96",
  bk019: "LA-B14DD3E9",
  bk038: "LA-4763B350",
  bk041: "LA-20BE9A7A",
  bk052: "LA-607D9919",
  bk055: "S1",
  bk060: "LA-E32EEDA4",
  bk062: "LA-31BDCEA0",
  bk076: "CS-OXFAM-BLOOMSBURY-STREET-BOOKSHOP",
  bk077: "CS-OXFAM-BLACKHEATH",
  bk078: "CS-OXFAM-GREENWICH-BOOKSHOP",
  bk079: "CS-OXFAM-HERNE-HILL-BOOKSHOP",
  bk080: "CS-OXFAM-ISLINGTON-BOOKS-MUSIC",
  bk106: "LA-88665BAF",
}));

const addedOxfamCharityIds = [
  "oxfam-balham-bookshop",
  "oxfam-camden-bookshop",
  "oxfam-chiswick-bookshop",
  "oxfam-crouch-end-books-music",
  "oxfam-hampstead-bookshop",
  "oxfam-highgate-bookshop",
  "oxfam-portobello-bookshop",
  "oxfam-victoria-bookshop",
];

const verifiedNewOxfam = [
  {
    id: "oxfam-ealing-bookshop", place_id: "CS-OXFAM-EALING-BOOKSHOP", name: "Oxfam — Ealing Bookshop",
    branch: "Ealing Bookshop", address: "1 The Green, Ealing, London", postcode: "W5 5DA", tfl_zone: "3",
    lat: 51.5115897, lon: -0.3048582, station: "Ealing Broadway",
    source_url: "https://www.oxfam.org.uk/shops/oxfam-bookshop-ealing/",
  },
  {
    id: "oxfam-muswell-hill-bookshop", place_id: "CS-OXFAM-MUSWELL-HILL-BOOKSHOP", name: "Oxfam — Muswell Hill Bookshop",
    branch: "Muswell Hill Bookshop", address: "378 Muswell Hill Broadway, London", postcode: "N10 1DJ", tfl_zone: "3",
    lat: 51.5915384, lon: -0.1427329, station: "Highgate",
    source_url: "https://www.oxfam.org.uk/shops/oxfam-bookshop-muswell-hill/",
  },
  {
    id: "oxfam-kentish-town-books-music", place_id: "CS-OXFAM-KENTISH-TOWN-BOOKS-MUSIC", name: "Oxfam — Kentish Town Books & Music",
    branch: "Kentish Town Books & Music", address: "166 Kentish Town Road, London", postcode: "NW5 2AG", tfl_zone: "2",
    lat: 51.5469758, lon: -0.1413684, station: "Kentish Town West",
    source_url: "https://www.oxfam.org.uk/shops/oxfam-books-music-kentish-town/",
  },
];

function sql(value) {
  if (value === null || value === undefined) return "NULL";
  return `'${String(value).replaceAll("'", "''")}'`;
}

function json(value) {
  return JSON.stringify(value || []);
}

function slug(value) {
  return String(value || "")
    .normalize("NFKD").replace(/[\u0300-\u036f]/g, "")
    .toLowerCase().replace(/&/g, " and ").replace(/[^a-z0-9]+/g, "-").replace(/(^-|-$)/g, "");
}

function canonicalId(shop) {
  return existingPlaceByBookId.get(shop.id) || `BOOK-${shop.id.toUpperCase()}`;
}

function bookshopFromCharity(row) {
  const branch = String(row.branch || row.name || "").replace(/\s+(Bookshop|Books\s*&\s*Music)$/i, "");
  return {
    id: `book-${row.id}`,
    place_id: row.place_id,
    name: "Oxfam Bookshop",
    branch,
    address: row.address,
    postcode: row.postcode,
    zone: row.tfl_zone,
    station: branch,
    lat: row.lat,
    lon: row.lon,
    type: "charity",
    ownership: "Oxfam",
    stock: ["Second-hand", "books", "music"],
    stock_it: ["usato", "libri", "musica"],
    specialisms: ["General donated books and music"],
    specialisms_it: ["libri e musica donati"],
    specialism_tags: [],
    features: ["Volunteer-run", "Changing donated stock"],
    features_it: ["gestita da volontari", "assortimento donato variabile"],
    feature_tags: [],
    heritage: "Oxfam specialist books and music branch",
    heritage_it: "Sede Oxfam specializzata in libri e musica",
    description: `Oxfam's ${branch} specialist branch for donated second-hand books and music; stock changes continuously.`,
    description_it: `Sede specializzata Oxfam di ${branch} per libri e musica usati donati; l’assortimento cambia continuamente.`,
    website: row.source_url,
    source: row.source_url,
    confidence: "high",
    last_verified: "2026-11-04",
  };
}

function newCharityRow(row) {
  const description_en = "Oxfam specialist charity bookshop selling donated second-hand books and music; stock changes continuously.";
  const description_it = "Libreria solidale specializzata Oxfam con libri e musica usati donati; l’assortimento cambia continuamente.";
  return {
    ...row,
    organization: "Oxfam", organization_id: "oxfam", category: "charity_shop", subtype: "books_music",
    subtype_label_en: "Books & music", subtype_label_it: "Libri e musica",
    description_en, description_it, specialism_en: "Books and music only", specialism_it: "Solo libri e musica",
    opening_hours_en: "Check official source", opening_hours_it: "Controllare la fonte ufficiale",
    data_status: "official_source_verified", last_verified_at: "2026-11-04",
  };
}

const addedExistingOxfam = addedOxfamCharityIds.map((id) => {
  const row = charityShops.find((shop) => shop.id === id);
  if (!row) throw new Error(`Missing charity source row: ${id}`);
  return bookshopFromCharity(row);
});
const newCharityRows = verifiedNewOxfam.map(newCharityRow);
const newOxfamBookshops = newCharityRows.map(bookshopFromCharity);
const allBookshops = [...sourceBookshops, ...addedExistingOxfam, ...newOxfamBookshops]
  .map((shop) => ({ ...shop, place_id: shop.place_id || canonicalId(shop) }));

if (allBookshops.length !== 124) throw new Error(`Expected 124 bookshops, found ${allBookshops.length}`);
if (new Set(allBookshops.map((shop) => shop.place_id)).size !== 124) throw new Error("Duplicate canonical place_id in bookshop collection");

const out = [];
out.push("PRAGMA foreign_keys = ON;", "");
out.push("-- Canonical cross-tool classification. The existing places.category remains the", "-- backward-compatible primary category; collections provide many-to-many membership.");
out.push("INSERT OR IGNORE INTO categories(code,label_en,label_it,display_order) VALUES ('BOOKSHOP','Bookshops','Librerie',11);");
out.push("CREATE TABLE IF NOT EXISTS place_collections (place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE, collection_code TEXT NOT NULL REFERENCES categories(code), created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY(place_id, collection_code));");
out.push("CREATE INDEX IF NOT EXISTS idx_place_collections_collection ON place_collections(collection_code, place_id);");
out.push("INSERT OR IGNORE INTO place_collections(place_id,collection_code) SELECT id,category FROM places;");
out.push("CREATE TABLE IF NOT EXISTS bookshop_details (place_id TEXT PRIMARY KEY REFERENCES places(id) ON DELETE CASCADE, source_bookshop_id TEXT NOT NULL UNIQUE, branch_name TEXT NOT NULL DEFAULT '', ownership TEXT NOT NULL DEFAULT '', shop_type TEXT NOT NULL, address TEXT NOT NULL, postcode TEXT NOT NULL DEFAULT '', tfl_zone TEXT NOT NULL DEFAULT '', station_name TEXT NOT NULL DEFAULT '', stock_json TEXT NOT NULL DEFAULT '[]', stock_it_json TEXT NOT NULL DEFAULT '[]', specialisms_json TEXT NOT NULL DEFAULT '[]', specialisms_it_json TEXT NOT NULL DEFAULT '[]', specialism_tags_json TEXT NOT NULL DEFAULT '[]', features_json TEXT NOT NULL DEFAULT '[]', features_it_json TEXT NOT NULL DEFAULT '[]', feature_tags_json TEXT NOT NULL DEFAULT '[]', heritage_en TEXT NOT NULL DEFAULT '', heritage_it TEXT NOT NULL DEFAULT '', source_url TEXT NOT NULL DEFAULT '', confidence TEXT NOT NULL DEFAULT 'medium', last_verified_at TEXT NOT NULL);");
out.push("CREATE INDEX IF NOT EXISTS idx_bookshop_details_type ON bookshop_details(shop_type, tfl_zone);");
out.push("");

for (const row of newCharityRows) {
  out.push(`INSERT INTO places(id,slug,name,category,latitude,longitude,status,description_en,description_it,editorial_hook_en,editorial_hook_it,official_url,google_maps_url,access_type,access_notes_en,access_notes_it,opening_hours_json,tourist_intensity,crowd_scope,visit_minutes,best_time,weather_fit,visit_mode,mood_quiet,mood_unexpected,mood_beautiful,mood_weird,mood_local,mood_green,mood_atmospheric,mood_lively,mood_reviewed,mood_confidence,mood_basis,source_type,source_ref,last_verified_at,published_at,updated_at) VALUES (${sql(row.place_id)},${sql(slug(row.name))},${sql(row.name)},'CHARITY_SHOP',${row.lat},${row.lon},'published',${sql(row.description_en)},${sql(row.description_it)},${sql(row.description_en)},${sql(row.description_it)},${sql(row.source_url)},${sql(`https://www.google.com/maps?q=${row.lat},${row.lon}`)},'VARIABLE',${sql(`${row.address}, ${row.postcode}. Check the official source before a special journey.`)},${sql(`${row.address}, ${row.postcode}. Controlla la fonte ufficiale prima di un viaggio apposito.`)},'{}',20,'VENUE',30,'DAY','RAIN_FRIENDLY','STOP',1,2,1,0,3,0,1,1,1,'HIGH','OFFICIAL_OXFAM_SOURCE','official-source',${sql(row.source_url)},'2026-11-04',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP) ON CONFLICT(id) DO UPDATE SET slug=excluded.slug,name=excluded.name,latitude=excluded.latitude,longitude=excluded.longitude,status='published',description_en=excluded.description_en,description_it=excluded.description_it,official_url=excluded.official_url,source_ref=excluded.source_ref,last_verified_at=excluded.last_verified_at,updated_at=CURRENT_TIMESTAMP;`);
  out.push(`INSERT INTO charity_shop_details(place_id,organisation_id,organisation_name,branch_name,subtype,address,postcode,tfl_zone,specialism_en,specialism_it,opening_hours_en,opening_hours_it,source_url,data_status,last_verified_at) VALUES (${sql(row.place_id)},'oxfam','Oxfam',${sql(row.branch)},'books_music',${sql(row.address)},${sql(row.postcode)},${sql(row.tfl_zone)},'Books and music only','Solo libri e musica','Check official source','Controllare la fonte ufficiale',${sql(row.source_url)},'official_source_verified','2026-11-04') ON CONFLICT(place_id) DO UPDATE SET branch_name=excluded.branch_name,subtype='books_music',address=excluded.address,postcode=excluded.postcode,tfl_zone=excluded.tfl_zone,source_url=excluded.source_url,data_status=excluded.data_status,last_verified_at=excluded.last_verified_at;`);
  out.push(`INSERT OR IGNORE INTO place_collections(place_id,collection_code) VALUES (${sql(row.place_id)},'CHARITY_SHOP');`);
}

for (const shop of allBookshops) {
  const placeId = shop.place_id;
  if (!existingPlaceByBookId.has(shop.id) && !shop.id.startsWith("book-oxfam-")) {
    out.push(`INSERT INTO places(id,slug,name,category,latitude,longitude,status,description_en,description_it,editorial_hook_en,editorial_hook_it,official_url,google_maps_url,access_type,access_notes_en,access_notes_it,opening_hours_json,tourist_intensity,crowd_scope,visit_minutes,best_time,weather_fit,visit_mode,mood_quiet,mood_unexpected,mood_beautiful,mood_weird,mood_local,mood_green,mood_atmospheric,mood_lively,mood_reviewed,mood_confidence,mood_basis,source_type,source_ref,last_verified_at,published_at,updated_at) VALUES (${sql(placeId)},${sql(`${slug(shop.name)}-${shop.id}`)},${sql(shop.name)},'BOOKSHOP',${shop.lat},${shop.lon},'published',${sql(shop.description)},${sql(shop.description_it || shop.description)},${sql(shop.heritage || shop.description)},${sql(shop.heritage_it || shop.description_it || shop.description)},${sql(shop.website || shop.source)},${sql(`https://www.google.com/maps?q=${shop.lat},${shop.lon}`)},'VARIABLE',${sql(`${shop.address}, ${shop.postcode}. Opening hours can change; check the linked source before a special journey.`)},${sql(`${shop.address}, ${shop.postcode}. Gli orari possono cambiare: controlla la fonte collegata prima di un viaggio apposito.`)},'{}',25,'VENUE',35,'DAY','RAIN_FRIENDLY','STOP',2,2,1,0,3,0,2,1,1,${sql(shop.confidence === "high" ? "HIGH" : "MEDIUM")},'CURATED_BOOKSHOP_INVENTORY','curated-bookshop-inventory',${sql(shop.source || shop.website)},${sql(shop.last_verified || "2026-11-04")},CURRENT_TIMESTAMP,CURRENT_TIMESTAMP) ON CONFLICT(id) DO UPDATE SET name=excluded.name,status='published',description_en=excluded.description_en,description_it=excluded.description_it,editorial_hook_en=excluded.editorial_hook_en,editorial_hook_it=excluded.editorial_hook_it,official_url=excluded.official_url,last_verified_at=excluded.last_verified_at,updated_at=CURRENT_TIMESTAMP;`);
  }
  out.push(`INSERT OR IGNORE INTO place_collections(place_id,collection_code) VALUES (${sql(placeId)},'BOOKSHOP');`);
  out.push(`INSERT INTO bookshop_details(place_id,source_bookshop_id,branch_name,ownership,shop_type,address,postcode,tfl_zone,station_name,stock_json,stock_it_json,specialisms_json,specialisms_it_json,specialism_tags_json,features_json,features_it_json,feature_tags_json,heritage_en,heritage_it,source_url,confidence,last_verified_at) VALUES (${sql(placeId)},${sql(shop.id)},${sql(shop.branch)},${sql(shop.ownership)},${sql(shop.type)},${sql(shop.address)},${sql(shop.postcode)},${sql(shop.zone)},${sql(shop.station)},${sql(json(shop.stock))},${sql(json(shop.stock_it))},${sql(json(shop.specialisms))},${sql(json(shop.specialisms_it))},${sql(json(shop.specialism_tags))},${sql(json(shop.features))},${sql(json(shop.features_it))},${sql(json(shop.feature_tags))},${sql(shop.heritage)},${sql(shop.heritage_it)},${sql(shop.website || shop.source)},${sql(shop.confidence || "medium")},${sql(shop.last_verified || "2026-11-04")}) ON CONFLICT(place_id) DO UPDATE SET source_bookshop_id=excluded.source_bookshop_id,branch_name=excluded.branch_name,ownership=excluded.ownership,shop_type=excluded.shop_type,address=excluded.address,postcode=excluded.postcode,tfl_zone=excluded.tfl_zone,station_name=excluded.station_name,stock_json=excluded.stock_json,stock_it_json=excluded.stock_it_json,specialisms_json=excluded.specialisms_json,specialisms_it_json=excluded.specialisms_it_json,specialism_tags_json=excluded.specialism_tags_json,features_json=excluded.features_json,features_it_json=excluded.features_it_json,feature_tags_json=excluded.feature_tags_json,heritage_en=excluded.heritage_en,heritage_it=excluded.heritage_it,source_url=excluded.source_url,confidence=excluded.confidence,last_verified_at=excluded.last_verified_at;`);
}

out.push("UPDATE places SET status='archived', updated_at=CURRENT_TIMESTAMP WHERE id='LA-B46237A3' AND status != 'archived';");
out.push("DELETE FROM place_collections WHERE place_id='LA-B46237A3';");
out.push("INSERT INTO app_meta(key,value,updated_at) VALUES ('schema_version','22',CURRENT_TIMESTAMP) ON CONFLICT(key) DO UPDATE SET value='22',updated_at=CURRENT_TIMESTAMP;");
out.push("INSERT INTO app_meta(key,value,updated_at) VALUES ('data_version','2026-11-04-unified-bookshops',CURRENT_TIMESTAMP) ON CONFLICT(key) DO UPDATE SET value=excluded.value,updated_at=CURRENT_TIMESTAMP;");

await writeFile(outputPath, `${out.join("\n")}\n`);
if (fallbackPath) {
  await writeFile(fallbackPath, `${JSON.stringify({ schema_version: "2.0", generated: "2026-11-04", count: allBookshops.length, shops: allBookshops }, null, 2)}\n`);
}
if (charityFallbackPath) {
  const reconciledCharities = [...charityShops, ...newCharityRows];
  if (reconciledCharities.length !== 301) throw new Error(`Expected 301 charity shops, found ${reconciledCharities.length}`);
  await writeFile(charityFallbackPath, `${JSON.stringify({
    ...charityPayload,
    schema_version: "2.0",
    generated_at: "2026-11-04",
    count: reconciledCharities.length,
    source_note: "Fail-safe export of the canonical D1 inventory; public APIs read D1 directly.",
    shops: reconciledCharities,
  }, null, 2)}\n`);
}
console.log(`Wrote ${path.resolve(outputPath)} with ${allBookshops.length} canonical bookshops.`);
