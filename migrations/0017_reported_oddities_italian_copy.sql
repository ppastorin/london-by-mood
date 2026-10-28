-- Add the missing Italian editorial copy for the two legacy oddities reported
-- from the Italian London by Mood results on 2026-10-28.
UPDATE places
SET description_it='Leinster Gardens nasconde due celebri case dalla falsa facciata ai numeri 23–24 di Bayswater. Costruite negli anni Sessanta dell’Ottocento per celare una trincea ferroviaria vittoriana, le facciate dipinte imitano le case vicine ma nascondono i binari. Una curiosità londinese fotogenica, visibile dal marciapiede: cerca le finestre dipinte, i piani inferiori ciechi e la sottile giunzione tra illusione e realtà.',
    editorial_hook_it='Leinster Gardens nasconde due celebri case dalla falsa facciata ai numeri 23–24 di Bayswater.',
    source_ref='Historic England list entry 1221942; City of London Picture Archive, verified 2026-10-28',
    last_verified_at='2026-10-28',
    updated_at=CURRENT_TIMESTAMP
WHERE id='O8' AND status='published';

UPDATE places
SET description_it='L’Elfin Oak è il tronco di una quercia di circa ottocento anni, portata da Richmond Park e trasformata da Ivor Innes nel 1930. Intorno alle forme naturali del legno compaiono fate, gnomi, streghe e animali in miniatura. La scultura, tutelata di grado II e collocata vicino al Diana Memorial Playground nei Kensington Gardens, è stata restaurata più volte, anche grazie all’impegno di Spike Milligan.',
    editorial_hook_it='Fate, gnomi e animali in miniatura abitano un’antica quercia scolpita da Ivor Innes nei Kensington Gardens.',
    source_ref='The Royal Parks, The Elfin Oak, verified 2026-10-28',
    last_verified_at='2026-10-28',
    updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E000F10B' AND status='published';

UPDATE app_meta SET value=CAST(CAST(value AS INTEGER)+1 AS TEXT),updated_at=CURRENT_TIMESTAMP WHERE key='data_version';
