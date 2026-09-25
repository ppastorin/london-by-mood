PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS place_sources (
  source_id INTEGER PRIMARY KEY AUTOINCREMENT,
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  provider TEXT NOT NULL,
  external_id TEXT NOT NULL DEFAULT '',
  source_url TEXT NOT NULL DEFAULT '',
  source_name TEXT NOT NULL DEFAULT '',
  source_latitude REAL,
  source_longitude REAL,
  fingerprint TEXT NOT NULL,
  first_seen_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  last_seen_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(provider, fingerprint)
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_place_sources_external_id
  ON place_sources(provider, external_id)
  WHERE external_id <> '';
CREATE INDEX IF NOT EXISTS idx_place_sources_place ON place_sources(place_id);

CREATE TABLE IF NOT EXISTS import_batches (
  id TEXT PRIMARY KEY,
  provider TEXT NOT NULL,
  source_name TEXT NOT NULL DEFAULT '',
  filename TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'preview' CHECK(status IN ('preview', 'committing', 'committed', 'failed')),
  total_rows INTEGER NOT NULL DEFAULT 0,
  existing_rows INTEGER NOT NULL DEFAULT 0,
  review_rows INTEGER NOT NULL DEFAULT 0,
  new_rows INTEGER NOT NULL DEFAULT 0,
  invalid_rows INTEGER NOT NULL DEFAULT 0,
  created_rows INTEGER NOT NULL DEFAULT 0,
  actor_email TEXT NOT NULL DEFAULT 'local-dev',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  committed_at TEXT
);

CREATE TABLE IF NOT EXISTS import_candidates (
  batch_id TEXT NOT NULL REFERENCES import_batches(id) ON DELETE CASCADE,
  row_number INTEGER NOT NULL,
  external_id TEXT NOT NULL DEFAULT '',
  name TEXT NOT NULL DEFAULT '',
  description TEXT NOT NULL DEFAULT '',
  latitude REAL,
  longitude REAL,
  fingerprint TEXT NOT NULL DEFAULT '',
  classification TEXT NOT NULL CHECK(classification IN ('existing', 'review', 'new', 'invalid')),
  matched_place_id TEXT REFERENCES places(id) ON DELETE SET NULL,
  match_reason TEXT NOT NULL DEFAULT '',
  distance_metres REAL,
  created_place_id TEXT REFERENCES places(id) ON DELETE SET NULL,
  raw_json TEXT NOT NULL DEFAULT '{}',
  PRIMARY KEY(batch_id, row_number)
);

CREATE INDEX IF NOT EXISTS idx_import_candidates_classification
  ON import_candidates(batch_id, classification);

UPDATE app_meta SET value='2', updated_at=CURRENT_TIMESTAMP WHERE key='schema_version';
