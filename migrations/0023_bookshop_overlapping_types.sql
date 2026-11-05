PRAGMA foreign_keys = ON;

-- A bookshop can be both rare/antiquarian and second-hand. Keep shop_type as
-- the backward-compatible primary type and expose all applicable classifications
-- through type_tags_json.
ALTER TABLE bookshop_details ADD COLUMN type_tags_json TEXT NOT NULL DEFAULT '[]';

UPDATE bookshop_details
SET type_tags_json = CASE
  WHEN shop_type = 'rare-antiquarian'
    AND (lower(stock_json) LIKE '%second-hand%' OR lower(stock_json) LIKE '%"used%')
    THEN '["rare-antiquarian","second-hand"]'
  WHEN shop_type = 'second-hand'
    AND (lower(stock_json) LIKE '%"rare"%' OR lower(stock_json) LIKE '%antiquarian%')
    THEN '["second-hand","rare-antiquarian"]'
  WHEN shop_type = 'second-hand' THEN '["second-hand"]'
  WHEN shop_type = 'rare-antiquarian' THEN '["rare-antiquarian"]'
  WHEN lower(stock_json) LIKE '%second-hand%' OR lower(stock_json) LIKE '%"used%'
    THEN '["' || shop_type || '","second-hand"]'
  WHEN lower(stock_json) LIKE '%"rare"%' OR lower(stock_json) LIKE '%antiquarian%'
    THEN '["' || shop_type || '","rare-antiquarian"]'
  ELSE '["' || shop_type || '"]'
END;

CREATE INDEX IF NOT EXISTS idx_bookshop_details_type_tags ON bookshop_details(type_tags_json);

INSERT INTO app_meta(key,value,updated_at) VALUES ('schema_version','23',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value='23',updated_at=CURRENT_TIMESTAMP;
INSERT INTO app_meta(key,value,updated_at) VALUES ('data_version','2026-11-05-bookshop-overlapping-types',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value,updated_at=CURRENT_TIMESTAMP;
