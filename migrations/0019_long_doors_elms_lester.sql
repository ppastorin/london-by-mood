-- Correct the Long doors record with authoritative Elms Lester Painting Rooms history.
UPDATE places
SET description_en='These full-height loading doors belong to the Grade II-listed Elms Lester Painting Rooms at 1–5 Flitcroft Street, built in 1903–04 for W. & J. Elms Lester as a workshop for painting theatrical scenery. Inside, four 50-by-30-foot frames could be raised by electric winches; a hoist and trapdoors helped move completed backcloths out through the towering façade doors.',
    description_it='Queste porte di carico a tutta altezza appartengono agli Elms Lester Painting Rooms, edificio tutelato di grado II ai numeri 1–5 di Flitcroft Street, costruito nel 1903–04 per W. & J. Elms Lester come laboratorio di scenografie teatrali. All’interno, quattro telai di 50 per 30 piedi venivano sollevati da argani elettrici; un montacarichi e botole permettevano di far uscire i fondali completati attraverso le imponenti porte della facciata.',
    editorial_hook_en='Long doors: Full-height loading doors reveal the Elms Lester workshop built for painting and moving vast West End theatre backcloths.',
    editorial_hook_it='Long doors: porte di carico a tutta altezza rivelano il laboratorio Elms Lester, costruito per dipingere e movimentare enormi fondali teatrali del West End.',
    official_url='https://historicengland.org.uk/listing/the-list/list-entry/1113013',
    access_type='VARIABLE',
    access_notes_en='The Flitcroft Street façade is visible from public space; interior access depends on the building’s current exhibition or event programme.',
    access_notes_it='La facciata su Flitcroft Street è visibile dallo spazio pubblico; l’accesso interno dipende dal programma attuale di mostre o eventi.',
    mood_reviewed=1,
    mood_confidence='HIGH',
    mood_basis='EDITORIAL_RESEARCH+HISTORIC_ENGLAND',
    source_type='editorial-research',
    source_ref='Historic England list entry 1113013; Elms Lesters scenic-painting history, verified 2026-10-28',
    last_verified_at='2026-10-28',
    updated_at=CURRENT_TIMESTAMP
WHERE id='LA-812D6CBF' AND category='ODDITY';

INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1113013','official-or-authoritative','2026-10-28'
FROM places WHERE id='LA-812D6CBF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://elmslesters.co.uk/scenic-painting/','official-or-authoritative','2026-10-28'
FROM places WHERE id='LA-812D6CBF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

INSERT INTO app_meta(key,value,updated_at)
VALUES ('oddity_editorial_version','2026-10-28.2',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;
