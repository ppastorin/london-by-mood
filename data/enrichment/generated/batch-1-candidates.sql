-- GENERATED FILE: apply only after migrations/0003_planner_data_foundation.sql.
-- This candidate set is designed for a local/development D1 database and does not touch production.
PRAGMA foreign_keys = ON;
INSERT OR REPLACE INTO enrichment_batches(batch_code,name,purpose,status) VALUES ('BATCH-1','Editorial core','Guide/editorial core and current high mood-confidence records.','REVIEW');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B1',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='APPOINTMENT_ONLY', booking_mode='REQUIRED', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:15.501Z', hours_next_check_at='2026-10-31T10:21:15.501Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): Reviewer confirmed the building identity and appointment-only interior access. The building remains viewable from public streets, but the supplied tower site blocks automated verification.' WHERE id='B1';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B1','official-web','https://trellicktower.com/','Trellick Tower','2bc1a14ab987c63108443c7676818a52a79931e52d5afc010ce78729e2e8ae5d','GENERAL','OWNER_OPERATOR',1,'OK',200,'fcb6ab51f059cad12b9cc64a6114273bf8d5e658134c6dd8e18a1a14e643f809','2026-10-03T10:21:15.501Z','2026-10-31T10:21:15.501Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B1','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B1' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B5',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='REQUIRED', admission_type='PAID', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:15.510Z', hours_next_check_at='2026-10-31T10:21:15.510Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Westminster Hall is included in scheduled Palace of Westminster ticketed tours.' WHERE id='B5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B5','official-web','https://tickets.parliament.uk/content/ticket-options','Westminster Hall','0f79fb9c2824737b3c972c42fb4c05133618d70cca1ec3e558b9c42edb9ad8e4','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'9871559e2b21cfcb14fe48873919167dcdd785bfc8b9d6632f2e3936383e0bd8','2026-10-03T10:21:15.510Z','2026-10-31T10:21:15.510Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B12',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='HIGH', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='OPTIONAL', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:15.511Z', hours_next_check_at='2027-04-01T10:21:15.511Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Historic England confirms the listed Michelin House facade; the planner default is an exterior architecture stop, while access to businesses inside is separate and optional.' WHERE id='B12';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B12','official-web','https://historicengland.org.uk/listing/the-list/list-entry/1080656','Michelin House','c5e2fe83ea10e3234577c4d4221e687282ad293b25fb273424cf517970e17fc9','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'3d811bf7ab843d54af018ca78ad5d0e2bb3d149bf91694115af82637172c811a','2026-10-03T10:21:15.511Z','2027-04-01T10:21:15.511Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P11',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:22.456Z', hours_next_check_at='2026-10-10T10:21:22.456Z', quality_reviewed_at='2026-10-03T10:21:22.456Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P11';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P11','official-web','https://vauxhallcityfarm.org/','Vauxhall City Farm','0e7ad5e902b3a3dab3ed82cd0b5c1e2a3680b242e4c8a250068a7f6d2d6995ed','GENERAL','OWNER_OPERATOR',1,'OK',200,'cb5ea034c7bd914c721c07b9687e0a6860d2618f507734a9c89a16120d837f6f','2026-10-03T10:21:22.456Z','2026-10-10T10:21:22.456Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P11','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P11' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P11','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P11' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V6',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:22.768Z', hours_next_check_at='2027-01-01T10:21:22.768Z', quality_reviewed_at='2026-10-03T10:21:22.768Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V6';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V6','official-web','https://oxotowerrestaurant.com/','Oxo Tower','cbdc78abf8d88c9f163219d8683ef23e7ab48824749625ae4c8f83a2d14224d5','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'e46f7ff9fbb179bef1631ba66bada2e5a38cc4dc54e274d5277867af86a47630','2026-10-03T10:21:22.768Z','2027-01-01T10:21:22.768Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'V6','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://oxotowerrestaurant.com/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='V6' AND issue_type='OTHER' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A14',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:22.974Z', hours_next_check_at='2027-01-01T10:21:22.974Z', quality_reviewed_at='2026-10-03T10:21:22.974Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A14';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A14','official-web','https://www.shepherdmarket.com/','Shepherd Market','c42852778fa8321995bcfb708cd483f1e9fdf3ee33337a585a723e2fc717fd1f','GENERAL','OWNER_OPERATOR',1,'OK',200,'52942d8a07fe45561bc5193aa2e8cc65c51a3da29db42342a7cae038a1f4f1a3','2026-10-03T10:21:22.974Z','2027-01-01T10:21:22.974Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B10',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EVENT_ONLY', booking_mode='REQUIRED', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:27.249Z', hours_next_check_at='2026-10-10T10:21:27.249Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): The official local guide operator advertises dated Canonbury Tower tours and directs visitors to book a place; no daily walk-in access is published.' WHERE id='B10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B10','official-web','https://islingtonguidedwalks.com/old-walks/canonbury-tower-tours/','Canonbury Tower','6f1cd7df5c75e1d03fe523f844cb3081879afdb13cba843947e5f35e69529cf6','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'ed8329af9506324666a1e9092a408ddf34adb8b9d4d50d9936ba13f3b7333856','2026-10-03T10:21:27.249Z','2026-10-10T10:21:27.249Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B10','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://islingtonguidedwalks.com/old-walks/canonbury-tower-tours/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B10' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B10','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B10' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','LA-E57750BC',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='LA-E57750BC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E57750BC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E57750BC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E57750BC','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E57750BC' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E57750BC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E57750BC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E57750BC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E57750BC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A3',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A3','official-web','https://en.wikipedia.org/wiki/Kynance_Mews','Kynance Mews','d047d5c74cb3b4171ec51e44588a5e9aa6af45162faf0dd2ec47032c71d2b2ba','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'A3','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Kynance_Mews"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='A3' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A11',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A11';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A11','official-web','https://en.wikipedia.org/wiki/Harrow_on_the_Hill','Harrow Village','4c3c26df52ba9c5c264805ad0943428efc93278eea9f548a9bce9c256add1e04','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'A11','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Harrow_on_the_Hill"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='A11' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B3',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='OPTIONAL', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:28.168Z', hours_next_check_at='2026-10-31T10:21:28.168Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Official visit page publishes recurring public opening days; guided tours can be booked separately.' WHERE id='B3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B3','official-web','https://bartsnorthwing.org.uk/visit/','St Bartholomew''s North Wing','a8b7210962655a0fbfd7ad680e4e4e82a93d108a38d7acf4847cd7e16d58d061','GENERAL','OWNER_OPERATOR',1,'OK',200,'bbb90aadf809fc42c81e25462a2c5d32e19d96764ffb96c23425ab2c84973bc3','2026-10-03T10:21:28.168Z','2026-10-31T10:21:28.168Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B3','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B3' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V2',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:29.132Z', hours_next_check_at='2027-01-01T10:21:29.132Z', quality_reviewed_at='2026-10-03T10:21:29.132Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V2','official-web','https://www.tcv.org.uk/london/urbanecology/urban-ecology-sites/stave-hill-ecological-park/','Stave Hill','47161db8325f569814e51f2565b1f8d611c60b9a5e8293963d8d8d394ef62b5a','GENERAL','OWNER_OPERATOR',1,'OK',200,'8fe45b6f160579498d61f257c3458ea70f806b6cafb0579d3215db57808fbb53','2026-10-03T10:21:29.132Z','2027-01-01T10:21:29.132Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'V2','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='V2' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V11',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:31.989Z', hours_next_check_at='2027-01-01T10:21:31.989Z', quality_reviewed_at='2026-10-03T10:21:31.989Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V11';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V11','official-web','https://www.johnlewis.com/our-shops/peter-jones','Peter Jones & Partners','2723f09d101a85362877730eed75b830272449ac0f7bff76364bffa88153e38f','GENERAL','OWNER_OPERATOR',1,'OK',200,'ab5edb70214e8a65fe8b095decb0035ac9b53cfdb366a73dba4fcbc1aa7ab280','2026-10-03T10:21:31.989Z','2027-01-01T10:21:31.989Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
DELETE FROM place_opening_periods WHERE place_id='V11' AND experience_id IS NULL;
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V11',1,1,'10:00','19:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V11' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:31.989Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V11',2,1,'10:00','19:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V11' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:31.989Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V11',3,1,'10:00','19:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V11' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:31.989Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V11',4,1,'10:00','19:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V11' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:31.989Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V11',5,1,'10:00','19:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V11' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:31.989Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V11',6,1,'10:00','19:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V11' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:31.989Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V11',0,1,'11:30','18:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V11' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:31.989Z');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A16',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:33.191Z', hours_next_check_at='2027-01-01T10:21:33.191Z', quality_reviewed_at='2026-10-03T10:21:33.191Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A16';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A16','official-web','https://v17walthamstow.org/history','Walthamstow village','3621161d1c70a9fca2b932213e7dbd2ef76b9e7e322ad5c47ad99905c5914b96','GENERAL','OWNER_OPERATOR',1,'OK',200,'d61033c24a03874d14881edfb6c5cce92ec80bf3c1b0fbfef7900743964f3858','2026-10-03T10:21:33.191Z','2027-01-01T10:21:33.191Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B2',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='OPTIONAL', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:35.599Z', hours_next_check_at='2026-10-31T10:21:35.599Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): House has published daily hours; advance booking is optional and admission is free.' WHERE id='B2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B2','official-web','https://www.english-heritage.org.uk/visit/places/kenwood/','Kenwood House','584221e0442d8865ae31b48cc0d6b26bd03c820450639348593f753d639d8c19','GENERAL','OWNER_OPERATOR',1,'OK',200,'355440ad2293fb95fae7d7a9456cdf981badd6ad98de9720cf9b966e8d039395','2026-10-03T10:21:35.599Z','2026-10-31T10:21:35.599Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','LA-2D02CF27',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='RECOMMENDED', admission_type='PAID', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:36.358Z', hours_next_check_at='2026-10-10T10:21:36.358Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): House and gardens operate a seasonal timetable with paid admission and bookable tours.' WHERE id='LA-2D02CF27';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('LA-2D02CF27','official-web','https://syonpark.co.uk/visitor-information/','Syon House','bb1074c3741aeb873aa778d822c80b7a9b5a705dc6b5c37668b86a4a6e956d37','GENERAL','OWNER_OPERATOR',1,'OK',200,'9f177b255f1367371585bd85edc0b125ef237e517c9b4e50898270aad13945e1','2026-10-03T10:21:36.358Z','2026-10-10T10:21:36.358Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2D02CF27','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2D02CF27' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2D02CF27','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2D02CF27' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B8',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='REQUIRED', admission_type='PAID', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:36.876Z', hours_next_check_at='2026-10-31T10:21:36.876Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Interior access is tied to scheduled performances and bookable heritage tours.' WHERE id='B8';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B8','official-web','https://wiltons.org.uk/visit-us/find-contact/','Wilton''s Music Mall','3540864193b77e8ccc76237fef80f8cc03d1702a27017984b81276f66fcbf468','GENERAL','OWNER_OPERATOR',1,'OK',200,'dad03822ef2bfaa431b216c47d770d9312b67455b13dca5d583dbfba023860b8','2026-10-03T10:21:36.876Z','2026-10-31T10:21:36.876Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B9',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='PAID', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:39.706Z', hours_next_check_at='2026-10-31T10:21:39.706Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Official page publishes asset-specific hours and states that general admission is not pre-booked.' WHERE id='B9';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B9','official-web','https://www.nationaltrust.org.uk/visit/london/ham-house-and-garden','Ham House and Garden','445b66c25b23231286f3f5ae92327df9201f1570a5ec1422dcd54590b4182e0b','GENERAL','OWNER_OPERATOR',1,'OK',200,'2a93c48bc1e46aa50513993f965e4465bca7aa885d03c38f41c492ae93fdb383','2026-10-03T10:21:39.706Z','2026-10-31T10:21:39.706Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B9','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B9' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P7',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:41.224Z', hours_next_check_at='2026-10-10T10:21:41.224Z', quality_reviewed_at='2026-10-03T10:21:41.224Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P7','official-web','https://www.nationaltrust.org.uk/visit/london/morden-hall-park','Morden Hall Park','b47d42881a8ced45a5db286310de8d3bb75270f35f44a1e61d17fd55930bd966','GENERAL','OWNER_OPERATOR',1,'OK',200,'2eb5cc817a00042286d59535aca54a1dab67e541e76fefac4f3836140d6a6e42','2026-10-03T10:21:41.224Z','2026-10-10T10:21:41.224Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P7','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P7' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P7','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P7' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P2',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:42.302Z', hours_next_check_at='2026-10-10T10:21:42.302Z', quality_reviewed_at='2026-10-03T10:21:42.302Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P2','official-web','https://chiswickhouseandgardens.org.uk/','Chiswick House and Gardens','8ac22b4c0677f964389a737d8a5b40df3bc4ccc107d72068bae32721c04049bb','GENERAL','OWNER_OPERATOR',1,'OK',200,'b761dcbd163d57133cc1df2a98bb347a65acd7c45edfcaa3ebf97fea7c2620fc','2026-10-03T10:21:42.302Z','2026-10-10T10:21:42.302Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P12',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:45.461Z', hours_next_check_at='2026-10-10T10:21:45.461Z', quality_reviewed_at='2026-10-03T10:21:45.461Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P12';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P12','official-web','https://hackney.gov.uk/clissold-park','Clissold Park','d324ee48f69e9acb4421fcf661fa514aab098069e8a59ee7bff8ff6c3f5159bf','GENERAL','PUBLIC_AUTHORITY',1,'BROKEN',0,'','2026-10-03T10:21:45.461Z','2026-10-10T10:21:45.461Z','The operation was aborted due to timeout')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P12','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"https://hackney.gov.uk/clissold-park","httpStatus":null,"error":"The operation was aborted due to timeout"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P12' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P12','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P12' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P12','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P12' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','LA-2405DFBC',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='LA-2405DFBC';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2405DFBC','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2405DFBC' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2405DFBC','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2405DFBC' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2405DFBC','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2405DFBC' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-2405DFBC','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-2405DFBC' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R12',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:45.706Z', hours_next_check_at='2026-10-31T10:21:45.706Z', quality_reviewed_at='2026-10-03T10:21:45.706Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R12';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R12','official-web','https://www.ststephenwalbrook.net/','St Stephen Walbrook','9fd5ef2e3edba1c6a4fb06aef33069e72a65eb7502b13be73d75b970535d7eff','GENERAL','OWNER_OPERATOR',1,'OK',200,'77e325cd2f34b0073d91f7a89738c690448fe079ca283ba848e839f259fdf29c','2026-10-03T10:21:45.706Z','2026-10-31T10:21:45.706Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R12','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R12' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R12','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R12' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V7',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:47.079Z', hours_next_check_at='2027-01-01T10:21:47.079Z', quality_reviewed_at='2026-10-03T10:21:47.079Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V7','official-web','https://www.royalparks.org.uk/get-in-touch/media-centre/news-press-releases/enhancing-historic-viewpoint-one-tree-hill','One Tree Hill','17661366e55bc0989133d1833abe8531b73b04c28845cc9fb3a25526ebb285ef','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'fc0f899d3bda6aeb8cf965d659e124057f3f8cc705eb25b6dc1f8eb7613c32e5','2026-10-03T10:21:47.079Z','2027-01-01T10:21:47.079Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V8',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:50.388Z', hours_next_check_at='2027-01-01T10:21:50.388Z', quality_reviewed_at='2026-10-03T10:21:50.388Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V8';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V8','official-web','https://www.richmondparklondon.co.uk/walks/bestviewpoints.html','Sawyer''s Hill','f7bfe89c8522f987fa4466bae36f2456a04a86177df2633bdc1412be50a1696f','GENERAL','OWNER_OPERATOR',1,'OK',200,'9d9bfd0013b74c1eadd79d31b45876c1f9abe311e25e8f77f0b86cba02d5ebdd','2026-10-03T10:21:50.388Z','2027-01-01T10:21:50.388Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V9',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V9';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V9','official-web','https://www.littleobservationist.com/village-vibes-londons-harrow-hill/','Harrow Viewpoint','41a9239e9c20f22a992b6955932511b6b5ef4b8591c3bdb00ea8980a66e28bb0','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'V9','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://www.littleobservationist.com/village-vibes-londons-harrow-hill/"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='V9' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V12',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:52.262Z', hours_next_check_at='2027-01-01T10:21:52.262Z', quality_reviewed_at='2026-10-03T10:21:52.262Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V12';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V12','official-web','https://ldn.celavi.com/','Ce'' la vi rooftop','0996765b687c09bd256ec7a471bad369700253f29112b9e2a026e7c25c692874','GENERAL','OWNER_OPERATOR',1,'OK',200,'18dccb690814eb0cf6628ef49472edb3fefb466c45a9c56d49a280fb0917cb25','2026-10-03T10:21:52.262Z','2027-01-01T10:21:52.262Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
DELETE FROM place_opening_periods WHERE place_id='V12' AND experience_id IS NULL;
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V12',1,1,'12:00','00:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V12' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:52.262Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V12',2,1,'12:00','00:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V12' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:52.262Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V12',0,1,'12:00','00:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V12' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:52.262Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V12',3,1,'12:00','00:30',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V12' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:52.262Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V12',4,1,'12:00','01:30',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V12' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:52.262Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V12',5,1,'12:00','01:30',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V12' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:52.262Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('V12',6,1,'12:00','01:30',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='V12' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:21:52.262Z');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B6',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='PAID', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:54.390Z', hours_next_check_at='2026-10-31T10:21:54.390Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): General admission is available on published Sunday opening sessions without advance booking.' WHERE id='B6';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B6','official-web','https://severndroogcastle.org.uk/visit/','Severndroog Castle','41a449596830f0a46fdc782def121c69cf202de8fe0cd9b2158a5f62f70c90fa','GENERAL','OWNER_OPERATOR',1,'OK',200,'f86fb267b4723bdcd9b5c21e2e694080719fa30b0c7261c36a56afcb49abdde8','2026-10-03T10:21:54.390Z','2026-10-31T10:21:54.390Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B6','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B6' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B6','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B6' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P10',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:21:57.090Z', hours_next_check_at='2026-10-10T10:21:57.090Z', quality_reviewed_at='2026-10-03T10:21:57.090Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P10','official-web','https://stepneycityfarm.org/','Stepney City Farm','a68d19175aec77e7a6f6fcf176f077d341ea9771dfa6101546fac30c203348e5','GENERAL','OWNER_OPERATOR',1,'OK',200,'d19d93915756fc6f47937de8b95a74aafc1ccad898ff4b5e7023f147075a4ab2','2026-10-03T10:21:57.090Z','2026-10-10T10:21:57.090Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P10','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P10' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P10','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P10' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A5',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:21:58.745Z', hours_next_check_at='2027-01-01T10:21:58.745Z', quality_reviewed_at='2026-10-03T10:21:58.745Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A5','official-web','https://naturesacred.org/sacred_place/mount-street-gardens/','Mount Street Gardens','33e4df764b08a6860cad858912a8cecdb37c5ccb04734977014175d988dbb288','GENERAL','OWNER_OPERATOR',1,'OK',200,'8e88550b598a7d5e108ff572247c565932b4da95e1ef6f4fec521e24a2708be9','2026-10-03T10:21:58.745Z','2027-01-01T10:21:58.745Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'A5','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='A5' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A15',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:00.463Z', hours_next_check_at='2027-01-01T10:22:00.463Z', quality_reviewed_at='2026-10-03T10:22:00.463Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A15';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A15','official-web','https://www.thespitalfieldstrust.com/','Princelet st','7fe3ba5d009192a6c11c0f422cca0e90777765a9a1965a8d3817bbbcdd6de1aa','GENERAL','OWNER_OPERATOR',1,'OK',200,'56a4df4c6ea5e5e6e2e702ca67f1d0852a08146ef9416b974895655a1b3946ef','2026-10-03T10:22:00.463Z','2027-01-01T10:22:00.463Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A2',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:01.971Z', hours_next_check_at='2027-01-01T10:22:01.971Z', quality_reviewed_at='2026-10-03T10:22:01.971Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A2','official-web','https://www.hillgatevillage.com/the-facts','Coloured Houses','084a656e76ed46fcc892309e14fcf9b23a1b3a84aae8ac60ba6ca80417daffac','GENERAL','OWNER_OPERATOR',1,'OK',200,'ac70504e85eb9926d2faf36b319cbdf7ead64288fb9e23d2f9bc4676d6aeb15d','2026-10-03T10:22:01.971Z','2027-01-01T10:22:01.971Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A8',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:03.987Z', hours_next_check_at='2027-01-01T10:22:03.987Z', quality_reviewed_at='2026-10-03T10:22:03.987Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A8';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A8','official-web','https://www.lera.org.uk/','Roupell Street','eb2d60daba7ca451c5de0ab2f280dd6c332a82068241abea6f3c65b153058be2','GENERAL','OWNER_OPERATOR',1,'OK',200,'eb32a8f9a9453e6a74f017dcb4b62d8e227f590de776d957aa8d7c0ab07e626f','2026-10-03T10:22:03.987Z','2027-01-01T10:22:03.987Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B11',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:04.520Z', hours_next_check_at='2026-10-31T10:22:04.520Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): Official visit page confirms public opening times; standard house access is treated as scheduled public entry.' WHERE id='B11';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B11','official-web','https://bostonmanorhouse.org/visit-us/','Boston Manor House','ca48a0c80df21cccb1da89b760880b8aba5849da92e1e6e83a3a5e22694370fc','GENERAL','OWNER_OPERATOR',1,'OK',200,'16f9ab677c96b3c65fcea1ceed7174aab21b30d9b6d2a144590b89aff4a8d53f','2026-10-03T10:22:04.520Z','2026-10-31T10:22:04.520Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B11','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B11' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P5',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:06.289Z', hours_next_check_at='2026-10-10T10:22:06.289Z', quality_reviewed_at='2026-10-03T10:22:06.289Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P5','official-web','https://www.lambeth.gov.uk/parks/rookery-streatham','The Rookery Gardens','56a1d81f02dbab2a755a0f90f46f393a2f2299159dfa95875d02eac7c68f92a2','GENERAL','PUBLIC_AUTHORITY',1,'BLOCKED',403,'93c24f424a903a16f849461362ad657618eb2c1e913ee65ac7fc29904818a232','2026-10-03T10:22:06.289Z','2026-10-10T10:22:06.289Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P5','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.lambeth.gov.uk/parks/rookery-streatham","httpStatus":403}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P5' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P5','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P5' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P5','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P5' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R1',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:09.002Z', hours_next_check_at='2026-10-31T10:22:09.002Z', quality_reviewed_at='2026-10-03T10:22:09.002Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R1';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R1','official-web','https://www.royalparks.org.uk/visit/parks/brompton-cemetery','Brompton Cemetery','6965fe0a12fd47a092ab5940109c8b46070651e55682f4e2d46bc533a823e996','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'95d036d2d7acf1bb1b271621b6748e38bcfd22c893a7ddba534b8adcf9223846','2026-10-03T10:22:09.002Z','2026-10-31T10:22:09.002Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R1','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R1' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R1','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R1' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R8',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:10.033Z', hours_next_check_at='2026-10-31T10:22:10.033Z', quality_reviewed_at='2026-10-03T10:22:10.033Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R8';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R8','official-web','https://www.nunheadcemetery.org.uk/','Nunhead Cemetery','d2fdb65f993e5b16d5d1919bbb998f07a30a336ebb056000699823195fcc0ad6','GENERAL','OWNER_OPERATOR',1,'REDIRECTED',200,'ff14c73e5dd8feeadbb58a8a761fe428a9187c96076215f903601fce17faaf8d','2026-10-03T10:22:10.033Z','2026-10-31T10:22:10.033Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R8','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R8' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V10',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V10','official-web','https://en.wikipedia.org/wiki/Gipsy_Hill','Gipsy Hill','def807a0c16e8d5d8724996ab618dbe8b1555d9499a3cabce46eacf9911171bd','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'V10','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Gipsy_Hill"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='V10' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V3',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:10.302Z', hours_next_check_at='2027-01-01T10:22:10.302Z', quality_reviewed_at='2026-10-03T10:22:10.302Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V3','official-web','https://www.royalparks.org.uk/visit/parks/richmond-park/king-henrys-mound','King Henry''s Mound','0ff684b56b427fe84b5e6e0ffe2727797723c499ee0d7e41e11ea612707e0130','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'0ee5c7a899c392d73ef74b44ebe6ae6fb666c308d6299dbc91e0e11343186562','2026-10-03T10:22:10.302Z','2027-01-01T10:22:10.302Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P3',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:12.993Z', hours_next_check_at='2026-10-10T10:22:12.993Z', quality_reviewed_at='2026-10-03T10:22:12.993Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P3','official-web','https://www.royalparks.org.uk/visit/parks/richmond-park/isabella-plantation','Isabella Plantation','987ddc0f237fcc8b84d028dbcfa1d906b4a402bc027f5ec3072e8133fc3b4dba','GENERAL','PUBLIC_AUTHORITY',1,'OK',200,'daa4fecfaa666e7d393f7ea92418cc4a0a1b5c0c1bb21771ec9063345815c298','2026-10-03T10:22:12.993Z','2026-10-10T10:22:12.993Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P3','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P3' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P3','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P3' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R3',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:13.072Z', hours_next_check_at='2026-10-31T10:22:13.072Z', quality_reviewed_at='2026-10-03T10:22:13.072Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R3','official-web','https://www.stsophia.org.uk/','Greek Orthodox Cathedral of the Divine Wisdom','36e99292096ab3b51681d0f9230e9939017a0531d868cec706b7b187b8d622c2','GENERAL','OWNER_OPERATOR',1,'OK',200,'2d33969ae03e21b43ab000dc5f7cb5d579c8a492ea9ce8616503c058a2374e6f','2026-10-03T10:22:13.072Z','2026-10-31T10:22:13.072Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R3','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R3' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R3','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R3' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R4',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:13.428Z', hours_next_check_at='2026-10-31T10:22:13.428Z', quality_reviewed_at='2026-10-03T10:22:13.428Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R4';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R4','official-web','https://buddhapadipa.com/','Buddhapadipa Temple','5e88e7adf84e122c3be7687a72d04194dedaa78084e3450a70ab6717a10ac0eb','GENERAL','OWNER_OPERATOR',1,'OK',200,'ae3dc1f456104f4dd25cb4fafd448916d44675c8c9ebb29d335fb60c7e98552a','2026-10-03T10:22:13.428Z','2026-10-31T10:22:13.428Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R4','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R4' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R4','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R4' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R4','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R4' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A4',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:16.951Z', hours_next_check_at='2027-01-01T10:22:16.951Z', quality_reviewed_at='2026-10-03T10:22:16.951Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A4';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A4','official-web','https://www.parkland-walk.org.uk/','Parkland Walk','136823e1936395c18aa9c86ac50974db628106b9bd5cae988135d6fdd9246d73','GENERAL','OWNER_OPERATOR',1,'OK',200,'c71ff4aea733f695fda393eb5eb91febeba67c7075a15aad37e4728d4ea3a3ff','2026-10-03T10:22:16.951Z','2027-01-01T10:22:16.951Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A9',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A9';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A9','official-web','https://en.wikipedia.org/wiki/Comyn_Ching_Triangle','Ching Court','ef10678025894dd45068c3ff94fe8505cd010355785faee17daf11088017503f','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'A9','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Comyn_Ching_Triangle"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='A9' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A10',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A10','official-web','https://en.wikipedia.org/wiki/Lamb%27s_Conduit_Street','Lamb''s Conduit Passage','6fc1ea75de42e912f4f93a6e23865a893715a3dd1cd61ba41b181c6b2c330558','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'A10','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Lamb%27s_Conduit_Street"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='A10' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A13',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:18.103Z', hours_next_check_at='2027-01-01T10:22:18.103Z', quality_reviewed_at='2026-10-03T10:22:18.103Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A13';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A13','official-web','https://www.shakespearesglobe.com/discover/shakespeares-world/the-globe/','Original site of the Globe Theatre','00fb98ca17a7888aeee1adc34ade057e65c2ff42cd155592a13dc69ebe3fe14b','GENERAL','OWNER_OPERATOR',1,'OK',200,'09ee819d754300d08c82f06ac542df658a6ffe483e9b0542364848208feda178','2026-10-03T10:22:18.103Z','2027-01-01T10:22:18.103Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R6',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:21.251Z', hours_next_check_at='2026-10-31T10:22:21.251Z', quality_reviewed_at='2026-10-03T10:22:21.251Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R6';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R6','official-web','https://parish.rcdow.org.uk/ukrainianchurch/about-the-parish/','Ukrainian Catholic Cathedral','e6b52869ac2dc92564929cfb9fee4e29cbcebe1b11b670c61d69d6421445d537','GENERAL','OWNER_OPERATOR',1,'OK',200,'469e48ce8709352e795dc45b881fd947ae548b1f7e58ba8da9b200d3a45db47a','2026-10-03T10:22:21.251Z','2026-10-31T10:22:21.251Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R6','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R6' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R6','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R6' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S7',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:22.781Z', hours_next_check_at='2026-10-31T10:22:22.781Z', quality_reviewed_at='2026-10-03T10:22:22.781Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S7','official-web','https://victoriaparkmarket.com/','Victoria Park Market','81b717742546208758b6fead3c7e4b14718673f73a1361ab28c47434ccdfc3ff','GENERAL','OWNER_OPERATOR',1,'OK',200,'a4389dddb08f8293fe8e3a2a71172daf7c58fdf046aa34d6c27543ebc49ca78f','2026-10-03T10:22:22.781Z','2026-10-31T10:22:22.781Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S7','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S7' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S7','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S7' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S5',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S5','official-web','https://en.wikipedia.org/wiki/Walthamstow_Market','Walthamstow Market','fdb7b016bf974e0dd68e35f4ea6f5288fd25b1bf8ddea9ad9658761ef3ec1dd4','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S5','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Walthamstow_Market"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S5' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S5','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S5' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S6',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:23.457Z', hours_next_check_at='2026-10-31T10:22:23.457Z', quality_reviewed_at='2026-10-03T10:22:23.457Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S6';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S6','official-web','https://shepherdsbushmarket.org/','Shepherd''s Bush Market','4a7071208a4431bfe189a49c66e6daa7c92b24989ccc2a35fa361813935bcea6','GENERAL','OWNER_OPERATOR',1,'OK',200,'0d125cbb2124c9835d363bd45dacf3a130cd918ba6e9c074bb6b4c3b03c42d6f','2026-10-03T10:22:23.457Z','2026-10-31T10:22:23.457Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S6','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S6' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S6','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S6' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','LA-36EE3D05',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='LA-36EE3D05';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-36EE3D05','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-36EE3D05' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-36EE3D05','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-36EE3D05' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-36EE3D05','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-36EE3D05' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','LA-85EA8890',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='LA-85EA8890';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-85EA8890','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-85EA8890' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-85EA8890','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-85EA8890' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-85EA8890','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-85EA8890' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-85EA8890','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-85EA8890' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S2',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED', hours_last_checked_at='2026-10-03T10:22:25.377Z', hours_next_check_at='2026-10-31T10:22:25.377Z', quality_reviewed_at='2026-10-03T10:22:25.377Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S2','official-web','https://www.japanhouselondon.uk/','Japan House','d908d296b39b0b1e9cf9a4669b662e09f43be1bbf0ee360d4877255173c570f1','GENERAL','OWNER_OPERATOR',1,'OK',200,'12d3f4b546cd00c9c96bf4df2d23858eb26ceece1a6efb762e97f528e6407bb5','2026-10-03T10:22:25.377Z','2026-10-31T10:22:25.377Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
DELETE FROM place_opening_periods WHERE place_id='S2' AND experience_id IS NULL;
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S2',1,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S2' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:25.377Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S2',2,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S2' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:25.377Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S2',3,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S2' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:25.377Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S2',4,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S2' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:25.377Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S2',5,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S2' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:25.377Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S2',6,1,'10:00','20:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S2' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:25.377Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S2',0,1,'12:00','18:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S2' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:25.377Z');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B7',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='HIGH', planner_ready=0, access_type_v2='APPOINTMENT_ONLY', booking_mode='REQUIRED', admission_type='PAID', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:27.522Z', hours_next_check_at='2026-10-31T10:22:27.522Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (HIGH): Official museum page explicitly states that visits are by appointment only and lists paid group tours.' WHERE id='B7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B7','official-web','https://www.londonscottishhouse.org/museum','London Scottish House','241b7df2d18f0c34c6a4c11d0619afa116d11796c3f40793c67fac6979909bbb','GENERAL','OWNER_OPERATOR',1,'OK',200,'83de10cd327039e36d350fb646e58b7b3cd9a17f53bfb152f00def23f9ea645d','2026-10-03T10:22:27.522Z','2026-10-31T10:22:27.522Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'B7','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='B7' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V1',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:28.285Z', hours_next_check_at='2027-01-01T10:22:28.285Z', quality_reviewed_at='2026-10-03T10:22:28.285Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V1';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V1','official-web','https://www.alexandrapalace.com/','Alexandra Palace','e1da705946dc76e820a27b61367c3860cfb972c1249de4bd66cbd41ffb6fd02d','GENERAL','OWNER_OPERATOR',1,'OK',200,'e496c637c4209874d8b82b209d2a63102be58049930558c385a31a02808b52cd','2026-10-03T10:22:28.285Z','2027-01-01T10:22:28.285Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S3',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S3','official-web','https://www.atlasobscura.com/places/osterley-bookshop','Osterley Bookshop','ae50bf9962df118b08460a5ca233608283632121c1e8a8a5229f159fb40a0fe2','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S3','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://www.atlasobscura.com/places/osterley-bookshop"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S3' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S3','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S3' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S3','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S3' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R5',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:31.450Z', hours_next_check_at='2026-10-31T10:22:31.450Z', quality_reviewed_at='2026-10-03T10:22:31.450Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R5','official-web','https://stpancrasoldchurch.posp.co.uk/','St Pancras Old Church','ac1c1cda86978e10432198d07159c70fc559750fd0842383c0be5226d4f6d643','GENERAL','OWNER_OPERATOR',1,'OK',200,'e039c839e18f50d573b7527bbbaa59d6f90315c2a15f2c45ca42b5171def7ba6','2026-10-03T10:22:31.450Z','2026-10-31T10:22:31.450Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R5','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R5' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P9',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:31.565Z', hours_next_check_at='2026-10-10T10:22:31.565Z', quality_reviewed_at='2026-10-03T10:22:31.565Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P9';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P9','official-web','https://dalstongarden.org/','Dalston Eastern Curve Garden','4fc0e3d913b6eb36e32109765a83a2b7a08fcb46cf5f50226d1d361bc6b0450e','GENERAL','OWNER_OPERATOR',1,'OK',200,'ea06967bb09e5cf31916e91a21d4f4aa5b514e68aae1141d6e072401a929188f','2026-10-03T10:22:31.565Z','2026-10-10T10:22:31.565Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P9','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P9' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P9','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P9' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R2',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:32.602Z', hours_next_check_at='2026-10-31T10:22:32.602Z', quality_reviewed_at='2026-10-03T10:22:32.602Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R2','official-web','https://www.kensalgreencemetery.com/','Kensal Green Cemetery','43151f97a59e391faa47a132dcc710ef66144d657adf840e66af8a32bd9fb352','GENERAL','OWNER_OPERATOR',1,'OK',200,'9e353c5adcbe8cff29b0a25c7034ebfc0dc57e0eb547e081c5e5dfbe913a7aa3','2026-10-03T10:22:32.602Z','2026-10-31T10:22:32.602Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R10',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:35.847Z', hours_next_check_at='2026-10-31T10:22:35.847Z', quality_reviewed_at='2026-10-03T10:22:35.847Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R10','official-web','https://www.lincolnsinn.org.uk/about-us/chapel/','Lincoln’s Inn Chapel','4a2e7f05946b21325c0faa46ad31fa8d619399a486bd6998dee72e0e991f02f8','GENERAL','OWNER_OPERATOR',1,'OK',200,'7f2733726d6d3f97f1759aa88611fa36a79982427af10c665d05462dc7c8eaf2','2026-10-03T10:22:35.847Z','2026-10-31T10:22:35.847Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R10','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R10' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R10','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R10' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R11',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:37.053Z', hours_next_check_at='2026-10-31T10:22:37.053Z', quality_reviewed_at='2026-10-03T10:22:37.053Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R11';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R11','official-web','https://www.royalchapelsavoy.org/','The King’s Chapel of the Savoy','a485527d5b83a1ade13bf84014c89e20fb4898a97d83d01d593d03ae4693d9c7','GENERAL','OWNER_OPERATOR',1,'OK',200,'a93ba7a94b65d5e7f6990ca252762b22c034b65b6d4291d71e719335893ce9dc','2026-10-03T10:22:37.053Z','2026-10-31T10:22:37.053Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R11','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R11' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R11','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R11' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M7',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:38.534Z', hours_next_check_at='2026-10-31T10:22:38.534Z', quality_reviewed_at='2026-10-03T10:22:38.534Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M7','official-web','https://foundlingmuseum.org.uk/','The Foundling Museum','81a0d0f3e02c4e2e32f3c0a58f70f038d87becaf2262e889f511264b94d5799a','GENERAL','OWNER_OPERATOR',1,'OK',200,'afaa1b3b3d273801fc8013a30017b93d80353262b245be9d3f5c48c3ff0d482e','2026-10-03T10:22:38.534Z','2026-10-31T10:22:38.534Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M7','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M7' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M7','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M7' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S8',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:39.754Z', hours_next_check_at='2026-10-31T10:22:39.754Z', quality_reviewed_at='2026-10-03T10:22:39.754Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S8';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S8','official-web','https://alfiesantiques.com/','Alfies Antique Market','9c1299edd76d2488998ac743c4c1549998ba4f5a8460168d10a58bc6d71a227a','GENERAL','OWNER_OPERATOR',1,'OK',200,'42391986a9261dfb0a5cf290c0ac14e59ee63b2a05151a604cdd1e7f911fde6b','2026-10-03T10:22:39.754Z','2026-10-31T10:22:39.754Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S8','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S8' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A7',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A7','official-web','https://en.wikipedia.org/wiki/Denmark_Street','Denmark Street','eb9d6350e32e4d04e47b09b5e676ef713265bbd6704f5c561a79ad1e00a3f968','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'A7','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Denmark_Street"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='A7' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S9',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED', hours_last_checked_at='2026-10-03T10:22:41.457Z', hours_next_check_at='2026-10-31T10:22:41.457Z', quality_reviewed_at='2026-10-03T10:22:41.457Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S9';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S9','official-web','https://eu.assouline.com/pages/maison?srsltid=AfmBOopOKjheYdt4fZhk0xICHci_NjG9srnlImSDqTPqZJOaGccQtvLD','Maison Assouline','38795d8a3321ff0eb3d9c70e661a7e1287f4969eb9b42375348623b0103dc230','GENERAL','OWNER_OPERATOR',1,'OK',200,'65734162596a65de71d7a8e797db5909dbb845468a87c96aa799bc5922c47a9c','2026-10-03T10:22:41.457Z','2026-10-31T10:22:41.457Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
DELETE FROM place_opening_periods WHERE place_id='S9' AND experience_id IS NULL;
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S9',1,1,'10:30','19:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S9' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:41.457Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S9',2,1,'10:30','19:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S9' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:41.457Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S9',3,1,'10:30','19:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S9' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:41.457Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S9',4,1,'10:30','21:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S9' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:41.457Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S9',5,1,'10:30','21:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S9' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:41.457Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S9',6,1,'10:30','21:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S9' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:41.457Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S9',0,1,'12:00','18:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S9' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:22:41.457Z');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S9','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S9' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A6',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:43.044Z', hours_next_check_at='2027-01-01T10:22:43.044Z', quality_reviewed_at='2026-10-03T10:22:43.044Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A6';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A6','official-web','https://www.camdenpassageislington.co.uk/','Camden Passage','be85be59d319e67c00d8651283549daca8fcef62c515d2c2687f916af2e65bce','GENERAL','OWNER_OPERATOR',1,'OK',200,'3ff6bd1d86f7c410aa128c048bb6fe864759f086ecb98a55cffe07376d76b4c1','2026-10-03T10:22:43.044Z','2027-01-01T10:22:43.044Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M6',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:43.379Z', hours_next_check_at='2026-10-31T10:22:43.379Z', quality_reviewed_at='2026-10-03T10:22:43.379Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M6';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M6','official-web','https://www.cartoonmuseum.org/','The Cartoon Museum','80ebed7cff0af5423d9f0a2cb5e1099337fdbb6071bbf08a0f5e09d5018fa1c4','GENERAL','OWNER_OPERATOR',1,'OK',200,'687fb8a587304485ea163b8a1a82f806ed61d5c0692786533992595fbf2768eb','2026-10-03T10:22:43.379Z','2026-10-31T10:22:43.379Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M6','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M6' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M6','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M6' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M6','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M6' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M17',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:47.153Z', hours_next_check_at='2026-10-31T10:22:47.153Z', quality_reviewed_at='2026-10-03T10:22:47.153Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M17';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M17','official-web','https://www.english-heritage.org.uk/visit/places/eltham-palace-and-gardens/','Eltham Palace','ad748d500cb989b988a8b01a7e2c982124114486eb3f5d53992e7425f0488464','GENERAL','OWNER_OPERATOR',1,'OK',200,'fae3b8812e67b2e82cda6f9662bc0977c7a289cae547b19709133b5fc17870ac','2026-10-03T10:22:47.153Z','2026-10-31T10:22:47.153Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M17','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M17' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M17','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M17' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V5',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:47.423Z', hours_next_check_at='2027-01-01T10:22:47.423Z', quality_reviewed_at='2026-10-03T10:22:47.423Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V5','official-web','https://callypark.london/','Caledonian Park Clock Tower','b9b5c14dfaf4939cb854fafeec35f8d145df14cbf5ff1c490e589050a1a3b720','GENERAL','OWNER_OPERATOR',1,'OK',200,'f6b7b337a9082b829b586244f7a9fe0857fb7128456d4815d05667d81efb4958','2026-10-03T10:22:47.423Z','2027-01-01T10:22:47.423Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'V5','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='V5' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M1',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:47.705Z', hours_next_check_at='2026-10-31T10:22:47.705Z', quality_reviewed_at='2026-10-03T10:22:47.705Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M1';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M1','official-web','https://thephotographersgallery.org.uk/','The Photographers'' Gallery','2fe9a1c542a6b4c152fb7f50c50b77a645acec57719e58f421e78bde3b99ea2d','GENERAL','OWNER_OPERATOR',1,'OK',200,'a6fab5071f34214c605d976cdb9307e72ed2db5ff3b8a4ef091374d5fb197f93','2026-10-03T10:22:47.705Z','2026-10-31T10:22:47.705Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M1','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M1' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M1','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M1' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','LA-E562A6D2',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='LA-E562A6D2';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E562A6D2','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E562A6D2' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E562A6D2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E562A6D2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-E562A6D2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-E562A6D2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M18',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:51.213Z', hours_next_check_at='2026-10-31T10:22:51.213Z', quality_reviewed_at='2026-10-03T10:22:51.213Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M18';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M18','official-web','https://museumofthehome.org.uk/','Museum of the Home','c5583d7514d546811b4176d0599ea49e0294982252a78a69a54ff02c17b30a2d','GENERAL','OWNER_OPERATOR',1,'OK',200,'cf1b6f0b4aabcf81e6379b9fdbda36aa6526c78affde628cf2b75759c55d15d1','2026-10-03T10:22:51.213Z','2026-10-31T10:22:51.213Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M18','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M18' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M18','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M18' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M18','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M18' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S11',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:51.474Z', hours_next_check_at='2026-10-31T10:22:51.474Z', quality_reviewed_at='2026-10-03T10:22:51.474Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S11';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S11','official-web','https://poetrypharmacy.co.uk/','Poetry Pharmacy','143705c62f6c5c16dca96618fc6e8a23c9ee51cfedccaa85b26fe90b549ea434','GENERAL','OWNER_OPERATOR',1,'OK',200,'9055c3bce2b1b1873da49ac619b9113d5c527c96f47e3d952444055312872f01','2026-10-03T10:22:51.474Z','2026-10-31T10:22:51.474Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S11','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S11' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S11','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S11' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M16',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:51.918Z', hours_next_check_at='2026-10-31T10:22:51.918Z', quality_reviewed_at='2026-10-03T10:22:51.918Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M16';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M16','official-web','https://thecharterhouse.org/','The Charterhouse','a9a054ccee761f98b13f651b6f246e354339c52175b7d884c5d54cc9b07d9355','GENERAL','OWNER_OPERATOR',1,'OK',200,'1c821034a0543b0610ec17c62716e134d7dd78ffa8e458aa3f0463a4c60ccdbd','2026-10-03T10:22:51.918Z','2026-10-31T10:22:51.918Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M16','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M16' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M16','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M16' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R7',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:57.075Z', hours_next_check_at='2026-10-31T10:22:57.075Z', quality_reviewed_at='2026-10-03T10:22:57.075Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R7','official-web','https://www.ahbtt.org.uk/','All Hallows by the Tower','0c9903a6e86ab6399264bfce61732e634227a9cd12d9a83040e6a886ccc38d91','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'8a7b114e5e65f2f67e4178fb0f3da000ef4d7c5e639cc1aa523aacd531475412','2026-10-03T10:22:57.075Z','2026-10-31T10:22:57.075Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R7','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.ahbtt.org.uk/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R7' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R7','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R7' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R7','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R7' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','R9',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:22:57.107Z', hours_next_check_at='2026-10-31T10:22:57.107Z', quality_reviewed_at='2026-10-03T10:22:57.107Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='R9';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('R9','official-web','https://www.fitzroviachapel.org/','Fitzrovia Chapel','b3f79e1a47335080bd46573507b68eb0e35793d336ac689b11211014f428b8f8','GENERAL','OWNER_OPERATOR',1,'OK',200,'7ef3e6fb04309cfabeaaa05a3ceb85ce0eb1f46caabc0ba3a159ec3f98f21b4c','2026-10-03T10:22:57.107Z','2026-10-31T10:22:57.107Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R9','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R9' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R9','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R9' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'R9','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='R9' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','V4',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:22:57.579Z', hours_next_check_at='2027-01-01T10:22:57.579Z', quality_reviewed_at='2026-10-03T10:22:57.579Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='V4';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('V4','official-web','https://www.horniman.ac.uk/event/gardens/','Horniman Gardens','5e9f3a3a22da005987a7fa81fd952c0b89ce0155b280461ae9d1cd3f1aa13f76','GENERAL','OWNER_OPERATOR',1,'OK',200,'25a5bb42392ef3372ce1004180dafbdfa6b52bcc0d4f8ffb7e386ad139414b40','2026-10-03T10:22:57.579Z','2027-01-01T10:22:57.579Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P8',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:01.370Z', hours_next_check_at='2026-10-10T10:23:01.370Z', quality_reviewed_at='2026-10-03T10:23:01.370Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P8';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P8','official-web','https://www.wildlondon.org.uk/nature-reserves/camley-street-natural-park','Camley Street Natural Park','4d62533d38e147f4195e4c1b4115ee5d353c13f88ec3ece5956f2e9f934a71a6','GENERAL','OWNER_OPERATOR',1,'OK',200,'a1913e7faae1c44bdae0738e0a92036ae1fdda30b0a5e5264c6523da91397f87','2026-10-03T10:23:01.370Z','2026-10-10T10:23:01.370Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P8','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P8' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M14',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:02.231Z', hours_next_check_at='2026-10-31T10:23:02.231Z', quality_reviewed_at='2026-10-03T10:23:02.231Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M14';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M14','official-web','https://www.heathrobinsonmuseum.org/','Heath Robinson Museum','a5709cad9922a082ee6d9e585ae3467ecff87024769a2dbe0e4c447d987e866a','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'370a0419d481d7b6aedd40fdb43d2145e68426ecefb1809715190a4a42aa1ba3','2026-10-03T10:23:02.231Z','2026-10-31T10:23:02.231Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M14','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.heathrobinsonmuseum.org/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M14' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M14','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M14' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M14','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M14' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M12',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:02.434Z', hours_next_check_at='2026-10-31T10:23:02.434Z', quality_reviewed_at='2026-10-03T10:23:02.434Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M12';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M12','official-web','https://www.crystalpalaceparktrust.org/pages/crystal-palace-museum','Crystal Palace Museum','8811a5a49f79ce8690228ab4b041d5ed77fa0372e22798f58c1b6945c927d07e','GENERAL','OWNER_OPERATOR',1,'BROKEN',0,'','2026-10-03T10:23:02.434Z','2026-10-31T10:23:02.434Z','The operation was aborted due to timeout')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M12','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"https://www.crystalpalaceparktrust.org/pages/crystal-palace-museum","httpStatus":null,"error":"The operation was aborted due to timeout"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M12' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M12','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M12' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M12','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M12' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M3',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:06.058Z', hours_next_check_at='2026-10-31T10:23:06.058Z', quality_reviewed_at='2026-10-03T10:23:06.058Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M3','official-web','https://twotempleplace.org/','Two Temple Place','cd5156ec2b8cd5802df918a58fbcea6fa39646983cb0171b5991f1538320f8a6','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'f6d202f04b7b6a3713eda4ba515d72263217bde73128d0f69471ea37621fca90','2026-10-03T10:23:06.058Z','2026-10-31T10:23:06.058Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M3','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://twotempleplace.org/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M3' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M3','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M3' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M3','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M3' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M10',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:06.065Z', hours_next_check_at='2026-10-31T10:23:06.065Z', quality_reviewed_at='2026-10-03T10:23:06.065Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M10','official-web','https://bentleypriorymuseum.org.uk/','Bentley Priory Museum','e7bc924332993ee520401aa0d5def660809ea398c6f41f488ae521beed9d3097','GENERAL','OWNER_OPERATOR',1,'OK',200,'3f1b08cfcbf2975156844846bcccfaa85801389770362ed404ec9d1dedf0914e','2026-10-03T10:23:06.065Z','2026-10-31T10:23:06.065Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M10','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M10' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M10','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M10' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M8',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:10.422Z', hours_next_check_at='2026-10-31T10:23:10.422Z', quality_reviewed_at='2026-10-03T10:23:10.422Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M8';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M8','official-web','https://www.florence-nightingale.co.uk/','Florence Nightingale Museum','981f70d8afdd49f1fc2be0e3d91c42bbd35e2cc9dd9cb4323e62db660443a5b6','GENERAL','OWNER_OPERATOR',1,'OK',200,'9236112a61cfe55d5a9804c7d0d32888d5c9204237a8c770938900d5cc48733f','2026-10-03T10:23:10.422Z','2026-10-31T10:23:10.422Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M8','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M8' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M8','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M8' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M13',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:11.127Z', hours_next_check_at='2026-10-31T10:23:11.127Z', quality_reviewed_at='2026-10-03T10:23:11.127Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M13';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M13','official-web','https://www.ucl.ac.uk/engage/museums-collections/petrie-museum-egyptian-and-sudanese-archaeology','Petrie Museum of Egyptian Archaeology','b08b2c1c7016f05df0048110a4cf9786913464ec59e2f8a0016e6740f83c7b98','GENERAL','OWNER_OPERATOR',1,'REDIRECTED',200,'2e1026e45b32668331c5796a7e980237c7a491632d4da5a570c6ee28f53aeb12','2026-10-03T10:23:11.127Z','2026-10-31T10:23:11.127Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M13','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M13' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M13','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M13' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M4',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:17.067Z', hours_next_check_at='2026-10-31T10:23:17.067Z', quality_reviewed_at='2026-10-03T10:23:17.067Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M4';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M4','official-web','https://www.wimbledonwindmill.org.uk/','Wimbledon Windmill Museum','dd35f45b564a30503667632cdad6f1adb951905fdde8e4a34844f336679ecc68','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'0c680bed609f0a4f749f660f68779a54b528d6f0ac1f06a566aa62b0f628d8c6','2026-10-03T10:23:17.067Z','2026-10-31T10:23:17.067Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M4','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.wimbledonwindmill.org.uk/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M4' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M4','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M4' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M4','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M4' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M4','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M4' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M5',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:17.435Z', hours_next_check_at='2026-10-31T10:23:17.435Z', quality_reviewed_at='2026-10-03T10:23:17.435Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M5','official-web','https://www.english-heritage.org.uk/visit/places/home-of-charles-darwin-down-house/','Home of Charles Darwin','578b3d9bada0aeb9c05f3f9441377eb0973febfe765e7cd7cceb5d7752f3d2a1','GENERAL','OWNER_OPERATOR',1,'OK',200,'977ad1464de0481ec80b1fd4189855f74a6dd1d7f04cdcac8cb3ba5b30619633','2026-10-03T10:23:17.435Z','2026-10-31T10:23:17.435Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M5','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M5' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M5','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M5' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M2',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:20.102Z', hours_next_check_at='2026-10-31T10:23:20.102Z', quality_reviewed_at='2026-10-03T10:23:20.102Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M2','official-web','https://wmgallery.org.uk/','William Morris Gallery','e8a6a3ad0193fd47b845aab2a578400f41b60ebe398ca21b333f4b602786c210','GENERAL','OWNER_OPERATOR',1,'OK',200,'dce2ccea3073b1956dffe76875029e05d9e4efd8c8780036b07268bdac1d1699','2026-10-03T10:23:20.102Z','2026-10-31T10:23:20.102Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M2','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M2' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M2','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M2' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M9',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:20.904Z', hours_next_check_at='2026-10-31T10:23:20.904Z', quality_reviewed_at='2026-10-03T10:23:20.904Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M9';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M9','official-web','https://battleofbritainbunker.co.uk/','Battle of Britain Bunker','af3e6da85d681f9b7cfc5eaf37d8721a5c8a7744420e10aa06d02f90bde02f1d','GENERAL','OWNER_OPERATOR',1,'OK',200,'20d2b42332da625f6085fde5cdf196d88577540616a7f15335331dbf34aef8e1','2026-10-03T10:23:20.904Z','2026-10-31T10:23:20.904Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M9','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M9' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M9','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M9' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M11',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:22.042Z', hours_next_check_at='2026-10-31T10:23:22.042Z', quality_reviewed_at='2026-10-03T10:23:22.042Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M11';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M11','official-web','https://www.nationalarchives.gov.uk/','The National Archives','2b2adf6b5d45f9fbb5e7ae0a1ed0f17fb62e04866f74e556164d2010ec5efa59','GENERAL','PUBLIC_AUTHORITY',1,'BLOCKED',403,'81fe27d92dee308a5d92c1b099acf8b90356be96a80889c642e65f529ea0bf07','2026-10-03T10:23:22.042Z','2026-10-31T10:23:22.042Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M11','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.nationalarchives.gov.uk/","httpStatus":403}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M11' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M11','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M11' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M11','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M11' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','B4',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='CUSTOMER_ONLY', booking_mode='NONE', admission_type='FREE', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED', hours_last_checked_at='2026-10-03T10:23:24.541Z', hours_next_check_at='2026-12-02T10:23:24.541Z', quality_reviewed_at='2026-10-03', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence. Access reviewed 2026-10-03 (MEDIUM): The former Granada operates as Buzz Bingo Tooting with published club hours. Entry is treated as customer access without advance booking; paid games and age or membership conditions remain separate.' WHERE id='B4';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('B4','official-web','https://www.buzzbingo.com/club/tooting.html','Granada Bingo Hall','e54e839cb512855e33c8951938d227281db6009747436cadbd73a406c981aedb','GENERAL','OWNER_OPERATOR',1,'OK',200,'fda476a29ae1bf9c46d11f7a4d701f6c5eb2b291ec8752d5b49b2c49a111bd87','2026-10-03T10:23:24.541Z','2026-12-02T10:23:24.541Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
DELETE FROM place_opening_periods WHERE place_id='B4' AND experience_id IS NULL;
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('B4',1,1,'00:00','23:59',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='B4' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:24.541Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('B4',2,1,'10:00','04:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='B4' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:24.541Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('B4',3,1,'10:00','04:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='B4' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:24.541Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('B4',4,1,'10:00','04:00',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='B4' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:24.541Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('B4',5,1,'00:00','23:59',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='B4' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:24.541Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('B4',6,1,'00:00','23:59',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='B4' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:24.541Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('B4',0,1,'00:00','23:59',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='B4' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:24.541Z');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S1',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:25.879Z', hours_next_check_at='2026-10-31T10:23:25.879Z', quality_reviewed_at='2026-10-03T10:23:25.879Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S1';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S1','official-web','https://hurlinghambooks.com/','Hurlingham Books','38ca1bfd1cc2c62fc2f78f951cea4587c88e22a25365eb2f0be17548ed3737c6','GENERAL','OWNER_OPERATOR',1,'OK',200,'4d32ab8301b8eb4c3e867a92f986d097f44692850e54156407b94497259590e0','2026-10-03T10:23:25.879Z','2026-10-31T10:23:25.879Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S1','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S1' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S1','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S1' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S10',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='VERIFIED', hours_last_checked_at='2026-10-03T10:23:26.024Z', hours_next_check_at='2026-10-31T10:23:26.024Z', quality_reviewed_at='2026-10-03T10:23:26.024Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S10','official-web','https://woodstreetindoormarket.co.uk/','Wood Street Indoor Market','80b8c3deb72a3458f931c6803e4c8e4eacbaf173a1cfcad16648acc73ea8e9e0','GENERAL','OWNER_OPERATOR',1,'OK',200,'595beaef27c7202d21eecf8240539546e6bb8fd2c0867bbcbea7623fac489263','2026-10-03T10:23:26.024Z','2026-10-31T10:23:26.024Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
DELETE FROM place_opening_periods WHERE place_id='S10' AND experience_id IS NULL;
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S10',2,1,'10:00','17:30',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S10' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:26.024Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S10',3,1,'10:00','17:30',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S10' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:26.024Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S10',4,1,'10:00','17:30',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S10' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:26.024Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S10',5,1,'10:00','17:30',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S10' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:26.024Z');
INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES ('S10',6,1,'10:00','17:30',NULL,NULL,
          (SELECT source_id FROM place_sources WHERE place_id='S10' AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),'2026-10-03T10:23:26.024Z');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S10','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S10' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','LA-6749E2E6',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='LA-6749E2E6';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6749E2E6','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6749E2E6' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6749E2E6','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6749E2E6' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-6749E2E6','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-6749E2E6' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O3',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O3';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O3','official-web','https://en.wikipedia.org/wiki/Brown_Hart_Gardens','Brown Hart Gardens','3fa471b9fce0a4b472051052e40a71843c0deabf1658a682fe9311fcad7ddae0','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O3','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Brown_Hart_Gardens"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O3' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O3','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O3' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','LA-8AE5679E',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='LA-8AE5679E';
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8AE5679E','SOURCE_MISSING','HIGH','Find an official or authoritative source URL.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8AE5679E' AND issue_type='SOURCE_MISSING' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'LA-8AE5679E','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='LA-8AE5679E' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O16',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O16';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O16','official-web','https://banksyexplained.com/basquiat-murals-2017/','Banksy Basquiat','0bb7d34eb8e015f8759857e624fa1d0230fc2439b70a01a2dc82c85a496fe703','GENERAL','TRUSTED_EDITORIAL',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O16','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://banksyexplained.com/basquiat-murals-2017/"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O16' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O12',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O12';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O12','official-web','https://en.wikipedia.org/wiki/Clattern_Bridge','Clattern Bridge','0eafac8befb446cc07c828f693364e1f943031425b86455460b46cd1d0c85dd8','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O12','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Clattern_Bridge"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O12' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','M15',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:28.812Z', hours_next_check_at='2026-10-31T10:23:28.812Z', quality_reviewed_at='2026-10-03T10:23:28.812Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='M15';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('M15','official-web','https://museumstjohn.org.uk/','Museum of the Order of Saint John','8d4dff56741732b309d363829a578beee712d810a894d54a3f4eb191e9cde0b4','GENERAL','OWNER_OPERATOR',1,'OK',200,'226ee6dd33fe3d6a5a13bf07782602b720746d9f2863218c744c0669c915422c','2026-10-03T10:23:28.812Z','2026-10-31T10:23:28.812Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M15','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M15' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'M15','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='M15' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A1',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:23:30.765Z', hours_next_check_at='2027-01-01T10:23:30.765Z', quality_reviewed_at='2026-10-03T10:23:30.765Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A1';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A1','official-web','https://www.eelpieislandartists.co.uk/','Eel Pie Island','9ab6578c376f0e46a5521eefd45063ac4ca6e438a18f5d080708e88e2b05827f','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'b925ed20d0d4b17d2a41516dff7d36e2932cd6d7a7034e7fa195112e551c01c0','2026-10-03T10:23:30.765Z','2027-01-01T10:23:30.765Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'A1','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.eelpieislandartists.co.uk/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='A1' AND issue_type='OTHER' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O1',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O1';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O1','official-web','https://en.wikipedia.org/wiki/Thames_Barrier','The Thames Barrier','c43ffaa474250dc1de6f1ecbc49494d032dfcdfbee4fc7a70796fa9d40eb18b7','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O1','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Thames_Barrier"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O1' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O14',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:23:33.278Z', hours_next_check_at='2027-04-01T10:23:33.278Z', quality_reviewed_at='2026-10-03T10:23:33.278Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O14';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O14','official-web','https://www.trinitybuoywharf.com/','Trinity Buoy Lighthouse','e58478cacd31c3cee645611cd6d4b6c547a3793bedda3705a75a765b92d8fcc3','GENERAL','OWNER_OPERATOR',1,'OK',200,'532a6117d99de62613f5a8e2340fabf5c22ead8ef283ae3b925d09a252a6ea94','2026-10-03T10:23:33.278Z','2027-04-01T10:23:33.278Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O6',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:23:33.811Z', hours_next_check_at='2027-04-01T10:23:33.811Z', quality_reviewed_at='2026-10-03T10:23:33.811Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O6';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O6','official-web','https://www.staugustinestower.org/','St. Augustine''s Tower','4032f16c5df5ac42860534c9edda8f78cd85ec0aed91293656785903187b41c6','GENERAL','OWNER_OPERATOR',1,'OK',200,'41be51b08701ba5aa679c6c30874b361e5cdde84df8448bf9bd7914a09ec7eb9','2026-10-03T10:23:33.811Z','2027-04-01T10:23:33.811Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O15',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:23:36.596Z', hours_next_check_at='2027-04-01T10:23:36.596Z', quality_reviewed_at='2026-10-03T10:23:36.596Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O15';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O15','official-web','https://www.crystalpalaceparktrust.org/pages/crystal-palace-subway','Crystal Palace Subway','dc3adffd9f53d76b61cf08ba94c36bd03125213021322fa9e22a2ec83d9b3725','GENERAL','OWNER_OPERATOR',1,'BROKEN',0,'','2026-10-03T10:23:36.596Z','2027-04-01T10:23:36.596Z','The operation was aborted due to timeout')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O15','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"https://www.crystalpalaceparktrust.org/pages/crystal-palace-subway","httpStatus":null,"error":"The operation was aborted due to timeout"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O15' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O4',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:23:39.060Z', hours_next_check_at='2027-04-01T10:23:39.060Z', quality_reviewed_at='2026-10-03T10:23:39.060Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O4';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O4','official-web','https://www.barbican.org.uk/search?search=conservatory','Barbican Conservatory','92d64eca48c2353af8df4f7673173e707e18569535b8d827f9d6b1f4dc2d9d05','GENERAL','OWNER_OPERATOR',1,'OK',200,'410d9000d4252995618017dfa327b7bd16f178161834ba517b63ad978241fc8e','2026-10-03T10:23:39.060Z','2027-04-01T10:23:39.060Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O4','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O4' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O2',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O2';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O2','official-web','https://www.thenorthernantiquarian.org/2022/12/16/caesars-well/','Caesar''s Well','e13ea1b907947d8457c569ec52c3458bb54743ad7bd7bad7a531a98444e4e3bd','GENERAL','TRUSTED_EDITORIAL',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O2','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://www.thenorthernantiquarian.org/2022/12/16/caesars-well/"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O2' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O2','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O2' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O11',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O11';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O11','official-web','https://en.wikipedia.org/wiki/London_Necropolis_railway_station','Necropolis station','ad6155fca040492d462f2511c461d64ee12e1271d7b55aef81238d99bcf67a5a','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O11','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/London_Necropolis_railway_station"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O11' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O5',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:23:39.298Z', hours_next_check_at='2027-04-01T10:23:39.298Z', quality_reviewed_at='2026-10-03T10:23:39.298Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O5';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O5','official-web','https://www.brixtonwindmill.org/','Brixton Windmill','3357372113e2da6472412d3ff3bf92705356f2140c82dae92b8614b7d694f492','GENERAL','OWNER_OPERATOR',1,'OK',200,'cbe871bcc261cdeb2504dd49eba24a7c62dd2183670ed93ffcf416e43204ed48','2026-10-03T10:23:39.298Z','2027-04-01T10:23:39.298Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P6',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:43.872Z', hours_next_check_at='2026-10-10T10:23:43.872Z', quality_reviewed_at='2026-10-03T10:23:43.872Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P6';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P6','official-web','https://www.thephoenixgarden.org/','The Phoenix Garden','0fb99ff26e621ab9a0f8ee94b6d8f1de9fa0fdc75e524b2217d24d56682e0673','GENERAL','OWNER_OPERATOR',1,'OK',200,'218b7c31f5a796603e88ec380fe94bae93fc3140d5e6f0bd2f799e8de15d75be','2026-10-03T10:23:43.872Z','2026-10-10T10:23:43.872Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P6','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P6' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P6','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P6' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P6','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P6' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S4',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:44.671Z', hours_next_check_at='2026-10-31T10:23:44.671Z', quality_reviewed_at='2026-10-03T10:23:44.671Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S4';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S4','official-web','https://www.junkshoplondon.co.uk/','The Junk Shop','f704d528fc5531d7985c525bff138a727c96e0223bd38a3bd13a2b1b77be3392','GENERAL','OWNER_OPERATOR',1,'BLOCKED',200,'2e727d6e64768e6b1a87742ee4618aeab842c9107e94a964dd09427b064733bb','2026-10-03T10:23:44.671Z','2026-10-31T10:23:44.671Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S4','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://www.junkshoplondon.co.uk/","httpStatus":200}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S4' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S4','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S4' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S4','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S4' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P1',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:49.061Z', hours_next_check_at='2026-10-10T10:23:49.061Z', quality_reviewed_at='2026-10-03T10:23:49.061Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P1';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P1','official-web','https://crossbones.org.uk/','Crossbones Garden','f6cff88b9580c645cd868a900eea8b8ac0b2df54ce196764f544f52db0f59673','GENERAL','OWNER_OPERATOR',1,'BLOCKED',202,'649982e208b4832d57c50ceb98a693b966dd0a35a2ceabb33744f10bb8372aff','2026-10-03T10:23:49.061Z','2026-10-10T10:23:49.061Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P1','OTHER','MEDIUM','The source blocks automated checks; verify it manually.','{"url":"https://crossbones.org.uk/","httpStatus":202}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P1' AND issue_type='OTHER' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P1','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P1' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P1','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P1' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O8',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='GENERIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O8';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O8','official-web','https://en.wikipedia.org/wiki/Leinster_Gardens','Leinster Gardens False Facades','bf26cab34c45b5e3039dd1e863c16ee7629e501c71efc192633efc2ae20ce179','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O8','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://en.wikipedia.org/wiki/Leinster_Gardens"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O8' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O8','DESCRIPTION_GENERIC','MEDIUM','Replace generic copy with a concise place-specific description.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O8' AND issue_type='DESCRIPTION_GENERIC' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','P4',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='SEASONAL', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:49.560Z', hours_next_check_at='2026-10-10T10:23:49.560Z', quality_reviewed_at='2026-10-03T10:23:49.560Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='P4';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('P4','official-web','https://www.crystalpalaceparktrust.org/pages/crystal-palace-dinosaurs','Crystal Palace Dinosaurs','585d0eddd33d6308dd5cef97d9d5610cb205e04bbc8ea2061f7411c02758e1b6','GENERAL','OWNER_OPERATOR',1,'BROKEN',0,'','2026-10-03T10:23:49.560Z','2026-10-10T10:23:49.560Z','The operation was aborted due to timeout')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P4','LINK_BROKEN','HIGH','The source timed out or failed and needs checking.','{"url":"https://www.crystalpalaceparktrust.org/pages/crystal-palace-dinosaurs","httpStatus":null,"error":"The operation was aborted due to timeout"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P4' AND issue_type='LINK_BROKEN' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P4','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P4' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'P4','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='P4' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O9',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:23:51.596Z', hours_next_check_at='2027-04-01T10:23:51.596Z', quality_reviewed_at='2026-10-03T10:23:51.596Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O9';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O9','official-web','https://www.godsownjunkyard.co.uk/','God''s Own Junkyard','c1a825035a6deb4e885135aa07d227b60d8bbe42feb88a9ce9077dcd214e8dc3','GENERAL','OWNER_OPERATOR',1,'OK',200,'f1b670447dc755ee3eea224524ef24425522265507633961480fdab05033b324','2026-10-03T10:23:51.596Z','2027-04-01T10:23:51.596Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O7',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O7';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O7','official-web','https://www.ianvisits.co.uk/articles/the-fake-10-downing-street-door-you-can-pose-in-front-of-38574/','Fake no.10','0b765a387dd0d6d97f914a7d4bda12832e013549cc26b7a59abf43ac6d1c29d6','GENERAL','TRUSTED_EDITORIAL',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O7','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://www.ianvisits.co.uk/articles/the-fake-10-downing-street-door-you-can-pose-in-front-of-38574/"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O7' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O13',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O13';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O13','official-web','https://www.discoveringbritain.org/activities/greater-london/viewpoints/three-bridges.html','Three Bridges','afa93e4f89885042335735787672d5ce4f4fe4aef8ea6cae25c7854a64f515c5','GENERAL','TRUSTED_EDITORIAL',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O13','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://www.discoveringbritain.org/activities/greater-london/viewpoints/three-bridges.html"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O13' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','O10',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='LOW', planner_ready=0, access_type_v2='ALWAYS_ACCESSIBLE', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at=NULL, hours_next_check_at=NULL, quality_reviewed_at=NULL, quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='O10';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('O10','official-web','https://www.atlasobscura.com/places/carting-lane-sewer-gas-lamp','Sewer Lamp','88dc4773114fa8ce63b8d3f90f5c5d228c64fdfc2f6c3225415ac19817e87cb9','GENERAL','THIRD_PARTY',1,'UNCHECKED',NULL,'',NULL,NULL,'')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'O10','SOURCE_CONFLICT','HIGH','The current or redirected link is editorial or third-party evidence, not an official source.','{"url":"https://www.atlasobscura.com/places/carting-lane-sewer-gas-lamp"}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='O10' AND issue_type='SOURCE_CONFLICT' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','S12',100,'Guide/editorial core and current high mood-confidence records.','NEEDS_REVIEW');
UPDATE places SET data_confidence='MEDIUM', planner_ready=0, access_type_v2='TIMETABLED', booking_mode='UNKNOWN', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='UNKNOWN', hours_last_checked_at='2026-10-03T10:23:53.610Z', hours_next_check_at='2026-10-31T10:23:53.610Z', quality_reviewed_at='2026-10-03T10:23:53.610Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='S12';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('S12','official-web','https://ministryofstories.org/hoxton-street-monster-supplies/','Hoxton Street Monster Supplies','9f05c556325c59313d78f44dc0be7bbb8257b3a210c6e0195251feb87f774300','GENERAL','OWNER_OPERATOR',1,'REDIRECTED',200,'84e71068a339398d8ecc646b43d6f73db38833c55e9b463be1ecbd87a0c6beba','2026-10-03T10:23:53.610Z','2026-10-31T10:23:53.610Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S12','BOOKING_UNCLEAR','MEDIUM','Confirm whether advance booking is optional, recommended or required.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S12' AND issue_type='BOOKING_UNCLEAR' AND status='OPEN');
INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT 'S12','HOURS_UNCLEAR','MEDIUM','Confirm opening days and hours from the official source.','{}'
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id='S12' AND issue_type='HOURS_UNCLEAR' AND status='OPEN');
INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES ('BATCH-1','A12',100,'Guide/editorial core and current high mood-confidence records.','READY');
UPDATE places SET data_confidence='MEDIUM', planner_ready=1, access_type_v2='EXTERIOR_ONLY', booking_mode='NONE', admission_type='UNKNOWN', access_clarity='CLEAR', description_quality='SPECIFIC', hours_status='NOT_APPLICABLE', hours_last_checked_at='2026-10-03T10:23:55.982Z', hours_next_check_at='2027-01-01T10:23:55.982Z', quality_reviewed_at='2026-10-03T10:23:55.982Z', quality_notes='Prepared by BATCH-1; factual confidence is separate from mood confidence.' WHERE id='A12';
INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES ('A12','official-web','https://chislehurst-caves.co.uk/','Chislehurst Caves','796242abe06e46ccb1b2b32c6f7b0dfd5560d5014a59bd4e0726ad7b55701005','GENERAL','OWNER_OPERATOR',1,'OK',200,'2c67f714972d5f0ab0c741e8d246c3b546f6579be2d80a22ffee1d944a123b4f','2026-10-03T10:23:55.982Z','2027-01-01T10:23:55.982Z','')
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;
UPDATE app_meta SET value = CAST(value AS INTEGER) + 1, updated_at=CURRENT_TIMESTAMP WHERE key='data_version';
