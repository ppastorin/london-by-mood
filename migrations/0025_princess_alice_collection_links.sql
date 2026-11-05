-- Expose the Princess Alice Hospice rows added by migration 0024 through the
-- canonical charity-shop collection used by the public API and all consumers.

INSERT OR IGNORE INTO place_collections(place_id, collection_code)
SELECT id, 'CHARITY_SHOP'
FROM places
WHERE id IN (
  'CS-PRINCESS-ALICE-HOSPICE-BARNES',
  'CS-PRINCESS-ALICE-HOSPICE-HOUNSLOW',
  'CS-PRINCESS-ALICE-HOSPICE-NEW-MALDEN',
  'CS-PRINCESS-ALICE-HOSPICE-RAYNES-PARK',
  'CS-PRINCESS-ALICE-HOSPICE-RICHMOND',
  'CS-PRINCESS-ALICE-HOSPICE-WEST-EALING-ALICES-ATTIC',
  'CS-PRINCESS-ALICE-HOSPICE-WORCESTER-PARK'
);

INSERT INTO app_meta(key,value,updated_at) VALUES ('schema_version','25',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value='25',updated_at=CURRENT_TIMESTAMP;

INSERT INTO app_meta(key,value,updated_at) VALUES ('data_version','2026-11-05-princess-alice-hospice-shops',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value,updated_at=CURRENT_TIMESTAMP;
