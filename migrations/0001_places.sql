PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS categories (
  code TEXT PRIMARY KEY,
  label_en TEXT NOT NULL,
  label_it TEXT NOT NULL,
  display_order INTEGER NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS places (
  id TEXT PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  category TEXT NOT NULL REFERENCES categories(code),
  latitude REAL NOT NULL CHECK(latitude BETWEEN 50.80 AND 52.00),
  longitude REAL NOT NULL CHECK(longitude BETWEEN -1.00 AND 0.75),
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft', 'published', 'archived')),
  description_en TEXT NOT NULL DEFAULT '',
  description_it TEXT NOT NULL DEFAULT '',
  editorial_hook_en TEXT NOT NULL DEFAULT '',
  editorial_hook_it TEXT NOT NULL DEFAULT '',
  official_url TEXT NOT NULL DEFAULT '',
  guide_url TEXT NOT NULL DEFAULT '',
  google_maps_url TEXT NOT NULL DEFAULT '',
  price_text TEXT NOT NULL DEFAULT '',
  access_type TEXT NOT NULL DEFAULT 'VARIABLE',
  access_notes_en TEXT NOT NULL DEFAULT '',
  access_notes_it TEXT NOT NULL DEFAULT '',
  opening_hours_json TEXT NOT NULL DEFAULT '{}',
  tourist_intensity INTEGER NOT NULL DEFAULT 30 CHECK(tourist_intensity BETWEEN 0 AND 100),
  crowd_scope TEXT NOT NULL DEFAULT 'VENUE',
  visit_minutes INTEGER NOT NULL DEFAULT 30 CHECK(visit_minutes BETWEEN 1 AND 720),
  best_time TEXT NOT NULL DEFAULT 'ANY',
  weather_fit TEXT NOT NULL DEFAULT 'ANY',
  visit_mode TEXT NOT NULL DEFAULT 'STOP',
  mood_quiet INTEGER NOT NULL DEFAULT 0 CHECK(mood_quiet BETWEEN 0 AND 3),
  mood_unexpected INTEGER NOT NULL DEFAULT 0 CHECK(mood_unexpected BETWEEN 0 AND 3),
  mood_beautiful INTEGER NOT NULL DEFAULT 0 CHECK(mood_beautiful BETWEEN 0 AND 3),
  mood_weird INTEGER NOT NULL DEFAULT 0 CHECK(mood_weird BETWEEN 0 AND 3),
  mood_local INTEGER NOT NULL DEFAULT 0 CHECK(mood_local BETWEEN 0 AND 3),
  mood_green INTEGER NOT NULL DEFAULT 0 CHECK(mood_green BETWEEN 0 AND 3),
  mood_atmospheric INTEGER NOT NULL DEFAULT 0 CHECK(mood_atmospheric BETWEEN 0 AND 3),
  mood_lively INTEGER NOT NULL DEFAULT 0 CHECK(mood_lively BETWEEN 0 AND 3),
  mood_reviewed INTEGER NOT NULL DEFAULT 0 CHECK(mood_reviewed IN (0, 1)),
  mood_confidence TEXT NOT NULL DEFAULT 'LOW' CHECK(mood_confidence IN ('LOW', 'MEDIUM', 'HIGH')),
  mood_basis TEXT NOT NULL DEFAULT '',
  source_type TEXT NOT NULL DEFAULT 'manual',
  source_ref TEXT NOT NULL DEFAULT '',
  source_row INTEGER,
  source_code_r1 TEXT NOT NULL DEFAULT '',
  last_verified_at TEXT,
  published_at TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS place_time_affinity (
  place_id TEXT PRIMARY KEY REFERENCES places(id) ON DELETE CASCADE,
  mon_thu_00_05 INTEGER NOT NULL DEFAULT 5 CHECK(mon_thu_00_05 BETWEEN 0 AND 100),
  mon_thu_06_10 INTEGER NOT NULL DEFAULT 25 CHECK(mon_thu_06_10 BETWEEN 0 AND 100),
  mon_thu_10_13 INTEGER NOT NULL DEFAULT 50 CHECK(mon_thu_10_13 BETWEEN 0 AND 100),
  mon_thu_13_17 INTEGER NOT NULL DEFAULT 60 CHECK(mon_thu_13_17 BETWEEN 0 AND 100),
  mon_thu_17_20 INTEGER NOT NULL DEFAULT 60 CHECK(mon_thu_17_20 BETWEEN 0 AND 100),
  mon_thu_20_24 INTEGER NOT NULL DEFAULT 40 CHECK(mon_thu_20_24 BETWEEN 0 AND 100),
  friday_00_05 INTEGER NOT NULL DEFAULT 8 CHECK(friday_00_05 BETWEEN 0 AND 100),
  friday_06_10 INTEGER NOT NULL DEFAULT 25 CHECK(friday_06_10 BETWEEN 0 AND 100),
  friday_10_13 INTEGER NOT NULL DEFAULT 50 CHECK(friday_10_13 BETWEEN 0 AND 100),
  friday_13_17 INTEGER NOT NULL DEFAULT 65 CHECK(friday_13_17 BETWEEN 0 AND 100),
  friday_17_20 INTEGER NOT NULL DEFAULT 70 CHECK(friday_17_20 BETWEEN 0 AND 100),
  friday_20_24 INTEGER NOT NULL DEFAULT 50 CHECK(friday_20_24 BETWEEN 0 AND 100),
  weekend_00_05 INTEGER NOT NULL DEFAULT 10 CHECK(weekend_00_05 BETWEEN 0 AND 100),
  weekend_06_10 INTEGER NOT NULL DEFAULT 30 CHECK(weekend_06_10 BETWEEN 0 AND 100),
  weekend_10_13 INTEGER NOT NULL DEFAULT 55 CHECK(weekend_10_13 BETWEEN 0 AND 100),
  weekend_13_17 INTEGER NOT NULL DEFAULT 65 CHECK(weekend_13_17 BETWEEN 0 AND 100),
  weekend_17_20 INTEGER NOT NULL DEFAULT 65 CHECK(weekend_17_20 BETWEEN 0 AND 100),
  weekend_20_24 INTEGER NOT NULL DEFAULT 50 CHECK(weekend_20_24 BETWEEN 0 AND 100)
);

CREATE TABLE IF NOT EXISTS place_stations (
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  position INTEGER NOT NULL CHECK(position BETWEEN 1 AND 3),
  station_id TEXT NOT NULL DEFAULT '',
  station_name TEXT NOT NULL,
  distance_metres INTEGER NOT NULL CHECK(distance_metres >= 0),
  PRIMARY KEY(place_id, position)
);

CREATE TABLE IF NOT EXISTS place_revisions (
  revision_id INTEGER PRIMARY KEY AUTOINCREMENT,
  place_id TEXT NOT NULL,
  action TEXT NOT NULL CHECK(action IN ('create', 'update', 'archive', 'publish')),
  actor_email TEXT NOT NULL DEFAULT 'local-dev',
  snapshot_json TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS app_meta (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_places_status_category ON places(status, category);
CREATE INDEX IF NOT EXISTS idx_places_coordinates ON places(latitude, longitude);
CREATE INDEX IF NOT EXISTS idx_places_name ON places(name COLLATE NOCASE);
CREATE INDEX IF NOT EXISTS idx_revisions_place ON place_revisions(place_id, created_at DESC);

INSERT OR IGNORE INTO categories(code, label_en, label_it, display_order) VALUES
  ('AREA', 'Areas', 'Zone', 1),
  ('BUILDING', 'Buildings', 'Edifici', 2),
  ('MUSEUM', 'Museums', 'Musei', 3),
  ('ODDITY', 'Oddities', 'Curiosità', 4),
  ('PARK', 'Parks', 'Parchi', 5),
  ('RELIGIOUS', 'Religious', 'Luoghi religiosi', 6),
  ('SHOPPING', 'Shopping', 'Shopping', 7),
  ('VIEWPOINT', 'Views', 'Panorami', 8);

INSERT OR IGNORE INTO app_meta(key, value) VALUES
  ('schema_version', '1'),
  ('data_version', '1');
