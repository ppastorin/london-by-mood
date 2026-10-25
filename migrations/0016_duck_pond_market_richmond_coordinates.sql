-- The checklist explicitly refines Duck Pond Market to its Richmond location.
UPDATE places
SET latitude=51.458417,
    longitude=-0.3061978,
    google_maps_url='https://www.google.com/maps?q=51.458417,-0.3061978',
    source_ref='Duck Pond Market Richmond; Heron Square address reconciliation 2026-10-25',
    last_verified_at='2026-10-25',
    updated_at=CURRENT_TIMESTAMP
WHERE name='Duck Pond Market Richmond' AND category='SHOPPING' AND status='published';

UPDATE app_meta SET value=CAST(CAST(value AS INTEGER)+1 AS TEXT),updated_at=CURRENT_TIMESTAMP WHERE key='data_version';
