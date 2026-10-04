-- Curated sandbox-only enhancement for route-aware planner validation.
-- Apply after Batch 1 and Batch 2. This file is deliberately not a migration.
PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO enrichment_batches(batch_code,name,purpose,status)
VALUES ('ROUTE-BERMONDSEY-PUTNEY','Bermondsey to Putney corridor','Official-source coverage for the first route-aware planner test.','COMPLETE');

-- Crossbones: the reliable default experience is the exterior memorial and
-- ribboned gates; entry to the volunteer-run garden remains variable.
UPDATE places SET
  description_en='Crossbones is a former paupers’ burial ground and a volunteer-made garden of remembrance for Southwark’s outcast dead. The ribbon-covered memorial gates on Redcross Way remain visible when the small interior garden is closed.',
  editorial_hook_en='A moving, handmade memorial where medieval Southwark history survives in ribbons, names and a small community garden.',
  official_url='https://crossbones.org.uk/crossbones-garden-of-remembrance-opening-times/',
  visit_minutes=25, mood_unexpected=3, mood_beautiful=2, mood_weird=3, mood_atmospheric=3,
  data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE',
  hours_last_checked_at='2026-10-03T18:45:00Z', hours_next_check_at='2026-11-02T18:45:00Z',
  quality_reviewed_at='2026-10-03T18:45:00Z', quality_notes='Official community source confirms variable volunteer opening; exterior memorial is the planner default.'
WHERE id='P1';

-- The surviving London Necropolis Company frontage is an exterior stop.
UPDATE places SET
  description_en='The surviving frontage of the London Necropolis Company’s terminus stands at 121 Westminster Bridge Road. Its granite arch, terracotta ornament and 1900 date mark the railway that once carried coffins and mourners from London to Brookwood Cemetery.',
  editorial_hook_en='A richly detailed former funeral-railway terminus hiding in plain sight near Waterloo.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1249875',
  visit_minutes=25, mood_unexpected=3, mood_beautiful=2, mood_weird=3, mood_atmospheric=3,
  data_confidence='HIGH', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE',
  hours_last_checked_at='2026-10-03T18:45:00Z', hours_next_check_at='2027-04-03T18:45:00Z',
  quality_reviewed_at='2026-10-03T18:45:00Z', quality_notes='Historic England list entry confirms identity, date, architecture and former use; exterior view only.'
WHERE id='O11';

-- Garden Museum: recurring hours from the owner/operator visit page.
UPDATE places SET
  description_en='Britain’s only museum devoted to the art, history and design of gardens occupies the former church of St Mary-at-Lambeth beside Lambeth Palace. The church interior, collections, courtyard garden and medieval tower combine architecture, planting and London history.',
  editorial_hook_en='A medieval church transformed into an unusually beautiful museum of gardens, with a tower and planted courtyard.',
  official_url='https://www.gardenmuseum.org.uk/visit/',
  visit_minutes=75, mood_unexpected=2, mood_beautiful=3, mood_weird=1, mood_green=3, mood_atmospheric=3,
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='OPTIONAL', admission_type='PAID',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED',
  hours_last_checked_at='2026-10-03T18:45:00Z', hours_next_check_at='2026-11-02T18:45:00Z',
  quality_reviewed_at='2026-10-03T18:45:00Z', quality_notes='Owner visit page verified; special-event exceptions must still be checked before travel.'
WHERE id='LA-6714C61A';

-- Battersea Power Station public halls and riverside estate.
UPDATE places SET
  description_en='The restored Grade II* Battersea Power Station is open as a public riverside destination. Its vast brick elevations, four chimneys and contrasting Art Deco Turbine Halls preserve the scale and industrial detail of the former power station.',
  editorial_hook_en='Walk inside one of London’s great industrial monuments and compare its two dramatically different turbine halls.',
  official_url='https://batterseapowerstation.co.uk/plan-your-visit/',
  visit_minutes=60, mood_unexpected=3, mood_beautiful=3, mood_weird=2, mood_atmospheric=3,
  data_confidence='HIGH', planner_ready=1, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED',
  hours_last_checked_at='2026-10-03T18:45:00Z', hours_next_check_at='2026-11-02T18:45:00Z',
  quality_reviewed_at='2026-10-03T18:45:00Z', quality_notes='Owner visit and access pages verified for the free public destination; paid experiences have separate conditions.'
WHERE id='LA-BD10B2CC';

-- Battersea Park and the Peace Pagoda use Wandsworth public-authority sources.
UPDATE places SET
  description_en='Battersea Park is a 200-acre Victorian riverside park with a lake, mature trees, ecological areas and a long Thames promenade. Its western riverside contains the London Peace Pagoda, while the eastern edge frames Battersea Power Station.',
  editorial_hook_en='A broad Victorian park where the lakes, riverside promenade and Peace Pagoda give the walk a sequence of contrasting scenes.',
  official_url='https://www.wandsworth.gov.uk/batterseapark',
  visit_minutes=60, mood_quiet=3, mood_unexpected=2, mood_beautiful=3, mood_green=3, mood_atmospheric=3,
  data_confidence='HIGH', planner_ready=0, access_type_v2='SEASONAL', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN',
  hours_last_checked_at='2026-10-03T18:45:00Z', hours_next_check_at='2026-10-10T18:45:00Z',
  quality_reviewed_at='2026-10-03T18:45:00Z', quality_notes='Council states 8am until dusk; closing time is seasonal and intentionally not converted into a fixed recurring time.'
WHERE id='LA-5F4C8579';

UPDATE places SET
  description_en='The London Peace Pagoda is a Buddhist stupa on the Thames edge of Battersea Park, completed in 1985 as a focus for peace. Four gilded Buddha figures face the stages of life, with the river and Chelsea embankment forming the backdrop.',
  editorial_hook_en='A gilded riverside Buddhist pagoda—one of the most unexpected architectural sights on this stretch of the Thames.',
  official_url='https://www.wandsworth.gov.uk/media/1583/battersea_park_conservation_area_appraisal_and_management_strategy_2014.pdf',
  visit_minutes=30, mood_quiet=3, mood_unexpected=3, mood_beautiful=3, mood_weird=1, mood_green=2, mood_atmospheric=3,
  data_confidence='HIGH', planner_ready=0, access_type_v2='SEASONAL', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN',
  hours_last_checked_at='2026-10-03T18:45:00Z', hours_next_check_at='2026-10-10T18:45:00Z',
  quality_reviewed_at='2026-10-03T18:45:00Z', quality_notes='Wandsworth conservation appraisal verifies the pagoda; access follows Battersea Park’s seasonal dusk closing.'
WHERE id='LA-74187E6F';

-- Albert Bridge is treated as an exterior architectural stop.
UPDATE places SET
  description_en='Albert Bridge is a slender 1873 Thames crossing with Ordish suspension elements, pastel-painted ironwork and distinctive octagonal tollbooths. Its illuminated cables and towers make it one of London’s most recognisable bridges.',
  editorial_hook_en='Pastel ironwork, surviving tollbooths and a famously delicate silhouette make this bridge worth stopping for rather than merely crossing.',
  official_url='https://www.rbkc.gov.uk/streets-and-transport/albert-bridge-repairs',
  visit_minutes=25, mood_unexpected=2, mood_beautiful=3, mood_weird=1, mood_atmospheric=3,
  data_confidence='HIGH', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE',
  access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE',
  hours_last_checked_at='2026-10-03T18:45:00Z', hours_next_check_at='2027-01-03T18:45:00Z',
  quality_reviewed_at='2026-10-03T18:45:00Z', quality_notes='Public-authority source confirms date and current pedestrian access; planner uses an exterior stop.'
WHERE id='LA-289CB273';

-- Replace lower-authority primary general sources for these records.
UPDATE place_sources SET is_primary=0
WHERE place_id IN ('P1','O11','LA-6714C61A','LA-BD10B2CC','LA-5F4C8579','LA-74187E6F','LA-289CB273') AND source_role='GENERAL';

INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,last_checked_at,next_check_at,extraction_notes)
VALUES
('P1','official-web','https://crossbones.org.uk/crossbones-garden-of-remembrance-opening-times/','Crossbones Garden','route-review-p1','GENERAL','OWNER_OPERATOR',1,'OK',200,'2026-10-03T18:45:00Z','2026-11-02T18:45:00Z','Interior opening is volunteer-dependent; exterior memorial is always visible.'),
('O11','official-web','https://historicengland.org.uk/listing/the-list/list-entry/1249875','Westminster Bridge House','route-review-o11','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'2026-10-03T18:45:00Z','2027-04-03T18:45:00Z','National Heritage List entry.'),
('LA-6714C61A','official-web','https://www.gardenmuseum.org.uk/visit/','Garden Museum','route-review-garden-museum','GENERAL','OWNER_OPERATOR',1,'OK',200,'2026-10-03T18:45:00Z','2026-11-02T18:45:00Z','Official visit page.'),
('LA-BD10B2CC','official-web','https://batterseapowerstation.co.uk/plan-your-visit/','Battersea Power Station','route-review-bps','GENERAL','OWNER_OPERATOR',1,'OK',200,'2026-10-03T18:45:00Z','2026-11-02T18:45:00Z','Official plan-your-visit page.'),
('LA-5F4C8579','official-web','https://www.wandsworth.gov.uk/batterseapark','Battersea Park','route-review-battersea-park','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'2026-10-03T18:45:00Z','2026-10-10T18:45:00Z','Council park page; closes at dusk.'),
('LA-74187E6F','official-web','https://www.wandsworth.gov.uk/media/1583/battersea_park_conservation_area_appraisal_and_management_strategy_2014.pdf','London Peace Pagoda','route-review-peace-pagoda','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'2026-10-03T18:45:00Z','2027-04-03T18:45:00Z','Council conservation appraisal.'),
('LA-289CB273','official-web','https://www.rbkc.gov.uk/streets-and-transport/albert-bridge-repairs','Albert Bridge','route-review-albert-bridge','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'2026-10-03T18:45:00Z','2027-01-03T18:45:00Z','Council bridge page and current access status.')
ON CONFLICT(provider,fingerprint) DO UPDATE SET
  source_url=excluded.source_url, source_name=excluded.source_name, authority=excluded.authority,
  is_primary=excluded.is_primary, source_status=excluded.source_status, http_status=excluded.http_status,
  last_checked_at=excluded.last_checked_at, next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;

DELETE FROM place_opening_periods WHERE place_id IN ('LA-6714C61A','LA-BD10B2CC') AND experience_id IS NULL;

-- SQLite weekday: Sunday=0 ... Saturday=6.
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,closed,last_verified_at)
VALUES
('LA-6714C61A',0,1,'10:00','17:00',0,'2026-10-03T18:45:00Z'),
('LA-6714C61A',1,1,NULL,NULL,1,'2026-10-03T18:45:00Z'),
('LA-6714C61A',2,1,'10:00','16:00',0,'2026-10-03T18:45:00Z'),
('LA-6714C61A',3,1,'10:00','16:00',0,'2026-10-03T18:45:00Z'),
('LA-6714C61A',4,1,'10:00','16:00',0,'2026-10-03T18:45:00Z'),
('LA-6714C61A',5,1,'10:00','16:00',0,'2026-10-03T18:45:00Z'),
('LA-6714C61A',6,1,'10:00','17:00',0,'2026-10-03T18:45:00Z'),
('LA-BD10B2CC',0,1,'12:00','18:00',0,'2026-10-03T18:45:00Z'),
('LA-BD10B2CC',1,1,'10:00','20:00',0,'2026-10-03T18:45:00Z'),
('LA-BD10B2CC',2,1,'10:00','20:00',0,'2026-10-03T18:45:00Z'),
('LA-BD10B2CC',3,1,'10:00','20:00',0,'2026-10-03T18:45:00Z'),
('LA-BD10B2CC',4,1,'10:00','20:00',0,'2026-10-03T18:45:00Z'),
('LA-BD10B2CC',5,1,'10:00','20:00',0,'2026-10-03T18:45:00Z'),
('LA-BD10B2CC',6,1,'10:00','20:00',0,'2026-10-03T18:45:00Z');

INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status)
VALUES
('ROUTE-BERMONDSEY-PUTNEY','P1',10,'Bermondsey-Putney route quality','READY'),
('ROUTE-BERMONDSEY-PUTNEY','O11',10,'Bermondsey-Putney route quality','READY'),
('ROUTE-BERMONDSEY-PUTNEY','LA-6714C61A',10,'Bermondsey-Putney route quality','READY'),
('ROUTE-BERMONDSEY-PUTNEY','LA-BD10B2CC',10,'Bermondsey-Putney route quality','READY'),
('ROUTE-BERMONDSEY-PUTNEY','LA-5F4C8579',20,'Bermondsey-Putney route quality','READY'),
('ROUTE-BERMONDSEY-PUTNEY','LA-74187E6F',20,'Bermondsey-Putney route quality','READY'),
('ROUTE-BERMONDSEY-PUTNEY','LA-289CB273',10,'Bermondsey-Putney route quality','READY');
