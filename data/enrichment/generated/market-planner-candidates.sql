-- Curated market planner follow-up. Sandbox/development data only.
-- Official opening information checked 2026-10-03; refresh after 2026-10-31.
PRAGMA foreign_keys = ON;

UPDATE places SET data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED',
  booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC',
  hours_status='VERIFIED', hours_last_checked_at='2026-10-03T12:00:00Z', hours_next_check_at='2026-10-31T12:00:00Z',
  quality_reviewed_at='2026-10-03', quality_notes=quality_notes || ' Market trading days and hours verified from the official operator source on 2026-10-03.'
WHERE id IN ('A6','S6','S7','S8','S10','LA-61180A5D','LA-12DFBA93','LA-302EC634','LA-E36CA94C');

UPDATE places SET
  description_en='A car-free Islington passage of independent shops, cafés and three outdoor market areas, with antiques, vintage clothing and collectables on the main weekend market days.',
  editorial_hook_en='Camden Passage combines independent shops with regular outdoor antique and vintage market days in a compact pedestrian lane.'
WHERE id='A6';
UPDATE places SET official_url='https://www.primrosehillfoodmarket.co.uk/',
  description_en='A Saturday neighbourhood food market beside Primrose Hill, bringing together independent producers, prepared food and fresh seasonal produce.',
  editorial_hook_en='Primrose Hill Food Market is a compact Saturday market for independent food traders and local produce.'
WHERE id='LA-61180A5D';
UPDATE places SET official_url='https://www.maltbystreetmarket.co.uk/welcome',
  description_en='A weekend street-food and makers market along a flag-lined Bermondsey railway arch lane, with independent traders and permanent Ropewalk businesses.',
  editorial_hook_en='Maltby Street Market is a compact Bermondsey weekend market beneath railway arches, known for independent food and makers.'
WHERE id='LA-12DFBA93';
UPDATE places SET official_url='https://eatworkart.com/netil-market',
  description_en='A creative Hackney courtyard market near London Fields with independent food vendors, small retailers, artisans and Netil Radio.',
  editorial_hook_en='Netil Market mixes independent food, design and small creative businesses in a relaxed Hackney courtyard.'
WHERE id='LA-302EC634';
UPDATE places SET official_url='https://broadwaymarket.co.uk/',
  description_en='A Victorian street market beside London Fields, with produce, prepared food, books, clothing and independent neighbourhood shops.',
  editorial_hook_en='Broadway Market combines weekend stalls and long-standing independent shops on a lively Hackney street.'
WHERE id='LA-E36CA94C';

UPDATE place_sources SET source_status='OK', http_status=200, last_checked_at='2026-10-03T12:00:00Z',
  next_check_at='2026-10-31T12:00:00Z', extraction_notes='Market hours manually verified from the official operator page.'
WHERE place_id IN ('A6','S6','S7','S8','S10','LA-61180A5D','LA-302EC634','LA-E36CA94C') AND provider='official-web';
UPDATE place_sources SET source_url='https://www.maltbystreetmarket.co.uk/welcome', source_status='OK', http_status=200,
  last_checked_at='2026-10-03T12:00:00Z', next_check_at='2026-10-31T12:00:00Z',
  extraction_notes='Market hours manually verified from the official operator page.'
WHERE place_id='LA-12DFBA93' AND provider='official-web';

DELETE FROM place_opening_periods
WHERE place_id IN ('A6','S6','S7','S8','S10','LA-61180A5D','LA-12DFBA93','LA-302EC634','LA-E36CA94C') AND experience_id IS NULL;

-- Camden Passage: main market days. Hours are conservative across its three market areas.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('A6',3,1,'09:00','17:30',(SELECT source_id FROM place_sources WHERE place_id='A6' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('A6',6,1,'09:00','17:30',(SELECT source_id FROM place_sources WHERE place_id='A6' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('A6',0,1,'09:00','17:30',(SELECT source_id FROM place_sources WHERE place_id='A6' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z');

-- Shepherd's Bush Market: Monday-Saturday, 09:00-18:00.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'S6', value, 1, '09:00', '18:00', (SELECT source_id FROM place_sources WHERE place_id='S6' AND provider='official-web' LIMIT 1), '2026-10-03T12:00:00Z'
FROM json_each('[1,2,3,4,5,6]');

-- Victoria Park Market: Sunday, 10:00-16:00.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('S7',0,1,'10:00','16:00',(SELECT source_id FROM place_sources WHERE place_id='S7' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z');

-- Alfies Antique Market: Tuesday-Saturday, 10:00-18:00.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'S8', value, 1, '10:00', '18:00', (SELECT source_id FROM place_sources WHERE place_id='S8' AND provider='official-web' LIMIT 1), '2026-10-03T12:00:00Z'
FROM json_each('[2,3,4,5,6]');

-- Wood Street Indoor Market: Tuesday-Saturday, 10:00-17:30.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'S10', value, 1, '10:00', '17:30', (SELECT source_id FROM place_sources WHERE place_id='S10' AND provider='official-web' LIMIT 1), '2026-10-03T12:00:00Z'
FROM json_each('[2,3,4,5,6]');

-- Primrose Hill Food Market: Saturday, 09:30-14:30.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('LA-61180A5D',6,1,'09:30','14:30',(SELECT source_id FROM place_sources WHERE place_id='LA-61180A5D' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z');

-- Maltby Street Market: Saturday and Sunday.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('LA-12DFBA93',6,1,'10:00','17:00',(SELECT source_id FROM place_sources WHERE place_id='LA-12DFBA93' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('LA-12DFBA93',0,1,'11:00','16:00',(SELECT source_id FROM place_sources WHERE place_id='LA-12DFBA93' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z');

-- Netil Market: official site-wide hours; individual traders may vary.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('LA-302EC634',0,1,'09:00','18:00',(SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('LA-302EC634',1,1,'09:00','18:00',(SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('LA-302EC634',2,1,'09:00','18:00',(SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('LA-302EC634',3,1,'09:00','22:00',(SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('LA-302EC634',4,1,'09:00','22:00',(SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('LA-302EC634',5,1,'09:00','22:00',(SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('LA-302EC634',6,1,'09:00','22:00',(SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z');

-- Broadway Market: Saturday and Sunday market hours.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('LA-E36CA94C',6,1,'09:00','17:00',(SELECT source_id FROM place_sources WHERE place_id='LA-E36CA94C' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z'),
       ('LA-E36CA94C',0,1,'10:00','16:00',(SELECT source_id FROM place_sources WHERE place_id='LA-E36CA94C' AND provider='official-web' LIMIT 1),'2026-10-03T12:00:00Z');

UPDATE enrichment_batch_places SET status='READY'
WHERE place_id IN ('A6','S6','S7','S8','S10','LA-61180A5D','LA-12DFBA93','LA-302EC634','LA-E36CA94C');
UPDATE place_review_issues SET status='RESOLVED', resolution='Official operator source and current market hours confirmed 2026-10-03.', resolved_at='2026-10-03T12:00:00Z'
WHERE place_id IN ('A6','S6','S7','S8','S10','LA-61180A5D','LA-12DFBA93','LA-302EC634','LA-E36CA94C')
  AND status='OPEN' AND issue_type IN ('SOURCE_MISSING','LINK_BROKEN','DESCRIPTION_GENERIC','BOOKING_UNCLEAR','HOURS_UNCLEAR');
