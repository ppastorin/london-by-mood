-- Correct three London museums that were previously matched to Wikipedia disambiguation pages.
-- Sources re-verified against each museum’s official website on 2026-10-14.

UPDATE places SET description_en='London’s National Portrait Gallery tells British history through portraits of the people who shaped it, from Tudor monarchs and writers to scientists, performers and contemporary public figures. More than 11,000 paintings, drawings, miniatures and sculptures form the Primary Collection, complemented by extensive photography and works on paper; the chronological galleries make changing ideas of identity, power and celebrity easy to follow.', description_it='La National Portrait Gallery di Londra racconta la storia britannica attraverso i ritratti delle persone che l’hanno plasmata, dai sovrani Tudor e dagli scrittori fino a scienziati, artisti e protagonisti contemporanei. La collezione principale comprende oltre 11.000 dipinti, disegni, miniature e sculture, affiancati da vaste raccolte fotografiche e opere su carta; le sale cronologiche mostrano con chiarezza l’evoluzione di identità, potere e celebrità.',
  editorial_hook_en='More than 11,000 portraits turn British history into a chronological encounter with its monarchs, makers, performers and public figures.', editorial_hook_it='Oltre 11.000 ritratti trasformano la storia britannica in un incontro cronologico con sovrani, creatori, artisti e personaggi pubblici.',
  official_url='https://www.npg.org.uk/', access_notes_en='Opening hours and exhibition schedules can change. Check the official venue site before travelling, especially between temporary shows or for event-day restrictions.', access_notes_it='Orari e calendario delle mostre possono cambiare. Controlla il sito ufficiale prima di partire, soprattutto tra mostre temporanee o in giornate con eventi.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A550BDE9' AND category='MUSEUM';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.npg.org.uk/collections/','official', '2026-10-14' FROM places WHERE id='LA-A550BDE9'
ON CONFLICT(place_id,source_url) DO UPDATE SET source_kind=excluded.source_kind, verified_at=excluded.verified_at;

UPDATE places SET description_en='London’s Science Museum explores how scientific ideas and technologies changed everyday life through landmark objects, working models and interactive galleries. Highlights range from full-size steam engines and historic aircraft to space hardware, communications technology and the vast Medicine galleries; Wonderlab adds hands-on experiments and live demonstrations for families.', description_it='Lo Science Museum di Londra mostra come idee scientifiche e tecnologie abbiano trasformato la vita quotidiana attraverso oggetti fondamentali, modelli funzionanti e sale interattive. Il percorso spazia da grandi motori a vapore e aerei storici fino a veicoli spaziali, telecomunicazioni e vaste gallerie dedicate alla medicina; Wonderlab aggiunge esperimenti pratici e dimostrazioni dal vivo per le famiglie.',
  editorial_hook_en='Steam engines, aircraft, spacecraft, medicine and hands-on experiments trace the technologies that built the modern world.', editorial_hook_it='Motori a vapore, aerei, veicoli spaziali, medicina ed esperimenti pratici raccontano le tecnologie che hanno costruito il mondo moderno.',
  official_url='https://www.sciencemuseum.org.uk/', access_notes_en='Opening hours and exhibition schedules can change. Check the official venue site before travelling, especially between temporary shows or for event-day restrictions.', access_notes_it='Orari e calendario delle mostre possono cambiare. Controlla il sito ufficiale prima di partire, soprattutto tra mostre temporanee o in giornate con eventi.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A46A6C72' AND category='MUSEUM';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sciencemuseum.org.uk/free-galleries','official', '2026-10-14' FROM places WHERE id='LA-A46A6C72'
ON CONFLICT(place_id,source_url) DO UPDATE SET source_kind=excluded.source_kind, verified_at=excluded.verified_at;

UPDATE places SET description_en='London’s Natural History Museum cares for about 80 million specimens spanning zoology, botany, entomology, mineralogy and palaeontology. Its Romanesque building frames world-famous dinosaur fossils, minerals and Earth-science galleries, while Hintze Hall places Hope—the 25-metre blue whale skeleton—above objects representing 4.5 billion years of natural history and active scientific research.', description_it='Il Natural History Museum di Londra custodisce circa 80 milioni di esemplari di zoologia, botanica, entomologia, mineralogia e paleontologia. Il grande edificio neoromanico ospita celebri fossili di dinosauri, minerali e gallerie dedicate alla Terra; nella Hintze Hall, Hope, lo scheletro di balenottera azzurra lungo 25 metri, sovrasta reperti che raccontano 4,5 miliardi di anni di storia naturale e ricerca scientifica.',
  editorial_hook_en='Hope, a 25-metre blue whale skeleton, presides over dinosaur fossils, minerals and specimens spanning 4.5 billion years of natural history.', editorial_hook_it='Hope, uno scheletro di balenottera azzurra lungo 25 metri, domina fossili di dinosauri, minerali e reperti che coprono 4,5 miliardi di anni.',
  official_url='https://www.nhm.ac.uk/', access_notes_en='Opening hours and exhibition schedules can change. Check the official venue site before travelling, especially between temporary shows or for event-day restrictions.', access_notes_it='Orari e calendario delle mostre possono cambiare. Controlla il sito ufficiale prima di partire, soprattutto tra mostre temporanee o in giornate con eventi.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9ED1A100' AND category='MUSEUM';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nhm.ac.uk/visit/galleries-and-museum-map/hintze-hall.html','official', '2026-10-14' FROM places WHERE id='LA-9ED1A100'
ON CONFLICT(place_id,source_url) DO UPDATE SET source_kind=excluded.source_kind, verified_at=excluded.verified_at;

INSERT INTO app_meta(key,value,updated_at) VALUES ('museum_editorial_version','2026-10-14-correction-v2',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;

