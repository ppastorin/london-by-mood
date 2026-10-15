-- Bilingual, place-specific editorial enrichment for every published park-category place.
-- Research verified against the recorded official or authoritative sources on 2026-10-15.
CREATE TABLE IF NOT EXISTS place_editorial_sources (
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  source_url TEXT NOT NULL,
  source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative',
  verified_at TEXT NOT NULL,
  PRIMARY KEY(place_id, source_url)
);
CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);

UPDATE places SET description_en='Vauxhall City Farm began in 1977 on a former dairy site and now brings alpacas, goats, sheep, pigs and small animals into central London. Its riding centre, gardens and education programmes connect local children with animal care, food growing and the rural trades that once shaped this Thames-side district.', description_it='Vauxhall City Farm nacque nel 1977 sul sito di un’antica latteria e oggi ospita alpaca, capre, pecore, maiali e piccoli animali nel centro di Londra. Il maneggio, gli orti e i programmi educativi avvicinano i bambini del quartiere alla cura degli animali, alla coltivazione e ai mestieri rurali un tempo presenti lungo il Tamigi.',
  editorial_hook_en='A working city farm where alpacas, riding lessons and food-growing projects animate Vauxhall’s old dairy ground.', editorial_hook_it='Una fattoria urbana dove alpaca, equitazione e orti didattici animano il terreno di un’antica latteria di Vauxhall.',
  official_url='https://vauxhallcityfarm.org/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P11' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://vauxhallcityfarm.org/about-us/','official-or-authoritative','2026-10-15' FROM places WHERE id='P11'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Italian Gardens form a formal Victorian water garden at the north end of Kensington Gardens. Four Carrara-marble basins, carved stonework, fountains and a richly planted pump house were created in the 1860s, probably as a gift from Prince Albert to Queen Victoria.', description_it='Gli Italian Gardens sono un giardino d’acqua formale vittoriano all’estremità nord di Kensington Gardens. Quattro vasche in marmo di Carrara, sculture in pietra, fontane e una sala pompe riccamente decorata furono realizzati negli anni 1860, probabilmente come dono del principe Alberto alla regina Vittoria.',
  editorial_hook_en='Four marble fountain basins and an ornate pump house create Kensington Gardens’ most theatrical Victorian composition.', editorial_hook_it='Quattro vasche con fontane e una sala pompe ornata compongono la scenografia vittoriana più teatrale di Kensington Gardens.',
  official_url='https://www.royalparks.org.uk/visit/parks/kensington-gardens/gardens', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E57750BC' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/kensington-gardens/gardens','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-E57750BC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Royal Botanic Gardens at Kew preserve one of the world’s most important living plant collections across a historic Thames-side landscape. The Palm House, Temperate House, Princess of Wales Conservatory, arboretum and scientific collections trace plant diversity, conservation and botanical exchange over more than 250 years.', description_it='I Royal Botanic Gardens di Kew custodiscono una delle più importanti collezioni botaniche viventi al mondo in un paesaggio storico lungo il Tamigi. Palm House, Temperate House, Princess of Wales Conservatory, arboreto e collezioni scientifiche raccontano oltre 250 anni di biodiversità, conservazione e scambi botanici.',
  editorial_hook_en='Kew combines monumental Victorian glasshouses, a global living collection and active plant science beside the Thames.', editorial_hook_it='Kew riunisce monumentali serre vittoriane, una collezione vivente mondiale e ricerca botanica lungo il Tamigi.',
  official_url='https://www.kew.org/kew-gardens', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8CDC8BE3' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.kew.org/about-us','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-8CDC8BE3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Greenwich Park rises from the National Maritime Museum to one of London’s defining panoramas beside the Royal Observatory. Its avenues, ancient trees, deer-park origins, flower and herb gardens, Roman remains and newly restored seventeenth-century landscape reveal layers of royal, scientific and social history.', description_it='Greenwich Park sale dal National Maritime Museum fino a uno dei panorami più celebri di Londra, accanto al Royal Observatory. Viali, alberi secolari, origini come parco dei cervi, giardini fioriti ed erbari, resti romani e il paesaggio seicentesco restaurato raccontano una storia reale, scientifica e sociale stratificata.',
  editorial_hook_en='Stand on the hill where royal parkland, the Prime Meridian and Wren’s riverside architecture align in one view.', editorial_hook_it='Dalla collina, parco reale, Meridiano di Greenwich e architetture fluviali di Wren si allineano in un’unica veduta.',
  official_url='https://www.royalparks.org.uk/visit/parks/greenwich-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D4B3D748' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/greenwich-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-D4B3D748'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Spitalfields City Farm occupies a former railway goods depot between Brick Lane and the City. Founded by local residents in 1978, it keeps rare-breed farm animals, productive gardens and a celebrated Oxford and Cambridge Goat Race while running youth, volunteering and food-growing projects for Tower Hamlets.', description_it='Spitalfields City Farm occupa un ex deposito merci ferroviario tra Brick Lane e la City. Fondata dagli abitanti nel 1978, alleva razze rare, coltiva orti e ospita la celebre Oxford and Cambridge Goat Race, oltre a programmi per giovani, volontariato e agricoltura urbana rivolti a Tower Hamlets.',
  editorial_hook_en='Rare-breed animals and community growing fill a former railway yard only minutes from Brick Lane.', editorial_hook_it='Animali di razze rare e orti comunitari riempiono un ex scalo ferroviario a pochi minuti da Brick Lane.',
  official_url='https://www.spitalfieldscityfarm.org/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-95F6C6BC' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.spitalfieldscityfarm.org/about-us','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-95F6C6BC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Sydenham Hill Wood protects the largest surviving tract of the old Great North Wood in Southwark. Oak and hornbeam woodland has reclaimed the cuttings, footbridges and track bed of the Crystal Palace High Level railway, creating habitats for woodpeckers, bats, fungi and woodland wildflowers.', description_it='Sydenham Hill Wood protegge il più vasto tratto superstite dell’antica Great North Wood a Southwark. Boschi di querce e carpini hanno riconquistato trincee, ponticelli e sedime della ferrovia Crystal Palace High Level, creando habitat per picchi, pipistrelli, funghi e fiori del sottobosco.',
  editorial_hook_en='A disused Victorian railway has become a wooded corridor of bridges, cuttings, bats and ancient-oak habitat.', editorial_hook_it='Una ferrovia vittoriana dismessa è diventata un corridoio boscoso di ponti, trincee, pipistrelli e querce antiche.',
  official_url='https://www.wildlondon.org.uk/nature-reserves/sydenham-hill-wood-and-coxs-walk', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CFF3C596' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wildlondon.org.uk/nature-reserves/sydenham-hill-wood-and-coxs-walk','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-CFF3C596'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Osterley Park is an eighteenth-century country estate surrounded by farmland and parkland now enclosed by west London. Robert Adam transformed the Tudor house for the Child banking family, while the grounds combine lakes, grand approaches, formal gardens, meadows and a working kitchen garden.', description_it='Osterley Park è una tenuta settecentesca circondata da campi e parco, oggi inglobata nella Londra occidentale. Robert Adam trasformò la casa Tudor per la famiglia di banchieri Child; i terreni comprendono laghi, viali monumentali, giardini formali, prati e un orto produttivo.',
  editorial_hook_en='Robert Adam’s showpiece mansion sits within lakes, meadows and farmland unexpectedly enclosed by west London.', editorial_hook_it='La dimora scenografica di Robert Adam sorge tra laghi, prati e campi sorprendentemente inglobati nella Londra occidentale.',
  official_url='https://www.nationaltrust.org.uk/visit/london/osterley-park-and-house', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-264E515D' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nationaltrust.org.uk/visit/london/osterley-park-and-house','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-264E515D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Primrose Gardens is a pair of small railed gardens laid out between the stucco terraces of Belsize Park. Formerly called Stanley Gardens, the plots were acquired by Hampstead Borough Council in 1920 and renamed in 1939; lawns, mature trees and central seating preserve the intimate scale of the Victorian street.', description_it='Primrose Gardens è formato da due piccoli giardini recintati tra le terrazze in stucco di Belsize Park. Già chiamati Stanley Gardens, furono acquistati dal Comune di Hampstead nel 1920 e ribattezzati nel 1939; prati, alberi maturi e sedute centrali conservano la scala raccolta della strada vittoriana.',
  editorial_hook_en='Two pocket lawns and mature trees soften a short, architecturally unified Belsize Park terrace.', editorial_hook_it='Due piccoli prati e alberi maturi addolciscono una breve terrazza architettonicamente uniforme di Belsize Park.',
  official_url='https://www.camden.gov.uk/parks', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FADAFD2D' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://londongardenstrust.org/conservation/inventory/site-record/?ID=CAM081','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-FADAFD2D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Queen Mary’s Gardens are the horticultural centrepiece of Regent’s Park, laid out in the former grounds of the Royal Botanic Society. Around 12,000 roses from hundreds of varieties surround formal beds, a lake, Mediterranean borders and the secluded St John’s Lodge Garden, with the strongest display in early summer.', description_it='Queen Mary’s Gardens è il cuore orticolo di Regent’s Park, realizzato negli antichi terreni della Royal Botanic Society. Circa 12.000 rose di centinaia di varietà circondano aiuole formali, un lago, bordure mediterranee e il raccolto St John’s Lodge Garden, con il massimo splendore all’inizio dell’estate.',
  editorial_hook_en='Regent’s Park’s great rose collection surrounds formal beds, a lake and secluded garden rooms.', editorial_hook_it='La grande collezione di rose di Regent’s Park circonda aiuole formali, un lago e raccolte stanze verdi.',
  official_url='https://www.royalparks.org.uk/visit/parks/regents-park-primrose-hill/queen-marys-gardens', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2C697A87' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/regents-park-primrose-hill/queen-marys-gardens','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-2C697A87'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Fulham Palace’s Walled Garden preserves the productive heart of the Bishops of London’s historic estate. Tudor brick walls enclose espaliered fruit, knot-style planting, herbaceous borders, vegetables and a surviving vinery, linking today’s community garden with centuries of horticulture beside the Thames.', description_it='Il Walled Garden di Fulham Palace conserva il cuore produttivo della storica tenuta dei vescovi di Londra. Muri in mattoni Tudor racchiudono alberi da frutto a spalliera, aiuole geometriche, bordure erbacee, ortaggi e una vigna storica, collegando il giardino comunitario odierno a secoli di orticoltura lungo il Tamigi.',
  editorial_hook_en='Tudor walls shelter fruit, herbs, vegetables and formal planting in the old Bishops of London estate.', editorial_hook_it='Mura Tudor proteggono frutta, erbe, ortaggi e aiuole formali nell’antica tenuta dei vescovi di Londra.',
  official_url='https://www.fulhampalace.org/explore/garden/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6CB91D54' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.fulhampalace.org/explore/garden/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-6CB91D54'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Harleyford Road Community Garden grew from wasteland left by demolished Georgian houses, where residents began cultivating vegetables in 1984. Its lawns, allotments, greenhouse, pond, play area, mosaic paths and mature trees form a volunteer-run buffer between nearby homes and the traffic of Harleyford Road.', description_it='Harleyford Road Community Garden nacque su un terreno abbandonato dopo la demolizione di case georgiane, dove gli abitanti iniziarono a coltivare ortaggi nel 1984. Prati, parcelle, serra, stagno, area giochi, mosaici e alberi maturi creano una barriera gestita da volontari tra le case e il traffico di Harleyford Road.',
  editorial_hook_en='A resident-made garden of allotments, pond and mosaics occupies the footprint of demolished Georgian terraces.', editorial_hook_it='Un giardino creato dagli abitanti, con orti, stagno e mosaici, occupa l’area di terrazze georgiane demolite.',
  official_url='https://www.lambeth.gov.uk/parks', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B353C9CE' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lambeth.gov.uk/sites/default/files/2025-10/%28b%29%28i%29%20KOV%20Neighbourhood%20Plan%20Referendum%20Vers.pdf','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-B353C9CE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Bonnington Square Pleasure Garden was created by residents who reclaimed a Second World War bomb site beside their Vauxhall housing co-operative. Dense subtropical planting, a communal wheel sculpture, paths and informal seating give the tiny garden the inventive, self-managed character of Bonnington Square.', description_it='Bonnington Square Pleasure Garden fu creato dagli abitanti che recuperarono un sito bombardato durante la Seconda guerra mondiale accanto alla loro cooperativa residenziale di Vauxhall. Fitta vegetazione subtropicale, una scultura a ruota, sentieri e sedute informali esprimono il carattere creativo e autogestito di Bonnington Square.',
  editorial_hook_en='Residents turned a bomb site into a lush, collectively managed garden at the heart of Bonnington Square.', editorial_hook_it='Gli abitanti hanno trasformato un sito bombardato in un giardino rigoglioso e collettivo nel cuore di Bonnington Square.',
  official_url='https://www.bonningtonsquaregarden.org.uk/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5751FFE7' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bonningtonsquaregarden.org.uk/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-5751FFE7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Culpeper Community Garden has occupied former housing land near the Angel since 1982. Shared lawns and ponds sit beside individual organic plots, wildlife planting and a children’s area, while volunteers, schools and therapeutic gardening groups make it both a public park and a working neighbourhood garden.', description_it='Culpeper Community Garden occupa dal 1982 un terreno già destinato ad abitazioni vicino ad Angel. Prati e stagni comuni affiancano parcelle biologiche individuali, piantagioni per la fauna e un’area bambini; volontari, scuole e gruppi di ortoterapia lo rendono insieme parco pubblico e giardino di quartiere.',
  editorial_hook_en='Individual plots, shared ponds and therapeutic gardening make this Angel green space genuinely community-run.', editorial_hook_it='Parcelle individuali, stagni comuni e ortoterapia rendono questo spazio verde di Angel autenticamente comunitario.',
  official_url='https://culpeper.org.uk/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3BEEFAFE' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://culpeper.org.uk/about/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-3BEEFAFE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Eden Nature Garden was established in 2000 on disused church land beside St Paul’s Clapham. Volunteers use native planting, organic methods, ponds and habitat piles to support birds, insects and other wildlife, while the garden provides a quiet community space for play, learning and gardening.', description_it='Eden Nature Garden fu fondato nel 2000 su un terreno ecclesiastico inutilizzato accanto a St Paul’s Clapham. I volontari impiegano specie autoctone, metodi biologici, stagni e rifugi naturali per sostenere uccelli e insetti, offrendo al quartiere uno spazio tranquillo per gioco, apprendimento e giardinaggio.',
  editorial_hook_en='Disused church land has become a volunteer-grown refuge for native plants, wildlife and community learning.', editorial_hook_it='Un terreno ecclesiastico in disuso è diventato un rifugio curato da volontari per piante autoctone, fauna e apprendimento.',
  official_url='https://www.edennaturegarden.org/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-23040098' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.edennaturegarden.org/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-23040098'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Kensington Gardens Allotment is a volunteer-tended teaching garden hidden behind Serpentine North. Raised beds demonstrate fruit, vegetable and herb growing, including vertical techniques for small spaces, while composting, resident chickens and school visits turn the plot into a practical lesson in urban sustainability.', description_it='L’Allotment di Kensington Gardens è un orto didattico curato da volontari dietro Serpentine North. Le aiuole rialzate mostrano come coltivare frutta, ortaggi ed erbe, anche in verticale negli spazi piccoli; compostaggio, galline e visite scolastiche lo trasformano in una lezione pratica di sostenibilità urbana.',
  editorial_hook_en='Raised beds, compost and resident chickens teach small-space food growing behind Serpentine North.', editorial_hook_it='Aiuole rialzate, compost e galline insegnano la coltivazione in piccoli spazi dietro Serpentine North.',
  official_url='https://www.royalparks.org.uk/visit/parks/kensington-gardens/allotment', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-EC135A41' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/kensington-gardens/allotment','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-EC135A41'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Marchmont Community Garden opened in 2011 after residents, housing groups, Camden and the London Wildlife Trust reshaped an underused green. A serpentine path crosses lawn, perennial borders and surviving plane trees, with seating and wildlife-friendly planting designed for everyday use by Bloomsbury neighbours.', description_it='Marchmont Community Garden aprì nel 2011 dopo che abitanti, associazioni, Camden e London Wildlife Trust riqualificarono uno spazio sottoutilizzato. Un sentiero sinuoso attraversa prato, bordure perenni e platani storici, con sedute e piante favorevoli alla fauna pensate per l’uso quotidiano del quartiere.',
  editorial_hook_en='A resident-led redesign brought curved paths, perennial planting and sociable seating to central Bloomsbury.', editorial_hook_it='Un progetto guidato dagli abitanti ha portato sentieri curvi, piante perenni e sedute conviviali nel centro di Bloomsbury.',
  official_url='https://bloomsburysquares.com/the-squares/marchmont-community-garden/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B56E8457' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://bloomsburysquares.com/the-squares/marchmont-community-garden/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-B56E8457'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Bernie Spain Gardens form two riverside lawns at the centre of the Coin Street neighbourhood, between Gabriel’s Wharf and Oxo Tower Wharf. Named for a local housing campaigner, the space hosts festivals and community events while its lawns, borders and views open a public pause on the South Bank.', description_it='Bernie Spain Gardens comprende due prati lungo il fiume nel cuore del quartiere Coin Street, tra Gabriel’s Wharf e Oxo Tower Wharf. Intitolato a un’attivista per l’edilizia popolare, ospita festival ed eventi comunitari; prati, bordure e vedute offrono uno spazio pubblico sulla South Bank.',
  editorial_hook_en='Two community-owned lawns connect Gabriel’s Wharf, Oxo Tower Wharf and the Thames-side promenade.', editorial_hook_it='Due prati di proprietà comunitaria collegano Gabriel’s Wharf, Oxo Tower Wharf e la passeggiata sul Tamigi.',
  official_url='https://coinstreet.org/berniespaingardens', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4C8F3F6E' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://coinstreet.org/berniespaingardens','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-4C8F3F6E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Morden Hall Park follows the River Wandle through a former country estate, with wetland meadows, old parkland trees and several historic mill channels. An eighteenth-century snuff mill, white bridge, rose garden and surviving estate buildings explain how water, industry and leisure shaped this green stretch of south London.', description_it='Morden Hall Park segue il fiume Wandle attraverso un’antica tenuta, con prati umidi, alberi secolari e canali storici dei mulini. Un mulino da tabacco del Settecento, il ponte bianco, il roseto e gli edifici della proprietà mostrano come acqua, industria e svago abbiano modellato questa parte verde di Londra sud.',
  editorial_hook_en='Wandle channels, wetlands and an old snuff mill weave through a country estate absorbed by south London.', editorial_hook_it='Canali del Wandle, zone umide e un antico mulino da tabacco attraversano una tenuta inglobata nella Londra sud.',
  official_url='https://www.nationaltrust.org.uk/visit/london/morden-hall-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P7' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nationaltrust.org.uk/visit/london/morden-hall-park','official-or-authoritative','2026-10-15' FROM places WHERE id='P7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Horniman Gardens spread across sixteen acres around the museum, with broad views toward central London. A sunken garden follows the Arts and Crafts design of 1912, while a medicinal garden, prairie planting, nature trail, musical installations and animal walk extend the museum’s themes outdoors.', description_it='Gli Horniman Gardens si estendono per sedici acri intorno al museo, con ampie vedute verso il centro di Londra. Un giardino ribassato riprende il disegno Arts and Crafts del 1912; giardino medicinale, prateria, percorso naturalistico, installazioni musicali e recinto degli animali portano all’aperto i temi del museo.',
  editorial_hook_en='Arts and Crafts beds, medicinal plants, animals and skyline views extend the Horniman Museum outdoors.', editorial_hook_it='Aiuole Arts and Crafts, piante medicinali, animali e vedute dello skyline prolungano all’aperto l’Horniman Museum.',
  official_url='https://www.horniman.ac.uk/plan-your-visit/gardens/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-EC297907' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.horniman.ac.uk/plan-your-visit/gardens/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-EC297907'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Upper Lodge Water Gardens are an eighteenth-century Baroque garden restored inside Bushy Park. A canal, cascade, basins and geometric lawns were arranged around Upper Lodge for the Earl of Halifax; later buried and neglected, the composition was reopened after archaeological research and restoration.', description_it='Gli Upper Lodge Water Gardens sono un giardino barocco settecentesco restaurato all’interno di Bushy Park. Canale, cascata, vasche e prati geometrici furono disposti attorno a Upper Lodge per il conte di Halifax; sepolta e trascurata, la composizione è stata riaperta dopo ricerche archeologiche e restauro.',
  editorial_hook_en='A buried Baroque composition of canal, cascade and pools has been recovered inside Bushy Park.', editorial_hook_it='Una composizione barocca sepolta, fatta di canale, cascata e vasche, è stata recuperata dentro Bushy Park.',
  official_url='https://www.royalparks.org.uk/visit/parks/bushy-park/water-gardens', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-082F1CA1' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/bushy-park/water-gardens','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-082F1CA1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Pancras Gardens combine the churchyards of St Pancras Old Church and St Giles-in-the-Fields, reshaped as a public garden in the nineteenth century. The grounds contain the Hardy Tree memorial, the Burdett-Coutts sundial, the tomb of architect John Soane and monuments linked to writers, émigrés and railway expansion.', description_it='St Pancras Gardens riunisce i cimiteri di St Pancras Old Church e St Giles-in-the-Fields, trasformati in giardino pubblico nell’Ottocento. Vi si trovano il memoriale Hardy Tree, la meridiana Burdett-Coutts, la tomba dell’architetto John Soane e monumenti legati a scrittori, emigrati ed espansione ferroviaria.',
  editorial_hook_en='Churchyard monuments, the Hardy memorial and railway history gather around one of London’s oldest sacred sites.', editorial_hook_it='Monumenti funerari, il memoriale di Hardy e la storia ferroviaria si raccolgono attorno a uno dei luoghi sacri più antichi di Londra.',
  official_url='https://www.camden.gov.uk/st-pancras-gardens', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B7803442' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.camden.gov.uk/st-pancras-gardens','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-B7803442'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Chiswick House Gardens surround Lord Burlington’s neo-Palladian villa with one of the most influential early English landscape gardens. William Kent’s vistas, statues, lake, cascade and classical buildings survive alongside formal gardens, a conservatory with historic camellias and later public-park planting.', description_it='I giardini di Chiswick House circondano la villa neopalladiana di Lord Burlington con uno dei primi e più influenti paesaggi all’inglese. Prospettive, statue, lago, cascata ed edifici classici di William Kent convivono con giardini formali, una serra di camelie storiche e sistemazioni successive da parco pubblico.',
  editorial_hook_en='William Kent’s designed vistas and classical garden buildings helped change the course of European landscape design.', editorial_hook_it='Le prospettive e gli edifici da giardino di William Kent contribuirono a cambiare il paesaggismo europeo.',
  official_url='https://chiswickhouseandgardens.org.uk/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P2' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://chiswickhouseandgardens.org.uk/our-story/','official-or-authoritative','2026-10-15' FROM places WHERE id='P2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St George’s Gardens opened in 1889 from the joined burial grounds of two Bloomsbury churches, making it one of London’s earliest public gardens created from a cemetery. Mature plane trees shade surviving tombs, ironwork and winding paths, including monuments to architect Nicholas Hawksmoor and prison reformer Robert Nelson.', description_it='St George’s Gardens aprì nel 1889 unendo i cimiteri di due chiese di Bloomsbury: fu uno dei primi giardini pubblici londinesi ricavati da aree funerarie. Platani maturi ombreggiano tombe, cancellate e sentieri sinuosi, con monumenti legati all’architetto Nicholas Hawksmoor e al riformatore Robert Nelson.',
  editorial_hook_en='An early public cemetery garden where plane trees and eighteenth-century monuments survive among Bloomsbury streets.', editorial_hook_it='Un antico giardino cimiteriale pubblico, con platani e monumenti settecenteschi tra le strade di Bloomsbury.',
  official_url='https://www.camden.gov.uk/st-georges-gardens', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C9DCC88E' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.camden.gov.uk/st-georges-gardens','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-C9DCC88E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='All Hallows’ Churchyard, also called Copperfield Street Community Garden, occupies the walled site of George Gilbert Scott Jr’s church, destroyed during the Second World War. Local volunteers have tended its lawn, flower beds, shrubs and surviving fabric for decades as a secluded Southwark garden.', description_it='All Hallows’ Churchyard, noto anche come Copperfield Street Community Garden, occupa il sito murato della chiesa di George Gilbert Scott Jr, distrutta nella Seconda guerra mondiale. Da decenni volontari locali curano prato, aiuole, arbusti e resti architettonici come raccolto giardino di Southwark.',
  editorial_hook_en='A bombed Victorian church site survives as a walled garden maintained by Southwark neighbours.', editorial_hook_it='Il sito di una chiesa vittoriana bombardata sopravvive come giardino murato curato dagli abitanti di Southwark.',
  official_url='https://www.cathedral.southwark.anglican.org/about-us/cathedral-community/all-hallows-church-community-garden/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3F8175BF' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cathedral.southwark.anglican.org/about-us/cathedral-community/all-hallows-church-community-garden/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-3F8175BF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Swithin’s Church Garden marks the footprint of St Swithin London Stone, rebuilt by Christopher Wren after the Great Fire, damaged in 1941 and demolished in 1962. Planting and memorials preserve the churchyard in Oxford Court, including a monument to Catrin Glyndŵr, daughter of the Welsh leader Owain Glyndŵr.', description_it='St Swithin’s Church Garden segna l’impronta di St Swithin London Stone, ricostruita da Christopher Wren dopo il Grande Incendio, danneggiata nel 1941 e demolita nel 1962. Piante e memoriali conservano il sagrato in Oxford Court, compreso il ricordo di Catrin Glyndŵr, figlia del condottiero gallese Owain Glyndŵr.',
  editorial_hook_en='A pocket garden preserves the footprint and memorial history of a lost Wren church off Cannon Street.', editorial_hook_it='Un piccolo giardino conserva l’impronta e la memoria di una chiesa perduta di Wren vicino a Cannon Street.',
  official_url='https://londongardenstrust.org/conservation/inventory/site-record/?ID=COL101', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-ECB4623B' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://londongardenstrust.org/conservation/inventory/site-record/?ID=COL101','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-ECB4623B'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='1st Place at Chumleigh Gardens is an early-years nursery set within Burgess Park, not a freely accessible public garden attraction. Its outdoor spaces use the multicultural gardens and park setting for play and learning, but entry is for enrolled families, staff and arranged visitors.', description_it='1st Place at Chumleigh Gardens è un asilo per la prima infanzia dentro Burgess Park, non un giardino pubblico visitabile liberamente. Gli spazi esterni sfruttano i giardini multiculturali e il parco per gioco e apprendimento, ma l’ingresso è riservato a famiglie iscritte, personale e visitatori autorizzati.',
  editorial_hook_en='This Burgess Park pin is a working nursery with learning gardens, not a drop-in park destination.', editorial_hook_it='Questo punto in Burgess Park è un asilo attivo con giardini didattici, non una meta pubblica ad accesso libero.',
  official_url='https://www.1stplace.uk.com/', access_notes_en='This site is not an unrestricted public park: access is limited, event-led or by prior arrangement. Check the recorded source and confirm access before making a special journey.', access_notes_it='Questo sito non è un parco pubblico ad accesso libero: l’ingresso è limitato, legato a eventi o su appuntamento. Controlla la fonte indicata e conferma l’accesso prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-AA9918B2' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.1stplace.uk.com/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-AA9918B2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Olden Community Garden is a volunteer-run, two-acre nature site on Islington Council land near Highbury. Woodland, meadow, pond, orchard, vegetable beds and a children’s play area support local wildlife and community gardening, with public access concentrated around volunteer sessions and open days.', description_it='Olden Community Garden è un’area naturalistica di due acri gestita da volontari su terreno del Comune di Islington, vicino a Highbury. Bosco, prato, stagno, frutteto, orti e area giochi sostengono fauna e giardinaggio comunitario; l’accesso pubblico si concentra durante turni di volontariato e giornate aperte.',
  editorial_hook_en='Two acres of woodland, meadow, orchard and pond are cared for collectively behind a Highbury gate.', editorial_hook_it='Due acri di bosco, prato, frutteto e stagno sono curati collettivamente dietro un cancello di Highbury.',
  official_url='https://www.oldengarden.org/', access_notes_en='This site is not an unrestricted public park: access is limited, event-led or by prior arrangement. Check the recorded source and confirm access before making a special journey.', access_notes_it='Questo sito non è un parco pubblico ad accesso libero: l’ingresso è limitato, legato a eventi o su appuntamento. Controlla la fonte indicata e conferma l’accesso prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9CB0DF99' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.oldengarden.org/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-9CB0DF99'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Stephens House & Gardens preserves the former Finchley home of ink manufacturer and philanthropist Henry ‘Inky’ Stephens. The landscaped grounds include an avenue, pond, rockery, arboretum and the secluded Bothy Garden, while the house and estate buildings support community events and heritage activities.', description_it='Stephens House & Gardens conserva l’antica casa di Finchley del produttore d’inchiostri e filantropo Henry “Inky” Stephens. Il paesaggio comprende viale, stagno, roccaglia, arboreto e il raccolto Bothy Garden; casa ed edifici della tenuta ospitano eventi comunitari e attività culturali.',
  editorial_hook_en='A Victorian ink manufacturer’s estate survives as Finchley parkland with an arboretum and hidden Bothy Garden.', editorial_hook_it='La tenuta vittoriana di un produttore d’inchiostri sopravvive a Finchley con arboreto e nascosto Bothy Garden.',
  official_url='https://www.stephenshouseandgardens.com/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A97449EC' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stephenshouseandgardens.com/history','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-A97449EC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Crystal Palace Park Farm is a small educational farm within the park, operated by Capel Manor College. Visitors can encounter farm animals and learn about husbandry, while students train in animal care beside the Victorian park’s lakes, terraces and celebrated dinosaur sculptures.', description_it='Crystal Palace Park Farm è una piccola fattoria didattica nel parco, gestita da Capel Manor College. I visitatori incontrano animali da fattoria e scoprono il loro allevamento, mentre gli studenti si formano nella cura animale accanto ai laghi, alle terrazze e ai celebri dinosauri vittoriani del parco.',
  editorial_hook_en='A working college farm brings animal-care training and close-up livestock encounters into Crystal Palace Park.', editorial_hook_it='Una fattoria didattica porta formazione nella cura degli animali e incontri ravvicinati con il bestiame dentro Crystal Palace Park.',
  official_url='https://www.capel.ac.uk/our-centres/crystal-palace-park/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C1E6F626' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.capel.ac.uk/our-centres/crystal-palace-park/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-C1E6F626'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Clissold Park occupies the grounds of eighteenth-century Clissold House beside the medieval parish church of St Mary. Its lakes began as New River reservoirs; today deer and animal enclosures, an aviary, playgrounds, sports fields, mature avenues and the restored house make it Stoke Newington’s principal civic park.', description_it='Clissold Park occupa i terreni della settecentesca Clissold House accanto alla chiesa medievale di St Mary. I laghi nacquero come serbatoi del New River; oggi recinti con daini e animali, voliera, giochi, campi sportivi, viali maturi e la casa restaurata ne fanno il principale parco civico di Stoke Newington.',
  editorial_hook_en='Old New River reservoirs, deer enclosures and Clissold House shape Stoke Newington’s landmark park.', editorial_hook_it='Antichi serbatoi del New River, recinti dei daini e Clissold House definiscono il parco simbolo di Stoke Newington.',
  official_url='https://hackney.gov.uk/clissold-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P12' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://hackney.gov.uk/clissold-park','official-or-authoritative','2026-10-15' FROM places WHERE id='P12'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Sexby Garden is Peckham Rye Park’s formal Arts and Crafts garden, created in the early twentieth century and named for the London County Council’s first parks superintendent, John James Sexby. A pergola, central pool, stone paths and densely planted seasonal borders create a composed garden room within the larger park.', description_it='Il Sexby Garden è il giardino formale Arts and Crafts di Peckham Rye Park, creato all’inizio del Novecento e intitolato al primo sovrintendente dei parchi del London County Council, John James Sexby. Pergola, vasca centrale, vialetti in pietra e fitte bordure stagionali formano una stanza verde nel parco.',
  editorial_hook_en='Pergolas, a formal pool and abundant borders form an Arts and Crafts garden room inside Peckham Rye Park.', editorial_hook_it='Pergole, vasca formale e ricche bordure creano una stanza verde Arts and Crafts dentro Peckham Rye Park.',
  official_url='https://www.southwark.gov.uk/culture-and-sport/parks-and-open-spaces/find-park/peckham-rye-park-and-common', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B2225D90' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.southwark.gov.uk/culture-and-sport/parks-and-open-spaces/find-park/peckham-rye-park-and-common','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-B2225D90'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Lesnes Abbey Woods combine ancient woodland with the standing ruins of an Augustinian abbey founded in 1178. Paths cross coppiced hornbeam, heath and fossil-rich ground above the Thames marshes, while the excavated monastic plan, reconstructed cloister garden and panoramic viewpoints connect natural and archaeological history.', description_it='Lesnes Abbey Woods unisce un bosco antico alle rovine di un’abbazia agostiniana fondata nel 1178. Sentieri attraversano carpini cedui, brughiera e terreni ricchi di fossili sopra le paludi del Tamigi; pianta monastica scavata, chiostro ricostruito e belvedere collegano natura e archeologia.',
  editorial_hook_en='Ancient hornbeam woods rise around a twelfth-century abbey ruin and fossil-bearing Thames-side slopes.', editorial_hook_it='Boschi antichi di carpino circondano un’abbazia del XII secolo e pendii fossiliferi sopra il Tamigi.',
  official_url='https://www.lesnesabbeywoods.org/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-64139BFD' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lesnesabbeywoods.org/about','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-64139BFD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Onion Garden transformed a narrow concrete service yard near Victoria Street into a dense container garden, café and inclusive community hub from 2021. Its layered planting, greenhouse, beehive and events demonstrated what could grow above Tube lines, but the Seaforth Place site closed after its lease ended in 2026.', description_it='The Onion Garden trasformò dal 2021 uno stretto cortile cementato vicino a Victoria Street in un fitto giardino in vaso, caffè e centro comunitario inclusivo. Piante stratificate, serra, alveare ed eventi mostrarono cosa poteva crescere sopra le linee della metropolitana, ma il sito di Seaforth Place ha chiuso nel 2026 alla fine della concessione.',
  editorial_hook_en='This inventive container garden above the Tube is part of Westminster’s recent community history, but the mapped site is closed.', editorial_hook_it='Questo creativo giardino in vaso sopra la metropolitana appartiene alla storia comunitaria recente di Westminster, ma il sito indicato è chiuso.',
  official_url='https://www.theoniongarden.org/', access_notes_en='This mapped site is closed and should not be treated as a current visitor attraction. Consult the official project page for relocation or reopening news.', access_notes_it='Il sito indicato sulla mappa è chiuso e non va considerato un’attrazione visitabile. Consulta la pagina ufficiale del progetto per notizie su trasferimenti o riaperture.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-054E8E36' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.theoniongarden.org/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-054E8E36'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Coombe Wood Gardens occupy part of the former Coombe Wood House estate on the wooded slopes above Croydon. Formal terraces, ponds, a rock garden, ornamental shrubs and a broad lawn lead into woodland renowned for spring rhododendrons, azaleas and bluebells.', description_it='Coombe Wood Gardens occupa parte dell’antica tenuta di Coombe Wood House sui pendii boscosi sopra Croydon. Terrazze formali, stagni, roccaglia, arbusti ornamentali e un grande prato conducono nel bosco, celebre in primavera per rododendri, azalee e campanule.',
  editorial_hook_en='Formal terraces and ponds give way to spring displays of rhododendrons, azaleas and bluebells on a wooded slope.', editorial_hook_it='Terrazze e stagni formali lasciano spazio a rododendri, azalee e campanule primaverili su un pendio boscoso.',
  official_url='https://www.croydon.gov.uk/leisure/parks-and-open-spaces/coombe-wood', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A1526D62' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.croydon.gov.uk/leisure/parks-and-open-spaces/coombe-wood','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-A1526D62'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The original Story Garden on Ossulston Street turned a concrete car park beside the British Library into orchards, growing beds, a small oak woodland and spaces for youth and community programmes. That garden closed in September 2025; Global Generation transferred the project to a permanent triangular site on York Way, opened in 2026.', description_it='L’originario Story Garden di Ossulston Street trasformò un parcheggio in cemento accanto alla British Library in frutteti, aiuole produttive, un piccolo bosco di querce e spazi per programmi giovanili e comunitari. Quel giardino chiuse nel settembre 2025; Global Generation trasferì il progetto in una sede permanente su York Way, aperta nel 2026.',
  editorial_hook_en='The mapped British Library garden has closed, while its community and planting continue at a new permanent York Way site.', editorial_hook_it='Il giardino indicato presso la British Library è chiuso, mentre comunità e coltivazioni continuano nella nuova sede permanente di York Way.',
  official_url='https://www.globalgeneration.org.uk/our-gardens/old-story-garden', access_notes_en='This mapped site is closed and should not be treated as a current visitor attraction. Consult the official project page for relocation or reopening news.', access_notes_it='Il sito indicato sulla mappa è chiuso e non va considerato un’attrazione visitabile. Consulta la pagina ufficiale del progetto per notizie su trasferimenti o riaperture.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4B293650' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.globalgeneration.org.uk/our-gardens/old-story-garden','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-4B293650'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Eastcote House Gardens preserve the grounds of a lost manor house beside the River Pinn. A Tudor dovecote, seventeenth-century coach house, walled garden, orchard, wildflower meadow and old trees survive around the house footprint, restored as a community heritage landscape.', description_it='Eastcote House Gardens conserva i terreni di una dimora scomparsa lungo il fiume Pinn. Una colombaia Tudor, una rimessa seicentesca, giardino murato, frutteto, prato fiorito e alberi antichi circondano l’impronta della casa, restaurata come paesaggio storico comunitario.',
  editorial_hook_en='A Tudor dovecote, old coach house and walled garden reveal the vanished Eastcote manor beside the River Pinn.', editorial_hook_it='Colombaia Tudor, antica rimessa e giardino murato raccontano la dimora scomparsa di Eastcote lungo il fiume Pinn.',
  official_url='https://eastcotehousegardens.weebly.com/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0E20B090' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://eastcotehousegardens.weebly.com/history.html','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-0E20B090'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Epsom Downs is open chalk grassland on the North Downs best known as the home of the Derby, first run here in 1780. Away from race meetings, public paths cross broad turf with long views toward London, while the racecourse grandstands and Tattenham Corner express the landscape’s sporting identity.', description_it='Epsom Downs è un vasto prato calcareo dei North Downs, noto soprattutto come sede del Derby, disputato qui per la prima volta nel 1780. Fuori dalle giornate di corsa, sentieri pubblici attraversano l’erba con ampie vedute verso Londra; tribune e Tattenham Corner raccontano l’identità sportiva del paesaggio.',
  editorial_hook_en='Chalk grassland, distant London views and the Derby course share one sweeping North Downs landscape.', editorial_hook_it='Prati calcarei, vedute lontane di Londra e pista del Derby condividono un unico vasto paesaggio dei North Downs.',
  official_url='https://www.epsom-ewell.gov.uk/residents/venues-sport-and-leisure-facilities/parks-open-spaces/epsom-and-walton-downs', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-34B701A6' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.epsom-ewell.gov.uk/residents/venues-sport-and-leisure-facilities/parks-open-spaces/epsom-and-walton-downs','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-34B701A6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Whalebones Park is a privately owned area of fields, woodland and smallholding land around the Grade II-listed Whalebones House in Chipping Barnet. Its whale-jaw arch, artists’ studios and beekeeping use are locally distinctive, but there is currently no general public right of access and redevelopment is planned.', description_it='Whalebones Park è un’area privata di campi, boschi e piccola azienda agricola attorno alla Whalebones House, classificata Grade II, a Chipping Barnet. L’arco formato da mascelle di balena, gli studi d’artista e l’apicoltura sono elementi caratteristici, ma non esiste attualmente un diritto generale di accesso pubblico ed è prevista una riqualificazione.',
  editorial_hook_en='The whale-bone arch marks a private Barnet estate of fields and woods, not a freely accessible public park.', editorial_hook_it='L’arco di ossa di balena segnala una tenuta privata di Barnet con campi e boschi, non un parco pubblico liberamente accessibile.',
  official_url='https://www.sng.org.uk/press-release/sng-partners-with-hill-to-deliver-54-homes-at-whalebones', access_notes_en='This site is not an unrestricted public park: access is limited, event-led or by prior arrangement. Check the recorded source and confirm access before making a special journey.', access_notes_it='Questo sito non è un parco pubblico ad accesso libero: l’ingresso è limitato, legato a eventi o su appuntamento. Controlla la fonte indicata e conferma l’accesso prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-20262752' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sng.org.uk/press-release/sng-partners-with-hill-to-deliver-54-homes-at-whalebones','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-20262752'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Victoria Park opened in 1845 as the People’s Park for the rapidly growing East End. Its broad carriage drives, lakes, mature avenues, Chinese pagoda, drinking fountain and surviving ornamental gates combine Victorian civic ambition with modern sports, playgrounds, festivals and community facilities.', description_it='Victoria Park aprì nel 1845 come People’s Park per l’East End in rapida crescita. Ampi viali, laghi, alberature mature, pagoda cinese, fontana e cancelli ornamentali superstiti uniscono l’ambizione civica vittoriana a sport, giochi, festival e servizi comunitari contemporanei.',
  editorial_hook_en='The East End’s People’s Park pairs Victorian lakes and avenues with some of London’s busiest community life.', editorial_hook_it='Il People’s Park dell’East End unisce laghi e viali vittoriani a una delle vite comunitarie più intense di Londra.',
  official_url='https://www.towerhamlets.gov.uk/lgnl/leisure_and_culture/parks_and_open_spaces/victoria_park/victoria_park.aspx', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DBCFCD75' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.towerhamlets.gov.uk/lgnl/leisure_and_culture/parks_and_open_spaces/victoria_park/victoria_park.aspx','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-DBCFCD75'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Battersea Park was laid out beside the Thames in the 1850s on former market gardens and marsh. Its carriage drives, boating lake, sub-tropical garden, riverside promenade, Peace Pagoda, sports grounds and surviving Festival of Britain features create an unusually varied Victorian municipal park.', description_it='Battersea Park fu progettato lungo il Tamigi negli anni 1850 su antichi orti e paludi. Viali, lago navigabile, giardino subtropicale, passeggiata fluviale, Peace Pagoda, campi sportivi e resti del Festival of Britain compongono un parco municipale vittoriano insolitamente vario.',
  editorial_hook_en='A Victorian Thames-side park moves from subtropical planting and boating lake to pagoda, promenade and sports grounds.', editorial_hook_it='Un parco vittoriano sul Tamigi passa dal giardino subtropicale e lago alla pagoda, passeggiata e campi sportivi.',
  official_url='https://www.wandsworth.gov.uk/leisure-and-culture/parks-and-open-spaces/battersea-park/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5F4C8579' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wandsworth.gov.uk/leisure-and-culture/parks-and-open-spaces/battersea-park/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-5F4C8579'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Grovelands Park preserves the landscape around an eighteenth-century villa now used as a hospital. Humphry Repton advised on the estate design: a long lake, wooded slopes, grassland and veteran trees remain, joined today by sports courts, playgrounds and lakeside paths used by Winchmore Hill and Southgate communities.', description_it='Grovelands Park conserva il paesaggio attorno a una villa settecentesca oggi utilizzata come ospedale. Humphry Repton contribuì al disegno della tenuta: restano un lungo lago, pendii boscosi, prati e alberi veterani, affiancati da campi sportivi, giochi e sentieri frequentati da Winchmore Hill e Southgate.',
  editorial_hook_en='Repton-influenced parkland descends through veteran trees and broad lawns to a long ornamental lake.', editorial_hook_it='Il parco influenzato da Repton scende tra alberi veterani e grandi prati verso un lungo lago ornamentale.',
  official_url='https://www.enfield.gov.uk/services/leisure-and-culture/parks-and-open-spaces/grovelands-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7476FE80' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.enfield.gov.uk/services/leisure-and-culture/parks-and-open-spaces/grovelands-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-7476FE80'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Bushy Park is the second largest Royal Park, shaped by Tudor hunting, seventeenth-century water engineering and centuries of grazing. Chestnut Avenue leads to Sir Christopher Wren’s Diana Fountain, while deer herds, acid grassland, ponds, woodland gardens and the restored Water Gardens spread around Hampton Court’s northern approach.', description_it='Bushy Park è il secondo Royal Park per estensione, modellato dalla caccia Tudor, dall’ingegneria idraulica seicentesca e da secoli di pascolo. Chestnut Avenue conduce alla Diana Fountain di Christopher Wren; mandrie di cervi, praterie acide, stagni, giardini boscosi e Water Gardens restaurati circondano l’accesso nord a Hampton Court.',
  editorial_hook_en='Deer cross a royal landscape of chestnut avenues, ancient grassland and waterworks beside Hampton Court.', editorial_hook_it='I cervi attraversano un paesaggio reale di viali di castagni, prati antichi e opere d’acqua accanto a Hampton Court.',
  official_url='https://www.royalparks.org.uk/visit/parks/bushy-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C638E2EA' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/bushy-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-C638E2EA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Dulwich Park opened in 1890 on former farmland and fields belonging to Dulwich College. Curving drives circle a boating lake, American Garden, winter garden, sports grounds and playgrounds; mature trees and restored Victorian features make the park a carefully composed counterpart to nearby Dulwich Picture Gallery.', description_it='Dulwich Park aprì nel 1890 su campi appartenuti a Dulwich College. Viali curvi circondano lago navigabile, American Garden, giardino invernale, impianti sportivi e giochi; alberi maturi ed elementi vittoriani restaurati creano un paesaggio accurato vicino alla Dulwich Picture Gallery.',
  editorial_hook_en='Curving Victorian drives link a boating lake, specialist gardens and broad recreation lawns in Dulwich.', editorial_hook_it='Viali vittoriani curvi collegano lago navigabile, giardini specializzati e grandi prati ricreativi a Dulwich.',
  official_url='https://www.southwark.gov.uk/culture-and-sport/parks-and-open-spaces/find-park/dulwich-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-87691D29' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.southwark.gov.uk/culture-and-sport/parks-and-open-spaces/find-park/dulwich-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-87691D29'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Barnsbury Wood is Islington’s smallest local nature reserve and its only surviving mature woodland. The site grew from the garden of a nineteenth-century house; ash, sycamore, lime and horse chestnut now shelter deadwood insects, birds and shade plants along a short path opened only at limited times.', description_it='Barnsbury Wood è la più piccola riserva naturale locale di Islington e il suo unico bosco maturo superstite. Nata dal giardino di una casa ottocentesca, ospita frassini, sicomori, tigli e ippocastani che proteggono insetti del legno morto, uccelli e piante d’ombra lungo un breve sentiero aperto solo in orari limitati.',
  editorial_hook_en='A nineteenth-century garden has matured into Islington’s tiny gated woodland nature reserve.', editorial_hook_it='Un giardino ottocentesco è maturato nella piccola riserva boschiva recintata di Islington.',
  official_url='https://www.islington.gov.uk/physical-activity-parks-and-trees/parks-and-green-space/your-local-parks/barnsbury-wood', access_notes_en='This site is not an unrestricted public park: access is limited, event-led or by prior arrangement. Check the recorded source and confirm access before making a special journey.', access_notes_it='Questo sito non è un parco pubblico ad accesso libero: l’ingresso è limitato, legato a eventi o su appuntamento. Controlla la fonte indicata e conferma l’accesso prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2DDB57F9' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.islington.gov.uk/physical-activity-parks-and-trees/parks-and-green-space/your-local-parks/barnsbury-wood','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-2DDB57F9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Gunnersbury Park is the former Rothschild estate shared by Ealing and Hounslow. Two mansions overlook lawns, lakes, an orangery, temple, Gothic ruins and historic gardens; museum galleries, sports facilities and continuing restoration reveal how an aristocratic landscape became a major public park.', description_it='Gunnersbury Park è l’antica tenuta Rothschild condivisa da Ealing e Hounslow. Due ville dominano prati, laghi, aranciera, tempio, rovine gotiche e giardini storici; museo, impianti sportivi e restauri mostrano come un paesaggio aristocratico sia diventato un grande parco pubblico.',
  editorial_hook_en='Rothschild mansions, ornamental lakes and garden buildings anchor a restored west London estate.', editorial_hook_it='Ville Rothschild, laghi ornamentali ed edifici da giardino definiscono una tenuta restaurata della Londra ovest.',
  official_url='https://visitgunnersbury.org/park/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-53972718' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://visitgunnersbury.org/park/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-53972718'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Brent Lodge Park follows the River Brent through the former grounds of Brent Lodge in Hanwell. Known locally as the Bunny Park, it combines riverside meadows, veteran trees, playgrounds and sports with a free animal centre, maze and the adjoining Millennium woodland.', description_it='Brent Lodge Park segue il fiume Brent negli antichi terreni di Brent Lodge a Hanwell. Conosciuto localmente come Bunny Park, unisce prati fluviali, alberi veterani, giochi e sport a un centro animali gratuito, un labirinto e il vicino bosco del Millennium.',
  editorial_hook_en='The Bunny Park pairs River Brent meadows and old trees with a free animal centre and maze.', editorial_hook_it='Il Bunny Park unisce prati lungo il Brent e alberi antichi a un centro animali gratuito e un labirinto.',
  official_url='https://www.ealing.gov.uk/directory_record/516/brent_lodge_park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FBAA707F' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.ealing.gov.uk/directory_record/516/brent_lodge_park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-FBAA707F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='London Fields Lido is a heated, fifty-metre outdoor pool opened in 1932 at the edge of London Fields. Restored after a long closure, it offers lane swimming year-round with a sun terrace and changing facilities; this is a ticketed sports venue rather than a general park lawn.', description_it='London Fields Lido è una piscina scoperta riscaldata di cinquanta metri, aperta nel 1932 ai margini di London Fields. Restaurata dopo una lunga chiusura, offre nuoto in corsia tutto l’anno con terrazza solarium e spogliatoi; è un impianto sportivo a pagamento, non un prato pubblico del parco.',
  editorial_hook_en='A restored 1930s heated lido offers year-round fifty-metre swimming beside London Fields.', editorial_hook_it='Un lido riscaldato degli anni Trenta, restaurato, offre nuoto tutto l’anno su cinquanta metri accanto a London Fields.',
  official_url='https://www.better.org.uk/leisure-centre/london/hackney/london-fields-lido', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A2CC937F' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.better.org.uk/leisure-centre/london/hackney/london-fields-lido','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-A2CC937F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Woodberry Wetlands transformed former New River reservoirs into an urban nature reserve in 2016 while retaining their role in London’s water system. Reedbeds, open water and islands support kingfishers, reed warblers, bats and wintering birds, with a boardwalk and Coal House café opening views across the habitat.', description_it='Woodberry Wetlands ha trasformato nel 2016 antichi serbatoi del New River in riserva naturale urbana, conservandone il ruolo nel sistema idrico londinese. Canneti, acque aperte e isole ospitano martin pescatori, cannareccioni, pipistrelli e uccelli svernanti; passerella e Coal House café offrono vedute sull’habitat.',
  editorial_hook_en='Working reservoirs have become reed-fringed habitat for kingfishers, bats and migratory birds in Hackney.', editorial_hook_it='Serbatoi ancora attivi sono diventati habitat di canneti per martin pescatori, pipistrelli e uccelli migratori a Hackney.',
  official_url='https://www.wildlondon.org.uk/nature-reserves/woodberry-wetlands', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F6B8C534' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wildlondon.org.uk/nature-reserves/woodberry-wetlands','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-F6B8C534'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Brockwell Park climbs from Herne Hill to broad skyline views around Brockwell Hall. Opened to the public in 1892, it contains walled and community gardens, ponds, mature avenues, sports grounds, a miniature railway and the Grade II-listed 1930s lido.', description_it='Brockwell Park sale da Herne Hill verso ampie vedute dello skyline attorno a Brockwell Hall. Aperto al pubblico nel 1892, comprende giardino murato e comunitario, stagni, viali maturi, campi sportivi, ferrovia in miniatura e il lido degli anni Trenta classificato Grade II.',
  editorial_hook_en='Hilltop views, Brockwell Hall, garden rooms and a landmark Art Deco lido define this south London park.', editorial_hook_it='Vedute dalla collina, Brockwell Hall, stanze verdi e un celebre lido Art Déco definiscono questo parco della Londra sud.',
  official_url='https://www.lambeth.gov.uk/parks/brockwell-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-084238D8' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lambeth.gov.uk/parks/brockwell-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-084238D8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Gladstone Park spreads across the former Dollis Hill estate, where its high ground opens long views toward central London. Formal terraces near the surviving house stable block descend to sports pitches, playgrounds, mature avenues and the peaceful walled garden, with railway and wartime history around the edges.', description_it='Gladstone Park si estende sull’antica tenuta di Dollis Hill, da cui si aprono lunghe vedute verso il centro di Londra. Terrazze formali presso le scuderie superstiti scendono verso campi sportivi, giochi, viali maturi e un tranquillo giardino murato, con tracce ferroviarie e belliche ai margini.',
  editorial_hook_en='High ground, formal terraces and a secluded walled garden overlook the city from Dollis Hill.', editorial_hook_it='Terreno elevato, terrazze formali e un raccolto giardino murato guardano la città da Dollis Hill.',
  official_url='https://www.brent.gov.uk/parks-leisure-and-healthy-living/parks-and-open-spaces/gladstone-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D4E5C39D' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.brent.gov.uk/parks-leisure-and-healthy-living/parks-and-open-spaces/gladstone-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-D4E5C39D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Beckenham Place Park is Lewisham’s largest green space, centred on an eighteenth-century Palladian mansion built for John Cator. Ancient woodland, grassland, historic park trees and the River Ravensbourne surround a restored lake for swimming and paddling, community gardens and extensive walking routes.', description_it='Beckenham Place Park è il più grande spazio verde di Lewisham, centrato su una villa palladiana settecentesca costruita per John Cator. Bosco antico, prati, alberi storici e il fiume Ravensbourne circondano un lago restaurato per nuoto e pagaia, giardini comunitari e numerosi sentieri.',
  editorial_hook_en='Ancient woodland and the Ravensbourne frame a Palladian mansion and a revived public swimming lake.', editorial_hook_it='Bosco antico e Ravensbourne incorniciano una villa palladiana e un lago pubblico rinato per il nuoto.',
  official_url='https://www.lewisham.gov.uk/inmyarea/openspaces/parks/beckenham-place-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C775B72D' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lewisham.gov.uk/inmyarea/openspaces/parks/beckenham-place-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-C775B72D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Gunnersbury Triangle is a six-acre nature reserve created on abandoned railway land between three active lines. Saved from development by a community campaign in the 1980s, its birch and willow woodland, ponds, meadow and acid grassland now shelter frogs, newts, butterflies and woodland birds.', description_it='Gunnersbury Triangle è una riserva naturale di sei acri nata su terreno ferroviario abbandonato tra tre linee ancora attive. Salvata dallo sviluppo da una campagna locale negli anni Ottanta, ospita boschi di betulle e salici, stagni, prato e prateria acida con rane, tritoni, farfalle e uccelli.',
  editorial_hook_en='Community action turned an abandoned railway triangle into woodland, meadow and pond habitat.', editorial_hook_it='L’azione comunitaria ha trasformato un triangolo ferroviario abbandonato in habitat di bosco, prato e stagni.',
  official_url='https://www.wildlondon.org.uk/nature-reserves/gunnersbury-triangle', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-AE9250DE' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wildlondon.org.uk/nature-reserves/gunnersbury-triangle','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-AE9250DE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Eden Dock is a new waterside public realm in Canary Wharf designed to bring biodiversity back into the dock system. Floating wetlands, aquatic planting, boardwalks and seating create habitat for birds, insects and fish among the office towers, while visitors can move close to the water rather than viewing it only from quays.', description_it='Eden Dock è un nuovo spazio pubblico sull’acqua a Canary Wharf, progettato per riportare biodiversità nel sistema dei docks. Zone umide galleggianti, piante acquatiche, passerelle e sedute creano habitat per uccelli, insetti e pesci tra le torri, permettendo ai visitatori di avvicinarsi all’acqua.',
  editorial_hook_en='Floating wetlands and low boardwalks put living dock water at the centre of Canary Wharf’s public realm.', editorial_hook_it='Zone umide galleggianti e passerelle basse portano l’acqua viva dei docks al centro dello spazio pubblico di Canary Wharf.',
  official_url='https://canarywharf.com/eden-dock/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F276F7BA' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://canarywharf.com/eden-dock/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-F276F7BA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Jubilee Park is a roof garden above Canary Wharf Underground station, designed by landscape architect Jacques Wirtz. Curving paths pass dense clipped hedges, lawns, fountains and mature trees that conceal much of the surrounding glass-and-steel skyline, making the park an engineered green room over transport infrastructure.', description_it='Jubilee Park è un giardino pensile sopra la stazione della metropolitana di Canary Wharf, progettato dal paesaggista Jacques Wirtz. Sentieri curvi attraversano siepi scolpite, prati, fontane e alberi maturi che nascondono gran parte dello skyline di vetro e acciaio, creando una stanza verde sopra le infrastrutture.',
  editorial_hook_en='Wirtz’s curved hedges, fountains and mature canopy form a roof garden directly above the Jubilee line.', editorial_hook_it='Siepi curve, fontane e chiome mature di Wirtz formano un giardino pensile direttamente sopra la Jubilee line.',
  official_url='https://canarywharf.com/open-spaces/jubilee-park/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A0C898C3' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://canarywharf.com/open-spaces/jubilee-park/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-A0C898C3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Woodlands Farm is a 89-acre working community farm on the Greenwich–Bexley border, preserving pasture that escaped suburban development. Cattle, sheep, pigs, poultry and horses graze among hedgerows, ponds and ancient woodland while volunteer, school and conservation programmes teach farming and wildlife management.', description_it='Woodlands Farm è una fattoria comunitaria attiva di 89 acri al confine tra Greenwich e Bexley, su pascoli sfuggiti all’espansione suburbana. Bovini, pecore, maiali, pollame e cavalli vivono tra siepi, stagni e bosco antico; volontariato, scuole e conservazione insegnano agricoltura e gestione della natura.',
  editorial_hook_en='Working livestock, old hedgerows and ancient woodland preserve a rural landscape on London’s south-eastern edge.', editorial_hook_it='Bestiame, vecchie siepi e bosco antico conservano un paesaggio rurale sul margine sud-orientale di Londra.',
  official_url='https://www.thewoodlandsfarmtrust.org/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-584B96F2' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.thewoodlandsfarmtrust.org/about-us/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-584B96F2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Richmond Park is London’s largest Royal Park and a National Nature Reserve, enclosed as a royal hunting ground in the seventeenth century. Free-roaming red and fallow deer share acid grassland, ancient oaks and ponds; King Henry’s Mound protects a celebrated sightline to St Paul’s Cathedral.', description_it='Richmond Park è il più grande Royal Park di Londra e una riserva naturale nazionale, recintato nel Seicento come riserva di caccia reale. Cervi rossi e daini liberi condividono praterie acide, querce antiche e stagni; King Henry’s Mound tutela una celebre visuale verso St Paul’s Cathedral.',
  editorial_hook_en='Free-roaming deer, ancient oaks and protected views make Richmond Park a nationally important urban landscape.', editorial_hook_it='Cervi liberi, querce antiche e vedute protette rendono Richmond Park un paesaggio urbano di importanza nazionale.',
  official_url='https://www.royalparks.org.uk/visit/parks/richmond-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-92B787E4' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/richmond-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-92B787E4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Stepney City Farm was founded in 1979 on a Second World War bomb site beside St Dunstan’s Church. Farm animals, allotments, a rural arts centre, market and café support education, crafts and food growing, while surviving walls and cobbles recall the site’s earlier use by a brewery and haulage yard.', description_it='Stepney City Farm fu fondata nel 1979 su un sito bombardato nella Seconda guerra mondiale accanto a St Dunstan’s Church. Animali, orti, centro di arti rurali, mercato e caffè sostengono educazione, artigianato e coltivazione; muri e selciati ricordano i precedenti usi industriali.',
  editorial_hook_en='Animals, allotments, crafts and a farmers’ market animate a bomb-site farm beside St Dunstan’s Church.', editorial_hook_it='Animali, orti, artigianato e mercato animano una fattoria nata su un sito bombardato accanto a St Dunstan’s Church.',
  official_url='https://stepneycityfarm.org/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P10' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://stepneycityfarm.org/about-us/','official-or-authoritative','2026-10-15' FROM places WHERE id='P10'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Rookery is a formal garden created from the grounds of a large house on the edge of Streatham Common. Terraces, an Old English Garden, rockery, cascade, ornamental ponds and woodland walks climb the slope, with views and planting maintained through a community-led cooperative.', description_it='The Rookery è un giardino formale ricavato dai terreni di una grande casa ai margini di Streatham Common. Terrazze, Old English Garden, roccaglia, cascata, stagni ornamentali e sentieri boscosi salgono il pendio; vedute e piantagioni sono curate da una cooperativa comunitaria.',
  editorial_hook_en='Terraces, cascade and Old English planting rise above Streatham Common in a garden saved by public subscription.', editorial_hook_it='Terrazze, cascata e aiuole all’inglese salgono sopra Streatham Common in un giardino salvato da una sottoscrizione pubblica.',
  official_url='https://www.lambeth.gov.uk/parks/rookery-streatham', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P5' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lambeth.gov.uk/parks/rookery-streatham','official-or-authoritative','2026-10-15' FROM places WHERE id='P5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Isabella Plantation is a forty-acre woodland garden enclosed within Richmond Park and developed chiefly from the 1950s. Evergreen azaleas and rhododendrons blaze around streams and ponds in spring, while native woodland, bog planting and the accessible Broomfield Hill route sustain interest and wildlife year-round.', description_it='Isabella Plantation è un giardino boschivo di quaranta acri dentro Richmond Park, sviluppato soprattutto dagli anni Cinquanta. Azalee sempreverdi e rododendri colorano ruscelli e stagni in primavera; bosco autoctono, piante di palude e percorso accessibile da Broomfield Hill mantengono interesse e biodiversità tutto l’anno.',
  editorial_hook_en='Spring azaleas and rhododendrons surround streams and ponds in Richmond Park’s enclosed woodland garden.', editorial_hook_it='Azalee e rododendri primaverili circondano ruscelli e stagni nel giardino boschivo recintato di Richmond Park.',
  official_url='https://www.royalparks.org.uk/visit/parks/richmond-park/isabella-plantation', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P3' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/richmond-park/isabella-plantation','official-or-authoritative','2026-10-15' FROM places WHERE id='P3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Gibbons Rent Community Garden occupies a narrow passage and former yard behind Bermondsey Street. Residents and local organisations transformed hard standing into raised beds, fruit trees, a greenhouse, children’s growing areas and sociable seating, creating a collectively tended shortcut between dense Southwark streets.', description_it='Gibbons Rent Community Garden occupa un passaggio stretto e un antico cortile dietro Bermondsey Street. Abitanti e organizzazioni locali hanno trasformato il suolo duro in aiuole rialzate, alberi da frutto, serra, spazi di coltivazione per bambini e sedute, creando un collegamento verde curato collettivamente.',
  editorial_hook_en='Raised beds, fruit trees and a greenhouse turn a Bermondsey passage into a community-grown route.', editorial_hook_it='Aiuole rialzate, alberi da frutto e una serra trasformano un passaggio di Bermondsey in un percorso coltivato dalla comunità.',
  official_url='https://www.bost.org.uk/gardens/gibbons-rent', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6402E31F' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bost.org.uk/gardens/gibbons-rent','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-6402E31F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Soho Square Gardens preserve the centre of a late seventeenth-century residential square laid out during London’s westward expansion. Mature plane trees, lawns and benches surround a distinctive timber gardener’s hut disguised as a Tudor market cross, with the statue of Charles II standing nearby.', description_it='Soho Square Gardens conserva il centro di una piazza residenziale tardo-seicentesca nata durante l’espansione occidentale di Londra. Platani maturi, prati e panchine circondano una caratteristica capanna del giardiniere in legno, camuffata da croce di mercato Tudor, accanto alla statua di Carlo II.',
  editorial_hook_en='A Tudor-style gardener’s hut and Charles II statue sit beneath mature planes in historic Soho.', editorial_hook_it='Una capanna da giardiniere in stile Tudor e la statua di Carlo II sorgono sotto platani maturi nella Soho storica.',
  official_url='https://www.westminster.gov.uk/parks-squares-and-open-spaces/soho-square-gardens', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-190FA290' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.westminster.gov.uk/parks-squares-and-open-spaces/soho-square-gardens','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-190FA290'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Red Cross Garden was created in 1887 by social reformer Octavia Hill as the green heart of an experimental housing scheme for local workers. Restored Arts and Crafts cottages face lawns, flower borders, a pond and the community hall, expressing Hill’s belief that beauty and open space belonged in everyday urban life.', description_it='Red Cross Garden fu creato nel 1887 dalla riformatrice sociale Octavia Hill come cuore verde di un complesso abitativo sperimentale per lavoratori. Cottage Arts and Crafts restaurati guardano prati, bordure fiorite, stagno e sala comunitaria, esprimendo l’idea di Hill che bellezza e spazio aperto appartenessero alla vita urbana quotidiana.',
  editorial_hook_en='Octavia Hill’s cottages, pond and flower garden unite social housing reform with Arts and Crafts design.', editorial_hook_it='Cottage, stagno e aiuole di Octavia Hill uniscono riforma dell’edilizia sociale e disegno Arts and Crafts.',
  official_url='https://www.bost.org.uk/gardens/red-cross-garden', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C40F0905' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bost.org.uk/gardens/red-cross-garden','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-C40F0905'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Dalston Eastern Curve Garden follows the former Eastern Curve railway that once linked Dalston Junction with the North London Line. Opened as a community garden in 2010, it layers raised beds, trees, wildlife planting, greenhouse spaces and a café along the old track, with events and volunteer growing at its core.', description_it='Dalston Eastern Curve Garden segue l’antica Eastern Curve ferroviaria che collegava Dalston Junction alla North London Line. Aperto come giardino comunitario nel 2010, dispone aiuole rialzate, alberi, piante per la fauna, serre e caffè lungo il vecchio tracciato, con eventi e coltivazioni volontarie al centro.',
  editorial_hook_en='A disused railway curve has become Dalston’s long, densely planted community garden and gathering space.', editorial_hook_it='Una curva ferroviaria dismessa è diventata il lungo e fitto giardino comunitario e luogo d’incontro di Dalston.',
  official_url='https://dalstongarden.org/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P9' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://dalstongarden.org/about/','official-or-authoritative','2026-10-15' FROM places WHERE id='P9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='WWT London Wetland Centre occupies four former Thames-side reservoirs transformed into lakes, reedbeds, marsh, meadows and ponds. Boardwalks, hides and an observatory reveal kingfishers, bitterns, sand martins and seasonal migrants, while family discovery zones explain wetland ecology and water management.', description_it='WWT London Wetland Centre occupa quattro antichi serbatoi lungo il Tamigi trasformati in laghi, canneti, paludi, prati e stagni. Passerelle, capanni e osservatorio permettono di vedere martin pescatori, tarabusi, topini e migratori stagionali; aree didattiche spiegano ecologia e gestione dell’acqua.',
  editorial_hook_en='Former reservoirs now support reedbeds, marsh and internationally rich birdlife within sight of central London.', editorial_hook_it='Antichi serbatoi ospitano oggi canneti, paludi e una ricca avifauna a poca distanza dal centro di Londra.',
  official_url='https://www.wwt.org.uk/wetland-centres/london', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8B9990D1' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wwt.org.uk/wetland-centres/london','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-8B9990D1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Hackney City Farm has occupied a former brewery and button-factory site off Hackney Road since 1984. Pigs, donkeys, goats, sheep and poultry share the compact grounds with gardens, pottery, classrooms and a café, supporting food education, volunteering and practical environmental projects.', description_it='Hackney City Farm occupa dal 1984 il sito di un antico birrificio e fabbrica di bottoni vicino a Hackney Road. Maiali, asini, capre, pecore e pollame condividono gli spazi con orti, ceramica, aule e caffè, sostenendo educazione alimentare, volontariato e progetti ambientali pratici.',
  editorial_hook_en='Farm animals, food growing and craft workshops occupy an old industrial yard off Hackney Road.', editorial_hook_it='Animali, orti e laboratori artigianali occupano un antico cortile industriale vicino a Hackney Road.',
  official_url='https://hackneycityfarm.co.uk/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B8B69AFD' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://hackneycityfarm.co.uk/about/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-B8B69AFD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Freightliners Farm grew from a 1970s community project that kept livestock in railway goods vans, giving the farm its name. Its Islington site now includes rare-breed animals, poultry, beehives, gardens and a café, with education and volunteering focused on farming, food and urban ecology.', description_it='Freightliners Farm nacque da un progetto comunitario degli anni Settanta che ospitava animali in carri merci ferroviari, da cui deriva il nome. Il sito di Islington comprende oggi razze rare, pollame, alveari, orti e caffè, con educazione e volontariato dedicati ad agricoltura, cibo ed ecologia urbana.',
  editorial_hook_en='A farm named for its original railway vans now combines rare breeds, beehives and growing in Islington.', editorial_hook_it='Una fattoria chiamata dai suoi originari carri ferroviari unisce oggi razze rare, alveari e coltivazioni a Islington.',
  official_url='https://www.freightlinersfarm.org.uk/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5839F2F8' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.freightlinersfarm.org.uk/about-us','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-5839F2F8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Deen City Farm has brought animals, gardens and vocational learning to the River Wandle floodplain in Morden since 1978. Cattle, sheep, goats, pigs, poultry and horses support school visits and accredited training, while allotments, wetlands and community events connect the farm to its surrounding estates.', description_it='Deen City Farm porta animali, orti e formazione professionale nella pianura del fiume Wandle a Morden dal 1978. Bovini, pecore, capre, maiali, pollame e cavalli sostengono visite scolastiche e corsi riconosciuti; orti, zone umide ed eventi collegano la fattoria ai quartieri circostanti.',
  editorial_hook_en='Livestock, riding and vocational training meet allotments and Wandle wetlands at this Morden farm.', editorial_hook_it='Bestiame, equitazione e formazione professionale incontrano orti e zone umide del Wandle in questa fattoria di Morden.',
  official_url='https://www.deencityfarm.co.uk/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E4DF9DA5' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.deencityfarm.co.uk/about-us','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-E4DF9DA5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Kentish Town City Farm was founded in 1972 on railway land beside Gospel Oak, making it the United Kingdom’s first city farm. Thirty-two acres include farm animals, riding facilities, gardens and wildlife habitat around old railway structures, with youth work, therapy and environmental education central to its mission.', description_it='Kentish Town City Farm fu fondata nel 1972 su terreno ferroviario vicino a Gospel Oak, diventando la prima city farm del Regno Unito. Trentadue acri comprendono animali, strutture per equitazione, orti e habitat naturali attorno a manufatti ferroviari, con lavoro giovanile, terapia ed educazione ambientale al centro.',
  editorial_hook_en='Britain’s first city farm combines railway heritage, riding, livestock and wildlife work beside Gospel Oak.', editorial_hook_it='La prima city farm britannica unisce patrimonio ferroviario, equitazione, animali e natura accanto a Gospel Oak.',
  official_url='https://ktcityfarm.org.uk/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4C150B7C' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://ktcityfarm.org.uk/about-us/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-4C150B7C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Surrey Docks Farm is a working community farm on a riverside site opposite Canary Wharf. Goats, sheep, pigs, poultry and cattle occupy yards and pasture beside food-growing plots, a blacksmith’s forge and classrooms, while the Thames path opens unusual views across the working landscape.', description_it='Surrey Docks Farm è una fattoria comunitaria attiva sul fiume, di fronte a Canary Wharf. Capre, pecore, maiali, pollame e bovini occupano cortili e pascoli accanto a orti, fucina e aule; il Thames Path offre vedute insolite sul paesaggio produttivo.',
  editorial_hook_en='Livestock, food plots and a working forge meet the Thames path directly opposite Canary Wharf.', editorial_hook_it='Animali, orti e una fucina attiva incontrano il Thames Path proprio di fronte a Canary Wharf.',
  official_url='https://www.surreydocksfarm.org.uk/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-91BDE902' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.surreydocksfarm.org.uk/about-us','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-91BDE902'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Mudchute Park and Farm covers thirty-two acres on the Isle of Dogs, much of it formed from soil excavated during construction of the Millwall Dock. One of Europe’s largest urban farms, it combines livestock fields, horse riding, rare breeds, allotments and wartime anti-aircraft remains beneath views of Canary Wharf.', description_it='Mudchute Park and Farm copre trentadue acri nell’Isle of Dogs, in gran parte formati dalla terra scavata durante la costruzione del Millwall Dock. Tra le più grandi fattorie urbane d’Europa, unisce pascoli, equitazione, razze rare, orti e resti antiaerei bellici sotto lo skyline di Canary Wharf.',
  editorial_hook_en='Thirty-two acres of livestock pasture and wartime traces sit beneath the towers of Canary Wharf.', editorial_hook_it='Trentadue acri di pascoli e tracce belliche si estendono sotto le torri di Canary Wharf.',
  official_url='https://www.mudchute.org/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0FB25A60' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.mudchute.org/about-us','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-0FB25A60'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Mayfield Lavender is a commercial lavender farm on the North Downs at Banstead, immediately beyond Greater London’s boundary. Rows of purple flowers cover the chalk soil in midsummer and supply lavender products, but flowering dates, photography rules, admission and opening are seasonal rather than park-like.', description_it='Mayfield Lavender è un’azienda agricola di lavanda sui North Downs a Banstead, appena oltre il confine della Greater London. File di fiori viola coprono il suolo calcareo in piena estate e alimentano la produzione; fioritura, regole fotografiche, ingresso e apertura sono stagionali, non quelli di un normale parco.',
  editorial_hook_en='Midsummer rows of lavender cover a working chalk-land farm just beyond London’s southern boundary.', editorial_hook_it='File di lavanda estiva coprono una fattoria su suolo calcareo appena oltre il confine meridionale di Londra.',
  official_url='https://www.mayfieldlavender.com/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E7330F82' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.mayfieldlavender.com/pages/visit-us','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-E7330F82'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Hounslow Urban Farm occupies twenty-nine acres near Heathrow and grew from the former borough farm of the 1970s. Visitors meet farm animals, owls, reptiles and other species through scheduled demonstrations and handling sessions, making this a ticketed family attraction rather than an open public park.', description_it='Hounslow Urban Farm occupa ventinove acri vicino a Heathrow e deriva dall’antica fattoria comunale degli anni Settanta. I visitatori incontrano animali da fattoria, gufi, rettili e altre specie durante dimostrazioni e attività guidate: è quindi un’attrazione familiare a pagamento, non un parco pubblico aperto.',
  editorial_hook_en='Farm livestock, owls and reptile encounters make this Heathrow-side site a hands-on ticketed attraction.', editorial_hook_it='Animali da fattoria, gufi e incontri con rettili rendono questo sito vicino a Heathrow un’attrazione pratica a pagamento.',
  official_url='https://www.hounslowurbanfarm.co.uk/', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7D427873' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.hounslowurbanfarm.co.uk/','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-7D427873'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Joseph Grimaldi Park occupies the former burial ground of St James’s Chapel in Pentonville and is named for the celebrated clown buried here in 1837. Two coffin-shaped musical artworks chime when stepped on, while restored monuments, lawns and play space keep the unusual theatrical history visible.', description_it='Joseph Grimaldi Park occupa l’antico cimitero della St James’s Chapel a Pentonville ed è intitolato al celebre clown sepolto qui nel 1837. Due opere musicali a forma di bara suonano quando vengono calpestate; monumenti restaurati, prati e giochi mantengono visibile questa insolita storia teatrale.',
  editorial_hook_en='Musical coffin sculptures and restored graves recall clown Joseph Grimaldi in a former chapel burial ground.', editorial_hook_it='Sculture musicali a forma di bara e tombe restaurate ricordano il clown Joseph Grimaldi in un antico cimitero.',
  official_url='https://www.islington.gov.uk/physical-activity-parks-and-trees/parks-and-green-space/your-local-parks/joseph-grimaldi-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-71C140D1' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.islington.gov.uk/physical-activity-parks-and-trees/parks-and-green-space/your-local-parks/joseph-grimaldi-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-71C140D1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Brooks Farm is a community teaching farm in Leyton’s Jack Cornwell Park. Cattle, sheep, goats, pigs, ponies, donkeys and small animals support school visits and family learning, while the surrounding park provides play and recreation for a densely built part of Waltham Forest.', description_it='Brooks Farm è una fattoria didattica comunitaria nel Jack Cornwell Park di Leyton. Bovini, pecore, capre, maiali, pony, asini e piccoli animali sostengono visite scolastiche e apprendimento familiare; il parco circostante offre gioco e svago in una zona densamente costruita di Waltham Forest.',
  editorial_hook_en='A teaching farm with livestock and family activities sits inside Leyton’s Jack Cornwell Park.', editorial_hook_it='Una fattoria didattica con animali e attività familiari si trova nel Jack Cornwell Park di Leyton.',
  official_url='https://www.walthamforest.gov.uk/leisure-parks-and-libraries/parks-and-open-spaces/brooks-farm', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6459084D' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.walthamforest.gov.uk/leisure-parks-and-libraries/parks-and-open-spaces/brooks-farm','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-6459084D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Cannizaro Park was once the private garden of the adjoining country house and became a public park in 1949. Its carefully managed collection includes an Italian garden, rose garden, Mediterranean beds, water garden, rare trees and woodland, all unfolding in distinct garden rooms beside Wimbledon Common.', description_it='Cannizaro Park fu il giardino privato della villa adiacente e divenne parco pubblico nel 1949. La collezione accuratamente curata comprende giardino italiano, roseto, aiuole mediterranee, giardino d’acqua, alberi rari e bosco, distribuiti in stanze verdi accanto a Wimbledon Common.',
  editorial_hook_en='Rare trees and a sequence of Italian, rose, Mediterranean and water gardens border Wimbledon Common.', editorial_hook_it='Alberi rari e una sequenza di giardini italiano, delle rose, mediterraneo e d’acqua costeggiano Wimbledon Common.',
  official_url='https://www.merton.gov.uk/leisure-recreation-and-culture/parks-and-open-spaces/parks-and-recreation-grounds/cannizaro-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-EFAC4DE1' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.merton.gov.uk/leisure-recreation-and-culture/parks-and-open-spaces/parks-and-recreation-grounds/cannizaro-park','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-EFAC4DE1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Kyoto Garden is a Japanese landscape garden within Holland Park, donated by the Kyoto Chamber of Commerce and opened in 1991. A tiered waterfall feeds a koi pond crossed by stone paths, with Japanese maples, clipped shrubs, lanterns and carefully placed rocks creating controlled seasonal views.', description_it='Kyoto Garden è un giardino paesaggistico giapponese dentro Holland Park, donato dalla Camera di Commercio di Kyoto e aperto nel 1991. Una cascata a terrazze alimenta uno stagno con carpe koi; sentieri in pietra, aceri giapponesi, arbusti potati, lanterne e rocce compongono vedute stagionali controllate.',
  editorial_hook_en='A waterfall, koi pond, maples and stone lanterns compose a Kyoto gift inside Holland Park.', editorial_hook_it='Cascata, stagno con koi, aceri e lanterne di pietra compongono un dono di Kyoto dentro Holland Park.',
  official_url='https://www.rbkc.gov.uk/parks-leisure-and-culture/parks/kyoto-garden', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-53ECA483' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.rbkc.gov.uk/parks-leisure-and-culture/parks/kyoto-garden','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-53ECA483'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Camley Street Natural Park is a former coal yard transformed by the London Wildlife Trust into a nature reserve beside the Regent’s Canal. Reedbeds, ponds, woodland and meadow support wetland wildlife within King’s Cross, while boardwalks, a learning centre and floating habitat bring visitors close to an urban ecosystem.', description_it='Camley Street Natural Park è un ex deposito di carbone trasformato dal London Wildlife Trust in riserva naturale lungo il Regent’s Canal. Canneti, stagni, bosco e prato sostengono la fauna nel cuore di King’s Cross; passerelle, centro didattico e habitat galleggianti avvicinano i visitatori a un ecosistema urbano.',
  editorial_hook_en='A King’s Cross coal yard has become canal-side reedbed, woodland and pond habitat.', editorial_hook_it='Un deposito di carbone di King’s Cross è diventato habitat di canneto, bosco e stagni lungo il canale.',
  official_url='https://www.wildlondon.org.uk/nature-reserves/camley-street-natural-park', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P8' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wildlondon.org.uk/nature-reserves/camley-street-natural-park','official-or-authoritative','2026-10-15' FROM places WHERE id='P8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Queen’s Park Pitch and Putt is a compact nine-hole, par-27 public course behind the park’s tennis courts. Club and ball hire are included in the fee, making it an informal introduction to golf, but opening hours depend on season, weather and daylight and admission is charged.', description_it='Il Pitch and Putt di Queen’s Park è un compatto percorso pubblico di nove buche, par 27, dietro i campi da tennis. Noleggio di mazze e palline è compreso nel prezzo, offrendo un’introduzione informale al golf; orari dipendono però da stagione, meteo e luce e l’ingresso è a pagamento.',
  editorial_hook_en='A nine-hole public course offers informal golf behind Queen’s Park’s tennis courts, with equipment included.', editorial_hook_it='Un percorso pubblico di nove buche offre golf informale dietro i campi da tennis di Queen’s Park, con attrezzatura inclusa.',
  official_url='https://www.cityoflondon.gov.uk/things-to-do/green-spaces/queens-park/queens-park-pitch-and-putt', access_notes_en='Opening hours, admission and programmed activities can change. Check the official venue site for current tickets, access arrangements and temporary closures before travelling.', access_notes_it='Orari, ingresso e attività possono cambiare. Controlla il sito ufficiale per biglietti, modalità di accesso e chiusure temporanee prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-602C6DBF' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cityoflondon.gov.uk/things-to-do/green-spaces/queens-park/queens-park-pitch-and-putt','official-or-authoritative','2026-10-15' FROM places WHERE id='LA-602C6DBF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Phoenix Garden is a community garden created in 1984 on a Second World War bomb site and former car park in the West End. Wildlife-friendly planting, pond, benches and winding paths thrive above difficult urban soil, while volunteers and a purpose-built community space support events and local ecology.', description_it='The Phoenix Garden è un giardino comunitario creato nel 1984 su un sito bombardato nella Seconda guerra mondiale e poi usato come parcheggio nel West End. Piante favorevoli alla fauna, stagno, panchine e sentieri prosperano su un terreno urbano difficile; volontari e uno spazio comunitario sostengono eventi ed ecologia locale.',
  editorial_hook_en='Wildlife planting thrives on a bomb-site garden maintained by volunteers behind the West End theatres.', editorial_hook_it='Piante per la fauna prosperano in un giardino nato su un sito bombardato e curato da volontari dietro i teatri del West End.',
  official_url='https://www.thephoenixgarden.org/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P6' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.thephoenixgarden.org/about-us/','official-or-authoritative','2026-10-15' FROM places WHERE id='P6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Crossbones Garden is a memorial on the edge of the medieval burial ground used for poor and marginalised people, including women known as the Winchester Geese. Ribbons and personal dedications cover its gates, while community planting, sculpture and ceremonies honour people historically excluded from consecrated ground.', description_it='Crossbones Garden è un memoriale ai margini del cimitero medievale destinato a poveri ed emarginati, comprese le donne note come Winchester Geese. Nastri e dediche personali coprono i cancelli; piante comunitarie, sculture e cerimonie ricordano chi fu storicamente escluso dal terreno consacrato.',
  editorial_hook_en='Ribbons, planting and ritual honour the outcast dead of Southwark’s medieval Cross Bones burial ground.', editorial_hook_it='Nastri, piante e rituali onorano i morti emarginati dell’antico cimitero Cross Bones di Southwark.',
  official_url='https://crossbones.org.uk/', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P1' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://crossbones.org.uk/history/','official-or-authoritative','2026-10-15' FROM places WHERE id='P1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Crystal Palace Dinosaurs are more than thirty life-size sculptures created by Benjamin Waterhouse Hawkins in the 1850s around lakes in Crystal Palace Park. Based on the earliest scientific reconstructions of extinct animals, their now-outdated anatomy records a pivotal moment when prehistoric life first entered public imagination.', description_it='I Crystal Palace Dinosaurs sono oltre trenta sculture a grandezza naturale create da Benjamin Waterhouse Hawkins negli anni 1850 attorno ai laghi di Crystal Palace Park. Basate sulle prime ricostruzioni scientifiche di animali estinti, le anatomie oggi superate documentano il momento in cui la preistoria entrò nell’immaginario pubblico.',
  editorial_hook_en='Victorian life-size dinosaurs preserve the earliest public visions of prehistoric animals, inaccuracies and all.', editorial_hook_it='Dinosauri vittoriani a grandezza naturale conservano le prime visioni pubbliche degli animali preistorici, errori compresi.',
  official_url='https://www.crystalpalaceparktrust.org/pages/crystal-palace-dinosaurs', access_notes_en='Outdoor access and gate times can change with the season, weather or events. Check the official source for current opening hours, closures and local restrictions before travelling.', access_notes_it='L’accesso e gli orari dei cancelli possono cambiare secondo stagione, meteo o eventi. Controlla la fonte ufficiale per aperture, chiusure e limitazioni prima di partire.',
  last_verified_at='2026-10-15', updated_at=CURRENT_TIMESTAMP
WHERE id='P4' AND category='PARK';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.crystalpalaceparktrust.org/pages/crystal-palace-dinosaurs','official-or-authoritative','2026-10-15' FROM places WHERE id='P4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

INSERT INTO app_meta(key,value,updated_at) VALUES ('park_editorial_version','2026-10-15',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;
