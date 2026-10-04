PRAGMA foreign_keys = ON;

-- Additive planner fields. Existing public fields and legacy access values remain
-- unchanged so London by Mood and Smart Navigation continue to read schema v2.
ALTER TABLE places ADD COLUMN data_confidence TEXT NOT NULL DEFAULT 'LOW'
  CHECK(data_confidence IN ('LOW', 'MEDIUM', 'HIGH'));
ALTER TABLE places ADD COLUMN planner_ready INTEGER NOT NULL DEFAULT 0
  CHECK(planner_ready IN (0, 1));
ALTER TABLE places ADD COLUMN access_type_v2 TEXT NOT NULL DEFAULT 'UNKNOWN';
ALTER TABLE places ADD COLUMN booking_mode TEXT NOT NULL DEFAULT 'UNKNOWN'
  CHECK(booking_mode IN ('NONE', 'OPTIONAL', 'RECOMMENDED', 'REQUIRED', 'UNKNOWN'));
ALTER TABLE places ADD COLUMN admission_type TEXT NOT NULL DEFAULT 'UNKNOWN'
  CHECK(admission_type IN ('FREE', 'PAID', 'MIXED', 'UNKNOWN'));
ALTER TABLE places ADD COLUMN access_clarity TEXT NOT NULL DEFAULT 'UNREVIEWED'
  CHECK(access_clarity IN ('CLEAR', 'NEEDS_REVIEW', 'UNREVIEWED'));
ALTER TABLE places ADD COLUMN description_quality TEXT NOT NULL DEFAULT 'UNREVIEWED'
  CHECK(description_quality IN ('SPECIFIC', 'GENERIC', 'MISSING', 'UNREVIEWED'));
ALTER TABLE places ADD COLUMN hours_status TEXT NOT NULL DEFAULT 'UNKNOWN'
  CHECK(hours_status IN ('VERIFIED', 'CANDIDATE', 'NOT_APPLICABLE', 'UNKNOWN', 'STALE'));
ALTER TABLE places ADD COLUMN hours_last_checked_at TEXT;
ALTER TABLE places ADD COLUMN hours_next_check_at TEXT;
ALTER TABLE places ADD COLUMN quality_reviewed_at TEXT;
ALTER TABLE places ADD COLUMN quality_notes TEXT NOT NULL DEFAULT '';

-- Existing durable source rows are extended instead of creating a competing
-- source model. A source may support general facts, access, hours or booking.
ALTER TABLE place_sources ADD COLUMN source_role TEXT NOT NULL DEFAULT 'GENERAL'
  CHECK(source_role IN ('GENERAL', 'ACCESS', 'HOURS', 'BOOKING'));
ALTER TABLE place_sources ADD COLUMN authority TEXT NOT NULL DEFAULT 'THIRD_PARTY'
  CHECK(authority IN ('OWNER_OPERATOR', 'PUBLIC_AUTHORITY', 'OFFICIAL_PARTNER', 'TRUSTED_EDITORIAL', 'THIRD_PARTY'));
ALTER TABLE place_sources ADD COLUMN is_primary INTEGER NOT NULL DEFAULT 0
  CHECK(is_primary IN (0, 1));
ALTER TABLE place_sources ADD COLUMN source_status TEXT NOT NULL DEFAULT 'UNCHECKED'
  CHECK(source_status IN ('OK', 'REDIRECTED', 'BLOCKED', 'BROKEN', 'UNCHECKED'));
ALTER TABLE place_sources ADD COLUMN http_status INTEGER;
ALTER TABLE place_sources ADD COLUMN content_hash TEXT NOT NULL DEFAULT '';
ALTER TABLE place_sources ADD COLUMN last_checked_at TEXT;
ALTER TABLE place_sources ADD COLUMN next_check_at TEXT;
ALTER TABLE place_sources ADD COLUMN extraction_notes TEXT NOT NULL DEFAULT '';

CREATE INDEX IF NOT EXISTS idx_places_planner_ready ON places(planner_ready, data_confidence, category);
CREATE INDEX IF NOT EXISTS idx_places_hours_refresh ON places(hours_next_check_at, hours_status);
CREATE INDEX IF NOT EXISTS idx_place_sources_refresh ON place_sources(next_check_at, source_status);
CREATE UNIQUE INDEX IF NOT EXISTS idx_place_sources_primary_role
  ON place_sources(place_id, source_role) WHERE is_primary = 1;

-- Experiences stay deliberately light: they distinguish an exterior, interior,
-- tour or event when one place has materially different access conditions.
CREATE TABLE IF NOT EXISTS place_experiences (
  id TEXT PRIMARY KEY,
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  name_en TEXT NOT NULL,
  name_it TEXT NOT NULL DEFAULT '',
  experience_type TEXT NOT NULL DEFAULT 'GENERAL'
    CHECK(experience_type IN ('GENERAL', 'EXTERIOR', 'INTERIOR', 'GROUNDS', 'TOUR', 'EVENT')),
  access_type TEXT NOT NULL DEFAULT 'UNKNOWN',
  visit_minutes INTEGER NOT NULL DEFAULT 30 CHECK(visit_minutes BETWEEN 1 AND 720),
  booking_mode TEXT NOT NULL DEFAULT 'NONE'
    CHECK(booking_mode IN ('NONE', 'OPTIONAL', 'RECOMMENDED', 'REQUIRED', 'THIRD_PARTY')),
  booking_url TEXT NOT NULL DEFAULT '',
  admission_type TEXT NOT NULL DEFAULT 'UNKNOWN'
    CHECK(admission_type IN ('FREE', 'PAID', 'MIXED', 'UNKNOWN')),
  source_id INTEGER REFERENCES place_sources(source_id) ON DELETE SET NULL,
  planner_enabled INTEGER NOT NULL DEFAULT 1 CHECK(planner_enabled IN (0, 1)),
  is_default INTEGER NOT NULL DEFAULT 0 CHECK(is_default IN (0, 1)),
  notes_en TEXT NOT NULL DEFAULT '',
  notes_it TEXT NOT NULL DEFAULT '',
  last_verified_at TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_place_experiences_place ON place_experiences(place_id, planner_enabled);
CREATE UNIQUE INDEX IF NOT EXISTS idx_place_experiences_default
  ON place_experiences(place_id) WHERE is_default = 1;

-- Repeating weekly hours. An experience_id of NULL applies to the place as a
-- whole. Multiple intervals per weekday support split opening hours.
CREATE TABLE IF NOT EXISTS place_opening_periods (
  period_id INTEGER PRIMARY KEY AUTOINCREMENT,
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  experience_id TEXT REFERENCES place_experiences(id) ON DELETE CASCADE,
  day_of_week INTEGER NOT NULL CHECK(day_of_week BETWEEN 0 AND 6),
  sequence INTEGER NOT NULL DEFAULT 1 CHECK(sequence BETWEEN 1 AND 8),
  opens_at TEXT,
  closes_at TEXT,
  all_day INTEGER NOT NULL DEFAULT 0 CHECK(all_day IN (0, 1)),
  closed INTEGER NOT NULL DEFAULT 0 CHECK(closed IN (0, 1)),
  by_appointment INTEGER NOT NULL DEFAULT 0 CHECK(by_appointment IN (0, 1)),
  valid_from TEXT,
  valid_to TEXT,
  source_id INTEGER REFERENCES place_sources(source_id) ON DELETE SET NULL,
  last_verified_at TEXT,
  UNIQUE(place_id, experience_id, day_of_week, sequence),
  CHECK(all_day + closed + by_appointment <= 1),
  CHECK(all_day = 1 OR closed = 1 OR by_appointment = 1 OR (opens_at IS NOT NULL AND closes_at IS NOT NULL))
);

CREATE INDEX IF NOT EXISTS idx_opening_periods_place_day
  ON place_opening_periods(place_id, day_of_week, experience_id);

CREATE TABLE IF NOT EXISTS place_opening_exceptions (
  exception_id INTEGER PRIMARY KEY AUTOINCREMENT,
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  experience_id TEXT REFERENCES place_experiences(id) ON DELETE CASCADE,
  local_date TEXT NOT NULL,
  opens_at TEXT,
  closes_at TEXT,
  closed INTEGER NOT NULL DEFAULT 0 CHECK(closed IN (0, 1)),
  note_en TEXT NOT NULL DEFAULT '',
  note_it TEXT NOT NULL DEFAULT '',
  source_id INTEGER REFERENCES place_sources(source_id) ON DELETE SET NULL,
  last_verified_at TEXT,
  UNIQUE(place_id, experience_id, local_date),
  CHECK(closed = 1 OR (opens_at IS NOT NULL AND closes_at IS NOT NULL))
);

CREATE INDEX IF NOT EXISTS idx_opening_exceptions_date
  ON place_opening_exceptions(local_date, place_id);

CREATE TABLE IF NOT EXISTS place_review_issues (
  issue_id INTEGER PRIMARY KEY AUTOINCREMENT,
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  experience_id TEXT REFERENCES place_experiences(id) ON DELETE CASCADE,
  issue_type TEXT NOT NULL
    CHECK(issue_type IN ('ACCESS_UNCLEAR', 'BOOKING_UNCLEAR', 'HOURS_UNCLEAR', 'SOURCE_MISSING', 'SOURCE_CONFLICT', 'DESCRIPTION_GENERIC', 'LINK_BROKEN', 'OTHER')),
  severity TEXT NOT NULL DEFAULT 'MEDIUM' CHECK(severity IN ('LOW', 'MEDIUM', 'HIGH')),
  summary TEXT NOT NULL,
  evidence_json TEXT NOT NULL DEFAULT '{}',
  status TEXT NOT NULL DEFAULT 'OPEN' CHECK(status IN ('OPEN', 'RESOLVED', 'DISMISSED')),
  resolution TEXT NOT NULL DEFAULT '',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  resolved_at TEXT
);

CREATE INDEX IF NOT EXISTS idx_place_review_issues_open
  ON place_review_issues(status, issue_type, severity, place_id);

CREATE TABLE IF NOT EXISTS enrichment_batches (
  batch_code TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  purpose TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'PREPARED'
    CHECK(status IN ('PREPARED', 'IN_PROGRESS', 'REVIEW', 'COMPLETE')),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  completed_at TEXT
);

CREATE TABLE IF NOT EXISTS enrichment_batch_places (
  batch_code TEXT NOT NULL REFERENCES enrichment_batches(batch_code) ON DELETE CASCADE,
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  priority INTEGER NOT NULL DEFAULT 100,
  reason TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'PENDING'
    CHECK(status IN ('PENDING', 'FETCHED', 'NEEDS_REVIEW', 'READY', 'SKIPPED')),
  PRIMARY KEY(batch_code, place_id)
);

-- Conservative legacy mapping. VARIABLE remains unknown until its official
-- source is checked; existing visitor-facing access_type is not modified.
UPDATE places SET access_type_v2 = CASE access_type
  WHEN '24H' THEN 'ALWAYS_ACCESSIBLE'
  WHEN 'TICKETED' THEN 'TIMETABLED'
  WHEN 'SEASONAL' THEN 'SEASONAL'
  ELSE 'UNKNOWN'
END;

UPDATE app_meta SET value='3', updated_at=CURRENT_TIMESTAMP WHERE key='schema_version';
