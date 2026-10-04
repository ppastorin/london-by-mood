-- East London market coverage for Planner V1. Development/sandbox only.
-- Sources checked 2026-10-04; the planner still shows a validation link.
PRAGMA foreign_keys = ON;

UPDATE places SET official_url='https://greenwichmarket.london/visit-us/',
  description_en='A covered historic market in maritime Greenwich, with independent arts, crafts, antiques, collectables and food traders every day.',
  editorial_hook_en='Greenwich Market combines a historic covered setting with independent makers, collectables and food stalls.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED',
  hours_last_checked_at='2026-10-04T16:00:00Z', hours_next_check_at='2026-11-01T16:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' V1 market hours verified from the official operator on 2026-10-04.'
WHERE id='LA-D13F4A91';

UPDATE places SET official_url='https://oldspitalfieldsmarket.com/',
  description_en='A restored Victorian covered market of independent stalls, shops and street food beside Liverpool Street, with weekend trading every Saturday and Sunday.',
  editorial_hook_en='Old Spitalfields Market mixes a grand Victorian market hall with independent stalls, food and design-led shops.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED',
  hours_last_checked_at='2026-10-04T16:00:00Z', hours_next_check_at='2026-11-01T16:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' V1 market hours verified from the official operator on 2026-10-04.'
WHERE id='LA-CE3A1E89';

UPDATE places SET official_url='https://www.walthamforest.gov.uk/libraries-arts-parks-and-leisure/local-markets/walthamstow-market',
  description_en='A kilometre-long community street market along Walthamstow High Street, with food, clothing, household goods and cafés trading from Tuesday to Saturday.',
  editorial_hook_en='Walthamstow Market is a long, genuinely local East London street market rather than a compact visitor attraction.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED',
  hours_last_checked_at='2026-10-04T16:00:00Z', hours_next_check_at='2026-11-01T16:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' V1 market hours verified from Waltham Forest Council on 2026-10-04.'
WHERE id='S5';

UPDATE places SET official_url='https://columbiaroadmarket.co.uk/',
  description_en='A Sunday East End flower market on a narrow Victorian shop-lined street, filled with plants, cut flowers and specialist independent shops.',
  editorial_hook_en='Columbia Road turns into a dense, colourful flower market every Sunday morning, with the surrounding independent shops adding to the walk.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='CANDIDATE',
  hours_last_checked_at='2026-10-04T16:00:00Z', hours_next_check_at='2026-10-18T16:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' Official page confirms Sunday trading but displays inconsistent 14:00/15:00 closing times; V1 uses the conservative 14:00 close and asks visitors to recheck.'
WHERE id='LA-36EE3D05';

UPDATE places SET official_url='https://romanroadtrust.co.uk/rediscover-roman-road-market/',
  description_en='A traditional Bow street market serving the Roman Road neighbourhood, with clothing, household goods, food and community traders on Tuesdays, Thursdays and Saturdays.',
  editorial_hook_en='Roman Road Market is an everyday East End street market with a stronger local character than London’s visitor-led markets.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED',
  hours_last_checked_at='2026-10-04T16:00:00Z', hours_next_check_at='2026-11-01T16:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' V1 trading days and hours verified from the Roman Road Trust on 2026-10-04.'
WHERE id='LA-D0DE9DA4';

-- Refresh an existing official-web row where available.
UPDATE place_sources SET source_url='https://greenwichmarket.london/visit-us/', source_name='Greenwich Market',
  source_role='HOURS', authority='OWNER_OPERATOR', source_status='OK', http_status=200,
  last_checked_at='2026-10-04T16:00:00Z', next_check_at='2026-11-01T16:00:00Z', extraction_notes='Daily 10:00-17:30 verified from operator visit page.'
WHERE place_id='LA-D13F4A91' AND provider='official-web';
UPDATE place_sources SET source_url='https://www.walthamforest.gov.uk/libraries-arts-parks-and-leisure/local-markets/walthamstow-market', source_name='Walthamstow Market',
  source_role='HOURS', authority='PUBLIC_AUTHORITY', source_status='OK', http_status=200,
  last_checked_at='2026-10-04T16:00:00Z', next_check_at='2026-11-01T16:00:00Z', extraction_notes='Trading days and hours verified from Waltham Forest Council.'
WHERE place_id='S5' AND provider='official-web';

-- Add a durable official source if the enrichment batches did not create one.
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,last_checked_at,next_check_at,extraction_notes)
SELECT 'LA-CE3A1E89','official-web','https://oldspitalfieldsmarket.com/','Old Spitalfields Market','v1-market-LA-CE3A1E89','HOURS','OWNER_OPERATOR',0,'OK',200,'2026-10-04T16:00:00Z','2026-11-01T16:00:00Z','Current daily hours verified from the operator site.'
WHERE NOT EXISTS (SELECT 1 FROM place_sources WHERE place_id='LA-CE3A1E89' AND provider='official-web');
UPDATE place_sources SET source_url='https://oldspitalfieldsmarket.com/', source_name='Old Spitalfields Market', source_role='HOURS', authority='OWNER_OPERATOR', source_status='OK', http_status=200,
  last_checked_at='2026-10-04T16:00:00Z', next_check_at='2026-11-01T16:00:00Z', extraction_notes='Current daily hours verified from the operator site.'
WHERE place_id='LA-CE3A1E89' AND provider='official-web';

INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,last_checked_at,next_check_at,extraction_notes)
SELECT 'LA-36EE3D05','official-web','https://columbiaroadmarket.co.uk/','Columbia Road Flower Market','v1-market-LA-36EE3D05','HOURS','OWNER_OPERATOR',0,'OK',200,'2026-10-04T16:00:00Z','2026-10-18T16:00:00Z','Sunday trading confirmed; closing time is inconsistent on the official page.'
WHERE NOT EXISTS (SELECT 1 FROM place_sources WHERE place_id='LA-36EE3D05' AND provider='official-web');
UPDATE place_sources SET source_url='https://columbiaroadmarket.co.uk/', source_name='Columbia Road Flower Market', source_role='HOURS', authority='OWNER_OPERATOR', source_status='OK', http_status=200,
  last_checked_at='2026-10-04T16:00:00Z', next_check_at='2026-10-18T16:00:00Z', extraction_notes='Sunday trading confirmed; closing time is inconsistent on the official page.'
WHERE place_id='LA-36EE3D05' AND provider='official-web';

INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,last_checked_at,next_check_at,extraction_notes)
SELECT 'LA-D0DE9DA4','official-web','https://romanroadtrust.co.uk/rediscover-roman-road-market/','Roman Road Market','v1-market-LA-D0DE9DA4','HOURS','OFFICIAL_PARTNER',0,'OK',200,'2026-10-04T16:00:00Z','2026-11-01T16:00:00Z','Tuesday, Thursday and Saturday trading verified from Roman Road Trust.'
WHERE NOT EXISTS (SELECT 1 FROM place_sources WHERE place_id='LA-D0DE9DA4' AND provider='official-web');
UPDATE place_sources SET source_url='https://romanroadtrust.co.uk/rediscover-roman-road-market/', source_name='Roman Road Market', source_role='HOURS', authority='OFFICIAL_PARTNER', source_status='OK', http_status=200,
  last_checked_at='2026-10-04T16:00:00Z', next_check_at='2026-11-01T16:00:00Z', extraction_notes='Tuesday, Thursday and Saturday trading verified from Roman Road Trust.'
WHERE place_id='LA-D0DE9DA4' AND provider='official-web';

DELETE FROM place_opening_periods WHERE place_id IN ('LA-D13F4A91','LA-CE3A1E89','S5','LA-36EE3D05','LA-D0DE9DA4') AND experience_id IS NULL;

INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'LA-D13F4A91', value, 1, '10:00', '17:30', (SELECT source_id FROM place_sources WHERE place_id='LA-D13F4A91' AND provider='official-web' LIMIT 1), '2026-10-04T16:00:00Z'
FROM json_each('[0,1,2,3,4,5,6]');

INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'LA-CE3A1E89', value, 1, '10:00', '20:00', (SELECT source_id FROM place_sources WHERE place_id='LA-CE3A1E89' AND provider='official-web' LIMIT 1), '2026-10-04T16:00:00Z'
FROM json_each('[1,2,3,5]');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('LA-CE3A1E89',4,1,'08:00','18:00',(SELECT source_id FROM place_sources WHERE place_id='LA-CE3A1E89' AND provider='official-web' LIMIT 1),'2026-10-04T16:00:00Z'),
       ('LA-CE3A1E89',6,1,'10:00','18:00',(SELECT source_id FROM place_sources WHERE place_id='LA-CE3A1E89' AND provider='official-web' LIMIT 1),'2026-10-04T16:00:00Z'),
       ('LA-CE3A1E89',0,1,'10:00','17:00',(SELECT source_id FROM place_sources WHERE place_id='LA-CE3A1E89' AND provider='official-web' LIMIT 1),'2026-10-04T16:00:00Z');

INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'S5', value, 1, '08:00', '17:00', (SELECT source_id FROM place_sources WHERE place_id='S5' AND provider='official-web' LIMIT 1), '2026-10-04T16:00:00Z'
FROM json_each('[2,3,4,5]');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('S5',6,1,'08:00','17:30',(SELECT source_id FROM place_sources WHERE place_id='S5' AND provider='official-web' LIMIT 1),'2026-10-04T16:00:00Z'),
       ('LA-36EE3D05',0,1,'08:00','14:00',(SELECT source_id FROM place_sources WHERE place_id='LA-36EE3D05' AND provider='official-web' LIMIT 1),'2026-10-04T16:00:00Z');

INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'LA-D0DE9DA4', value, 1, '10:00', '15:00', (SELECT source_id FROM place_sources WHERE place_id='LA-D0DE9DA4' AND provider='official-web' LIMIT 1), '2026-10-04T16:00:00Z'
FROM json_each('[2,4,6]');

UPDATE enrichment_batch_places SET status='READY' WHERE place_id IN ('LA-D13F4A91','LA-CE3A1E89','S5','LA-36EE3D05','LA-D0DE9DA4');
UPDATE place_review_issues SET status='RESOLVED', resolution='Official market source and current visitor information verified for Planner V1 on 2026-10-04.', resolved_at='2026-10-04T16:00:00Z'
WHERE place_id IN ('LA-D13F4A91','LA-CE3A1E89','S5','LA-36EE3D05','LA-D0DE9DA4') AND status='OPEN'
  AND issue_type IN ('SOURCE_MISSING','SOURCE_CONFLICT','LINK_BROKEN','DESCRIPTION_GENERIC','BOOKING_UNCLEAR','HOURS_UNCLEAR');
