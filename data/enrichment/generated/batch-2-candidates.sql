-- GENERATED FILE: apply only after migrations/0003_planner_data_foundation.sql.
-- This candidate set is designed for a local/development D1 database and does not touch production.
PRAGMA foreign_keys = ON;
INSERT OR REPLACE INTO enrichment_batches(batch_code,name,purpose,status) VALUES ('BATCH-2','Coverage expansion','All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','REVIEW');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-CECB7A4F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='REQUIRED', admission_type='PAID', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:09.192Z', hours_next_check_at='2026-10-31T10:24:09.192Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Visitor access is through dated audio, guided or specialist tour tickets.' WHERE id='LA-CECB7A4F';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-CECB7A4F','official-web','https://tickets.parliament.uk/content/ticket-options','Palace of Westminster','ec192175a186f1b919f9b9863a7c7c6eb74183ab63fe9ed45677e2890ca1465c','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'8820bf0c71a93860e47f9feb438d332fec5d6c89b9d2e89ca945d0e707fb4780','2026-10-03T10:24:09.192Z','2026-10-31T10:24:09.192Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CECB7A4F','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CECB7A4F' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CECB7A4F','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CECB7A4F' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-324D78AD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='RECOMMENDED', admission_type='PAID', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:09.200Z', hours_next_check_at='2026-10-31T10:24:09.200Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Interior exhibition access has published opening hours and ticket checks.' WHERE id='LA-324D78AD';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-324D78AD','official-web','https://www.towerbridge.org.uk/whats-on/entry-to-tower-bridge','Tower Bridge','daac2a31b50a9a2bccd0e910760c1663f64b0b2d73fde38a16f7be54247ea720','GENERAL','OWNER_OPERATOR',1,'OK',200,'8e3440ed5bac2677128860d57b0067973e1c19a660a66c515bb56cca3986f6d3','2026-10-03T10:24:09.200Z','2026-10-31T10:24:09.200Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-324D78AD','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-324D78AD' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-324D78AD','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-324D78AD' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-180AF830',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='RECOMMENDED', admission_type='PAID', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:09.201Z', hours_next_check_at='2026-10-31T10:24:09.201Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): Visitor access to the interior is through scheduled paid tours or performances.' WHERE id='LA-180AF830';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-180AF830','official-web','https://www.royalalberthall.com/visit/tours/','Royal Albert Hall','d4986c03cf3413e1968b4bf4556e05549df31020606452e830c4d5185ae5063f','GENERAL','OWNER_OPERATOR',1,'OK',200,'20c39e9e2f86336f2e65ee6deeb2c7628138daf8a7d228dbefca8591198c7c89','2026-10-03T10:24:09.201Z','2026-10-31T10:24:09.201Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-180AF830','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-180AF830' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-180AF830','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-180AF830' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-7319332B',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='REQUIRED', admission_type='PAID', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:13.919Z', hours_next_check_at='2026-10-10T10:24:13.919Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): The State Rooms open seasonally and entry is by dated ticket.' WHERE id='LA-7319332B';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-7319332B','official-web','https://www.rct.uk/visit/buckingham-palace','Buckingham Palace','7a4efaf9eb685cf3586581f29b51c42737548fbc401a552397498383e7938658','GENERAL','OWNER_OPERATOR',1,'OK',200,'103c667d7439a1f4f007d7282167a900e9ddcab74f606ae3126d4eff23a05d4f','2026-10-03T10:24:13.919Z','2026-10-10T10:24:13.919Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7319332B','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7319332B' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7319332B','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7319332B' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BBBAD130',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BBBAD130';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BBBAD130','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BBBAD130' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-368AE350',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-368AE350';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-368AE350','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-368AE350' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-CD14E834',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:14.290Z', hours_next_check_at='2027-01-01T10:24:14.290Z', quality_reviewed_at='2026-10-03T10:24:14.290Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-CD14E834';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-CD14E834','official-web','https://www.skdocks.co.uk/','St Katharine Docks Marina','8acfe5b2134a2d0d85a46fbcd0d1550869a5fd809038181f758643bd0be077ac','GENERAL','OWNER_OPERATOR',1,'OK',200,'98889d30d9477d81b27ad6545c1f3a8d1393b0dade61e9928768018825557311','2026-10-03T10:24:14.290Z','2027-01-01T10:24:14.290Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2432FD1F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2432FD1F';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2432FD1F','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2432FD1F' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-9B4A399A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:16.567Z', hours_next_check_at='2026-10-31T10:24:16.567Z', quality_reviewed_at='2026-10-03T10:24:16.567Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-9B4A399A';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-9B4A399A','official-web','https://www.stpauls.co.uk/','St. Paul''s Cathedral','d703796f7846bca83812c31104b7f5c18b91c4e40d1de11ef64e7f429747497d','GENERAL','OWNER_OPERATOR',1,'OK',200,'019bdc41986586998a14dbc2e854a06adce5017547faf026e65ee6f65790d102','2026-10-03T10:24:16.567Z','2026-10-31T10:24:16.567Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9B4A399A','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9B4A399A' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9B4A399A','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9B4A399A' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-679E3B20',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-679E3B20';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-679E3B20','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-679E3B20' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-5C88BA70',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-5C88BA70';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5C88BA70','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5C88BA70' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5C88BA70','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5C88BA70' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-55B5FAD6',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:18.015Z', hours_next_check_at='2027-01-01T10:24:18.015Z', quality_reviewed_at='2026-10-03T10:24:18.015Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-55B5FAD6';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-55B5FAD6','official-web','http://www.20fenchurchstreet.co.uk/','Sky Garden','38b31090265717302cb46a27025e6a8abeeb77a71bd9de79025153d42e0b0cec','GENERAL','OWNER_OPERATOR',1,'BROKEN',502,'81074a9c8dfb24290e8fc4af14d20f67f5304618d27ac713628b1126e41dbd8e','2026-10-03T10:24:18.015Z','2027-01-01T10:24:18.015Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-55B5FAD6','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"http://www.20fenchurchstreet.co.uk/","httpStatus":502,"error":""}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-55B5FAD6' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-55B5FAD6','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-55B5FAD6' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A34930A1',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A34930A1';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A34930A1','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A34930A1' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6886A4AB',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='RECOMMENDED', admission_type='PAID', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:22.034Z', hours_next_check_at='2026-10-31T10:24:22.034Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Palace access follows published daily hours and requires admission; advance purchase is recommended but on-day tickets may be available.' WHERE id='LA-6886A4AB';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-6886A4AB','official-web','https://www.hrp.org.uk/hampton-court-palace/visit/opening-and-closing-times/','Hampton Court Palace','854a919768703d771af058169013baea69a981b940311bd100e8e3c91e831e4a','GENERAL','OWNER_OPERATOR',1,'OK',200,'dca0f3fa0c1ab34c5e1fab5cd12bb3634f286e052ee420298561ae457c962c3a','2026-10-03T10:24:22.034Z','2026-10-31T10:24:22.034Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6886A4AB','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6886A4AB' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-89E0E43A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-89E0E43A';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-89E0E43A','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-89E0E43A' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-971A6354',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-971A6354';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-971A6354','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-971A6354' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-08BB5C1A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:22.156Z', hours_next_check_at='2027-04-01T10:24:22.156Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): The building operates as civic and registration premises rather than a general visitor attraction; the planner default is an exterior stop.' WHERE id='LA-08BB5C1A';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-08BB5C1A','official-web','https://www.royalgreenwich.gov.uk/directory_record/3431/woolwich_town_hall_%E2%80%93_the_edwardian_room_and_the_register_office','Woolwich Town Hall','747561d30cdb9efd90cbf7c8e0c038b2a79e902f38746b990fd46f61a4714300','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'0a348bcfbc8f8f5bb0794f1249a8a6978412537d54c9ec96277d575419886a92','2026-10-03T10:24:22.156Z','2027-04-01T10:24:22.156Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-08BB5C1A','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-08BB5C1A' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-DB1CFF86',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='HIGH', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:22.583Z', hours_next_check_at='2027-04-01T10:24:22.583Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Historic England confirms the Grade II Ancient House at 2-8 Church Lane, Walthamstow. No regular public interior access is published, so the planner default is a free exterior stop.' WHERE id='LA-DB1CFF86';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-DB1CFF86','official-web','https://historicengland.org.uk/listing/the-list/list-entry/1190795','The Ancient House','b15c24f60c6a37a555bd8909816ffda137776830fb90ebe98297e447911464a1','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'03d3a8c523d563b284b916b2479ec702a96366d421d7a1bb1907ebd02f0a0060','2026-10-03T10:24:22.583Z','2027-04-01T10:24:22.583Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-514269D2',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='CUSTOMER_ONLY', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:26.270Z', hours_next_check_at='2026-12-02T10:24:26.270Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Royal Ballet and Opera visitor information confirms public building access, while the former Floral Hall, now Paul Hamlyn Hall, is available around performances and programmed activity.' WHERE id='LA-514269D2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-514269D2','official-web','https://www.rbo.org.uk/visit/visitor-information','Royal Opera House - Floral Hall','768c800b9ab2316170590442ba335f316285d1593ec0b44c578bb6f30f009aa6','GENERAL','OWNER_OPERATOR',1,'OK',200,'b2ab17bc29fcdd347928e0f22acd58be6c27588d3a4fc2b85a2ebe52cce89367','2026-10-03T10:24:26.270Z','2026-12-02T10:24:26.270Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-514269D2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-514269D2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-609640E0',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:26.658Z', hours_next_check_at='2026-10-31T10:24:26.658Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Official visitor information provides regular public opening and free standard admission.' WHERE id='LA-609640E0';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-609640E0','official-web','https://www.fulhampalace.org/visit/','Fulham Palace','ce339ad6e5da1c775db1ec71b7a9f1485e01be489d6b066cd68e86af59987bbb','GENERAL','OWNER_OPERATOR',1,'OK',200,'be93fd312ef27618e114ca4bbcfc88c57b073d177d29185107c50022f218e137','2026-10-03T10:24:26.658Z','2026-10-31T10:24:26.658Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-609640E0','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-609640E0' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-609640E0','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-609640E0' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-DC429397',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='APPOINTMENT_ONLY', booking_mode='REQUIRED', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:27.113Z', hours_next_check_at='2026-10-31T10:24:27.113Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): The official site routes hall tours through enquiries and otherwise presents the building as a working and hire venue.' WHERE id='LA-DC429397';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-DC429397','official-web','https://www.apothecaries.org/contact/','Apothecaries'' Hall','b39037428bc07191b495ecab340838973f5593c743be75917518c81560c1d4a0','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'dcad5e82260a9124e3368933cdef0a87455e8e852bf309afc8668336e476ae6e','2026-10-03T10:24:27.113Z','2026-10-31T10:24:27.113Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DC429397','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.apothecaries.org/contact/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DC429397' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DC429397','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DC429397' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DC429397','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DC429397' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D62073EC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='APPOINTMENT_ONLY', booking_mode='REQUIRED', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:31.527Z', hours_next_check_at='2026-10-31T10:24:31.527Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): The Hall is a working livery and events venue; visits require prior arrangement.' WHERE id='LA-D62073EC';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-D62073EC','official-web','https://www.ironmongers.org/contact-us','Ironmongers'' Hall','74ba3a8b254b87ad4fbf332993fad66bfc171a2d9f06b40a47fb0083fc66605c','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'fbc7c994cff8a3fb202a4118c83e22a0aabbce1605d60d6fc90961677cc4c07e','2026-10-03T10:24:31.527Z','2026-10-31T10:24:31.527Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D62073EC','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.ironmongers.org/contact-us","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D62073EC' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D62073EC','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D62073EC' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D62073EC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D62073EC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-54A730BF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='OPTIONAL', admission_type='PAID', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:32.463Z', hours_next_check_at='2026-10-31T10:24:32.463Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Official page provides recurring opening sessions; self-led admission can be bought at the door while tours are bookable.' WHERE id='LA-54A730BF';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-54A730BF','official-web','https://www.nationaltrust.org.uk/visit/london/sutton-house-and-breakers-yard/booking-your-visit-to-sutton-house','National Trust - Sutton House and Breaker''s Yard','ee14db6a3680b9b9488796190894eab24e44d5adc1126285db747b79c44b73bb','GENERAL','OWNER_OPERATOR',1,'OK',200,'24d11565b42d9b177a7039e348aef355b99eee9923bd3cc41008aba6f15a369e','2026-10-03T10:24:32.463Z','2026-10-31T10:24:32.463Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-54A730BF','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-54A730BF' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-54A730BF','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-54A730BF' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-5850CBFC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:33.186Z', hours_next_check_at='2027-04-01T10:24:33.186Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): The reviewed identity is the private Tudor-revival house at 22 Farm Street within the Mayfair Conservation Area. The reliable visitor experience is viewing it from the public street.' WHERE id='LA-5850CBFC';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-5850CBFC','official-web','https://www.westminster.gov.uk/sites/default/files/media/documents/Mayfair%20conservation%20area%20directory.pdf','Farm House','4c9e8ba65fd66199cb0a6502d9fadf38d4d74728b8b94ad7103f472360d716bc','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'a88ecf5bbfd150400fab64176b1194ba4d616b389031e4aa3f5da87c4dcfe112','2026-10-03T10:24:33.186Z','2027-04-01T10:24:33.186Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-37145B89',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:35.088Z', hours_next_check_at='2027-04-01T10:24:35.088Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): Reviewer confirmed that this record refers to the Garnault Place elevation of Finsbury Town Hall. Historic England confirms that elevation; the planner default is an exterior stop.' WHERE id='LA-37145B89';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-37145B89','official-web','https://historicengland.org.uk/listing/the-list/list-entry/1293112','Garnault Place','7bccf5c177d1fbbadf8049cb9616373f8d49982f6f9bdf1002db2d2fbb461eaf','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'2c66f747cfa6b715918e92ff7a00ee5e7bc8736a7f3ff4652ef3e628bd208a04','2026-10-03T10:24:35.088Z','2027-04-01T10:24:35.088Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-FDFDE1A3',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='HIGH', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:37.825Z', hours_next_check_at='2027-04-01T10:24:37.825Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Westminster''s conservation audit identifies the former Queen''s Cinema at Bishops Bridge Road and its Art Deco frontage. The cinema use has ended, so the planner default is exterior viewing.' WHERE id='LA-FDFDE1A3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-FDFDE1A3','official-web','https://www.westminster.gov.uk/sites/default/files/media/documents/Queensway%20conservation%20area%20audit%20SPD.pdf','Queens ex cinema art deco','0da48ed6d450a9750fe3d0b34197d4e4ec5b6d49607c21bc92df24501f505cfb','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'21fbc8b5a55826ac94f87092c93d3762b6e8b98997bbd0e9b34c96480bb9c34d','2026-10-03T10:24:37.825Z','2027-04-01T10:24:37.825Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-195EC386',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='EVENT_ONLY', booking_mode='REQUIRED', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:38.089Z', hours_next_check_at='2026-10-10T10:24:38.089Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Central Hall''s official listings publish dated public concerts, conferences and other events with event-specific booking rather than unrestricted sightseeing access.' WHERE id='LA-195EC386';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-195EC386','official-web','https://www.c-h-w.com/whats-on/','Central Hall Westminster','9434e8ead0838326d3f846742516bfe8a848409bbd5b4c47817ad039fa5257d8','GENERAL','OWNER_OPERATOR',1,'OK',200,'e49b34f0ba0469d291744bdb7ea87b37a69f9b94b76feb690e3f2ae1dc9c51df','2026-10-03T10:24:38.089Z','2026-10-10T10:24:38.089Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-195EC386','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-195EC386' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-46AC4436',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:40.021Z', hours_next_check_at='2027-04-01T10:24:40.021Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): It is a private listed residence; local official heritage guidance identifies street viewing as the public experience.' WHERE id='LA-46AC4436';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-46AC4436','official-web','https://historicengland.org.uk/listing/the-list/list-entry/1078943','Vanbrugh Castle','7e4487787fdba4a98c97f585b3123fb9940de5a4a5ddb61f0d0af5415e80d1e5','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'49f03eadd509873b06faf684aec5e59d79e82c77741a6b6b086a485c83e1caca','2026-10-03T10:24:40.021Z','2027-04-01T10:24:40.021Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-46AC4436','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-46AC4436' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BFB4236C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:40.657Z', hours_next_check_at='2027-01-01T10:24:40.657Z', quality_reviewed_at='2026-10-03T10:24:40.657Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BFB4236C';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-BFB4236C','official-web','https://www.royalparks.org.uk/visit/parks/greenwich-park/restoring-greenwich-parks-disappearing-17th-century-landscape','Greenwich Park','8fe9cc23945e78c64c082a104aa4792ed1f39c56ba0df141b85afd234bbe8d22','GENERAL','PUBLIC_AUTHORITY',1,'REDIRECTED',200,'c57038f06b9bc4ab5fb7a693eff00a7b0cb0e538062dd6a2993dfc91244a598b','2026-10-03T10:24:40.657Z','2027-01-01T10:24:40.657Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BFB4236C','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BFB4236C' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F7AA0663',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F7AA0663';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F7AA0663','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F7AA0663' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B48EAC0F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B48EAC0F';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B48EAC0F','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B48EAC0F' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D233EC24',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D233EC24';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D233EC24','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D233EC24' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2CB2ED1C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2CB2ED1C';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2CB2ED1C','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2CB2ED1C' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4F15DE84',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4F15DE84';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4F15DE84','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4F15DE84' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4F15DE84','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4F15DE84' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-3E4981B2',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-3E4981B2';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3E4981B2','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3E4981B2' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3E4981B2','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3E4981B2' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F4B7AD9A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F4B7AD9A';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F4B7AD9A','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F4B7AD9A' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-289CB273',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-289CB273';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-289CB273','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-289CB273' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D41325AD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:43.031Z', hours_next_check_at='2026-10-31T10:24:43.031Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): HMCTS publishes weekday public opening hours; public hearings may be observed subject to security and court restrictions.' WHERE id='LA-D41325AD';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-D41325AD','official-web','https://www.find-court-tribunal.service.gov.uk/courts/royal-courts-of-justice','Royal Courts of Justice','9c9549f57f71fc0ff2217dbdda86c8cc8dedbce992017784c566bfd18e686e0b','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'24ca54c59a74af36dff298cdb02ffe8e1cfc6fa29e73c4e290df1745832bca95','2026-10-03T10:24:43.031Z','2026-10-31T10:24:43.031Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D41325AD','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D41325AD' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-60671E10',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:43.273Z', hours_next_check_at='2027-01-01T10:24:43.273Z', quality_reviewed_at='2026-10-03T10:24:43.273Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-60671E10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-60671E10','official-web','https://codydock.org.uk/','Cody Dock','b33f3b5c5159361422c380f884d5066c145f0a4122a5e1290df434c8406bc21f','GENERAL','OWNER_OPERATOR',1,'OK',200,'b552029568abeaae5013e64fa0c60f2f61b40335ebb44691373e31d3227fb3ca','2026-10-03T10:24:43.273Z','2027-01-01T10:24:43.273Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-60671E10','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-60671E10' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6848ABD9',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6848ABD9';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6848ABD9','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6848ABD9' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-8F516FD6',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-8F516FD6';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8F516FD6','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8F516FD6' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-554EB24B',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-554EB24B';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-554EB24B','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-554EB24B' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6AB1C79F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6AB1C79F';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6AB1C79F','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6AB1C79F' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D4507260',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D4507260';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D4507260','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D4507260' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-59438F7C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-59438F7C';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-59438F7C','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-59438F7C' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C67DC12F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C67DC12F';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C67DC12F','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C67DC12F' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-1EA9255D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-1EA9255D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1EA9255D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1EA9255D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2DACE566',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2DACE566';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2DACE566','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2DACE566' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-860AE553',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-860AE553';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-860AE553','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-860AE553' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-3B8D5F62',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-3B8D5F62';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3B8D5F62','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3B8D5F62' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D86CD792',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D86CD792';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D86CD792','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D86CD792' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-8CDC8BE3',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-8CDC8BE3';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8CDC8BE3','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8CDC8BE3' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8CDC8BE3','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8CDC8BE3' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8CDC8BE3','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8CDC8BE3' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8CDC8BE3','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8CDC8BE3' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C1542295',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EVENT_ONLY', booking_mode='OPTIONAL', admission_type='MIXED', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:47.941Z', hours_next_check_at='2026-10-10T10:24:47.941Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): Public interior access is driven by advertised open days, exhibitions, tours and events rather than daily general admission.' WHERE id='LA-C1542295';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-C1542295','official-web','https://visionrcl.org.uk/venues/valentines-mansion-gardens/','Valentines Mansion & Gardens','dbfb8341ab5531986a91d7df72639d1cdbef0e4a0bc34248f2f5ca6359def26e','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'312835c70a23dcd75b5a421b31c17ae4aa25cf425e88e46fef1c29465fcde57b','2026-10-03T10:24:47.941Z','2026-10-10T10:24:47.941Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C1542295','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://visionrcl.org.uk/venues/valentines-mansion-gardens/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C1542295' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C1542295','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C1542295' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C1542295','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C1542295' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-248B4B8F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='MIXED', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:49.071Z', hours_next_check_at='2026-10-31T10:24:49.071Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): The official venue publishes general opening times; some attractions and tours have separate tickets.' WHERE id='LA-248B4B8F';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-248B4B8F','official-web','https://www.hallplace.org.uk/opening-times/','Hall Place & Gardens','1119987c7c685ceb9934afc45185be2cd76f742acbd61573276a784084794af2','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'988b69b3827b875f2f26349a44934864b55df2e4030ea5d7726f2ed8cf6f2fab','2026-10-03T10:24:49.071Z','2026-10-31T10:24:49.071Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-248B4B8F','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.hallplace.org.uk/opening-times/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-248B4B8F' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-248B4B8F','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-248B4B8F' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-248B4B8F','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-248B4B8F' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-AF078B4E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='SEASONAL', booking_mode='NONE', admission_type='MIXED', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:49.298Z', hours_next_check_at='2026-10-10T10:24:49.298Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Official page describes volunteer-dependent Sunday openings from after Easter to September, plus occasional out-of-season events.' WHERE id='LA-AF078B4E';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-AF078B4E','official-web','https://carshaltonwatertower.co.uk/visit.html','Carshalton Water Tower & Historic Garden Trust','093f750383090a7142b582206fbe543efe3c1cf76002d35143c238c2e05857ee','GENERAL','OWNER_OPERATOR',1,'OK',200,'43c35b82b2df03d09f95128dc785378314b054106d95cae12b8433b436875c7d','2026-10-03T10:24:49.298Z','2026-10-10T10:24:49.298Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AF078B4E','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AF078B4E' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-8944F43B',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:53.331Z', hours_next_check_at='2026-10-31T10:24:53.331Z', quality_reviewed_at='2026-10-03T10:24:53.331Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-8944F43B';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-8944F43B','official-web','https://www.westminster-abbey.org/','Westminster Abbey','2348cde71e7c704b5d33d557a061940fc400a4a38e95ba1d1b1fb04f26eea4dd','GENERAL','OWNER_OPERATOR',1,'OK',200,'0ecae225722a2e305fba1520c50489401a4f262118ce29ce8973132a8b858ae5','2026-10-03T10:24:53.331Z','2026-10-31T10:24:53.331Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8944F43B','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8944F43B' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8944F43B','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8944F43B' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8944F43B','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8944F43B' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F8A41048',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F8A41048';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F8A41048','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F8A41048' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-EFD89C75',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-EFD89C75';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EFD89C75','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EFD89C75' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-ED38ED01',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:55.552Z', hours_next_check_at='2027-01-01T10:24:55.552Z', quality_reviewed_at='2026-10-03T10:24:55.552Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-ED38ED01';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-ED38ED01','official-web','https://www.johnlewis.com/our-shops/oxford-street','John Lewis & Partners','0b40735755981310771a72a2bb5c2ded6a724953bae44e3ff14de80b04b78ea3','GENERAL','OWNER_OPERATOR',1,'OK',200,'0bd58d0cd52794d7dbfc6a272fcdb9a15ca70044d2bfb7412d228b85c5a8136a','2026-10-03T10:24:55.552Z','2027-01-01T10:24:55.552Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
DELETE FROM place_opening_periods WHERE place_id='LA-ED38ED01' AND experience_id IS NULL;
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-ED38ED01',1,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-ED38ED01' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:24:55.552Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-ED38ED01',2,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-ED38ED01' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:24:55.552Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-ED38ED01',3,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-ED38ED01' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:24:55.552Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-ED38ED01',4,1,'10:00','21:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-ED38ED01' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:24:55.552Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-ED38ED01',5,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-ED38ED01' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:24:55.552Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-ED38ED01',6,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-ED38ED01' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:24:55.552Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-ED38ED01',0,1,'11:30','18:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-ED38ED01' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:24:55.552Z');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B1EA46B0',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B1EA46B0';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B1EA46B0','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B1EA46B0' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B1EA46B0','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B1EA46B0' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-21132E83',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-21132E83';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-21132E83','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-21132E83' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-41FD7373',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-41FD7373';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-41FD7373','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-41FD7373' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-8EEA8BAB',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-8EEA8BAB';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8EEA8BAB','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8EEA8BAB' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8EEA8BAB','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8EEA8BAB' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-69BD4ABD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-69BD4ABD';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-69BD4ABD','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-69BD4ABD' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-1C199D84',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-1C199D84';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1C199D84','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1C199D84' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-63CEED61',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-63CEED61';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-63CEED61','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-63CEED61' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-63CEED61','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-63CEED61' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-FA9B2599',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:56.144Z', hours_next_check_at='2027-01-01T10:24:56.144Z', quality_reviewed_at='2026-10-03T10:24:56.144Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-FA9B2599';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-FA9B2599','official-web','https://www.cityoflondon.gov.uk/things-to-do/city-gardens/find-a-garden/finsbury-circus-gardens','Finsbury Circus Gardens','a9519f32f50fdd66e144cde2fa960e97831158d5efb584f8b312502a51dee674','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'08a12ca21f66052571a496526143de224d4e0836a2bba4fc15fe9906fb0979b8','2026-10-03T10:24:56.144Z','2027-01-01T10:24:56.144Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-FA9B2599','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-FA9B2599' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-8F68CB52',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:24:57.534Z', hours_next_check_at='2027-01-01T10:24:57.534Z', quality_reviewed_at='2026-10-03T10:24:57.534Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-8F68CB52';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-8F68CB52','official-web','https://www.chelseaphysicgarden.co.uk/','Chelsea Physic Garden','9d2f6d2caaa72b5a80feae90b750606d45a57c0b72ae8a8a4d744e37448d131e','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'929c5c1633ae12739dc35cb4333bedf9bd03a40d4cd8a8e194b7533af4e6b518','2026-10-03T10:24:57.534Z','2027-01-01T10:24:57.534Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8F68CB52','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.chelseaphysicgarden.co.uk/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8F68CB52' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8F68CB52','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8F68CB52' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D000E30A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D000E30A';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D000E30A','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D000E30A' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D000E30A','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D000E30A' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D4B3D748',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:24:59.397Z', hours_next_check_at='2026-10-10T10:24:59.397Z', quality_reviewed_at='2026-10-03T10:24:59.397Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D4B3D748';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-D4B3D748','official-web','https://www.royalparks.org.uk/visit/parks/greenwich-park/restoring-greenwich-parks-disappearing-17th-century-landscape','Greenwich Park','027eebf9d2b3c01efa23036cb14a5ed7043765b7037ce86952230921c0ead9ab','GENERAL','PUBLIC_AUTHORITY',1,'REDIRECTED',200,'c57038f06b9bc4ab5fb7a693eff00a7b0cb0e538062dd6a2993dfc91244a598b','2026-10-03T10:24:59.397Z','2026-10-10T10:24:59.397Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D4B3D748','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D4B3D748' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D4B3D748','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D4B3D748' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D4B3D748','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D4B3D748' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-95F6C6BC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:01.229Z', hours_next_check_at='2026-10-10T10:25:01.229Z', quality_reviewed_at='2026-10-03T10:25:01.229Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-95F6C6BC';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-95F6C6BC','official-web','https://www.spitalfieldscityfarm.org/','Spitalfields City Farm','6a804b7aeaecf3a1a4c7dd01312a6f975977b8719343bbe540eee6e1e033eb6c','GENERAL','OWNER_OPERATOR',1,'OK',200,'5aff4eab090040cbcf96a3993397643beaec8c1d713c61dbfe11c7d88f62b1e1','2026-10-03T10:25:01.229Z','2026-10-10T10:25:01.229Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-95F6C6BC','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-95F6C6BC' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-95F6C6BC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-95F6C6BC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-95F6C6BC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-95F6C6BC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-31DF40AC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-31DF40AC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-31DF40AC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-31DF40AC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-53E06A72',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-53E06A72';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-53E06A72','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-53E06A72' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-332DB965',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-332DB965';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-332DB965','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-332DB965' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-20118320',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-20118320';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-20118320','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-20118320' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-8B8BA322',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-8B8BA322';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8B8BA322','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8B8BA322' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-996A13CB',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-996A13CB';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-996A13CB','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-996A13CB' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F0AF8E72',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F0AF8E72';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F0AF8E72','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F0AF8E72' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B071B32E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B071B32E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B071B32E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B071B32E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6694182D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6694182D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6694182D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6694182D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2848996B',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2848996B';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2848996B','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2848996B' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-9509CD88',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-9509CD88';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9509CD88','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9509CD88' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BEA33CBD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BEA33CBD';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BEA33CBD','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BEA33CBD' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F2DDB0A4',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F2DDB0A4';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F2DDB0A4','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F2DDB0A4' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F2DDB0A4','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F2DDB0A4' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6D2D60F3',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6D2D60F3';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6D2D60F3','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6D2D60F3' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-3785D940',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-3785D940';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3785D940','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3785D940' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3785D940','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3785D940' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4F79FBAD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4F79FBAD';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4F79FBAD','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4F79FBAD' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4AD1813D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4AD1813D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4AD1813D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4AD1813D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-504317B5',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-504317B5';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-504317B5','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-504317B5' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-9D806E19',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-9D806E19';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9D806E19','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9D806E19' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-881D6645',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:25:02.504Z', hours_next_check_at='2027-04-01T10:25:02.504Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): The official hotel site confirms the reviewed identity. Because this planner record focuses on the building rather than hotel services, the conservative default is a free exterior architecture stop.' WHERE id='LA-881D6645';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-881D6645','official-web','https://montcalmcollection.com/montcalm-east/','Montcalm East','2db51d9a16362769d3e2a5feab7b6e9ef0f9e21fe95aea35368f8bcaa4bb9af0','GENERAL','OWNER_OPERATOR',1,'OK',200,'78cb963195532b07d543481622a6f959beb1671e85aea685f0903165280b0c77','2026-10-03T10:25:02.504Z','2027-04-01T10:25:02.504Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-CFF3C596',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:25:05.503Z', hours_next_check_at='2027-01-01T10:25:05.503Z', quality_reviewed_at='2026-10-03T10:25:05.503Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-CFF3C596';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-CFF3C596','official-web','https://www.wildlondon.org.uk/nature-reserves/sydenham-hill-wood-and-coxs-walk','Sydenham Hill Wood','a96e63c22e82f47a7542b2a4c8bfea30c8bf0d16f4ab8bd380e68b2c590ce266','GENERAL','OWNER_OPERATOR',1,'REDIRECTED',200,'fe52c558c53c1b820141c2766e25a816aa7d38359bf4a67e867f8f455796df07','2026-10-03T10:25:05.503Z','2027-01-01T10:25:05.503Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CFF3C596','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CFF3C596' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-264E515D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-264E515D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-264E515D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-264E515D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-264E515D','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-264E515D' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-264E515D','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-264E515D' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-264E515D','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-264E515D' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-FADAFD2D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-FADAFD2D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-FADAFD2D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-FADAFD2D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-FADAFD2D','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-FADAFD2D' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-FADAFD2D','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-FADAFD2D' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-FADAFD2D','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-FADAFD2D' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2C697A87',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2C697A87';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2C697A87','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2C697A87' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2C697A87','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2C697A87' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2C697A87','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2C697A87' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2C697A87','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2C697A87' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6CB91D54',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:06.610Z', hours_next_check_at='2026-10-10T10:25:06.610Z', quality_reviewed_at='2026-10-03T10:25:06.610Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6CB91D54';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-6CB91D54','official-web','https://www.fulhampalace.org/house-garden/the-garden/the-walled-garden/','Walled Garden','57c1694cd4d41b31478521038cce4d15ca63caf9883fb8b4d901150e49b91faa','GENERAL','OWNER_OPERATOR',1,'OK',200,'89e53448cbc0db8168a000c2cdb1b915835fb8fccace79d8f64f1f846b4ff4d9','2026-10-03T10:25:06.610Z','2026-10-10T10:25:06.610Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6CB91D54','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6CB91D54' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6CB91D54','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6CB91D54' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6CB91D54','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6CB91D54' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B353C9CE',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B353C9CE';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B353C9CE','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B353C9CE' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B353C9CE','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B353C9CE' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B353C9CE','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B353C9CE' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B353C9CE','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B353C9CE' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-5751FFE7',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-5751FFE7';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5751FFE7','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5751FFE7' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5751FFE7','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5751FFE7' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5751FFE7','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5751FFE7' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5751FFE7','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5751FFE7' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-3BEEFAFE',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:09.526Z', hours_next_check_at='2026-10-10T10:25:09.526Z', quality_reviewed_at='2026-10-03T10:25:09.526Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-3BEEFAFE';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-3BEEFAFE','official-web','https://www.culpeper.org.uk/','Culpeper Community Garden','24619b2722a9a2d74f0f6c81982520e2d539d67ff7255358f52154dd8dbb8ce7','GENERAL','OWNER_OPERATOR',1,'OK',200,'0966445d4d35e28cf4e6d678dce4c2b65c9222430e8d681042fa0dc719e90af0','2026-10-03T10:25:09.526Z','2026-10-10T10:25:09.526Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3BEEFAFE','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3BEEFAFE' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3BEEFAFE','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3BEEFAFE' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3BEEFAFE','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3BEEFAFE' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-23040098',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:11.462Z', hours_next_check_at='2026-10-10T10:25:11.462Z', quality_reviewed_at='2026-10-03T10:25:11.462Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-23040098';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-23040098','official-web','https://www.edennaturegarden.org/','Eden Nature Garden','21cbb7cf3e1ccde3fe64ccd5f1712771782b4b6360c030eec4c62c01d04a0f1b','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'40c219a1fc4bf623cff1cfbf8db5e03ffb2c7513644d59d1e9badbdb9e0a7b63','2026-10-03T10:25:11.462Z','2026-10-10T10:25:11.462Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-23040098','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.edennaturegarden.org/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-23040098' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-23040098','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-23040098' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-23040098','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-23040098' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-23040098','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-23040098' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-EC135A41',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-EC135A41';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EC135A41','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EC135A41' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EC135A41','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EC135A41' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EC135A41','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EC135A41' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B56E8457',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B56E8457';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B56E8457','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B56E8457' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B56E8457','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B56E8457' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B56E8457','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B56E8457' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B56E8457','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B56E8457' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4C8F3F6E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4C8F3F6E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4C8F3F6E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4C8F3F6E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4C8F3F6E','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4C8F3F6E' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4C8F3F6E','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4C8F3F6E' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4C8F3F6E','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4C8F3F6E' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-EC297907',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-EC297907';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EC297907','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EC297907' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EC297907','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EC297907' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EC297907','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EC297907' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EC297907','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EC297907' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-082F1CA1',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-082F1CA1';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-082F1CA1','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-082F1CA1' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-082F1CA1','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-082F1CA1' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-082F1CA1','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-082F1CA1' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-082F1CA1','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-082F1CA1' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B7803442',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B7803442';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B7803442','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B7803442' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B7803442','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B7803442' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B7803442','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B7803442' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B7803442','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B7803442' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C9DCC88E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C9DCC88E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C9DCC88E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C9DCC88E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C9DCC88E','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C9DCC88E' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C9DCC88E','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C9DCC88E' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C9DCC88E','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C9DCC88E' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-3F8175BF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-3F8175BF';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3F8175BF','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3F8175BF' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3F8175BF','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3F8175BF' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3F8175BF','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3F8175BF' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-ECB4623B',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-ECB4623B';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-ECB4623B','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-ECB4623B' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-ECB4623B','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-ECB4623B' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-ECB4623B','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-ECB4623B' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-ECB4623B','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-ECB4623B' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-AA9918B2',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-AA9918B2';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AA9918B2','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AA9918B2' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AA9918B2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AA9918B2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AA9918B2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AA9918B2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-9CB0DF99',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:15.104Z', hours_next_check_at='2026-10-10T10:25:15.104Z', quality_reviewed_at='2026-10-03T10:25:15.104Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-9CB0DF99';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-9CB0DF99','official-web','https://www.oldengarden.org/','Olden Community Garden','5021f582c4b5e0c565ba5a7a67f631ec6a9d090a5766290f5c791eb21b854252','GENERAL','OWNER_OPERATOR',1,'OK',200,'bba5c35b0ecb56323d83a7dcf32612e17a06601143924ceb0fd0baffe521c056','2026-10-03T10:25:15.104Z','2026-10-10T10:25:15.104Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9CB0DF99','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9CB0DF99' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9CB0DF99','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9CB0DF99' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9CB0DF99','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9CB0DF99' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A97449EC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A97449EC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A97449EC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A97449EC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A97449EC','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A97449EC' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A97449EC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A97449EC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A97449EC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A97449EC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C1E6F626',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C1E6F626';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C1E6F626','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C1E6F626' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C1E6F626','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C1E6F626' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C1E6F626','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C1E6F626' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C1E6F626','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C1E6F626' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B2225D90',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B2225D90';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B2225D90','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B2225D90' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B2225D90','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B2225D90' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B2225D90','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B2225D90' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B2225D90','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B2225D90' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-64139BFD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-64139BFD';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-64139BFD','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-64139BFD' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-64139BFD','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-64139BFD' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-054E8E36',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-054E8E36';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-054E8E36','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-054E8E36' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-054E8E36','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-054E8E36' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-054E8E36','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-054E8E36' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-054E8E36','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-054E8E36' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A1526D62',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A1526D62';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A1526D62','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A1526D62' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A1526D62','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A1526D62' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4B293650',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:15.738Z', hours_next_check_at='2026-10-10T10:25:15.738Z', quality_reviewed_at='2026-10-03T10:25:15.738Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4B293650';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-4B293650','official-web','https://www.globalgeneration.org.uk/story-garden','Story Garden','955cb886641f208c14a7fd03a93a76fa3e119611ee317ba614c31c1844484d78','GENERAL','OWNER_OPERATOR',1,'BROKEN',0,'','2026-10-03T10:25:15.738Z','2026-10-10T10:25:15.738Z','The operation was aborted due to timeout')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4B293650','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"https://www.globalgeneration.org.uk/story-garden","httpStatus":null,"error":"The operation was aborted due to timeout"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4B293650' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4B293650','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4B293650' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4B293650','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4B293650' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4B293650','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4B293650' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0E20B090',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0E20B090';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0E20B090','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0E20B090' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0E20B090','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0E20B090' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0E20B090','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0E20B090' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0E20B090','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0E20B090' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C32C69BD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C32C69BD';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C32C69BD','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C32C69BD' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C32C69BD','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C32C69BD' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C32C69BD','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C32C69BD' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-DCFED3D4',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:18.499Z', hours_next_check_at='2026-10-31T10:25:18.499Z', quality_reviewed_at='2026-10-03T10:25:18.499Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-DCFED3D4';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-DCFED3D4','official-web','https://sacredheartwimbledon.org.uk/','Sacred Heart Church','b7d1595dd472ec79c99350588e24ed20e0974302a50e69697d41c4ae593f30ec','GENERAL','OWNER_OPERATOR',1,'OK',200,'dcb41bb0c3d701438dc6ceb7483209969d982f06761197e31e8ce42168cb806b','2026-10-03T10:25:18.499Z','2026-10-31T10:25:18.499Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DCFED3D4','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DCFED3D4' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DCFED3D4','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DCFED3D4' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DCFED3D4','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DCFED3D4' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E2618500',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:20.056Z', hours_next_check_at='2026-10-31T10:25:20.056Z', quality_reviewed_at='2026-10-03T10:25:20.056Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E2618500';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-E2618500','official-web','https://www.stmarksregentspark.org.uk/','St Mark''s Church','c8dbb7e5668f45e740d7776c611ab2b88d180726758a89d08c772d4d74fd314c','GENERAL','OWNER_OPERATOR',1,'OK',200,'d4039fffbc06b1a2274427837ab816efb648371aaf533db2a4f1c949d2199ef6','2026-10-03T10:25:20.056Z','2026-10-31T10:25:20.056Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E2618500','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E2618500' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E2618500','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E2618500' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E2618500','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E2618500' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-DEE612D7',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-DEE612D7';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DEE612D7','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DEE612D7' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DEE612D7','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DEE612D7' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DEE612D7','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DEE612D7' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-37072E1C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:23.231Z', hours_next_check_at='2026-10-31T10:25:23.231Z', quality_reviewed_at='2026-10-03T10:25:23.231Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-37072E1C';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-37072E1C','official-web','https://www.grosvenorchapel.org.uk/','Grosvenor Chapel','1ea37c260adb0eae150054dadfb5e27e3bef1f89fb6008b6c7ade9ffc2a3c701','GENERAL','OWNER_OPERATOR',1,'OK',200,'76341e6de0b8a72dbfa0bb3f5a360f97d40f7d73cc7be982adaa0cdde4d99d85','2026-10-03T10:25:23.231Z','2026-10-31T10:25:23.231Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-37072E1C','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-37072E1C' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-37072E1C','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-37072E1C' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-37072E1C','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-37072E1C' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-AE7400BB',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-AE7400BB';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AE7400BB','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AE7400BB' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AE7400BB','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AE7400BB' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AE7400BB','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AE7400BB' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B1759423',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B1759423';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B1759423','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B1759423' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B1759423','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B1759423' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B1759423','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B1759423' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B977AF30',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B977AF30';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B977AF30','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B977AF30' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B977AF30','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B977AF30' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B977AF30','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B977AF30' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-8C8B86E8',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-8C8B86E8';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8C8B86E8','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8C8B86E8' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8C8B86E8','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8C8B86E8' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8C8B86E8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8C8B86E8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-67B94737',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-67B94737';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-67B94737','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-67B94737' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-67B94737','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-67B94737' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-67B94737','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-67B94737' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C6EF7487',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:24.440Z', hours_next_check_at='2026-10-31T10:25:24.440Z', quality_reviewed_at='2026-10-03T10:25:24.440Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C6EF7487';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-C6EF7487','official-web','https://asms.uk/','All Saints Church','c89a11c1e1c3b99ff7a2c60f81309fdf482365ad123c7276731f00bbe8ee0676','GENERAL','OWNER_OPERATOR',1,'OK',200,'210e5281041c6674f72a9356d40ae55785e17d0ec96b3c4cc2f75d36dbf9f16d','2026-10-03T10:25:24.440Z','2026-10-31T10:25:24.440Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C6EF7487','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C6EF7487' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C6EF7487','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C6EF7487' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C6EF7487','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C6EF7487' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-CC343EAD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-CC343EAD';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CC343EAD','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CC343EAD' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CC343EAD','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CC343EAD' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CC343EAD','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CC343EAD' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CC343EAD','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CC343EAD' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6DEC2529',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6DEC2529';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6DEC2529','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6DEC2529' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6DEC2529','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6DEC2529' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6DEC2529','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6DEC2529' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-153B9809',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-153B9809';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-153B9809','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-153B9809' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-153B9809','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-153B9809' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-153B9809','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-153B9809' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-9832DDAE',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-9832DDAE';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9832DDAE','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9832DDAE' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9832DDAE','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9832DDAE' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9832DDAE','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9832DDAE' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6685CCC2',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6685CCC2';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6685CCC2','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6685CCC2' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6685CCC2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6685CCC2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6685CCC2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6685CCC2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-870B1D53',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-870B1D53';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-870B1D53','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-870B1D53' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-870B1D53','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-870B1D53' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-870B1D53','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-870B1D53' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-1838C086',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:29.253Z', hours_next_check_at='2026-10-31T10:25:29.253Z', quality_reviewed_at='2026-10-03T10:25:29.253Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-1838C086';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-1838C086','official-web','https://museumstjohn.org.uk/planning-your-visit/','St John Priory Church','b34d9a0c3a64a751412687dafdee0fb8c5cac6eeea35d28a311678be70da0bd5','GENERAL','OWNER_OPERATOR',1,'OK',200,'bfbc56cc8488e3f3a7ee10fe5740e6c098674558c966df238dbe744a9bd2fb9e','2026-10-03T10:25:29.253Z','2026-10-31T10:25:29.253Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1838C086','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1838C086' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1838C086','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1838C086' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-953A2878',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-953A2878';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-953A2878','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-953A2878' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-953A2878','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-953A2878' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-953A2878','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-953A2878' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-29D7ED48',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-29D7ED48';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-29D7ED48','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-29D7ED48' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-29D7ED48','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-29D7ED48' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-29D7ED48','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-29D7ED48' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-9133AB10',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:29.530Z', hours_next_check_at='2026-10-31T10:25:29.530Z', quality_reviewed_at='2026-10-03T10:25:29.530Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-9133AB10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-9133AB10','official-web','https://cathedral.southwark.anglican.org/','Southwark Cathedral','ab50b245031c61c780ef6e74ff52016866d4880f4339d464f43506a89f69cbd6','GENERAL','OWNER_OPERATOR',1,'OK',200,'fafc8dd0f03ca9be39e6c3929d06c22caacd8eb8a9c842f56b81fd940dbd0a40','2026-10-03T10:25:29.530Z','2026-10-31T10:25:29.530Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9133AB10','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9133AB10' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9133AB10','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9133AB10' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9133AB10','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9133AB10' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C84EF582',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:30.738Z', hours_next_check_at='2026-10-31T10:25:30.738Z', quality_reviewed_at='2026-10-03T10:25:30.738Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C84EF582';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-C84EF582','official-web','https://corpuschristimaidenlane.org.uk/','Corpus Christi Catholic Church','63e8bcc1f819d007c061bbe673067c00ea3f693c1cc74e2643968d8307bedc08','GENERAL','OWNER_OPERATOR',1,'OK',200,'8a95b013e58e45603616bbfbe7f0421053161763410a6081c4b6594d4a774455','2026-10-03T10:25:30.738Z','2026-10-31T10:25:30.738Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C84EF582','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C84EF582' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C84EF582','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C84EF582' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-020AE92F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:33.547Z', hours_next_check_at='2026-10-31T10:25:33.547Z', quality_reviewed_at='2026-10-03T10:25:33.547Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-020AE92F';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-020AE92F','official-web','https://stpaulsknightsbridge.org/','St Paul''s Knightsbridge','183c3960e558eb856b94b4e75418355e4585182a7f2b2beacb8827fb96bb819a','GENERAL','OWNER_OPERATOR',1,'OK',200,'b7292dd5e897d15693ccb2f6826ba20672ad14b0b127db46f145b2f0bffa0628','2026-10-03T10:25:33.547Z','2026-10-31T10:25:33.547Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-020AE92F','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-020AE92F' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-020AE92F','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-020AE92F' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B4270280',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B4270280';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B4270280','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B4270280' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B4270280','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B4270280' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B4270280','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B4270280' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-88A8D5DC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-88A8D5DC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-88A8D5DC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-88A8D5DC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-88A8D5DC','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-88A8D5DC' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-88A8D5DC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-88A8D5DC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-88A8D5DC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-88A8D5DC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B25923E0',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B25923E0';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B25923E0','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B25923E0' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B25923E0','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B25923E0' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B25923E0','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B25923E0' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4E5C28DD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:34.117Z', hours_next_check_at='2026-10-31T10:25:34.117Z', quality_reviewed_at='2026-10-03T10:25:34.117Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4E5C28DD';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-4E5C28DD','official-web','https://www.smaw8.org/','St Mary Abbots Church','2f294e0c3448685a98adfee5ac069a08585f6d9386f476ddc23d6b227d8434e7','GENERAL','OWNER_OPERATOR',1,'OK',200,'3391e2c582b39fe085be65eb96c59c6e1cb50df955ae813aef43f9aa43bf9077','2026-10-03T10:25:34.117Z','2026-10-31T10:25:34.117Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4E5C28DD','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4E5C28DD' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4E5C28DD','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4E5C28DD' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4B260399',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4B260399';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4B260399','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4B260399' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4B260399','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4B260399' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4B260399','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4B260399' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D038802D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D038802D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D038802D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D038802D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D038802D','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D038802D' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D038802D','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D038802D' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D038802D','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D038802D' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BC0453DA',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BC0453DA';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BC0453DA','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BC0453DA' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BC0453DA','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BC0453DA' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BC0453DA','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BC0453DA' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-7A5189CE',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:40.138Z', hours_next_check_at='2026-10-31T10:25:40.138Z', quality_reviewed_at='2026-10-03T10:25:40.138Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-7A5189CE';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-7A5189CE','official-web','https://stmarylebone.org/__sentry/balanced/','St Marylebone Parish Church','a13b5b27d10e9dd690b7354fa7f91646eb5aa920060119e68a169c9c292a2839','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'0d9634f33376555bf9b5edc237211b5b2aa95d2f98cf5466350059b00a9d367e','2026-10-03T10:25:40.138Z','2026-10-31T10:25:40.138Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7A5189CE','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://stmarylebone.org/__sentry/balanced/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7A5189CE' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7A5189CE','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7A5189CE' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7A5189CE','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7A5189CE' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4F33B327',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4F33B327';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4F33B327','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4F33B327' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4F33B327','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4F33B327' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4F33B327','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4F33B327' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B86D3E65',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B86D3E65';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B86D3E65','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B86D3E65' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B86D3E65','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B86D3E65' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B86D3E65','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B86D3E65' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E08F15AC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E08F15AC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E08F15AC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E08F15AC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E08F15AC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E08F15AC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E08F15AC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E08F15AC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A00E4399',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A00E4399';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A00E4399','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A00E4399' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A00E4399','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A00E4399' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A00E4399','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A00E4399' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D7222CD8',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D7222CD8';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D7222CD8','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D7222CD8' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D7222CD8','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D7222CD8' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D7222CD8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D7222CD8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-DA69C08B',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-DA69C08B';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DA69C08B','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DA69C08B' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DA69C08B','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DA69C08B' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DA69C08B','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DA69C08B' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DA69C08B','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DA69C08B' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F55EE81F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:40.605Z', hours_next_check_at='2026-10-31T10:25:40.605Z', quality_reviewed_at='2026-10-03T10:25:40.605Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F55EE81F';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-F55EE81F','official-web','https://www.stannes-soho.org.uk/','St Anne''s Church','35466a102226872a539b3b7b8226ddd151434ccceb6c1ac64da093b380182d6d','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'bb572d0cdb062050a34ba08bb6b9c26989700cf8d526d5c61dfd30b86853a530','2026-10-03T10:25:40.605Z','2026-10-31T10:25:40.605Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F55EE81F','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.stannes-soho.org.uk/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F55EE81F' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F55EE81F','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F55EE81F' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F55EE81F','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F55EE81F' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F55EE81F','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F55EE81F' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-03752923',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:42.589Z', hours_next_check_at='2026-10-31T10:25:42.589Z', quality_reviewed_at='2026-10-03T10:25:42.589Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-03752923';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-03752923','official-web','https://www.staugustine.london/','St Augustine’s Church','43c88011d6c083bbd2200b54e3cdf3032d2193a7b0d633f033b418eadf0ae441','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'0836f2bd72fad93764dd935a48f60b3b45fff22c40d2e9d1c1d45a1b3378e3ec','2026-10-03T10:25:42.589Z','2026-10-31T10:25:42.589Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-03752923','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.staugustine.london/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-03752923' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-03752923','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-03752923' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-03752923','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-03752923' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A66C50FA',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A66C50FA';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A66C50FA','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A66C50FA' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A66C50FA','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A66C50FA' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A66C50FA','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A66C50FA' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-83548C54',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-83548C54';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-83548C54','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-83548C54' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-83548C54','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-83548C54' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-83548C54','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-83548C54' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F5A195D0',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:46.760Z', hours_next_check_at='2026-10-31T10:25:46.760Z', quality_reviewed_at='2026-10-03T10:25:46.760Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F5A195D0';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-F5A195D0','official-web','https://www.stmarylebow.org.uk/','St Mary-le-Bow Church','e0e8d1078dffa6ccc6c81eb9fb42067341f45a2b27df8601a328fbf996de7239','GENERAL','OWNER_OPERATOR',1,'REDIRECTED',200,'67809da5b5dc7a9f150eb95466abdc372c4ac24f3440d21355ede10e56f8c234','2026-10-03T10:25:46.760Z','2026-10-31T10:25:46.760Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F5A195D0','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F5A195D0' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F5A195D0','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F5A195D0' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-44104C28',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-44104C28';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-44104C28','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-44104C28' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-44104C28','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-44104C28' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-44104C28','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-44104C28' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-705DDA4B',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:49.983Z', hours_next_check_at='2026-10-31T10:25:49.983Z', quality_reviewed_at='2026-10-03T10:25:49.983Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-705DDA4B';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-705DDA4B','official-web','https://www.stmaryabchurch.org.uk/','St Mary Abchurch','b8d0cb2ea9fce1ce35018f1cdb3a01d8ad9c2d73f0cc4277fd46452f595dea75','GENERAL','OWNER_OPERATOR',1,'OK',200,'fb3344f4e1cdaae38be088fd63e98ce7a5cb9a7c20c98e496623f7d905b0ac81','2026-10-03T10:25:49.983Z','2026-10-31T10:25:49.983Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-705DDA4B','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-705DDA4B' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-705DDA4B','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-705DDA4B' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-705DDA4B','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-705DDA4B' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C6F171EC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C6F171EC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C6F171EC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C6F171EC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C6F171EC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C6F171EC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C6F171EC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C6F171EC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-65589691',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:50.384Z', hours_next_check_at='2026-10-31T10:25:50.384Z', quality_reviewed_at='2026-10-03T10:25:50.384Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-65589691';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-65589691','official-web','https://www.stgeorgesbloomsbury.org.uk/','St George''s Church','0fa9c2afe1936ab759ed88b6e01b297c577fced41ce20ebb638ec110e00d699b','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'fea20930ce787bcd30e53c4e2f8d368c627f4b8eeb4ed3f133840613c66e2b54','2026-10-03T10:25:50.384Z','2026-10-31T10:25:50.384Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-65589691','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.stgeorgesbloomsbury.org.uk/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-65589691' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-65589691','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-65589691' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-65589691','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-65589691' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-65589691','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-65589691' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E489C56F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E489C56F';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E489C56F','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E489C56F' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E489C56F','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E489C56F' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2DDB57F9',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2DDB57F9';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2DDB57F9','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2DDB57F9' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2DDB57F9','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2DDB57F9' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A2CC937F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:55.785Z', hours_next_check_at='2026-10-10T10:25:55.785Z', quality_reviewed_at='2026-10-03T10:25:55.785Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A2CC937F';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-A2CC937F','official-web','https://www.better.org.uk/leisure-centre/london/hackney/london-fields-lido','London Fields Lido','b96f280abac0fcb37cbc0e411853818c9155a6b626bdd7f40d796d06f5590801','GENERAL','OWNER_OPERATOR',1,'OK',200,'ae5c127265e18128e0a709fe24715e76aea44cfb7cd51643bd2510185f41358a','2026-10-03T10:25:55.785Z','2026-10-10T10:25:55.785Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A2CC937F','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A2CC937F' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A2CC937F','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A2CC937F' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F6B8C534',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:25:56.048Z', hours_next_check_at='2026-10-10T10:25:56.048Z', quality_reviewed_at='2026-10-03T10:25:56.048Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F6B8C534';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-F6B8C534','official-web','https://www.wildlondon.org.uk/nature-reserves/woodberry-wetlands','Woodberry Wetlands','6ba24a41c06173ede3c34b489cf0b0c12ba1a89617f697d85c958f81d7d15a33','GENERAL','OWNER_OPERATOR',1,'OK',200,'8d5e15e39e5b85a0bb5a6c858f34b653b003b78140b2de4ecdf1df75327453aa','2026-10-03T10:25:56.048Z','2026-10-10T10:25:56.048Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F6B8C534','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F6B8C534' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F6B8C534','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F6B8C534' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F6B8C534','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F6B8C534' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-AE9250DE',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:00.335Z', hours_next_check_at='2026-10-10T10:26:00.335Z', quality_reviewed_at='2026-10-03T10:26:00.335Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-AE9250DE';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-AE9250DE','official-web','https://www.wildlondon.org.uk/nature-reserves/gunnersbury-triangle','Gunnersbury Triangle Nature Reserve','b1a8f27a59d894f23d23fdcecbc8bf47800482803359cbbe744238416d62d4d1','GENERAL','OWNER_OPERATOR',1,'OK',200,'c2e7f0de5a5becd3c51b0c4703c5b74d506ef8f9292f240a3b89fe598b6f0772','2026-10-03T10:26:00.335Z','2026-10-10T10:26:00.335Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AE9250DE','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AE9250DE' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AE9250DE','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AE9250DE' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F276F7BA',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F276F7BA';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F276F7BA','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F276F7BA' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F276F7BA','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F276F7BA' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F276F7BA','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F276F7BA' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F276F7BA','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F276F7BA' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-584B96F2',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-584B96F2';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-584B96F2','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-584B96F2' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-584B96F2','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-584B96F2' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-584B96F2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-584B96F2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-584B96F2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-584B96F2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0D6B91CF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:00.810Z', hours_next_check_at='2026-10-31T10:26:00.810Z', quality_reviewed_at='2026-10-03T10:26:00.810Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0D6B91CF';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-0D6B91CF','official-web','https://fothcp.org/','Tower Hamlets Cemetery Park','9348d7edf2dc4093832934565b606d0d821f8ad189d238f95ae442a814f25d1a','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'75cea3712cd99987d85107001e46be71889d1aa5e7d549d2f4ff026a61891de4','2026-10-03T10:26:00.810Z','2026-10-31T10:26:00.810Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0D6B91CF','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://fothcp.org/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0D6B91CF' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0D6B91CF','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0D6B91CF' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0D6B91CF','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0D6B91CF' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-CB5ABCE5',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-CB5ABCE5';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CB5ABCE5','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CB5ABCE5' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CB5ABCE5','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CB5ABCE5' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CB5ABCE5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CB5ABCE5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-048C9EA9',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-048C9EA9';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-048C9EA9','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-048C9EA9' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-048C9EA9','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-048C9EA9' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-048C9EA9','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-048C9EA9' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-3C975BDC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-3C975BDC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3C975BDC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3C975BDC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3C975BDC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3C975BDC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3C975BDC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3C975BDC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-7561A581',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='HIGH', planner_ready=1, access_type_v2='SEASONAL', booking_mode='NONE', admission_type='PAID', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED', hours_last_checked_at='2026-10-03T10:26:01.805Z', hours_next_check_at='2026-10-10T10:26:01.805Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Official page publishes limited weekly openings and a November-February closure; pre-booking is no longer used for standard visits.' WHERE id='LA-7561A581';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-7561A581','official-web','https://www.nationaltrust.org.uk/visit/london/fenton-house-and-garden','National Trust - Fenton House and Garden','e92228581817032255c56000a8b6aa4799b481b3e701de45e745f4340ab3b17b','GENERAL','OWNER_OPERATOR',1,'OK',200,'dcf1c5b7b85b534d7096624172323096ed2feeb8b74f3c4213f77d950640fe87','2026-10-03T10:26:01.805Z','2026-10-10T10:26:01.805Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
DELETE FROM place_opening_periods WHERE place_id='LA-7561A581' AND experience_id IS NULL;
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-7561A581',5,1,'11:00','16:00','2026-09-25','2026-11-01',
          (SELECT source_id FROM place_sources WHERE place_id='LA-7561A581' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:26:01.805Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-7561A581',0,1,'11:00','16:00','2026-09-25','2026-11-01',
          (SELECT source_id FROM place_sources WHERE place_id='LA-7561A581' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:26:01.805Z');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A8CCC3AB',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='PRIVATE_NO_PUBLIC_ACCESS', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:26:03.238Z', hours_next_check_at='2027-04-01T10:26:03.238Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): The chapel is an active part of the private school; no regular general-public visitor access is published.' WHERE id='LA-A8CCC3AB';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-A8CCC3AB','official-web','https://www.harrowschool.org.uk/boarding/pastoral-care/chaplaincy','Harrow School Chapel','b0573a36609665e949a3082ce5b48fff1840bb765de2174faa150ff45ffe6192','GENERAL','OWNER_OPERATOR',1,'OK',200,'3adee0522f30a66796898225f7b79d813b2dcd43e8fbbc8ce7ae601b51f3d37e','2026-10-03T10:26:03.238Z','2027-04-01T10:26:03.238Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-3BA68FDC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-3BA68FDC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3BA68FDC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3BA68FDC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3BA68FDC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3BA68FDC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3BA68FDC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3BA68FDC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-505641E6',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-505641E6';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-505641E6','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-505641E6' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-505641E6','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-505641E6' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-505641E6','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-505641E6' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-026EFE71',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:05.361Z', hours_next_check_at='2026-10-31T10:26:05.361Z', quality_reviewed_at='2026-10-03T10:26:05.361Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-026EFE71';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-026EFE71','official-web','http://marblehillaccountants.co.uk/','Marble Hill','e59e5ce56c120cdac6fe5ee5bc78db9375f904c1be9fa6f11fda575850234ba4','GENERAL','OWNER_OPERATOR',1,'OK',200,'79dc2a892e89bd48508e30f82d41776afda3fc99b747b5f492aa6bc62c3dce80','2026-10-03T10:26:05.361Z','2026-10-31T10:26:05.361Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-026EFE71','SOURCE_CONFLICT','HIGH','The source appears to describe a different organisation or place and needs human review.','{"url":"http://marblehillaccountants.co.uk/","title":"Marble Hill Chartered Certified Accountants | St Margarets"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-026EFE71' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-026EFE71','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-026EFE71' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-026EFE71','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-026EFE71' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-026EFE71','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-026EFE71' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-176B80D9',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:06.921Z', hours_next_check_at='2026-10-31T10:26:06.921Z', quality_reviewed_at='2026-10-03T10:26:06.921Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-176B80D9';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-176B80D9','official-web','https://www.templechurch.com/','Temple Church','85d89d710adf78b30cb40b4a98cdf251401b6ba521ea1e54ded4c15fb68f5b2f','GENERAL','OWNER_OPERATOR',1,'OK',200,'6dcefd701f4761d0a67e76dae591f39adb0444b36f67df9cc1330f46a2f6502c','2026-10-03T10:26:06.921Z','2026-10-31T10:26:06.921Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-176B80D9','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-176B80D9' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-176B80D9','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-176B80D9' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-176B80D9','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-176B80D9' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E4BE50C8',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E4BE50C8';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E4BE50C8','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E4BE50C8' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E4BE50C8','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E4BE50C8' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E4BE50C8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E4BE50C8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-188FAC2E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:07.130Z', hours_next_check_at='2026-10-31T10:26:07.130Z', quality_reviewed_at='2026-10-03T10:26:07.130Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-188FAC2E';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-188FAC2E','official-web','https://stmarylestrand.com/','St Mary Le Strand Church','934e51cbcff1238670eebf9e32744bfe24fff815c89071966a8daf59bc499828','GENERAL','OWNER_OPERATOR',1,'OK',200,'b3319e4d492d16ec09132c6f5f7e6b543d6359b1c2af9661f14ac5760381ca8f','2026-10-03T10:26:07.130Z','2026-10-31T10:26:07.130Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-188FAC2E','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-188FAC2E' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-188FAC2E','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-188FAC2E' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BA6DAA66',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BA6DAA66';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BA6DAA66','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BA6DAA66' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BA6DAA66','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BA6DAA66' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BA6DAA66','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BA6DAA66' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-DB5645D3',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-DB5645D3';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DB5645D3','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DB5645D3' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DB5645D3','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DB5645D3' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DB5645D3','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DB5645D3' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2645EF9B',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:10.497Z', hours_next_check_at='2026-10-31T10:26:10.497Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): The estate operates as a public museum and park with published venue hours; the exact page should be rechecked during the next source refresh.' WHERE id='LA-2645EF9B';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-2645EF9B','official-web','https://www.fortyhallestate.co.uk/','Forty Hall Estate','59214c69059b364b69c9e4a810f247d1ef8b8398d5b6c2bdfdc9a93e73774fd7','GENERAL','OWNER_OPERATOR',1,'OK',200,'6cef72f13af0e3840400baee9edf6052c921338ce858a8c54d83a90797c289d6','2026-10-03T10:26:10.497Z','2026-10-31T10:26:10.497Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2645EF9B','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2645EF9B' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2645EF9B','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2645EF9B' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6402E31F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6402E31F';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6402E31F','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6402E31F' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6402E31F','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6402E31F' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6402E31F','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6402E31F' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6402E31F','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6402E31F' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-61180A5D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:15.738Z', hours_next_check_at='2026-10-31T10:26:15.738Z', quality_reviewed_at='2026-10-03T10:26:15.738Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-61180A5D';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-61180A5D','official-web','https://www.primrosehillfoodmarket.co.uk/','Primrose Hill Food Market','048a28fb3f17d30accd232ab53cbf5b3b4860bc6519ea237a2a06dd234742212','GENERAL','OWNER_OPERATOR',1,'OK',200,'a7dfcb818f85d77f84cec4b75c94b1737b99449b41187bb1e07e9bde5cb71459','2026-10-03T10:26:15.738Z','2026-10-31T10:26:15.738Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-61180A5D','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-61180A5D' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-61180A5D','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-61180A5D' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E5480647',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:17.047Z', hours_next_check_at='2026-10-31T10:26:17.047Z', quality_reviewed_at='2026-10-03T10:26:17.047Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E5480647';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-E5480647','official-web','https://camdenmarket.com/','Camden Market','b0182120edec423b7609999adc5ab258c6428c4cd034bfe05e80cafba77376c4','GENERAL','OWNER_OPERATOR',1,'OK',200,'599356d6a3306e11b4523b88dd36b1b32b8235ee16e8cca8cf21dc3d0183d689','2026-10-03T10:26:17.047Z','2026-10-31T10:26:17.047Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E5480647','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E5480647' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E5480647','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E5480647' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E5480647','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E5480647' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0C287E77',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:18.230Z', hours_next_check_at='2026-10-31T10:26:18.230Z', quality_reviewed_at='2026-10-03T10:26:18.230Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0C287E77';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-0C287E77','official-web','https://boroughmarket.org.uk/','Borough Market','5db8f99930bbec7bd6d8eb4435ebf4945bb8fbd08edfe5534f1e9f45db856d89','GENERAL','OWNER_OPERATOR',1,'OK',200,'377a8bae4fcbe5c37989ed4c945da43f9199ee9a9c4917527bad8375d3e157d3','2026-10-03T10:26:18.230Z','2026-10-31T10:26:18.230Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0C287E77','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0C287E77' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0C287E77','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0C287E77' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0C287E77','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0C287E77' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-12DFBA93',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:20.367Z', hours_next_check_at='2026-10-31T10:26:20.367Z', quality_reviewed_at='2026-10-03T10:26:20.367Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-12DFBA93';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-12DFBA93','official-web','http://www.maltby.st/','Maltby Street Market','f0a34acdd1dba880a7b97b5006018945ef1d1779eaea6e18ab44992fb81bfa28','GENERAL','OWNER_OPERATOR',1,'BROKEN',0,'','2026-10-03T10:26:20.367Z','2026-10-31T10:26:20.367Z','The operation was aborted due to timeout')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-12DFBA93','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"http://www.maltby.st/","httpStatus":null,"error":"The operation was aborted due to timeout"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-12DFBA93' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-12DFBA93','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-12DFBA93' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-12DFBA93','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-12DFBA93' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-12DFBA93','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-12DFBA93' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-CE3D5929',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:22.468Z', hours_next_check_at='2026-10-31T10:26:22.468Z', quality_reviewed_at='2026-10-03T10:26:22.468Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-CE3D5929';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-CE3D5929','official-web','https://smithfieldmarket.com/','Smithfield Market','96d161fe827efaa0a77aaa2a55204528e221217b8743625db88e4e309549a375','GENERAL','OWNER_OPERATOR',1,'OK',200,'a293674da13dd5d41eb1bf175ce556b558d03552bddfe1af74e2115764bbff22','2026-10-03T10:26:22.468Z','2026-10-31T10:26:22.468Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CE3D5929','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CE3D5929' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CE3D5929','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CE3D5929' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CE3D5929','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CE3D5929' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BFEEF6E1',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BFEEF6E1';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BFEEF6E1','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BFEEF6E1' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BFEEF6E1','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BFEEF6E1' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BFEEF6E1','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BFEEF6E1' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BFEEF6E1','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BFEEF6E1' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E1411FDC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E1411FDC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E1411FDC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E1411FDC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E1411FDC','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E1411FDC' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E1411FDC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E1411FDC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E1411FDC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E1411FDC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-302EC634',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='VERIFIED', hours_last_checked_at='2026-10-03T10:26:30.506Z', hours_next_check_at='2026-10-31T10:26:30.506Z', quality_reviewed_at='2026-10-03T10:26:30.506Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-302EC634';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-302EC634','official-web','https://eatworkart.com/netil-market','Netil Market','6d06921440920bfc7a9af175c78bbaddf43a9a7719341f232630f1ac1b490766','GENERAL','OWNER_OPERATOR',1,'OK',200,'7c5088139bc470e16e9d6a23a0f301f8facb1929b9c7e794c087625aa070fb37','2026-10-03T10:26:30.506Z','2026-10-31T10:26:30.506Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
DELETE FROM place_opening_periods WHERE place_id='LA-302EC634' AND experience_id IS NULL;
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-302EC634',1,1,'09:00','18:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:26:30.506Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-302EC634',2,1,'09:00','18:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:26:30.506Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-302EC634',0,1,'09:00','18:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:26:30.506Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-302EC634',3,1,'09:00','22:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:26:30.506Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-302EC634',4,1,'09:00','22:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:26:30.506Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-302EC634',5,1,'09:00','22:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:26:30.506Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('LA-302EC634',6,1,'09:00','22:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='LA-302EC634' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:26:30.506Z');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-302EC634','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-302EC634' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-302EC634','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-302EC634' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D13F4A91',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:33.813Z', hours_next_check_at='2026-10-31T10:26:33.813Z', quality_reviewed_at='2026-10-03T10:26:33.813Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D13F4A91';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-D13F4A91','official-web','https://www.greenwichmarket.london/','Greenwich Market','79f3e9f0e0f7e2460ea65c1f366d3661b766216c2d5a068393be1f330ff0ed77','GENERAL','OWNER_OPERATOR',1,'BROKEN',0,'','2026-10-03T10:26:33.813Z','2026-10-31T10:26:33.813Z','The operation was aborted due to timeout')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D13F4A91','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"https://www.greenwichmarket.london/","httpStatus":null,"error":"The operation was aborted due to timeout"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D13F4A91' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D13F4A91','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D13F4A91' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D13F4A91','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D13F4A91' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D13F4A91','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D13F4A91' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E36CA94C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:35.368Z', hours_next_check_at='2026-10-31T10:26:35.368Z', quality_reviewed_at='2026-10-03T10:26:35.368Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E36CA94C';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-E36CA94C','official-web','https://broadwaymarket.co.uk/','Broadway Market','111816e1b01bf9c94bde55ed2c749bee210090faec4d5a7801f916a12baa55a4','GENERAL','OWNER_OPERATOR',1,'OK',200,'d735396f55fe4822289258234cbe7cac7930243b9852b7ab97c76e128e190076','2026-10-03T10:26:35.368Z','2026-10-31T10:26:35.368Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E36CA94C','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E36CA94C' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E36CA94C','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E36CA94C' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E36CA94C','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E36CA94C' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-5D7BD6DF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-5D7BD6DF';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5D7BD6DF','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5D7BD6DF' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5D7BD6DF','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5D7BD6DF' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5D7BD6DF','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5D7BD6DF' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5D7BD6DF','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5D7BD6DF' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-29E23D38',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-29E23D38';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-29E23D38','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-29E23D38' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-29E23D38','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-29E23D38' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-29E23D38','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-29E23D38' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-29E23D38','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-29E23D38' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4E68E539',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4E68E539';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4E68E539','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4E68E539' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4E68E539','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4E68E539' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4E68E539','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4E68E539' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4E68E539','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4E68E539' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-1BAA225C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-1BAA225C';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1BAA225C','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1BAA225C' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1BAA225C','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1BAA225C' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1BAA225C','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1BAA225C' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-CE3A1E89',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-CE3A1E89';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CE3A1E89','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CE3A1E89' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CE3A1E89','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CE3A1E89' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CE3A1E89','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CE3A1E89' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CE3A1E89','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CE3A1E89' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-5E16B6E0',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-5E16B6E0';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5E16B6E0','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5E16B6E0' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5E16B6E0','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5E16B6E0' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5E16B6E0','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5E16B6E0' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-702BB1E7',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:36.433Z', hours_next_check_at='2026-10-31T10:26:36.433Z', quality_reviewed_at='2026-10-03T10:26:36.433Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-702BB1E7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-702BB1E7','official-web','https://marestreetmarket.com/','Mare Street Market','6b6f2a96a59e0800b7b78b7e9da78c4daa4eceb828375ce2b8571ef1a3a6c821','GENERAL','OWNER_OPERATOR',1,'OK',200,'462d15b35357e9c2ca92dccb0590f4a20d9f1c591ff8724e9c7b2767cc9f1023','2026-10-03T10:26:36.433Z','2026-10-31T10:26:36.433Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-702BB1E7','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-702BB1E7' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-702BB1E7','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-702BB1E7' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-702BB1E7','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-702BB1E7' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-31A9713E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-31A9713E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-31A9713E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-31A9713E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-31A9713E','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-31A9713E' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-31A9713E','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-31A9713E' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A87A566F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A87A566F';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A87A566F','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A87A566F' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A87A566F','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A87A566F' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A87A566F','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A87A566F' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A87A566F','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A87A566F' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-11E644FF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-11E644FF';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-11E644FF','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-11E644FF' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-11E644FF','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-11E644FF' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-11E644FF','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-11E644FF' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-11E644FF','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-11E644FF' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B861F604',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B861F604';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B861F604','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B861F604' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B861F604','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B861F604' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B861F604','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B861F604' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B861F604','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B861F604' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-190FA290',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:41.508Z', hours_next_check_at='2026-10-10T10:26:41.508Z', quality_reviewed_at='2026-10-03T10:26:41.508Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-190FA290';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-190FA290','official-web','https://www.westminster.gov.uk/parks-and-open-spaces/soho-square-gardens','Soho Square Gardens','15672abe35a6c916854c051e47ae760bb48b519af102d744d0e777ba2382ce33','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'e79559cfbcfe5110aab8eeec69361f48bf71163e85411665a6c66b61fd9e7825','2026-10-03T10:26:41.508Z','2026-10-10T10:26:41.508Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-190FA290','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-190FA290' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-190FA290','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-190FA290' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-190FA290','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-190FA290' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-554993F6',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-554993F6';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-554993F6','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-554993F6' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-554993F6','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-554993F6' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-554993F6','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-554993F6' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-69D2786D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-69D2786D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-69D2786D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-69D2786D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-DB3045E3',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-DB3045E3';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DB3045E3','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DB3045E3' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DB3045E3','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DB3045E3' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DB3045E3','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DB3045E3' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DB3045E3','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DB3045E3' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-3FE43EF7',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-3FE43EF7';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3FE43EF7','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3FE43EF7' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3FE43EF7','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3FE43EF7' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3FE43EF7','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3FE43EF7' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-3FE43EF7','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-3FE43EF7' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-01643C93',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-01643C93';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-01643C93','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-01643C93' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-01643C93','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-01643C93' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-01643C93','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-01643C93' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-01643C93','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-01643C93' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C824CF2D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C824CF2D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C824CF2D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C824CF2D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C824CF2D','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C824CF2D' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C824CF2D','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C824CF2D' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C824CF2D','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C824CF2D' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C2BD9C30',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C2BD9C30';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C2BD9C30','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C2BD9C30' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-23D377C0',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-23D377C0';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-23D377C0','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-23D377C0' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2B0C2BDE',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2B0C2BDE';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2B0C2BDE','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2B0C2BDE' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2B0C2BDE','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2B0C2BDE' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2B0C2BDE','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2B0C2BDE' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C40F0905',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:41.563Z', hours_next_check_at='2026-10-10T10:26:41.563Z', quality_reviewed_at='2026-10-03T10:26:41.563Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C40F0905';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-C40F0905','official-web','http://www.bost.org.uk/open-places/red-cross-garden/','Red Cross Garden','82ced04e5918fc3f0c3a10c03fb3fde2874f738175b96311cf1f8e36854648ad','GENERAL','OWNER_OPERATOR',1,'BROKEN',0,'','2026-10-03T10:26:41.563Z','2026-10-10T10:26:41.563Z','The operation was aborted due to timeout')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C40F0905','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"http://www.bost.org.uk/open-places/red-cross-garden/","httpStatus":null,"error":"The operation was aborted due to timeout"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C40F0905' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C40F0905','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C40F0905' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C40F0905','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C40F0905' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C40F0905','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C40F0905' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A323C989',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A323C989';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A323C989','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A323C989' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A323C989','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A323C989' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A323C989','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A323C989' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BD9CA8DC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:46.376Z', hours_next_check_at='2026-10-31T10:26:46.376Z', quality_reviewed_at='2026-10-03T10:26:46.376Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BD9CA8DC';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-BD9CA8DC','official-web','https://westminstercathedral.org.uk/','Westminster Cathedral','4483a9e88480b7daa87c09f33d9e51e800b68e5e6d8fb2ed840dd14e4e299379','GENERAL','OWNER_OPERATOR',1,'OK',200,'1570801466d5c7c3a3d7e7f824dc5d55567b06346b1b86cfc0275cb5647ab62a','2026-10-03T10:26:46.376Z','2026-10-31T10:26:46.376Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BD9CA8DC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BD9CA8DC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BD9CA8DC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BD9CA8DC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B8B69AFD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B8B69AFD';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B8B69AFD','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B8B69AFD' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B8B69AFD','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B8B69AFD' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B8B69AFD','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B8B69AFD' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B8B69AFD','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B8B69AFD' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E4DF9DA5',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:48.815Z', hours_next_check_at='2026-10-10T10:26:48.815Z', quality_reviewed_at='2026-10-03T10:26:48.815Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E4DF9DA5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-E4DF9DA5','official-web','https://www.deencityfarm.co.uk/','Deen City Farm','159c31dfd99bd8ca9b5c7974b7ff78fc1f7aa8f69bee5c59a6eef34bf3557882','GENERAL','OWNER_OPERATOR',1,'OK',200,'4bed98b79aaa89357ee7c9ee4f82d6b79ea80aa9527c67ccbc3ed9c540e045ff','2026-10-03T10:26:48.815Z','2026-10-10T10:26:48.815Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E4DF9DA5','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E4DF9DA5' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E4DF9DA5','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E4DF9DA5' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E4DF9DA5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E4DF9DA5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4C150B7C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:51.875Z', hours_next_check_at='2026-10-10T10:26:51.875Z', quality_reviewed_at='2026-10-03T10:26:51.875Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4C150B7C';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-4C150B7C','official-web','https://ktcityfarm.org.uk/','Kentish Town City Farm','f344eb1f3b9db35ec9dd61ab097029038bfdd7a6edf2fd3589902e816e04c937','GENERAL','OWNER_OPERATOR',1,'OK',200,'3da2d4a74725c502c381424006b67a6706313015f442563b372f7f6280ee3230','2026-10-03T10:26:51.875Z','2026-10-10T10:26:51.875Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4C150B7C','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4C150B7C' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4C150B7C','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4C150B7C' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4C150B7C','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4C150B7C' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-91BDE902',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:55.076Z', hours_next_check_at='2026-10-10T10:26:55.076Z', quality_reviewed_at='2026-10-03T10:26:55.076Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-91BDE902';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-91BDE902','official-web','https://www.surreydocksfarm.org.uk/','Surrey Docks Farm','69bb72d9949ac5c4e60c0ae766cc2a639b8e3e2d468aebe3775afbedbbe7b696','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'87a04577fa4ba315cd6eb69e8725414763fb9b3a470be3a764695115891ba325','2026-10-03T10:26:55.076Z','2026-10-10T10:26:55.076Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-91BDE902','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.surreydocksfarm.org.uk/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-91BDE902' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-91BDE902','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-91BDE902' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-91BDE902','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-91BDE902' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-91BDE902','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-91BDE902' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-7D427873',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-7D427873';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7D427873','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7D427873' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7D427873','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7D427873' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7D427873','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7D427873' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7D427873','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7D427873' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C72026E2',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C72026E2';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C72026E2','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C72026E2' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C72026E2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C72026E2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C72026E2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C72026E2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-EB2D295A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-EB2D295A';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EB2D295A','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EB2D295A' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EB2D295A','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EB2D295A' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EB2D295A','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EB2D295A' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0581B888',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0581B888';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0581B888','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0581B888' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0581B888','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0581B888' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0581B888','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0581B888' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0581B888','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0581B888' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C46F735A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='RECOMMENDED', admission_type='PAID', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:26:56.564Z', hours_next_check_at='2026-10-31T10:26:56.564Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Official visitor page publishes opening times and recommends online booking for guaranteed entry and best price.' WHERE id='LA-C46F735A';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-C46F735A','official-web','https://www.strawberryhillhouse.org.uk/visit-us/','Strawberry Hill House & Garden','034139d61dbfeace7d24c79bf84b7bd54f9c1791527a7d2c91a21d7f4d96fecb','GENERAL','OWNER_OPERATOR',1,'OK',200,'1fe20208619656213f068a430c0334b8766e0cc658cf429d9f37ce92a3b7e9c7','2026-10-03T10:26:56.564Z','2026-10-31T10:26:56.564Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C46F735A','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C46F735A' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C46F735A','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C46F735A' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-97CA437D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-97CA437D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-97CA437D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-97CA437D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-97CA437D','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-97CA437D' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D0DE9DA4',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D0DE9DA4';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D0DE9DA4','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D0DE9DA4' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D0DE9DA4','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D0DE9DA4' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D0DE9DA4','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D0DE9DA4' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D0DE9DA4','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D0DE9DA4' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2BF2F4FF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2BF2F4FF';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2BF2F4FF','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2BF2F4FF' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D2A6F68E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D2A6F68E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D2A6F68E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D2A6F68E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-1986A3A5',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:01.177Z', hours_next_check_at='2026-10-31T10:27:01.177Z', quality_reviewed_at='2026-10-03T10:27:01.177Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-1986A3A5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-1986A3A5','official-web','https://www.iwm.org.uk/visits/churchill-war-rooms','Churchill War Rooms','79dec007f76870d0b12f9b5922fe5677db3c508487ad0408047d76dd4f8265a7','GENERAL','OWNER_OPERATOR',1,'OK',200,'bf26942d0ec913c6015e865fafdb4e2c945f541be459a1efb6b1f1ecde16ab26','2026-10-03T10:27:01.177Z','2026-10-31T10:27:01.177Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1986A3A5','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1986A3A5' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1986A3A5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1986A3A5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C8D68769',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:03.574Z', hours_next_check_at='2026-10-31T10:27:03.574Z', quality_reviewed_at='2026-10-03T10:27:03.574Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C8D68769';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-C8D68769','official-web','https://brucecastle.org/visit/opening-hours','Bruce Castle Museum','c032a5552471f935bac5724a19558c8aa5babb1246286229eb841c55b3d1cf6e','GENERAL','OWNER_OPERATOR',1,'BROKEN',404,'899da64bb496265f7412c62529a6a84d4218e028549f4808a23b2582e4996958','2026-10-03T10:27:03.574Z','2026-10-31T10:27:03.574Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C8D68769','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"https://brucecastle.org/visit/opening-hours","httpStatus":404,"error":""}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C8D68769' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C8D68769','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C8D68769' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C8D68769','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C8D68769' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C8D68769','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C8D68769' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-733D46DF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:04.445Z', hours_next_check_at='2026-10-31T10:27:04.445Z', quality_reviewed_at='2026-10-03T10:27:04.445Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-733D46DF';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-733D46DF','official-web','https://libraries.sutton.gov.uk/digital-content/sutton-heritage/whitehall-historic-house','Whitehall','1a86ef88423e670ee3c3465557187287207b897146d5e88eb006658b652c39f5','GENERAL','PUBLIC_AUTHORITY',1,'BLOCKED',403,'59450d0b0e537539d530e66210914b889baa34ec4729f9ab10f17dcdf6efc486','2026-10-03T10:27:04.445Z','2026-10-31T10:27:04.445Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-733D46DF','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://libraries.sutton.gov.uk/digital-content/sutton-heritage/whitehall-historic-house","httpStatus":403}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-733D46DF' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-733D46DF','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-733D46DF' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-733D46DF','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-733D46DF' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-733D46DF','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-733D46DF' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-EE0203E2',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:07.029Z', hours_next_check_at='2026-10-31T10:27:07.029Z', quality_reviewed_at='2026-10-03T10:27:07.029Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-EE0203E2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-EE0203E2','official-web','https://www.newportstreetgallery.com/','Newport Street Gallery','62bfbb68f7fca464254e9d83ba66aef75c2941e864d352178bc7891be5d3a500','GENERAL','OWNER_OPERATOR',1,'OK',200,'65a8806bdd669483d06998b76a5d39ae3eb4e9798865cad5b199b03a370bc38a','2026-10-03T10:27:07.029Z','2026-10-31T10:27:07.029Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EE0203E2','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EE0203E2' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EE0203E2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EE0203E2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EE0203E2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EE0203E2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B47FA9BD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:08.375Z', hours_next_check_at='2026-10-31T10:27:08.375Z', quality_reviewed_at='2026-10-03T10:27:08.375Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B47FA9BD';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-B47FA9BD','official-web','https://onecitylondon.com/directory/guildhall-art-gallery/','Guildhall Art Gallery','3456dfc849246ef1e039ab8a538dbda9a6872d32fd0708c26465740c4573f8e7','GENERAL','OWNER_OPERATOR',1,'REDIRECTED',200,'8444db4de28943928b1509569c518f19922bacc0bbaa40840ec3a2eb4a1b78a2','2026-10-03T10:27:08.375Z','2026-10-31T10:27:08.375Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B47FA9BD','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B47FA9BD' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B47FA9BD','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B47FA9BD' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B47FA9BD','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B47FA9BD' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-AC890240',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-AC890240';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AC890240','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AC890240' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AC890240','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AC890240' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AC890240','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AC890240' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AC890240','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AC890240' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-7B5BC29E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:09.428Z', hours_next_check_at='2026-10-31T10:27:09.428Z', quality_reviewed_at='2026-10-03T10:27:09.428Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-7B5BC29E';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-7B5BC29E','official-web','https://www.frithstreetgallery.com/','Frith Street Gallery','075d1d54e69de66bf7b27850a7926ccdadb0d0f71d9fd8c846b5b80af8c43c6d','GENERAL','OWNER_OPERATOR',1,'OK',200,'6f8eb1c9a7668b7c36bd833828d872810f8f34844974c2cd2d0ae961ddb3e831','2026-10-03T10:27:09.428Z','2026-10-31T10:27:09.428Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7B5BC29E','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7B5BC29E' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7B5BC29E','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7B5BC29E' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7B5BC29E','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7B5BC29E' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0CC3EA5E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:12.709Z', hours_next_check_at='2026-10-31T10:27:12.709Z', quality_reviewed_at='2026-10-03T10:27:12.709Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0CC3EA5E';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-0CC3EA5E','official-web','https://www.dorothycircusgallery.uk/','Dorothy Circus Gallery London','31554473dc03510d8fc8e9980696b5eb90ee0db34bcf7678bf7232d6291aad7e','GENERAL','OWNER_OPERATOR',1,'BROKEN',520,'c883f0b5f416d01446ccf745baa840f2e6cc27c4568776e6b61a3675ecadfa63','2026-10-03T10:27:12.709Z','2026-10-31T10:27:12.709Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0CC3EA5E','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"https://www.dorothycircusgallery.uk/","httpStatus":520,"error":""}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0CC3EA5E' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0CC3EA5E','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0CC3EA5E' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0CC3EA5E','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0CC3EA5E' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0CC3EA5E','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0CC3EA5E' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F60610F8',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F60610F8';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F60610F8','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F60610F8' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F60610F8','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F60610F8' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F60610F8','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F60610F8' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F60610F8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F60610F8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BA29F418',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:16.765Z', hours_next_check_at='2026-10-31T10:27:16.765Z', quality_reviewed_at='2026-10-03T10:27:16.765Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BA29F418';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-BA29F418','official-web','https://www.rct.uk/visit/the-kings-gallery-buckingham-palace','The King''s Gallery','39e9c1ce3e95309f1e102e772702552b5def53571b7cc159a1ae81f48f86be93','GENERAL','OWNER_OPERATOR',1,'OK',200,'5321e310e9de47cc5bbc04bfad53e3e3ee0f6e7371108f1ccc66dfdc427041e1','2026-10-03T10:27:16.765Z','2026-10-31T10:27:16.765Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BA29F418','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BA29F418' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BA29F418','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BA29F418' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BA29F418','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BA29F418' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-17639507',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-17639507';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-17639507','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-17639507' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-17639507','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-17639507' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-17639507','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-17639507' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-17639507','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-17639507' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BFFCFCA5',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BFFCFCA5';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BFFCFCA5','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BFFCFCA5' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BFFCFCA5','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BFFCFCA5' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BFFCFCA5','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BFFCFCA5' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BFFCFCA5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BFFCFCA5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D05A4C05',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D05A4C05';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D05A4C05','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D05A4C05' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0B0AED0C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:18.384Z', hours_next_check_at='2027-04-01T10:27:18.384Z', quality_reviewed_at='2026-10-03T10:27:18.384Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0B0AED0C';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-0B0AED0C','official-web','https://www.castle-climbing.co.uk/','The Castle Climbing Centre','df078374c43ebc1a436c625f19ac68403d2b96622469e0cdf36063bfca669b38','GENERAL','OWNER_OPERATOR',1,'OK',200,'c9d52066948f17c586eedc7dc64386532a3126242945d1160207996d3c147e1f','2026-10-03T10:27:18.384Z','2027-04-01T10:27:18.384Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0E416EB4',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0E416EB4';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0E416EB4','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0E416EB4' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0E416EB4','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0E416EB4' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0E416EB4','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0E416EB4' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D7759C90',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:18.737Z', hours_next_check_at='2026-10-31T10:27:18.737Z', quality_reviewed_at='2026-10-03T10:27:18.737Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D7759C90';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-D7759C90','official-web','https://www.supremecourt.uk/','The Supreme Court','075e8e103f585582e26762ebe249eb53fd3496b1db1f780b42a7ffc3d7e146bb','GENERAL','OWNER_OPERATOR',1,'OK',200,'6441263657d497a9f625971b47b0eec21e4d2b4bb6b8c19d0db2a10c454b100f','2026-10-03T10:27:18.737Z','2026-10-31T10:27:18.737Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D7759C90','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D7759C90' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D7759C90','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D7759C90' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-13F47C94',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-13F47C94';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-13F47C94','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-13F47C94' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-13F47C94','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-13F47C94' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-13F47C94','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-13F47C94' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-25ACC672',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:21.675Z', hours_next_check_at='2026-10-31T10:27:21.675Z', quality_reviewed_at='2026-10-03T10:27:21.675Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-25ACC672';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-25ACC672','official-web','https://www.londonmuseum.org.uk/docklands/','Museum of London Docklands','5a89996dfa23080b5678cb0f07ef7ea3dffbd9c4ca5986bd8292c5a64d46d87d','GENERAL','OWNER_OPERATOR',1,'OK',200,'7a59eace5104998c1d30ff1a84f080f3efaf26acbc84ce781b729afb6f4c9e58','2026-10-03T10:27:21.675Z','2026-10-31T10:27:21.675Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-25ACC672','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-25ACC672' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-25ACC672','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-25ACC672' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-25ACC672','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-25ACC672' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-26C43108',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:23.884Z', hours_next_check_at='2026-10-31T10:27:23.884Z', quality_reviewed_at='2026-10-03T10:27:23.884Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-26C43108';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-26C43108','official-web','https://friendsofhoneywood.co.uk/little-holland-house.html','Little Holland House','d068fcbb812fbc318739297c796055781a4b01ac975aa6f463724bfee26ce586','GENERAL','OWNER_OPERATOR',1,'OK',200,'a6a3ecc1101c3263ed07f4e82f8497331f8a000f44e40a3ae89aaaba52418785','2026-10-03T10:27:23.884Z','2026-10-31T10:27:23.884Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-26C43108','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-26C43108' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-26C43108','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-26C43108' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-26C43108','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-26C43108' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2523A610',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:23.932Z', hours_next_check_at='2026-10-31T10:27:23.932Z', quality_reviewed_at='2026-10-03T10:27:23.932Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2523A610';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-2523A610','official-web','https://www.whitechapelgallery.org/','Whitechapel Gallery','1a6dfb62589ef9f4756e4b5b6de060442763c5896c039ee11e368cc7d2f7b8bb','GENERAL','OWNER_OPERATOR',1,'OK',200,'a6d274e7b26b074e7c4bad4df5ee77d3f4c134c6161ef22f58171a16e0b28162','2026-10-03T10:27:23.932Z','2026-10-31T10:27:23.932Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2523A610','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2523A610' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2523A610','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2523A610' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2523A610','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2523A610' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-86C43514',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:25.718Z', hours_next_check_at='2026-10-31T10:27:25.718Z', quality_reviewed_at='2026-10-03T10:27:25.718Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-86C43514';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-86C43514','official-web','https://www.visitleevalley.org.uk/myddelton-house-gardens','Myddelton House Gardens','11c6283aab29d37b3de3003fbcba2521f6afbfe181af8c4b664cbf96a8f84d27','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'6b8e584ae79187706b77f9a10b3ab3dce3d0dca3630bad142e4eea8888a15d0c','2026-10-03T10:27:25.718Z','2026-10-31T10:27:25.718Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-86C43514','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.visitleevalley.org.uk/myddelton-house-gardens","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-86C43514' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-86C43514','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-86C43514' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-86C43514','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-86C43514' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-86C43514','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-86C43514' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6714C61A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:30.510Z', hours_next_check_at='2026-10-31T10:27:30.510Z', quality_reviewed_at='2026-10-03T10:27:30.510Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6714C61A';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-6714C61A','official-web','https://www.gardenmuseum.org.uk/','Garden Museum','e2370fcbc5421b624aad9ffd94ee6c5a097986adb4f7a33d2a6ba66951456128','GENERAL','OWNER_OPERATOR',1,'OK',200,'7acb430d7563c58d03414b800bd857b0760dd5ff170051543db2e6970d57801f','2026-10-03T10:27:30.510Z','2026-10-31T10:27:30.510Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6714C61A','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6714C61A' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6714C61A','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6714C61A' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6714C61A','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6714C61A' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-7B42E937',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-7B42E937';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7B42E937','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7B42E937' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7B42E937','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7B42E937' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7B42E937','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7B42E937' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-7B42E937','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-7B42E937' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-5D3A2868',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-5D3A2868';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5D3A2868','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5D3A2868' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5D3A2868','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5D3A2868' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5D3A2868','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5D3A2868' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-53ECA483',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-53ECA483';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-53ECA483','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-53ECA483' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-53ECA483','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-53ECA483' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-53ECA483','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-53ECA483' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-53ECA483','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-53ECA483' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-5DDBDFC1',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-5DDBDFC1';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5DDBDFC1','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5DDBDFC1' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5DDBDFC1','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5DDBDFC1' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5DDBDFC1','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5DDBDFC1' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-42FF4BB8',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-42FF4BB8';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-42FF4BB8','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-42FF4BB8' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-42FF4BB8','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-42FF4BB8' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-42FF4BB8','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-42FF4BB8' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-42FF4BB8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-42FF4BB8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E24C3E52',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E24C3E52';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E24C3E52','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E24C3E52' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E24C3E52','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E24C3E52' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E24C3E52','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E24C3E52' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-15CF6577',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-15CF6577';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-15CF6577','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-15CF6577' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-15CF6577','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-15CF6577' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-15CF6577','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-15CF6577' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B2AB1D50',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B2AB1D50';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B2AB1D50','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B2AB1D50' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B2AB1D50','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B2AB1D50' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B2AB1D50','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B2AB1D50' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B2AB1D50','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B2AB1D50' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E751C213',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E751C213';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E751C213','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E751C213' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E751C213','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E751C213' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E751C213','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E751C213' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E751C213','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E751C213' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4E033359',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:31.119Z', hours_next_check_at='2026-10-31T10:27:31.119Z', quality_reviewed_at='2026-10-03T10:27:31.119Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4E033359';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-4E033359','official-web','https://trentparkhouse.org.uk/','Trent Park House of Secrets','de8c1c81832a2bd22e6fd4cc91b7df25b096df16407e74f00dc7cb0f4ad1b577','GENERAL','OWNER_OPERATOR',1,'OK',200,'32b2cd4e706fdc87a2819f5751ea809668ef8bb834712f28c1b8127ed6f70172','2026-10-03T10:27:31.119Z','2026-10-31T10:27:31.119Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4E033359','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4E033359' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4E033359','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4E033359' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4E033359','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4E033359' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B462351E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B462351E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B462351E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B462351E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C24373B7',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:33.617Z', hours_next_check_at='2027-04-01T10:27:33.617Z', quality_reviewed_at='2026-10-03T10:27:33.617Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C24373B7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-C24373B7','official-web','https://www.shirleywindmill.org.uk/','Shirley Windmill','9f2984f2630feb0419a3427984ed25d27f930eac78e71c68c5ad8b441cf48ad2','GENERAL','OWNER_OPERATOR',1,'OK',200,'46d3511052fe6e45f06e2bae24ece7c1fd9162512f2b07b75dbede08916d4171','2026-10-03T10:27:33.617Z','2027-04-01T10:27:33.617Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-9366C9A1',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:35.251Z', hours_next_check_at='2027-04-01T10:27:35.251Z', quality_reviewed_at='2026-10-03T10:27:35.251Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-9366C9A1';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-9366C9A1','official-web','https://www.upminsterwindmill.org/','Upminster Windmill','58fb4de8c17c5f965ae0fc3b608fb9e2f0c70d631d80edb51f36574bbeede33a','GENERAL','OWNER_OPERATOR',1,'OK',200,'7d0b37d5ce251a913aac9d5a8cd13d7b0e3286b9341521681b5785b073d85b3c','2026-10-03T10:27:35.251Z','2027-04-01T10:27:35.251Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-26AD1A00',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-26AD1A00';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-26AD1A00','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-26AD1A00' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6E634A42',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6E634A42';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6E634A42','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6E634A42' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-8E5EFDAD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-8E5EFDAD';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8E5EFDAD','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8E5EFDAD' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8E5EFDAD','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8E5EFDAD' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-15651BB5',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:35.681Z', hours_next_check_at='2027-04-01T10:27:35.681Z', quality_reviewed_at='2026-10-03T10:27:35.681Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-15651BB5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-15651BB5','official-web','https://www.stmartin-in-the-fields.org/','St Martin-in-the-Fields Church','17262e8b29b3ffb10870890fb87c3dcc60f40ee3b1ddc36eb61e5b9f3449af8d','GENERAL','OWNER_OPERATOR',1,'OK',200,'5ea27a984e6d5615d4bc7f9f9f4e30bf7adfdca8b186961305de1df5b9eb4481','2026-10-03T10:27:35.681Z','2027-04-01T10:27:35.681Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B6DA5A6E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B6DA5A6E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B6DA5A6E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B6DA5A6E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B6DA5A6E','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B6DA5A6E' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-269DFDBF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-269DFDBF';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-269DFDBF','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-269DFDBF' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-B00C7D7D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-B00C7D7D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B00C7D7D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B00C7D7D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-B00C7D7D','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-B00C7D7D' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E0BD8587',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E0BD8587';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E0BD8587','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E0BD8587' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-869A2DEA',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-869A2DEA';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-869A2DEA','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-869A2DEA' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-869A2DEA','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-869A2DEA' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-39B28B3C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-39B28B3C';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-39B28B3C','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-39B28B3C' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-39B28B3C','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-39B28B3C' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-1BD5C1CB',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-1BD5C1CB';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1BD5C1CB','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1BD5C1CB' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1BD5C1CB','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1BD5C1CB' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-285D8952',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-285D8952';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-285D8952','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-285D8952' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-285D8952','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-285D8952' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BF11C83E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BF11C83E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BF11C83E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BF11C83E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-DAFBC4D4',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-DAFBC4D4';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-DAFBC4D4','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-DAFBC4D4' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-D689203D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-D689203D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-D689203D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-D689203D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-70FCEB5B',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:40.310Z', hours_next_check_at='2027-04-01T10:27:40.310Z', quality_reviewed_at='2026-10-03T10:27:40.310Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-70FCEB5B';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-70FCEB5B','official-web','https://ornc.org/explore-whats-here/painted-hall/','Painted Hall','0a129393c5c10988cce54eacca45a2546cb126ce785140b6cc0b86aab2c9e87e','GENERAL','OWNER_OPERATOR',1,'OK',200,'b1a6c605e569402d275080748ccffaad33a6ca3f15a9947c14eec55463d9a02b','2026-10-03T10:27:40.310Z','2027-04-01T10:27:40.310Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-70FCEB5B','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-70FCEB5B' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-780DDE54',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:41.353Z', hours_next_check_at='2027-04-01T10:27:41.353Z', quality_reviewed_at='2026-10-03T10:27:41.353Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-780DDE54';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-780DDE54','official-web','https://wiltons.org.uk/','Wilton''s Music Hall','3310107161408294ca1235649e3f741fa2e761df8293ec9da4d0a0474283d61c','GENERAL','OWNER_OPERATOR',1,'OK',200,'9efa4ef40242a47c6826aecb519dce9e8357a42eaafc8044d604758ee29555ba','2026-10-03T10:27:41.353Z','2027-04-01T10:27:41.353Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-9AC09376',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-9AC09376';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-9AC09376','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-9AC09376' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-639346A3',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-639346A3';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-639346A3','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-639346A3' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-1C2C5A4A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-1C2C5A4A';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1C2C5A4A','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1C2C5A4A' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6B9A4DFD',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6B9A4DFD';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6B9A4DFD','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6B9A4DFD' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0BB04092',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0BB04092';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0BB04092','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0BB04092' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F03B8F32',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F03B8F32';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F03B8F32','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F03B8F32' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A87A87EA',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A87A87EA';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A87A87EA','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A87A87EA' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-391AB302',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-391AB302';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-391AB302','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-391AB302' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-049868CF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-049868CF';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-049868CF','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-049868CF' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-049868CF','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-049868CF' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-8C880220',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-8C880220';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8C880220','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8C880220' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8C880220','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8C880220' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-EB43F217',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-EB43F217';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EB43F217','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EB43F217' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EB43F217','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EB43F217' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4ACACF0C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:42.005Z', hours_next_check_at='2027-04-01T10:27:42.005Z', quality_reviewed_at='2026-10-03T10:27:42.005Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4ACACF0C';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-4ACACF0C','official-web','https://www.wigmore-hall.org.uk/','Wigmore Hall','8e27cbd4274b4b9f8df1d9c7ed3a4906d2a8df325d378c6673d22f433bd6f043','GENERAL','OWNER_OPERATOR',1,'OK',200,'13dcabe963d63a8f02702c72a8fc84f2232218cc34370e86e7b04e1156c80946','2026-10-03T10:27:42.005Z','2027-04-01T10:27:42.005Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4ACACF0C','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4ACACF0C' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-35BA0210',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-35BA0210';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-35BA0210','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-35BA0210' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-4385553D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-4385553D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-4385553D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-4385553D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-AAEC1C99',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-AAEC1C99';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-AAEC1C99','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-AAEC1C99' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-13BCF732',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-13BCF732';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-13BCF732','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-13BCF732' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-EC43B547',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-EC43B547';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EC43B547','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EC43B547' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-EC43B547','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-EC43B547' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-603558FF',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-603558FF';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-603558FF','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-603558FF' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-303DB9AB',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-303DB9AB';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-303DB9AB','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-303DB9AB' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-13286267',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-13286267';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-13286267','official-web','https://secretldn.com/thin-house-thurloe-square/','Thin House','ecbfddf2904432fa277ec956a1f99c8aa333684d1f357651e8b606d11592b951','GENERAL','TRUSTED_EDITORIAL',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-13286267','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://secretldn.com/thin-house-thurloe-square/"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-13286267' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-13286267','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-13286267' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F229546C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:45.358Z', hours_next_check_at='2027-04-01T10:27:45.358Z', quality_reviewed_at='2026-10-03T10:27:45.358Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F229546C';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-F229546C','official-web','https://crossness.org.uk/','Crossness Pumping Station','ddd6a7993224148f755698bd9ce58ae96f997bfe9868c4a7e31108245191fe98','GENERAL','OWNER_OPERATOR',1,'OK',200,'114f2800edf36d7c6d96b6a7e412b8e0d9cace769d9a585b06a7c7802aa75396','2026-10-03T10:27:45.358Z','2027-04-01T10:27:45.358Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-CBC98DDE',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-CBC98DDE';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CBC98DDE','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CBC98DDE' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-CBC98DDE','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-CBC98DDE' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-5F918E8C',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-5F918E8C';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5F918E8C','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5F918E8C' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-E7E3D284',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:46.103Z', hours_next_check_at='2027-04-01T10:27:46.103Z', quality_reviewed_at='2026-10-03T10:27:46.103Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-E7E3D284';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-E7E3D284','official-web','https://www.ealing.gov.uk/info/201136/parks_in_the_borough/664/hanwell_parks/2','Millennium Maze','63005fda7cf3a0a94d5a450355162f1795edd6fb84a18036f757c2990c872a87','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'897a725c973199ff913d445bb60063f7371866a0db06dcf0c8561d62bb74b7f1','2026-10-03T10:27:46.103Z','2027-04-01T10:27:46.103Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-22DC04C5',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-22DC04C5';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-22DC04C5','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-22DC04C5' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-22DC04C5','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-22DC04C5' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-22DC04C5','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-22DC04C5' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-22DC04C5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-22DC04C5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0D218A21',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0D218A21';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0D218A21','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0D218A21' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0D218A21','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0D218A21' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0D218A21','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0D218A21' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0D218A21','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0D218A21' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-6A5CD7C6',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-6A5CD7C6';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6A5CD7C6','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6A5CD7C6' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6A5CD7C6','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6A5CD7C6' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6A5CD7C6','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6A5CD7C6' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-A64FA9D3',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:27:50.668Z', hours_next_check_at='2026-10-31T10:27:50.668Z', quality_reviewed_at='2026-10-03T10:27:50.668Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-A64FA9D3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-A64FA9D3','official-web','https://anaesthetists.org/Home/Heritage-centre','Anaesthesia Heritage Centre','01fe2c85e183064d5a31662cc1effed78df2387865ef26e99f4173702bf174d3','GENERAL','OWNER_OPERATOR',1,'OK',200,'36091d31e1d89089596db949c74d21c2b2a180389548dae8b96fc0ad453d5386','2026-10-03T10:27:50.668Z','2026-10-31T10:27:50.668Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A64FA9D3','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A64FA9D3' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A64FA9D3','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A64FA9D3' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-A64FA9D3','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-A64FA9D3' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-F4CBE9DC',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-F4CBE9DC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-F4CBE9DC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-F4CBE9DC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-744356F3',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-744356F3';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-744356F3','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-744356F3' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-FB52F5AA',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-FB52F5AA';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-FB52F5AA','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-FB52F5AA' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-FB52F5AA','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-FB52F5AA' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-814F8869',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-814F8869';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-814F8869','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-814F8869' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-814F8869','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-814F8869' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-0EF8D02D',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-0EF8D02D';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0EF8D02D','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0EF8D02D' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-0EF8D02D','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-0EF8D02D' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-29A0C7D1',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-29A0C7D1';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-29A0C7D1','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-29A0C7D1' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-29A0C7D1','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-29A0C7D1' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-2C691CC2',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-2C691CC2';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2C691CC2','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2C691CC2' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2C691CC2','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2C691CC2' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-14813A43',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-14813A43';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-14813A43','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-14813A43' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-14813A43','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-14813A43' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C899E589',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C899E589';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C899E589','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C899E589' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C899E589','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C899E589' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-1310FF8E',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-1310FF8E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-1310FF8E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-1310FF8E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-5365A20F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-5365A20F';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5365A20F','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5365A20F' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-5365A20F','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-5365A20F' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-C6BD9F0A',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-C6BD9F0A';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C6BD9F0A','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C6BD9F0A' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C6BD9F0A','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C6BD9F0A' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-C6BD9F0A','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-C6BD9F0A' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-684AA088',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-684AA088';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-684AA088','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-684AA088' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-83CD1CDE',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:51.545Z', hours_next_check_at='2027-04-01T10:27:51.545Z', quality_reviewed_at='2026-10-03T10:27:51.545Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-83CD1CDE';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-83CD1CDE','official-web','https://novelty-automation.com/','Novelty Automation','adb1b2e07aa3f3d3e6c3cc6cc13ab72e65956e8be576dd7b048a9662850a5f09','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'17fda57512a1498aeb2e962f9cfc072e7f6d71b51e6e34f8b260c4cf1f085bf9','2026-10-03T10:27:51.545Z','2027-04-01T10:27:51.545Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-83CD1CDE','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://novelty-automation.com/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-83CD1CDE' AND issue_type='OTHER' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-2','LA-BCEBA53F',100,'All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:27:52.504Z', hours_next_check_at='2027-04-01T10:27:52.504Z', quality_reviewed_at='2026-10-03T10:27:52.504Z', quality_notes='Prepared by BATCH-2; factual confidence is separate from mood confidence.' WHERE id='LA-BCEBA53F';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-BCEBA53F','official-web','https://www.idsme.co.uk/IMR/IMRWelcome.shtml','Ickenham Miniature Railway','4fb455f412608cef4febb6f70d48a517cdea783637861aac90898397b293fd18','GENERAL','OWNER_OPERATOR',1,'BROKEN',404,'555db2a18fcb65f4a5150aef492480b29d56841caa2c540aef6f6bfb9b21e318','2026-10-03T10:27:52.504Z','2027-04-01T10:27:52.504Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-BCEBA53F','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"https://www.idsme.co.uk/IMR/IMRWelcome.shtml","httpStatus":404,"error":""}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-BCEBA53F' AND issue_type='LINK_BROKEN' AND status='OPEN');
UPDATE app_meta SET value = CAST(value AS INTEGER) + 1, updated_at=CURRENT_TIMESTAMP WHERE key='data_version';
