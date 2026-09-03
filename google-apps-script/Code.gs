/**
 * London by Mood — Google Sheets data endpoint
 *
 * Attach this script to the Google Sheet that contains POI_MASTER.
 * Deploy it as a Web app, executing as you and accessible to anyone.
 * The spreadsheet itself can remain private.
 */

const CONFIG = Object.freeze({
  sheetName: 'POI_MASTER',
  schemaVersion: 1,
});

const TIME_FIELDS = Object.freeze([
  'ta_mon_thu_00_05', 'ta_mon_thu_06_10', 'ta_mon_thu_10_13',
  'ta_mon_thu_13_17', 'ta_mon_thu_17_20', 'ta_mon_thu_20_24',
  'ta_friday_00_05', 'ta_friday_06_10', 'ta_friday_10_13',
  'ta_friday_13_17', 'ta_friday_17_20', 'ta_friday_20_24',
  'ta_weekend_00_05', 'ta_weekend_06_10', 'ta_weekend_10_13',
  'ta_weekend_13_17', 'ta_weekend_17_20', 'ta_weekend_20_24',
]);

const REQUIRED_FIELDS = Object.freeze([
  'active', 'poi_id', 'name', 'category', 'lat', 'lon',
  'tourist_intensity', 'min_visit_minutes',
  'mood_quiet', 'mood_unexpected', 'mood_beautiful', 'mood_weird',
  'mood_local', 'mood_green', 'mood_atmospheric', 'mood_lively',
  'editorial_hook', 'best_time', 'weather_fit', 'visit_mode',
  'mood_reviewed', 'mood_confidence',
]);

function doGet() {
  try {
    const payload = buildPayload_();
    return jsonOutput_(JSON.stringify(payload));
  } catch (error) {
    return jsonOutput_(JSON.stringify({
      ok: false,
      schemaVersion: CONFIG.schemaVersion,
      error: error && error.message ? error.message : String(error),
    }));
  }
}

function buildPayload_() {
  const spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  const sheet = spreadsheet.getSheetByName(CONFIG.sheetName);
  if (!sheet) throw new Error('Missing sheet: ' + CONFIG.sheetName);

  const values = sheet.getDataRange().getValues();
  if (values.length < 2) throw new Error(CONFIG.sheetName + ' has no data rows');

  const headers = values[0].map(function (value) { return text_(value); });
  const column = {};
  headers.forEach(function (header, index) { column[header] = index; });

  const missing = REQUIRED_FIELDS.filter(function (field) {
    return column[field] === undefined;
  });
  if (missing.length) throw new Error('Missing required columns: ' + missing.join(', '));

  const places = values.slice(1)
    .filter(function (row) { return boolean_(cell_(row, column, 'active')); })
    .map(function (row) { return mapPlace_(row, column); })
    .filter(function (place) {
      return place.id && place.name && Number.isFinite(place.lat) && Number.isFinite(place.lon);
    });

  const ids = {};
  const duplicates = [];
  places.forEach(function (place) {
    if (ids[place.id]) duplicates.push(place.id);
    ids[place.id] = true;
  });
  if (duplicates.length) {
    throw new Error('Duplicate active poi_id values: ' + duplicates.slice(0, 10).join(', '));
  }

  return {
    ok: true,
    schemaVersion: CONFIG.schemaVersion,
    generatedAt: new Date().toISOString(),
    sourceSheet: CONFIG.sheetName,
    count: places.length,
    places: places,
  };
}

function mapPlace_(row, column) {
  const timeAffinity = {};
  TIME_FIELDS.forEach(function (field) {
    // 50 is a deliberately neutral fallback for a newly added place.
    timeAffinity[field.replace('ta_', '')] = number_(cell_(row, column, field), 50);
  });

  return {
    id: text_(cell_(row, column, 'poi_id')),
    name: text_(cell_(row, column, 'name')),
    category: text_(cell_(row, column, 'category')),
    lat: number_(cell_(row, column, 'lat'), null),
    lon: number_(cell_(row, column, 'lon'), null),
    touristIntensity: number_(cell_(row, column, 'tourist_intensity'), 1),
    crowdScope: text_(cell_(row, column, 'crowd_scope')),
    visitMinutes: number_(cell_(row, column, 'min_visit_minutes'), 30),
    officialUrl: url_(cell_(row, column, 'official_url')),
    guideUrl: url_(cell_(row, column, 'guide_url')),
    accessType: text_(cell_(row, column, 'access_type')),
    accessNotes: text_(cell_(row, column, 'access_notes')),
    lastVerified: dateText_(cell_(row, column, 'last_verified')),
    stations: [1, 2, 3].map(function (position) {
      return {
        name: text_(cell_(row, column, 'station' + position + '_name')),
        distanceM: number_(cell_(row, column, 'station' + position + '_distance_m'), null),
      };
    }).filter(function (station) { return station.name; }),
    timeAffinity: timeAffinity,
    moods: {
      quiet: mood_(cell_(row, column, 'mood_quiet')),
      unexpected: mood_(cell_(row, column, 'mood_unexpected')),
      beautiful: mood_(cell_(row, column, 'mood_beautiful')),
      weird: mood_(cell_(row, column, 'mood_weird')),
      local: mood_(cell_(row, column, 'mood_local')),
      green: mood_(cell_(row, column, 'mood_green')),
      atmospheric: mood_(cell_(row, column, 'mood_atmospheric')),
      lively: mood_(cell_(row, column, 'mood_lively')),
    },
    hook: text_(cell_(row, column, 'editorial_hook')),
    bestTime: text_(cell_(row, column, 'best_time')) || 'ANY',
    weatherFit: text_(cell_(row, column, 'weather_fit')) || 'ANY',
    visitMode: text_(cell_(row, column, 'visit_mode')) || 'STOP',
    reviewed: boolean_(cell_(row, column, 'mood_reviewed')),
    confidence: text_(cell_(row, column, 'mood_confidence')) || 'LOW',
  };
}

function cell_(row, column, field) {
  return column[field] === undefined ? '' : row[column[field]];
}

function text_(value) {
  return value === null || value === undefined ? '' : String(value).trim();
}

function boolean_(value) {
  return value === true || text_(value).toUpperCase() === 'TRUE';
}

function number_(value, fallback) {
  const parsed = Number(value);
  return Number.isFinite(parsed) ? parsed : fallback;
}

function mood_(value) {
  return Math.max(0, Math.min(3, Math.round(number_(value, 0))));
}

function url_(value) {
  const candidate = text_(value);
  return /^https?:\/\//i.test(candidate) ? candidate : '';
}

function dateText_(value) {
  if (Object.prototype.toString.call(value) === '[object Date]' && !isNaN(value)) {
    return Utilities.formatDate(value, Session.getScriptTimeZone(), 'yyyy-MM-dd');
  }
  return text_(value);
}

function jsonOutput_(body) {
  return ContentService
    .createTextOutput(body)
    .setMimeType(ContentService.MimeType.JSON);
}

/** Run manually in Apps Script before deployment. */
function testEndpoint() {
  const payload = buildPayload_();
  if (!payload.ok || payload.count < 1) throw new Error('No valid active places found');
  Logger.log(JSON.stringify({ ok: payload.ok, count: payload.count, sample: payload.places[0] }, null, 2));
}
