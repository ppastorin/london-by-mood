-- Focused City-church planner follow-up. Sandbox/development data only.
-- Official access information checked 2026-10-04; refresh after 2026-11-01.
PRAGMA foreign_keys = ON;

UPDATE places SET official_url='https://www.greatstbarts.com/visit', visit_minutes=45,
  description_en='A surviving Norman church at Smithfield with a Romanesque interior, medieval tombs and one of London''s most atmospheric approaches through a Tudor gatehouse.',
  editorial_hook_en='Enter through the timber-framed Smithfield gatehouse to find the weighty Norman interior of London''s oldest surviving parish church.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='MIXED',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='CANDIDATE',
  access_notes_en='Normally open Monday-Saturday 10:00-17:00; Sunday visiting is between services. Check the official visit page for exceptional closures.',
  hours_last_checked_at='2026-10-04T12:00:00Z', hours_next_check_at='2026-11-01T12:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' City-church access and specific editorial copy checked from the official visitor source on 2026-10-04.'
WHERE id='LA-2405DFBC';

UPDATE places SET official_url='https://www.stbrides.com/visit-us/', visit_minutes=40,
  description_en='Christopher Wren''s Fleet Street church, known for its tiered wedding-cake spire, the journalists'' memorials and a crypt preserving traces of earlier buildings on the site.',
  editorial_hook_en='St Bride''s combines Wren''s slender tiered spire with a crypt that exposes the much older layers beneath Fleet Street.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED',
  access_notes_en='Normally open Monday-Friday 08:00-17:00, Saturday 10:00-15:30 and Sunday 10:00-18:30; services and special events can affect access.',
  hours_last_checked_at='2026-10-04T12:00:00Z', hours_next_check_at='2026-11-01T12:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' City-church access and specific editorial copy checked from the official visitor source on 2026-10-04.'
WHERE id='LA-88A8D5DC';

UPDATE places SET official_url='https://www.stmarylebow.org.uk/', visit_minutes=35,
  description_en='The Wren church of the Bow Bells on Cheapside, rebuilt after wartime destruction, with a Roman crypt and a long-standing connection to the definition of a Cockney.',
  editorial_hook_en='Bow Bells, a Wren interior and a much older crypt make St Mary-le-Bow a compact lesson in the City''s repeated rebuilding.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='CANDIDATE',
  access_notes_en='Normally open Monday-Friday 07:30-18:00. Weekend visiting is informal and should be confirmed before a special trip.',
  hours_last_checked_at='2026-10-04T12:00:00Z', hours_next_check_at='2026-11-01T12:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' City-church access and specific editorial copy checked from the official visitor source on 2026-10-04.'
WHERE id='LA-F5A195D0';

UPDATE places SET official_url='https://www.stmagnusmartyr.org.uk/', visit_minutes=35,
  description_en='A richly decorated Wren church at the former approach to old London Bridge, with a model of the medieval bridge and a fragment of Roman riverside wall inside.',
  editorial_hook_en='St Magnus marks the lost gateway to old London Bridge and hides a bridge model and Roman masonry behind its white-and-gold interior.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED',
  access_notes_en='Normally open Tuesday-Friday 10:00-16:00 and Sunday 10:00-13:00; normally closed Monday and Saturday.',
  hours_last_checked_at='2026-10-04T12:00:00Z', hours_next_check_at='2026-11-01T12:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' City-church access and specific editorial copy checked from the official visitor source on 2026-10-04.'
WHERE id='LA-29D7ED48';

UPDATE places SET official_url='https://ahbtt.org.uk/visit/', visit_minutes=45,
  description_en='The City''s oldest surviving church foundation, beside the Tower, with Saxon fabric, a Roman pavement and an undercroft museum spanning nearly two millennia.',
  editorial_hook_en='All Hallows layers Roman pavement, Saxon stonework and a crypt museum into one of the City''s deepest historical interiors.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED',
  access_notes_en='Normally open Monday-Friday 08:00-17:00 and Saturday-Sunday 10:00-17:00; closed on Bank Holidays and occasionally for private events.',
  hours_last_checked_at='2026-10-04T12:00:00Z', hours_next_check_at='2026-11-01T12:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' City-church access and specific editorial copy checked from the official visitor source on 2026-10-04.'
WHERE id='R7';

UPDATE places SET official_url='https://www.ststephenwalbrook.net/', visit_minutes=35,
  description_en='A compact Wren masterpiece behind Mansion House, centred on a luminous dome and Henry Moore''s circular travertine altar; it was also the birthplace of Samaritans.',
  editorial_hook_en='St Stephen Walbrook turns a constrained City site into a domed, light-filled prototype for Wren''s later work at St Paul''s.',
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='NEEDS_REVIEW', description_quality='SPECIFIC', hours_status='CANDIDATE',
  access_notes_en='Public access is timetabled around services and events; confirm the current opening window on the official site before travelling.',
  hours_last_checked_at='2026-10-04T12:00:00Z', hours_next_check_at='2026-10-18T12:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' Official source confirmed; a stable visitor-hours statement was not found and remains flagged for review.'
WHERE id='R12';

UPDATE places SET official_url='https://www.cityoflondon.gov.uk/things-to-do/city-gardens/find-a-garden/st-dunstan-in-the-east-church-garden', visit_minutes=30,
  description_en='A public garden woven through the roofless walls of a bomb-damaged church, retaining Christopher Wren''s tower and framing modern City buildings with Gothic arches and foliage.',
  editorial_hook_en='St Dunstan in the East is the City at its most cinematic: a green garden growing through a ruined church beneath Wren''s surviving tower.',
  data_confidence='MEDIUM', planner_ready=1, access_type_v2='SEASONAL', booking_mode='NONE', admission_type='FREE',
  access_clarity='NEEDS_REVIEW', description_quality='SPECIFIC', hours_status='CANDIDATE',
  access_notes_en='Free public church garden managed by the City of London; gated opening can vary and the official page does not publish a stable daily timetable.',
  hours_last_checked_at='2026-10-04T12:00:00Z', hours_next_check_at='2026-10-18T12:00:00Z', quality_reviewed_at='2026-10-04',
  quality_notes=quality_notes || ' Official City of London source checked; stable daily gate times remain unclear.'
WHERE id='LA-E4BE50C8';

INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
VALUES
  ('LA-2405DFBC','official-hours','https://www.greatstbarts.com/visit','Great St Bartholomew visiting times','55019dc117cbaa3a1b01f760e3a3a3af0ef9b20aaf1fbce8d977523f9d0ae42d','HOURS','OWNER_OPERATOR',0,'OK',200,'','2026-10-04T12:00:00Z','2026-11-01T12:00:00Z','Monday-Saturday hours explicit; Sunday access is between services.'),
  ('LA-88A8D5DC','official-hours','https://www.stbrides.com/visit-us/','St Bride''s visitor information','cda224d1ff87f9d1830da56ba3b284ef3258f7f281a3a31cb75ef46fb97a7ee1','HOURS','OWNER_OPERATOR',0,'OK',200,'','2026-10-04T12:00:00Z','2026-11-01T12:00:00Z','Regular daily visitor hours explicitly published.'),
  ('LA-F5A195D0','official-hours','https://www.stmarylebow.org.uk/','St Mary-le-Bow opening times','a7f64aaddbaaee17a5324d7598b3b903034913a3360c135ff8119a42c3c052a7','HOURS','OWNER_OPERATOR',0,'OK',200,'','2026-10-04T12:00:00Z','2026-11-01T12:00:00Z','Weekday hours explicit; weekend access informal.'),
  ('LA-29D7ED48','official-hours','https://www.stmagnusmartyr.org.uk/','St Magnus the Martyr opening times','b6dd2c3ffe8ac64e4271dfb53cd8b85bc2f20906e7a0ceaa194d37f20e6e675b','HOURS','OWNER_OPERATOR',0,'OK',200,'','2026-10-04T12:00:00Z','2026-11-01T12:00:00Z','Regular weekly hours explicitly published.'),
  ('R7','official-hours','https://ahbtt.org.uk/visit/','All Hallows visiting times','e9cc88f79e5a4225c5126bbd8deee4cf0cc70cc8e75a8115afe66bb4a06e1674','HOURS','OWNER_OPERATOR',0,'OK',200,'','2026-10-04T12:00:00Z','2026-11-01T12:00:00Z','Regular daily visitor hours explicitly published.'),
  ('R12','official-hours','https://www.ststephenwalbrook.net/','St Stephen Walbrook','cdcecf80a9915c4a422655e89568f9add01a7a905c3f7b8d51c650a41de2f424','HOURS','OWNER_OPERATOR',0,'OK',200,'','2026-10-04T12:00:00Z','2026-10-18T12:00:00Z','Official site confirmed; stable public visitor hours not extracted.'),
  ('LA-E4BE50C8','official-hours','https://www.cityoflondon.gov.uk/things-to-do/city-gardens/find-a-garden/st-dunstan-in-the-east-church-garden','St Dunstan in the East Church Garden','ad8bb8823a8252f6e57cb5b17864c9c1bd86d318c382f073c8080f038875161f','HOURS','PUBLIC_AUTHORITY',0,'OK',200,'','2026-10-04T12:00:00Z','2026-10-18T12:00:00Z','Official garden page does not publish a stable daily timetable.')
ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
  http_status=excluded.http_status, last_checked_at=excluded.last_checked_at, next_check_at=excluded.next_check_at,
  extraction_notes=excluded.extraction_notes;

DELETE FROM place_opening_periods
WHERE place_id IN ('LA-2405DFBC','LA-88A8D5DC','LA-F5A195D0','LA-29D7ED48','R7') AND experience_id IS NULL;

-- Great St Bartholomew: Monday-Saturday 10:00-17:00; Sunday varies around services.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'LA-2405DFBC', value, 1, '10:00', '17:00', (SELECT source_id FROM place_sources WHERE place_id='LA-2405DFBC' AND provider='official-hours' LIMIT 1), '2026-10-04T12:00:00Z'
FROM json_each('[1,2,3,4,5,6]');

-- St Bride's: weekday, Saturday and Sunday hours.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'LA-88A8D5DC', value, 1, '08:00', '17:00', (SELECT source_id FROM place_sources WHERE place_id='LA-88A8D5DC' AND provider='official-hours' LIMIT 1), '2026-10-04T12:00:00Z'
FROM json_each('[1,2,3,4,5]');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('LA-88A8D5DC',6,1,'10:00','15:30',(SELECT source_id FROM place_sources WHERE place_id='LA-88A8D5DC' AND provider='official-hours' LIMIT 1),'2026-10-04T12:00:00Z'),
       ('LA-88A8D5DC',0,1,'10:00','18:30',(SELECT source_id FROM place_sources WHERE place_id='LA-88A8D5DC' AND provider='official-hours' LIMIT 1),'2026-10-04T12:00:00Z');

-- St Mary-le-Bow: explicit weekday hours only.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'LA-F5A195D0', value, 1, '07:30', '18:00', (SELECT source_id FROM place_sources WHERE place_id='LA-F5A195D0' AND provider='official-hours' LIMIT 1), '2026-10-04T12:00:00Z'
FROM json_each('[1,2,3,4,5]');

-- St Magnus: Tuesday-Friday and Sunday.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'LA-29D7ED48', value, 1, '10:00', '16:00', (SELECT source_id FROM place_sources WHERE place_id='LA-29D7ED48' AND provider='official-hours' LIMIT 1), '2026-10-04T12:00:00Z'
FROM json_each('[2,3,4,5]');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('LA-29D7ED48',0,1,'10:00','13:00',(SELECT source_id FROM place_sources WHERE place_id='LA-29D7ED48' AND provider='official-hours' LIMIT 1),'2026-10-04T12:00:00Z');

-- All Hallows: weekdays 08:00-17:00; weekends 10:00-17:00.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
SELECT 'R7', value, 1, '08:00', '17:00', (SELECT source_id FROM place_sources WHERE place_id='R7' AND provider='official-hours' LIMIT 1), '2026-10-04T12:00:00Z'
FROM json_each('[1,2,3,4,5]');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,source_id,last_verified_at)
VALUES ('R7',6,1,'10:00','17:00',(SELECT source_id FROM place_sources WHERE place_id='R7' AND provider='official-hours' LIMIT 1),'2026-10-04T12:00:00Z'),
       ('R7',0,1,'10:00','17:00',(SELECT source_id FROM place_sources WHERE place_id='R7' AND provider='official-hours' LIMIT 1),'2026-10-04T12:00:00Z');

INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
SELECT 'R12','HOURS_UNCLEAR','LOW','Confirm stable public visitor hours from the official church source.','{"url":"https://www.ststephenwalbrook.net/"}'
WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R12' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
SELECT 'LA-E4BE50C8','HOURS_UNCLEAR','LOW','Confirm the church garden''s current gate opening times.','{"url":"https://www.cityoflondon.gov.uk/things-to-do/city-gardens/find-a-garden/st-dunstan-in-the-east-church-garden"}'
WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E4BE50C8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');

UPDATE place_review_issues SET status='RESOLVED', resolution='Official visitor source and structured weekly hours confirmed 2026-10-04.', resolved_at='2026-10-04T12:00:00Z'
WHERE place_id IN ('LA-88A8D5DC','LA-29D7ED48','R7') AND status='OPEN'
  AND issue_type IN ('SOURCE_MISSING','DESCRIPTION_GENERIC','BOOKING_UNCLEAR','HOURS_UNCLEAR','LINK_BROKEN');
UPDATE place_review_issues SET status='RESOLVED', resolution='Official source and specific description confirmed; variable periods remain documented 2026-10-04.', resolved_at='2026-10-04T12:00:00Z'
WHERE place_id IN ('LA-2405DFBC','LA-F5A195D0') AND status='OPEN'
  AND issue_type IN ('SOURCE_MISSING','DESCRIPTION_GENERIC','BOOKING_UNCLEAR','LINK_BROKEN');

