PRAGMA foreign_keys = ON;

-- Recognition is not the same thing as crowd pressure. Keep a separate,
-- editable signal so first-visit planning can prioritise London's defining
-- places without changing the behaviour of Crowd Pressure or London by Mood.
ALTER TABLE places ADD COLUMN landmark_prominence INTEGER NOT NULL DEFAULT 0
  CHECK(landmark_prominence BETWEEN 0 AND 100);

-- Tourist intensity is a useful baseline for the existing catalogue, but it
-- materially understates several major institutions and historic landmarks.
UPDATE places SET landmark_prominence = tourist_intensity;

UPDATE places SET landmark_prominence = CASE id
  WHEN 'LA-CECB7A4F' THEN 100 -- Palace of Westminster
  WHEN 'LA-324D78AD' THEN 100 -- Tower Bridge
  WHEN 'LA-7319332B' THEN 100 -- Buckingham Palace
  WHEN 'LA-8944F43B' THEN 100 -- Westminster Abbey
  WHEN 'LA-6C9110FF' THEN 100 -- Tower of London
  WHEN 'LA-DE3494DB' THEN 100 -- Big Ben
  WHEN 'LA-9B4A399A' THEN 98  -- St Paul's Cathedral
  WHEN 'LA-7F9D8D70' THEN 98  -- British Museum
  WHEN 'LA-78266B44' THEN 95  -- London Eye
  WHEN 'LA-9E875B3F' THEN 94  -- National Gallery
  WHEN 'LA-4F15DE84' THEN 90  -- Covent Garden
  WHEN 'LA-368AE350' THEN 88  -- Millennium Bridge
  WHEN 'LA-09A19EC7' THEN 88  -- Tate Modern
  WHEN 'LA-95A39316' THEN 86  -- Shakespeare's Globe
  WHEN 'LA-F0C1DEE1' THEN 82  -- St Pancras International
  ELSE landmark_prominence
END
WHERE id IN (
  'LA-CECB7A4F','LA-324D78AD','LA-7319332B','LA-8944F43B','LA-6C9110FF',
  'LA-DE3494DB','LA-9B4A399A','LA-7F9D8D70','LA-78266B44','LA-9E875B3F',
  'LA-4F15DE84','LA-368AE350','LA-09A19EC7','LA-95A39316','LA-F0C1DEE1'
);

CREATE INDEX IF NOT EXISTS idx_places_landmark_prominence
  ON places(status, landmark_prominence DESC, category);

UPDATE app_meta SET value='4', updated_at=CURRENT_TIMESTAMP WHERE key='schema_version';
