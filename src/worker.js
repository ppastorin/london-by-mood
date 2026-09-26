const LONDON_BOUNDS = Object.freeze({ west: -0.75, south: 51.20, east: 0.45, north: 51.80 });
const PLACE_BOUNDS = Object.freeze({ west: -1.00, south: 50.80, east: 0.75, north: 52.00 });
const DEFAULT_LIMIT = 1200;
const MAX_LIMIT = 2000;
const CATEGORY_ORDER = ["AREA", "BUILDING", "MUSEUM", "ODDITY", "PARK", "RELIGIOUS", "SHOPPING", "VIEWPOINT"];

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);
    try {
      if (url.pathname === "/health") return health(env);
      if (url.pathname === "/api/pois" || url.pathname === "/api/places") {
        return request.method === "GET" ? listPublicPlaces(url, env) : methodNotAllowed("GET");
      }
      if (url.pathname === "/api/geocode") {
        return request.method === "GET" ? geocodeAddress(url, env, ctx) : methodNotAllowed("GET");
      }
      if (url.pathname === "/api/route") {
        return request.method === "POST" ? routeRequest(request, env) : methodNotAllowed("POST");
      }
      if (url.pathname === "/api/bikepoints") {
        return request.method === "GET" ? bikePoints(url, env) : methodNotAllowed("GET");
      }
      if (url.pathname === "/api/admin/resolve") {
        const auth = requireAdmin(request, env);
        if (auth) return auth;
        return request.method === "POST" ? resolveCapturedPlace(request, env) : methodNotAllowed("POST");
      }
      if (url.pathname === "/api/admin/imports/preview") {
        const auth = requireAdmin(request, env);
        if (auth) return auth;
        return request.method === "POST" ? previewCsvImport(request, env) : methodNotAllowed("POST");
      }
      if (url.pathname === "/api/admin/imports/commit") {
        const auth = requireAdmin(request, env);
        if (auth) return auth;
        return request.method === "POST" ? commitCsvImport(request, env) : methodNotAllowed("POST");
      }
      if (url.pathname === "/api/admin/places") {
        const auth = requireAdmin(request, env);
        if (auth) return auth;
        if (request.method === "GET") return listAdminPlaces(url, env);
        if (request.method === "POST") return createPlace(request, env);
        return methodNotAllowed("GET, POST");
      }
      const placeMatch = url.pathname.match(/^\/api\/admin\/places\/([^/]+)$/);
      if (placeMatch) {
        const auth = requireAdmin(request, env);
        if (auth) return auth;
        if (request.method === "GET") return getAdminPlace(decodeURIComponent(placeMatch[1]), env);
        if (request.method === "PUT") return updatePlace(decodeURIComponent(placeMatch[1]), request, env);
        return methodNotAllowed("GET, PUT");
      }

      const response = await env.ASSETS.fetch(request);
      return addSiteHeaders(response);
    } catch (error) {
      console.error(error);
      return json({ ok: false, error: error instanceof Error ? error.message : "Unexpected error" }, 500, {
        "Cache-Control": "no-store",
      });
    }
  },
};

async function health(env) {
  if (!env.DB) return json({ ok: false, service: "london-places", database: "missing" }, 503);
  const row = await env.DB.prepare("SELECT value FROM app_meta WHERE key = 'data_version'").first();
  return json({ ok: true, service: "london-places", database: "d1", dataVersion: row?.value ?? null });
}

async function listPublicPlaces(url, env) {
  requireDatabase(env);
  const places = await queryPlaces(env.DB, parsePlaceFilters(url.searchParams, true));
  return json({ ok: true, schemaVersion: 2, generatedAt: new Date().toISOString(), count: places.length, places }, 200, {
    "Cache-Control": "public, max-age=60, s-maxage=300, stale-while-revalidate=86400",
  });
}

async function listAdminPlaces(url, env) {
  requireDatabase(env);
  const places = await queryPlaces(env.DB, parsePlaceFilters(url.searchParams, false));
  return json({ ok: true, count: places.length, places }, 200, { "Cache-Control": "no-store" });
}

function parsePlaceFilters(params, publicOnly) {
  const filters = {
    publicOnly,
    status: publicOnly ? "published" : normalStatus(params.get("status"), ""),
    // D1/SQLite limits LIKE patterns to 50 bytes. Keep room for the two % wildcards.
    query: cleanUtf8(params.get("q"), 48),
    categories: String(params.get("categories") || "").split(",").map(normalCategory).filter(Boolean),
    limit: clampInt(params.get("limit"), 1, MAX_LIMIT, DEFAULT_LIMIT),
    offset: clampInt(params.get("offset"), 0, 100000, 0),
  };
  const bbox = ["west", "south", "east", "north"].map((key) => finiteNumber(params.get(key)));
  if (bbox.every(Number.isFinite)) filters.bbox = bbox;
  return filters;
}

async function queryPlaces(db, filters) {
  const where = [];
  const bindings = [];
  if (filters.publicOnly) where.push("p.status = 'published'");
  else if (filters.status) { where.push("p.status = ?"); bindings.push(filters.status); }
  if (filters.query) {
    where.push("(p.name LIKE ? ESCAPE '\\' OR p.description_en LIKE ? ESCAPE '\\' OR p.editorial_hook_en LIKE ? ESCAPE '\\')");
    const needle = `%${escapeLike(filters.query)}%`;
    bindings.push(needle, needle, needle);
  }
  if (filters.categories.length) {
    where.push(`p.category IN (${filters.categories.map(() => "?").join(",")})`);
    bindings.push(...filters.categories);
  }
  if (filters.bbox) {
    where.push("p.longitude BETWEEN ? AND ? AND p.latitude BETWEEN ? AND ?");
    bindings.push(filters.bbox[0], filters.bbox[2], filters.bbox[1], filters.bbox[3]);
  }
  bindings.push(filters.limit, filters.offset);
  const sql = `${placeSelect()} ${where.length ? `WHERE ${where.join(" AND ")}` : ""}
    ORDER BY CASE p.category ${CATEGORY_ORDER.map((category, index) => `WHEN '${category}' THEN ${index}`).join(" ")} ELSE 99 END,
      p.name COLLATE NOCASE LIMIT ? OFFSET ?`;
  const placeResult = await db.prepare(sql).bind(...bindings).all();
  const rows = placeResult.results || [];
  if (!rows.length) return [];
  const ids = rows.map((row) => row.id);
  const stations = new Map();
  // D1 accepts at most 100 bound parameters per statement. Leave headroom for
  // future filters and collect station relationships in bounded chunks.
  for (let start = 0; start < ids.length; start += 80) {
    const chunk = ids.slice(start, start + 80);
    const stationResult = await db.prepare(
      `SELECT place_id, position, station_id, station_name, distance_metres
       FROM place_stations WHERE place_id IN (${chunk.map(() => "?").join(",")})
       ORDER BY place_id, position`,
    ).bind(...chunk).all();
    for (const row of stationResult.results || []) {
      if (!stations.has(row.place_id)) stations.set(row.place_id, []);
      stations.get(row.place_id).push({ id: row.station_id, name: row.station_name, distanceM: row.distance_metres });
    }
  }
  return rows.map((row) => mapPlace(row, stations.get(row.id) || []));
}

function placeSelect() {
  return `SELECT p.*, t.mon_thu_00_05, t.mon_thu_06_10, t.mon_thu_10_13, t.mon_thu_13_17,
    t.mon_thu_17_20, t.mon_thu_20_24, t.friday_00_05, t.friday_06_10, t.friday_10_13,
    t.friday_13_17, t.friday_17_20, t.friday_20_24, t.weekend_00_05, t.weekend_06_10,
    t.weekend_10_13, t.weekend_13_17, t.weekend_17_20, t.weekend_20_24
    FROM places p LEFT JOIN place_time_affinity t ON t.place_id = p.id`;
}

function mapPlace(row, stations = []) {
  return {
    id: row.id, slug: row.slug, name: row.name, category: row.category, lat: row.latitude, lon: row.longitude,
    status: row.status, description: row.description_en || "", descriptionIt: row.description_it || "",
    touristIntensity: row.tourist_intensity, crowdScope: row.crowd_scope, visitMinutes: row.visit_minutes,
    officialUrl: row.official_url || "", guideUrl: row.guide_url || "",
    mapUrl: row.google_maps_url || `https://www.google.com/maps?q=${row.latitude},${row.longitude}`,
    price: row.price_text || "", accessType: row.access_type, accessNotes: row.access_notes_en || "",
    accessNotesIt: row.access_notes_it || "", openingHours: parseJsonObject(row.opening_hours_json),
    lastVerified: row.last_verified_at, stations,
    timeAffinity: {
      mon_thu_00_05: row.mon_thu_00_05 ?? 5, mon_thu_06_10: row.mon_thu_06_10 ?? 25,
      mon_thu_10_13: row.mon_thu_10_13 ?? 50, mon_thu_13_17: row.mon_thu_13_17 ?? 60,
      mon_thu_17_20: row.mon_thu_17_20 ?? 60, mon_thu_20_24: row.mon_thu_20_24 ?? 40,
      friday_00_05: row.friday_00_05 ?? 8, friday_06_10: row.friday_06_10 ?? 25,
      friday_10_13: row.friday_10_13 ?? 50, friday_13_17: row.friday_13_17 ?? 65,
      friday_17_20: row.friday_17_20 ?? 70, friday_20_24: row.friday_20_24 ?? 50,
      weekend_00_05: row.weekend_00_05 ?? 10, weekend_06_10: row.weekend_06_10 ?? 30,
      weekend_10_13: row.weekend_10_13 ?? 55, weekend_13_17: row.weekend_13_17 ?? 65,
      weekend_17_20: row.weekend_17_20 ?? 65, weekend_20_24: row.weekend_20_24 ?? 50,
    },
    moods: { quiet: row.mood_quiet, unexpected: row.mood_unexpected, beautiful: row.mood_beautiful,
      weird: row.mood_weird, local: row.mood_local, green: row.mood_green,
      atmospheric: row.mood_atmospheric, lively: row.mood_lively },
    hook: row.editorial_hook_en || "", hookIt: row.editorial_hook_it || "", bestTime: row.best_time,
    weatherFit: row.weather_fit, visitMode: row.visit_mode, reviewed: Boolean(row.mood_reviewed),
    confidence: row.mood_confidence, moodBasis: row.mood_basis || "",
    sourceType: row.source_type || "manual", sourceRef: row.source_ref || "",
    source: { type: row.source_type, ref: row.source_ref, row: row.source_row, code: row.source_code_r1 },
    createdAt: row.created_at, updatedAt: row.updated_at,
  };
}

async function getAdminPlace(id, env) {
  requireDatabase(env);
  const row = await env.DB.prepare(`${placeSelect()} WHERE p.id = ?`).bind(id).first();
  if (!row) return json({ ok: false, error: "Place not found" }, 404);
  const stations = await env.DB.prepare(
    "SELECT station_id AS id, station_name AS name, distance_metres AS distanceM FROM place_stations WHERE place_id = ? ORDER BY position",
  ).bind(id).all();
  return json({ ok: true, place: mapPlace(row, stations.results || []) }, 200, { "Cache-Control": "no-store" });
}

async function createPlace(request, env) {
  requireDatabase(env);
  const place = validatePlace(await readJson(request), null);
  place.id = place.id || `LA-${crypto.randomUUID().replaceAll("-", "").slice(0, 8).toUpperCase()}`;
  place.slug = await uniqueSlug(env.DB, place.slug || slugify(place.name), place.id);
  const statements = buildPlaceWriteStatements(env.DB, place, false);
  statements.push(env.DB.prepare(
    "INSERT INTO place_revisions(place_id, action, actor_email, snapshot_json) VALUES (?, 'create', ?, ?)",
  ).bind(place.id, actorEmail(request), JSON.stringify(place)));
  statements.push(bumpVersion(env.DB));
  await env.DB.batch(statements);
  return json({ ok: true, id: place.id, slug: place.slug }, 201, { "Cache-Control": "no-store" });
}

async function updatePlace(id, request, env) {
  requireDatabase(env);
  const existing = await env.DB.prepare(`${placeSelect()} WHERE p.id = ?`).bind(id).first();
  if (!existing) return json({ ok: false, error: "Place not found" }, 404);
  const place = validatePlace({ ...mapPlace(existing), ...await readJson(request), id }, id);
  place.slug = await uniqueSlug(env.DB, place.slug || slugify(place.name), id);
  const action = place.status === "archived" ? "archive" : existing.status !== "published" && place.status === "published" ? "publish" : "update";
  const statements = buildPlaceWriteStatements(env.DB, place, true);
  statements.unshift(env.DB.prepare(
    "INSERT INTO place_revisions(place_id, action, actor_email, snapshot_json) VALUES (?, ?, ?, ?)",
  ).bind(id, action, actorEmail(request), JSON.stringify(mapPlace(existing))));
  statements.push(bumpVersion(env.DB));
  await env.DB.batch(statements);
  return json({ ok: true, id, slug: place.slug }, 200, { "Cache-Control": "no-store" });
}

function buildPlaceWriteStatements(db, p, update) {
  const values = [p.slug, p.name, p.category, p.lat, p.lon, p.status, p.description, p.descriptionIt,
    p.hook, p.hookIt, p.officialUrl, p.guideUrl, p.mapUrl, p.price, p.accessType, p.accessNotes,
    p.accessNotesIt, JSON.stringify(p.openingHours || {}), p.touristIntensity, p.crowdScope,
    p.visitMinutes, p.bestTime, p.weatherFit, p.visitMode, p.moods.quiet, p.moods.unexpected,
    p.moods.beautiful, p.moods.weird, p.moods.local, p.moods.green, p.moods.atmospheric,
    p.moods.lively, p.reviewed ? 1 : 0, p.confidence, p.moodBasis, p.sourceType, p.sourceRef,
    p.lastVerified || null, p.status === "published" ? new Date().toISOString() : null];
  const main = update
    ? db.prepare(`UPDATE places SET slug=?, name=?, category=?, latitude=?, longitude=?, status=?, description_en=?,
      description_it=?, editorial_hook_en=?, editorial_hook_it=?, official_url=?, guide_url=?, google_maps_url=?,
      price_text=?, access_type=?, access_notes_en=?, access_notes_it=?, opening_hours_json=?, tourist_intensity=?,
      crowd_scope=?, visit_minutes=?, best_time=?, weather_fit=?, visit_mode=?, mood_quiet=?, mood_unexpected=?,
      mood_beautiful=?, mood_weird=?, mood_local=?, mood_green=?, mood_atmospheric=?, mood_lively=?, mood_reviewed=?,
      mood_confidence=?, mood_basis=?, source_type=?, source_ref=?, last_verified_at=?, published_at=COALESCE(published_at, ?),
      updated_at=CURRENT_TIMESTAMP WHERE id=?`).bind(...values, p.id)
    : db.prepare(`INSERT INTO places(id, slug, name, category, latitude, longitude, status, description_en,
      description_it, editorial_hook_en, editorial_hook_it, official_url, guide_url, google_maps_url, price_text,
      access_type, access_notes_en, access_notes_it, opening_hours_json, tourist_intensity, crowd_scope, visit_minutes,
      best_time, weather_fit, visit_mode, mood_quiet, mood_unexpected, mood_beautiful, mood_weird, mood_local,
      mood_green, mood_atmospheric, mood_lively, mood_reviewed, mood_confidence, mood_basis, source_type, source_ref,
      last_verified_at, published_at) VALUES (?,${values.map(() => "?").join(",")})`).bind(p.id, ...values);
  const a = p.timeAffinity;
  const affinityValues = [a.mon_thu_00_05, a.mon_thu_06_10, a.mon_thu_10_13, a.mon_thu_13_17,
    a.mon_thu_17_20, a.mon_thu_20_24, a.friday_00_05, a.friday_06_10, a.friday_10_13,
    a.friday_13_17, a.friday_17_20, a.friday_20_24, a.weekend_00_05, a.weekend_06_10,
    a.weekend_10_13, a.weekend_13_17, a.weekend_17_20, a.weekend_20_24];
  const affinity = db.prepare(`INSERT INTO place_time_affinity VALUES (?,${affinityValues.map(() => "?").join(",")})
    ON CONFLICT(place_id) DO UPDATE SET mon_thu_00_05=excluded.mon_thu_00_05, mon_thu_06_10=excluded.mon_thu_06_10,
    mon_thu_10_13=excluded.mon_thu_10_13, mon_thu_13_17=excluded.mon_thu_13_17,
    mon_thu_17_20=excluded.mon_thu_17_20, mon_thu_20_24=excluded.mon_thu_20_24,
    friday_00_05=excluded.friday_00_05, friday_06_10=excluded.friday_06_10, friday_10_13=excluded.friday_10_13,
    friday_13_17=excluded.friday_13_17, friday_17_20=excluded.friday_17_20, friday_20_24=excluded.friday_20_24,
    weekend_00_05=excluded.weekend_00_05, weekend_06_10=excluded.weekend_06_10,
    weekend_10_13=excluded.weekend_10_13, weekend_13_17=excluded.weekend_13_17,
    weekend_17_20=excluded.weekend_17_20, weekend_20_24=excluded.weekend_20_24`).bind(p.id, ...affinityValues);
  return [main, affinity];
}

function validatePlace(input, forcedId) {
  const name = cleanText(input.name, 180);
  const category = normalCategory(input.category);
  const lat = finiteNumber(input.lat ?? input.latitude);
  const lon = finiteNumber(input.lon ?? input.longitude);
  if (!name) throw new Error("Name is required");
  if (!category) throw new Error("Choose a valid category");
  if (!insidePlaceBounds(lat, lon)) throw new Error("Coordinates must be inside the London Advanced collection area");
  const moods = input.moods || {};
  const time = { ...defaultTimeAffinity(category), ...(input.timeAffinity || {}) };
  return {
    id: forcedId || cleanText(input.id, 80), slug: cleanText(input.slug, 180), name, category, lat, lon,
    status: normalStatus(input.status, "draft"), description: cleanText(input.description, 6000),
    descriptionIt: cleanText(input.descriptionIt, 6000), hook: cleanText(input.hook, 600),
    hookIt: cleanText(input.hookIt, 600), officialUrl: safeUrl(input.officialUrl), guideUrl: safeUrl(input.guideUrl),
    mapUrl: safeUrl(input.mapUrl) || `https://www.google.com/maps?q=${lat},${lon}`, price: cleanText(input.price, 120),
    accessType: cleanText(input.accessType, 40) || "VARIABLE", accessNotes: cleanText(input.accessNotes, 1000),
    accessNotesIt: cleanText(input.accessNotesIt, 1000), openingHours: input.openingHours || {},
    touristIntensity: clampInt(input.touristIntensity, 0, 100, 30), crowdScope: cleanText(input.crowdScope, 40) || "VENUE",
    visitMinutes: clampInt(input.visitMinutes, 1, 720, 30), bestTime: cleanText(input.bestTime, 40) || "ANY",
    weatherFit: cleanText(input.weatherFit, 40) || "ANY", visitMode: cleanText(input.visitMode, 40) || "STOP",
    moods: Object.fromEntries(["quiet", "unexpected", "beautiful", "weird", "local", "green", "atmospheric", "lively"]
      .map((key) => [key, clampInt(moods[key], 0, 3, 0)])),
    reviewed: Boolean(input.reviewed), confidence: ["LOW", "MEDIUM", "HIGH"].includes(input.confidence) ? input.confidence : "LOW",
    moodBasis: cleanText(input.moodBasis, 240), sourceType: cleanText(input.sourceType, 40) || "manual",
    sourceRef: cleanText(input.sourceRef, 500), lastVerified: cleanText(input.lastVerified, 32),
    timeAffinity: Object.fromEntries(Object.entries(time).map(([key, value]) => [key, clampInt(value, 0, 100, 50)])),
  };
}

function defaultTimeAffinity(category) {
  const defaults = {
    AREA: [5,25,50,60,65,40,8,25,50,65,75,55,10,30,55,65,70,55], BUILDING: [0,10,40,55,45,20,0,10,40,55,50,25,0,15,45,60,50,25],
    MUSEUM: [0,10,55,75,30,0,0,10,55,75,40,5,0,10,65,80,45,5], ODDITY: [5,20,45,55,55,30,8,20,45,55,65,40,10,25,50,60,60,40],
    PARK: [0,20,45,60,40,5,0,20,45,60,45,8,0,25,55,70,50,10], RELIGIOUS: [0,20,40,40,25,5,0,20,40,40,30,5,0,25,45,45,30,5],
    SHOPPING: [0,10,65,75,45,10,0,10,65,75,55,15,0,15,75,80,55,15], VIEWPOINT: [5,15,30,45,70,45,8,15,30,45,75,55,10,20,35,50,75,55],
  }[category] || Array(18).fill(50);
  const keys = ["mon_thu_00_05","mon_thu_06_10","mon_thu_10_13","mon_thu_13_17","mon_thu_17_20","mon_thu_20_24",
    "friday_00_05","friday_06_10","friday_10_13","friday_13_17","friday_17_20","friday_20_24",
    "weekend_00_05","weekend_06_10","weekend_10_13","weekend_13_17","weekend_17_20","weekend_20_24"];
  return Object.fromEntries(keys.map((key, index) => [key, defaults[index]]));
}

async function uniqueSlug(db, candidate, id) {
  const base = candidate || `place-${id.toLowerCase()}`;
  for (let suffix = 0; suffix < 100; suffix += 1) {
    const slug = suffix ? `${base}-${suffix + 1}` : base;
    const existing = await db.prepare("SELECT id FROM places WHERE slug = ? AND id <> ?").bind(slug, id).first();
    if (!existing) return slug;
  }
  throw new Error("Could not create a unique slug");
}

async function geocodeAddress(url, env, ctx) {
  const query = cleanText(url.searchParams.get("q"), 160);
  if (query.length < 3) return json({ ok: false, error: "Enter a London address or postcode" }, 400);
  const cache = globalThis.caches?.default;
  const cacheKey = new Request(`${url.origin}/__geocode?q=${encodeURIComponent(query.toLowerCase())}`);
  if (cache) { const hit = await cache.match(cacheKey); if (hit) return hit; }
  const result = await requestGeocode(query, env);
  const response = json({ ok: true, result, attribution: "Search data © OpenStreetMap contributors" }, 200, { "Cache-Control": "public, max-age=86400" });
  if (cache) ctx.waitUntil(cache.put(cacheKey, response.clone()));
  return response;
}

async function requestGeocode(query, env) {
  const target = new URL(env.GEOCODING_API_URL || "https://nominatim.openstreetmap.org/search");
  target.searchParams.set("q", /\blondon\b/i.test(query) ? query : `${query}, London, UK`);
  target.searchParams.set("format", "jsonv2"); target.searchParams.set("limit", "1"); target.searchParams.set("countrycodes", "gb");
  target.searchParams.set("viewbox", `${LONDON_BOUNDS.west},${LONDON_BOUNDS.north},${LONDON_BOUNDS.east},${LONDON_BOUNDS.south}`);
  target.searchParams.set("bounded", "1");
  const upstream = await fetch(target, { headers: { Accept: "application/json", "Accept-Language": "en-GB,en;q=0.8",
    Referer: "https://www.londonadvanced.com/", "User-Agent": "LondonAdvanced-Places/2.0 (https://www.londonadvanced.com/)" } });
  if (!upstream.ok) throw new Error(`Address search returned ${upstream.status}`);
  const matches = await upstream.json();
  if (!Array.isArray(matches) || !matches.length) throw new Error("We could not find that place in London");
  const lat = Number(matches[0].lat); const lon = Number(matches[0].lon);
  if (!insideLondonBounds(lat, lon)) throw new Error("That location appears to be outside London");
  return { label: String(matches[0].display_name || query), lat, lon };
}

async function resolveCapturedPlace(request, env) {
  const body = await readJson(request);
  const input = cleanText(body.input, 1000);
  if (!input) return json({ ok: false, error: "Paste a Google Maps link, place name or address" }, 400);
  let resolvedUrl = input;
  if (/^https?:\/\//i.test(input)) {
    try { const response = await fetch(input, { redirect: "follow", headers: { "User-Agent": "LondonAdvanced-Places/2.0" } }); resolvedUrl = response.url || input; }
    catch { resolvedUrl = input; }
  }
  const coordinates = coordinatesFromText(resolvedUrl) || coordinatesFromText(input);
  if (coordinates && insideLondonBounds(coordinates.lat, coordinates.lon)) {
    return json({ ok: true, result: { label: body.name || "Google Maps place", ...coordinates, sourceRef: input } });
  }
  const query = /^https?:\/\//i.test(input) ? mapsQuery(resolvedUrl) : input;
  if (!query) return json({ ok: false, error: "The link does not expose coordinates. Enter the place name or postcode as well." }, 422);
  const result = await requestGeocode(query, env);
  return json({ ok: true, result: { ...result, sourceRef: input } });
}

async function previewCsvImport(request, env) {
  requireDatabase(env);
  const body = await readJson(request);
  const filename = cleanText(body.filename, 240) || "google-mymaps.csv";
  const sourceName = cleanText(body.sourceName, 180) || filename.replace(/\.csv$/i, "");
  const csv = String(body.csv || "");
  if (!csv.trim()) return json({ ok: false, error: "Choose a non-empty My Maps CSV file" }, 400);
  if (new TextEncoder().encode(csv).byteLength > 2_000_000) {
    return json({ ok: false, error: "The CSV exceeds the 2 MB import limit" }, 413);
  }
  const parsed = parseCsv(csv);
  const headerIndex = Object.fromEntries(parsed.headers.map((header, index) => [header.trim().toLowerCase(), index]));
  if (headerIndex.wkt === undefined || headerIndex.name === undefined) {
    return json({ ok: false, error: "Expected My Maps columns named WKT and name" }, 422);
  }

  const placeResult = await env.DB.prepare(
    "SELECT id, name, latitude, longitude FROM places WHERE status <> 'archived'",
  ).all();
  const existingPlaces = placeResult.results || [];
  const sourceResult = await env.DB.prepare(
    "SELECT fingerprint, place_id FROM place_sources WHERE provider = 'google-mymaps'",
  ).all();
  const sourceMatches = new Map((sourceResult.results || []).map((row) => [row.fingerprint, row.place_id]));
  const batchId = `IMP-${crypto.randomUUID().replaceAll("-", "").slice(0, 12).toUpperCase()}`;
  const candidates = [];

  for (let index = 0; index < parsed.rows.length; index += 1) {
    const values = parsed.rows[index];
    const rowNumber = index + 2;
    const name = cleanText(values[headerIndex.name], 180);
    const description = headerIndex.description === undefined ? "" : cleanText(values[headerIndex.description], 6000);
    const point = parseWktPoint(values[headerIndex.wkt]);
    const raw = Object.fromEntries(parsed.headers.map((header, column) => [header, values[column] ?? ""]));
    if (!name || !point || !insidePlaceBounds(point.lat, point.lon)) {
      candidates.push({ rowNumber, name, description, lat: point?.lat ?? null, lon: point?.lon ?? null,
        fingerprint: "", classification: "invalid", matchedPlaceId: null,
        matchName: "", matchReason: !name ? "Missing name" : !point ? "Invalid WKT point" : "Coordinates outside collection bounds",
        distanceMetres: null, raw });
      continue;
    }
    const fingerprint = await importFingerprint(name, point.lat, point.lon);
    const knownPlaceId = sourceMatches.get(fingerprint);
    if (knownPlaceId) {
      const match = existingPlaces.find((place) => place.id === knownPlaceId);
      candidates.push({ rowNumber, name, description, ...point, fingerprint, classification: "existing",
        matchedPlaceId: knownPlaceId, matchName: match?.name || "", matchReason: "Previously imported source fingerprint",
        distanceMetres: match ? Math.round(haversineKm(point.lat, point.lon, match.latitude, match.longitude) * 1000) : null, raw });
      continue;
    }
    const match = closestPlaceMatch(name, point.lat, point.lon, existingPlaces);
    candidates.push({ rowNumber, name, description, ...point, fingerprint,
      classification: match.classification, matchedPlaceId: match.place?.id || null,
      matchName: match.place?.name || "", matchReason: match.reason,
      distanceMetres: match.distanceMetres, raw });
  }

  const counts = countClassifications(candidates);
  await env.DB.prepare(`INSERT INTO import_batches(id, provider, source_name, filename, total_rows, existing_rows,
    review_rows, new_rows, invalid_rows, actor_email) VALUES (?, 'google-mymaps', ?, ?, ?, ?, ?, ?, ?, ?)`)
    .bind(batchId, sourceName, filename, candidates.length, counts.existing, counts.review, counts.new, counts.invalid,
      actorEmail(request)).run();
  for (let start = 0; start < candidates.length; start += 70) {
    const statements = candidates.slice(start, start + 70).map((candidate) => env.DB.prepare(`INSERT INTO import_candidates(
      batch_id, row_number, name, description, latitude, longitude, fingerprint, classification, matched_place_id,
      match_reason, distance_metres, raw_json) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`)
      .bind(batchId, candidate.rowNumber, candidate.name, candidate.description, candidate.lat, candidate.lon,
        candidate.fingerprint, candidate.classification, candidate.matchedPlaceId, candidate.matchReason,
        candidate.distanceMetres, JSON.stringify(candidate.raw)));
    if (statements.length) await env.DB.batch(statements);
  }
  return json({ ok: true, batchId, filename, sourceName, counts: { total: candidates.length, ...counts }, candidates }, 200,
    { "Cache-Control": "no-store" });
}

async function commitCsvImport(request, env) {
  requireDatabase(env);
  const body = await readJson(request);
  const batchId = cleanText(body.batchId, 80);
  const category = normalCategory(body.category) || "MUSEUM";
  const selectedRows = Array.isArray(body.rows)
    ? new Set(body.rows.map((value) => clampInt(value, 2, 1000000, -1)).filter((value) => value >= 2))
    : null;
  const batch = await env.DB.prepare("SELECT * FROM import_batches WHERE id = ?").bind(batchId).first();
  if (!batch) return json({ ok: false, error: "Import preview not found" }, 404);
  if (batch.status === "committed") return json({ ok: true, batchId, created: batch.created_rows, alreadyCommitted: true });
  const result = await env.DB.prepare(`SELECT * FROM import_candidates
    WHERE batch_id = ? AND classification = 'new' AND created_place_id IS NULL ORDER BY row_number`).bind(batchId).all();
  const candidates = (result.results || []).filter((candidate) => !selectedRows || selectedRows.has(candidate.row_number));
  await env.DB.prepare("UPDATE import_batches SET status='committing' WHERE id=?").bind(batchId).run();
  const created = [];
  try {
    for (const candidate of candidates) {
      const id = `LA-${crypto.randomUUID().replaceAll("-", "").slice(0, 8).toUpperCase()}`;
      const place = validatePlace({
        id, name: candidate.name, category, lat: candidate.latitude, lon: candidate.longitude,
        status: "draft", description: candidate.description, confidence: "LOW", reviewed: false,
        sourceType: "google-mymaps-csv", sourceRef: `${batch.filename}#row=${candidate.row_number}`,
      }, null);
      place.id = id;
      place.slug = `${slugify(place.name).slice(0, 150)}-${id.slice(-8).toLowerCase()}`;
      const statements = buildPlaceWriteStatements(env.DB, place, false);
      statements.push(env.DB.prepare(`INSERT INTO place_sources(place_id, provider, source_name, source_latitude,
        source_longitude, fingerprint) VALUES (?, 'google-mymaps', ?, ?, ?, ?)`)
        .bind(id, candidate.name, candidate.latitude, candidate.longitude, candidate.fingerprint));
      statements.push(env.DB.prepare(
        "INSERT INTO place_revisions(place_id, action, actor_email, snapshot_json) VALUES (?, 'create', ?, ?)",
      ).bind(id, actorEmail(request), JSON.stringify(place)));
      statements.push(env.DB.prepare(
        "UPDATE import_candidates SET created_place_id=? WHERE batch_id=? AND row_number=?",
      ).bind(id, batchId, candidate.row_number));
      await env.DB.batch(statements);
      created.push({ rowNumber: candidate.row_number, id, name: candidate.name });
    }
    if (created.length) await bumpVersion(env.DB).run();
    await env.DB.prepare(`UPDATE import_batches SET status='committed', created_rows=?, committed_at=CURRENT_TIMESTAMP
      WHERE id=?`).bind(created.length, batchId).run();
    return json({ ok: true, batchId, created: created.length, places: created }, 201, { "Cache-Control": "no-store" });
  } catch (error) {
    await env.DB.prepare("UPDATE import_batches SET status='failed', created_rows=? WHERE id=?")
      .bind(created.length, batchId).run();
    throw error;
  }
}

function parseCsv(input) {
  const rows = [];
  let row = [], value = "", quoted = false;
  const text = String(input).replace(/^\uFEFF/, "");
  for (let index = 0; index < text.length; index += 1) {
    const character = text[index];
    if (quoted) {
      if (character === '"' && text[index + 1] === '"') { value += '"'; index += 1; }
      else if (character === '"') quoted = false;
      else value += character;
    } else if (character === '"') quoted = true;
    else if (character === ",") { row.push(value); value = ""; }
    else if (character === "\n" || character === "\r") {
      if (character === "\r" && text[index + 1] === "\n") index += 1;
      row.push(value); value = "";
      if (row.some((cell) => String(cell).trim())) rows.push(row);
      row = [];
    } else value += character;
  }
  if (value || row.length) { row.push(value); if (row.some((cell) => String(cell).trim())) rows.push(row); }
  if (!rows.length) throw new Error("The CSV contains no rows");
  const headers = rows.shift().map((header) => String(header).trim());
  return { headers, rows };
}

function parseWktPoint(value) {
  const match = String(value || "").match(/^\s*POINT\s*\(\s*([-+\d.eE]+)\s+([-+\d.eE]+)\s*\)\s*$/i);
  if (!match) return null;
  const lon = Number(match[1]), lat = Number(match[2]);
  return Number.isFinite(lat) && Number.isFinite(lon) ? { lat, lon } : null;
}

async function importFingerprint(name, lat, lon) {
  const source = `${normalImportName(name)}|${Number(lat).toFixed(5)}|${Number(lon).toFixed(5)}`;
  const digest = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(source));
  return [...new Uint8Array(digest)].map((byte) => byte.toString(16).padStart(2, "0")).join("");
}

function normalImportName(value) {
  return String(value || "").normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase()
    .replace(/^the\s+/, "").replace(/[^a-z0-9]+/g, "");
}

function nameSimilarity(left, right) {
  const a = normalImportName(left), b = normalImportName(right);
  if (!a || !b) return 0;
  if (a === b) return 1;
  const grams = (value) => {
    const result = new Set();
    for (let index = 0; index < Math.max(1, value.length - 2); index += 1) result.add(value.slice(index, index + 3));
    return result;
  };
  const first = grams(a), second = grams(b);
  const overlap = [...first].filter((item) => second.has(item)).length;
  return (2 * overlap) / (first.size + second.size);
}

function closestPlaceMatch(name, lat, lon, places) {
  let closest = null;
  for (const place of places) {
    const distanceMetres = haversineKm(lat, lon, Number(place.latitude), Number(place.longitude)) * 1000;
    const similarity = nameSimilarity(name, place.name);
    if (!closest || distanceMetres < closest.distanceMetres) closest = { place, distanceMetres, similarity };
    if (normalImportName(name) === normalImportName(place.name) && distanceMetres <= 250) {
      return { classification: "existing", place, distanceMetres: Math.round(distanceMetres), reason: "Same normalised name and nearby coordinates" };
    }
  }
  if (!closest) return { classification: "new", place: null, distanceMetres: null, reason: "No existing places" };
  const distance = Math.round(closest.distanceMetres);
  if ((closest.distanceMetres <= 8 && closest.similarity >= 0.35) ||
      (closest.distanceMetres <= 40 && closest.similarity >= 0.72)) {
    return { classification: "existing", place: closest.place, distanceMetres: distance, reason: "Strong name and coordinate match" };
  }
  if (closest.distanceMetres <= 80 || (closest.distanceMetres <= 300 && closest.similarity >= 0.68)) {
    return { classification: "review", place: closest.place, distanceMetres: distance, reason: "Possible renamed or colocated place" };
  }
  return { classification: "new", place: closest.place, distanceMetres: distance, reason: "No credible existing match" };
}

function countClassifications(candidates) {
  const counts = { existing: 0, review: 0, new: 0, invalid: 0 };
  for (const candidate of candidates) counts[candidate.classification] += 1;
  return counts;
}

async function routeRequest(request, env) {
  const body = await readJson(request);
  const start = { lat: finiteNumber(body.start?.lat), lon: finiteNumber(body.start?.lon) };
  const end = { lat: finiteNumber(body.end?.lat), lon: finiteNumber(body.end?.lon) };
  if (!insideLondonBounds(start.lat, start.lon) || !insideLondonBounds(end.lat, end.lon)) return json({ ok: false, error: "Both route points must be in London" }, 400);
  if (!env.HEIGIT_API_KEY) return json({ ok: false, error: "Routing is not configured in this dev environment" }, 503);
  const routingApiUrl = env.ROUTING_API_URL || "https://api.heigit.org/openrouteservice/v2/directions/foot-walking/geojson";
  let upstream;
  let responseText;
  try {
    upstream = await fetch(routingApiUrl, {
      method: "POST", headers: { Authorization: env.HEIGIT_API_KEY.trim(), "Content-Type": "application/json", Accept: "application/json" },
      body: JSON.stringify({ coordinates: [[start.lon, start.lat], [end.lon, end.lat]] }),
      signal: AbortSignal.timeout(12000),
    });
    responseText = await upstream.text();
  } catch (error) {
    return json({ ok: false, error: `Walking route service unavailable: ${safeErrorMessage(error)}` }, 502, { "Cache-Control": "no-store" });
  }
  let payload;
  try { payload = JSON.parse(responseText); } catch { payload = null; }
  if (!upstream.ok) {
    const upstreamMessage = payload?.error?.message || payload?.message || responseText.slice(0, 180).trim();
    throw new Error(upstreamMessage || `Routing returned ${upstream.status}`);
  }
  if (!payload) throw new Error("The routing service returned an unreadable response");
  const feature = payload?.features?.[0];
  if (!feature?.geometry) throw new Error("The routing service returned no route");
  return json({ ok: true, geometry: feature.geometry, distanceMetres: feature.properties?.summary?.distance ?? 0,
    durationSeconds: feature.properties?.summary?.duration ?? 0, attribution: "Route data © openrouteservice and OpenStreetMap contributors" });
}

function safeErrorMessage(error) {
  const message = error instanceof Error ? error.message : String(error || "Unknown error");
  return message.replace(/[\r\n]+/g, " ").slice(0, 180);
}

async function bikePoints(url, env) {
  const lat = finiteNumber(url.searchParams.get("lat")); const lon = finiteNumber(url.searchParams.get("lon"));
  if (!insideLondonBounds(lat, lon)) return json({ ok: false, error: "Choose a London starting point" }, 400);
  const target = new URL("https://api.tfl.gov.uk/BikePoint"); if (env.TFL_API_KEY) target.searchParams.set("app_key", env.TFL_API_KEY);
  const upstream = await fetch(target, { headers: { Accept: "application/json" } });
  if (!upstream.ok) throw new Error(`TfL BikePoint returned ${upstream.status}`);
  const payload = await upstream.json();
  const stations = payload.map((place) => mapBikePoint(place, lat, lon)).filter((place) => place.distanceM <= 500)
    .sort((a, b) => a.distanceM - b.distanceM).slice(0, 3);
  return json({ ok: true, updatedAt: new Date().toISOString(), stations }, 200, { "Cache-Control": "public, max-age=45" });
}

function mapBikePoint(place, lat, lon) {
  const props = Object.fromEntries((place.additionalProperties || []).map((p) => [p.key, p.value]));
  return { id: place.id, name: place.commonName, lat: Number(place.lat), lon: Number(place.lon),
    distanceM: Math.round(haversineKm(lat, lon, Number(place.lat), Number(place.lon)) * 1000), bikes: Number(props.NbBikes || 0),
    spaces: Number(props.NbEmptyDocks || 0), mapUrl: `https://www.google.com/maps?q=${place.lat},${place.lon}` };
}

function requireAdmin(request, env) {
  if (env.TRUST_CF_ACCESS === "true" && request.headers.get("Cf-Access-Authenticated-User-Email")) return null;
  if (!env.ADMIN_TOKEN) return json({ ok: false, error: "Admin access is not configured" }, 503);
  const token = request.headers.get("Authorization")?.replace(/^Bearer\s+/i, "") || request.headers.get("X-Admin-Token");
  return token === env.ADMIN_TOKEN ? null : json({ ok: false, error: "Admin authentication required" }, 401);
}

function actorEmail(request) { return request.headers.get("Cf-Access-Authenticated-User-Email") || "local-dev"; }
function bumpVersion(db) { return db.prepare("UPDATE app_meta SET value = CAST(value AS INTEGER) + 1, updated_at=CURRENT_TIMESTAMP WHERE key='data_version'"); }
function requireDatabase(env) { if (!env.DB) throw new Error("D1 binding DB is not configured"); }
async function readJson(request) { try { return await request.json(); } catch { throw new Error("Request body must be valid JSON"); } }
function normalCategory(value) { const v = String(value || "").trim().toUpperCase(); return CATEGORY_ORDER.includes(v) ? v : ""; }
function normalStatus(value, fallback) { const v = String(value || "").trim().toLowerCase(); return ["draft", "published", "archived"].includes(v) ? v : fallback; }
function cleanText(value, max = 500) { return String(value ?? "").trim().replace(/\u0000/g, "").slice(0, max); }
function cleanUtf8(value, maxBytes) {
  const cleaned = String(value ?? "").trim().replace(/\u0000/g, "");
  const encoder = new TextEncoder();
  let result = "";
  for (const character of cleaned) {
    if (encoder.encode(result + character).byteLength > maxBytes) break;
    result += character;
  }
  return result;
}
function parseJsonObject(value) { try { const parsed = JSON.parse(value || "{}"); return parsed && typeof parsed === "object" && !Array.isArray(parsed) ? parsed : {}; } catch { return {}; } }
function safeUrl(value) { const v = cleanText(value, 1200); if (!v) return ""; try { const u = new URL(v); return ["http:", "https:"].includes(u.protocol) ? u.href : ""; } catch { return ""; } }
function finiteNumber(value) { if (value === null || value === undefined || String(value).trim() === "") return NaN; const n = Number(value); return Number.isFinite(n) ? n : NaN; }
function clampInt(value, min, max, fallback) { const n = Number.parseInt(value, 10); return Number.isFinite(n) ? Math.min(max, Math.max(min, n)) : fallback; }
function insideLondonBounds(lat, lon) { return Number.isFinite(lat) && Number.isFinite(lon) && lat >= LONDON_BOUNDS.south && lat <= LONDON_BOUNDS.north && lon >= LONDON_BOUNDS.west && lon <= LONDON_BOUNDS.east; }
function insidePlaceBounds(lat, lon) { return Number.isFinite(lat) && Number.isFinite(lon) && lat >= PLACE_BOUNDS.south && lat <= PLACE_BOUNDS.north && lon >= PLACE_BOUNDS.west && lon <= PLACE_BOUNDS.east; }
function escapeLike(value) { return value.replace(/[\\%_]/g, "\\$&"); }
function slugify(value) { return String(value || "").normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "").slice(0, 160) || "place"; }
function coordinatesFromText(value) { const patterns = [/@(-?\d{1,2}\.\d+),(-?\d{1,3}\.\d+)/, /[?&](?:q|query)=(-?\d{1,2}\.\d+)(?:,|%2C|\s)+(-?\d{1,3}\.\d+)/i, /!3d(-?\d{1,2}\.\d+)!4d(-?\d{1,3}\.\d+)/]; for (const pattern of patterns) { const m = String(value).match(pattern); if (m) return { lat: Number(m[1]), lon: Number(m[2]) }; } return null; }
function mapsQuery(value) { try { const u = new URL(value); return u.searchParams.get("q") || u.searchParams.get("query") || decodeURIComponent(u.pathname.split("/place/")[1]?.split("/")[0] || "").replaceAll("+", " "); } catch { return ""; } }
function haversineKm(lat1, lon1, lat2, lon2) { const r = 6371; const rad = (x) => x * Math.PI / 180; const dLat = rad(lat2-lat1); const dLon = rad(lon2-lon1); const a = Math.sin(dLat/2)**2 + Math.cos(rad(lat1))*Math.cos(rad(lat2))*Math.sin(dLon/2)**2; return 2*r*Math.atan2(Math.sqrt(a),Math.sqrt(1-a)); }
function methodNotAllowed(allow) { return json({ ok: false, error: "Method not allowed" }, 405, { Allow: allow }); }
function json(value, status = 200, headers = {}) { return new Response(JSON.stringify(value), { status, headers: { "Content-Type": "application/json; charset=utf-8", "X-Content-Type-Options": "nosniff", ...headers } }); }
function addSiteHeaders(response) { const headers = new Headers(response.headers); headers.delete("X-Frame-Options"); headers.set("Content-Security-Policy", "frame-ancestors *"); headers.set("Referrer-Policy", "strict-origin-when-cross-origin"); headers.set("X-Content-Type-Options", "nosniff"); return new Response(response.body, { status: response.status, statusText: response.statusText, headers }); }

export const __test = { mapPlace, validatePlace, coordinatesFromText, slugify, insideLondonBounds,
  parseCsv, parseWktPoint, normalImportName, nameSimilarity, closestPlaceMatch };
