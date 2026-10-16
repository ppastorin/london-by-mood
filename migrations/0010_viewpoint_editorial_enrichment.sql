-- Bilingual, place-specific editorial enrichment for every published viewpoint-category place.
-- Research verified against the recorded official or authoritative sources on 2026-10-16.
CREATE TABLE IF NOT EXISTS place_editorial_sources (
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  source_url TEXT NOT NULL,
  source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative',
  verified_at TEXT NOT NULL,
  PRIMARY KEY(place_id, source_url)
);
CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);

UPDATE places SET description_en='Parliament Hill rises to 98 metres on Hampstead Heath and frames a protected panorama across central London. From the summit, St Paul’s Cathedral, the Palace of Westminster, the Shard and the City towers can be picked out beyond the heath; the hill’s name is traditionally linked to a Civil War lookout.', description_it='Parliament Hill raggiunge 98 metri su Hampstead Heath e incornicia un panorama protetto sulla Londra centrale. Dalla sommità si distinguono St Paul’s Cathedral, il Palace of Westminster, lo Shard e le torri della City oltre la brughiera; il nome è tradizionalmente legato a un punto d’osservazione della guerra civile.',
  editorial_hook_en='A protected skyline unfolds from a 98-metre heathland summit long associated with watching over London.', editorial_hook_it='Uno skyline protetto si apre da una cima di brughiera alta 98 metri, da secoli associata all’osservazione di Londra.',
  official_url='https://www.cityoflondon.gov.uk/things-to-do/green-spaces/hampstead-heath/parliament-hill-viewpoint', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-679E3B20' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cityoflondon.gov.uk/things-to-do/green-spaces/hampstead-heath/parliament-hill-viewpoint','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-679E3B20'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Primrose Hill’s 63-metre summit gives a protected south-facing view over Regent’s Park to Westminster and the City. The hill entered public ownership in 1841; today the summit includes a William Blake inscription and an oak planted as Shakespeare’s Tree, while lower paths offer quieter angles on the skyline.', description_it='La cima di Primrose Hill, alta 63 metri, offre una veduta protetta verso sud sopra Regent’s Park, fino a Westminster e alla City. La collina divenne pubblica nel 1841; oggi ospita un’iscrizione di William Blake e una quercia detta Shakespeare’s Tree, mentre i sentieri inferiori offrono prospettive più tranquille.',
  editorial_hook_en='Regent’s Park forms the foreground to a protected central-London panorama from this 63-metre hill.', editorial_hook_it='Regent’s Park fa da primo piano a un panorama protetto della Londra centrale da questa collina di 63 metri.',
  official_url='https://www.royalparks.org.uk/visit/parks/regents-park-primrose-hill/primrose-hill', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5C88BA70' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/regents-park-primrose-hill/primrose-hill','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-5C88BA70'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The View from The Shard occupies levels 68, 69 and 72 of Renzo Piano’s tapering tower. At about 244 metres, its indoor galleries and partly open-air upper deck look across the Thames, railway approaches and the entire London basin, with interactive displays helping identify landmarks in every direction.', description_it='The View from The Shard occupa i livelli 68, 69 e 72 della torre rastremata di Renzo Piano. A circa 244 metri, le gallerie interne e la piattaforma superiore parzialmente all’aperto dominano il Tamigi, le linee ferroviarie e l’intero bacino londinese, con schermi interattivi per riconoscere i monumenti.',
  editorial_hook_en='London’s highest visitor galleries combine enclosed floors with a partly open-air deck 72 storeys above London Bridge.', editorial_hook_it='Le gallerie visitabili più alte di Londra uniscono piani chiusi e una terrazza parzialmente aperta al 72º piano sopra London Bridge.',
  official_url='https://www.theviewfromtheshard.com/', access_notes_en='Admission is ticketed. Prices, opening hours, booking rules and weather-related access can change; check the official venue site before travelling.', access_notes_it='L’ingresso è a pagamento. Prezzi, orari, prenotazioni e accesso legato al meteo possono cambiare; controlla il sito ufficiale prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D6A55970' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.theviewfromtheshard.com/plan-your-visit/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-D6A55970'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Horizon 22 is a free public viewing gallery on level 58 of 22 Bishopsgate, reached by high-speed lift. Its floor-to-ceiling glazing creates a roughly 300-degree panorama above the City, placing the Gherkin and Tower 42 close below while the Thames, Canary Wharf and west London stretch into the distance.', description_it='Horizon 22 è una galleria panoramica pubblica gratuita al livello 58 di 22 Bishopsgate, raggiunta con ascensori ad alta velocità. Le vetrate a tutta altezza creano un panorama di circa 300 gradi sopra la City, con Gherkin e Tower 42 vicini sotto e Tamigi, Canary Wharf e Londra ovest all’orizzonte.',
  editorial_hook_en='Level 58 glazing looks over the City’s towers from London’s highest free public viewing gallery.', editorial_hook_it='Le vetrate del livello 58 dominano le torri della City dalla più alta galleria panoramica pubblica gratuita di Londra.',
  official_url='https://horizon22.co.uk/', access_notes_en='Advance booking, security checks, opening hours and temporary closures can change. Check the official venue site before travelling.', access_notes_it='Prenotazione, controlli di sicurezza, orari e chiusure temporanee possono cambiare. Controlla il sito ufficiale prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5B55DAA6' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://horizon22.co.uk/visit/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-5B55DAA6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Lookout occupies the fiftieth floor of 8 Bishopsgate, a stepped City tower designed by WilkinsonEyre. The free gallery concentrates on broad south-and-west views: the Thames bends past St Paul’s and Tate Modern, while the Walkie Talkie, Shard and Westminster skyline line up beyond the glass.', description_it='The Lookout occupa il cinquantesimo piano di 8 Bishopsgate, torre a gradoni della City progettata da WilkinsonEyre. La galleria gratuita privilegia le ampie vedute verso sud e ovest: il Tamigi passa tra St Paul’s e Tate Modern, mentre Walkie Talkie, Shard e Westminster si allineano oltre le vetrate.',
  editorial_hook_en='A calm fiftieth-floor gallery frames St Paul’s, the Thames and the western skyline between neighbouring City towers.', editorial_hook_it='Una tranquilla galleria al cinquantesimo piano incornicia St Paul’s, il Tamigi e lo skyline occidentale tra le torri della City.',
  official_url='https://www.8bishopsgate.com/the-lookout', access_notes_en='Advance booking, security checks, opening hours and temporary closures can change. Check the official venue site before travelling.', access_notes_it='Prenotazione, controlli di sicurezza, orari e chiusure temporanee possono cambiare. Controlla il sito ufficiale prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CB0C2059' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.8bishopsgate.com/the-lookout','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-CB0C2059'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The roof of James Stirling and Michael Wilford’s No 1 Poultry is occupied by Coq d’Argent, not a public observation deck. Its landscaped terraces look directly over Bank junction, the Royal Exchange and the Bank of England, making the view inseparable from the building’s colourful postmodern architecture and a restaurant visit.', description_it='Il tetto del No 1 Poultry di James Stirling e Michael Wilford è occupato da Coq d’Argent, non da una piattaforma panoramica pubblica. Le terrazze paesaggistiche guardano direttamente su Bank junction, Royal Exchange e Bank of England, legando la vista all’architettura postmoderna colorata e a una visita al ristorante.',
  editorial_hook_en='A restaurant roof garden looks straight onto Bank’s historic institutions from Stirling’s landmark postmodern building.', editorial_hook_it='Un giardino sul tetto del ristorante guarda le istituzioni storiche di Bank dall’edificio postmoderno simbolo di Stirling.',
  official_url='https://www.coqdargent.co.uk/', access_notes_en='This view is inside a commercial venue; opening hours, reservations, minimum spend and terrace access can change. Check directly before travelling.', access_notes_it='La vista si trova in un locale commerciale; orari, prenotazioni, consumazione minima e accesso alla terrazza possono cambiare. Verifica direttamente prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-31D4E0CE' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.coqdargent.co.uk/venue/roof-terrace/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-31D4E0CE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Sky Garden fills the upper floors of 20 Fenchurch Street with planted terraces, restaurants and a public observation space. From around level 35, the curved glass opens close views of the Thames, Tower Bridge and the Shard, while the City’s older churches appear between newer towers below.', description_it='Sky Garden occupa i piani superiori di 20 Fenchurch Street con terrazze piantumate, ristoranti e uno spazio panoramico pubblico. Da circa il livello 35, il vetro curvo apre vedute ravvicinate su Tamigi, Tower Bridge e Shard, mentre le chiese storiche della City emergono tra le torri moderne.',
  editorial_hook_en='Terraced planting and curved glass place Tower Bridge, the Shard and the City churches beneath one indoor garden.', editorial_hook_it='Terrazze verdi e vetri curvi riuniscono Tower Bridge, Shard e chiese della City sotto un unico giardino interno.',
  official_url='https://skygarden.london/', access_notes_en='Advance booking, security checks, opening hours and temporary closures can change. Check the official venue site before travelling.', access_notes_it='Prenotazione, controlli di sicurezza, orari e chiusure temporanee possono cambiare. Controlla il sito ufficiale prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-55B5FAD6' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://skygarden.london/booking/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-55B5FAD6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Garden at 120 is a free open-air roof garden on the fifteenth floor of 120 Fenchurch Street. Wisteria-covered pergolas, fruit trees, grasses and a water feature soften a 360-degree terrace set unusually close to the Walkie Talkie, Scalpel and Lloyd’s building, with Tower Bridge visible to the east.', description_it='The Garden at 120 è un giardino pensile gratuito all’aperto al quindicesimo piano di 120 Fenchurch Street. Pergolati di glicine, alberi da frutto, graminacee e uno specchio d’acqua addolciscono una terrazza a 360 gradi vicinissima a Walkie Talkie, Scalpel e Lloyd’s, con Tower Bridge verso est.',
  editorial_hook_en='A genuinely open-air City garden puts visitors among wisteria, fruit trees and the surrounding skyscrapers.', editorial_hook_it='Un vero giardino all’aperto nella City porta i visitatori tra glicini, alberi da frutto e grattacieli circostanti.',
  official_url='https://www.thegardenat120.com/', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A34930A1' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.120fenchurchstreet.co.uk/roof-garden','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-A34930A1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Greenwich Park’s principal viewpoint stands beside the General Wolfe statue above the Royal Observatory. The formal axis drops through the Queen’s House and twin domes of the Old Royal Naval College to the Thames, with Canary Wharf rising directly beyond—a composition shaped by royal landscape design and maritime London.', description_it='Il principale punto panoramico di Greenwich Park si trova accanto alla statua del generale Wolfe, sopra il Royal Observatory. L’asse formale scende attraverso Queen’s House e le cupole dell’Old Royal Naval College fino al Tamigi, con Canary Wharf alle spalle: una composizione di paesaggio reale e Londra marittima.',
  editorial_hook_en='Queen’s House, Wren’s riverside domes and Canary Wharf align below the Royal Observatory in London’s great formal vista.', editorial_hook_it='Queen’s House, le cupole fluviali di Wren e Canary Wharf si allineano sotto il Royal Observatory nella grande veduta formale londinese.',
  official_url='https://www.royalparks.org.uk/visit/parks/greenwich-park', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BFB4236C' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/greenwich-park','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-BFB4236C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Oxo Tower’s eighth floor includes a small public viewing gallery beside the restaurant, bar and brasserie. The west-facing opening looks along the Thames toward St Paul’s Cathedral, Blackfriars and the City; because access is embedded in a working hospitality venue, visitors should confirm the gallery’s current availability.', description_it='L’ottavo piano di Oxo Tower comprende una piccola galleria panoramica pubblica accanto a ristorante, bar e brasserie. L’apertura verso ovest segue il Tamigi fino a St Paul’s, Blackfriars e la City; poiché l’accesso è dentro un locale attivo, conviene verificare la disponibilità della galleria.',
  editorial_hook_en='A small eighth-floor gallery isolates a classic Thames-and-St Paul’s view within the Oxo Tower restaurant complex.', editorial_hook_it='Una piccola galleria all’ottavo piano ritaglia la classica veduta del Tamigi e St Paul’s nel complesso di Oxo Tower.',
  official_url='https://oxotowerrestaurant.com/', access_notes_en='This is not an unrestricted public viewpoint. Access is limited, tour-led or event-dependent, so confirm the current arrangement before travelling.', access_notes_it='Non è un punto panoramico pubblico ad accesso libero. L’ingresso è limitato, con visita guidata o legato a eventi: verifica le modalità prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V6' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://coinstreet.org/shops-galleries-and-designers/oxo-tower-wharf','official-or-authoritative','2026-10-16' FROM places WHERE id='V6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Tate Modern’s Blavatnik Building rises above the former Bankside Power Station, with a Level 10 viewing area looking north and west across the Thames. St Paul’s and the Millennium Bridge dominate the scene; outdoor terrace access has been restricted, so the current experience should be checked rather than assumed.', description_it='Il Blavatnik Building della Tate Modern si alza sopra l’ex Bankside Power Station e offre al livello 10 una zona panoramica verso nord e ovest sul Tamigi. St Paul’s e Millennium Bridge dominano la scena; l’accesso alla terrazza esterna è stato limitato, quindi va verificata l’esperienza disponibile.',
  editorial_hook_en='The power station’s new tower frames St Paul’s and Millennium Bridge from Level 10, with outdoor access no longer guaranteed.', editorial_hook_it='La nuova torre della centrale incornicia St Paul’s e Millennium Bridge dal livello 10, senza garanzia di accesso esterno.',
  official_url='https://www.tate.org.uk/visit/tate-modern', access_notes_en='This is not an unrestricted public viewpoint. Access is limited, tour-led or event-dependent, so confirm the current arrangement before travelling.', access_notes_it='Non è un punto panoramico pubblico ad accesso libero. L’ingresso è limitato, con visita guidata o legato a eventi: verifica le modalità prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C80106E3' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.tate.org.uk/visit/tate-modern/display/viewing-level','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-C80106E3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Tate Modern’s Level 6 Terrace Café and Bar occupies the river side of the Natalie Bell Building. Its windows and terrace face directly across the Thames to St Paul’s Cathedral, with the Millennium Bridge forming the foreground; the panorama is part of a café and bar rather than a separate observation attraction.', description_it='Il Level 6 Terrace Café and Bar della Tate Modern occupa il lato fluviale del Natalie Bell Building. Vetrate e terrazza guardano direttamente oltre il Tamigi verso St Paul’s Cathedral, con Millennium Bridge in primo piano; il panorama appartiene a un caffè-bar, non a un’attrazione panoramica separata.',
  editorial_hook_en='Coffee and drinks come with a direct sixth-floor sightline across Millennium Bridge to St Paul’s dome.', editorial_hook_it='Caffè e drink accompagnano una visuale diretta dal sesto piano, oltre Millennium Bridge fino alla cupola di St Paul’s.',
  official_url='https://www.tate.org.uk/visit/tate-modern/eat-shop', access_notes_en='This view is inside a commercial venue; opening hours, reservations, minimum spend and terrace access can change. Check directly before travelling.', access_notes_it='La vista si trova in un locale commerciale; orari, prenotazioni, consumazione minima e accesso alla terrazza possono cambiare. Verifica direttamente prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DD4BA92F' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.tate.org.uk/visit/tate-modern/eat-shop','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-DD4BA92F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Queen Elizabeth Hall Roof Garden was created with the Eden Project in 2011 above the Southbank Centre’s concrete terraces. Lawns, allotment beds, wildflowers and more than 200 native species overlook the Thames; it is seasonal and is currently closed for autumn and winter, with reopening announced for April 2027.', description_it='Il Roof Garden della Queen Elizabeth Hall fu creato con l’Eden Project nel 2011 sopra le terrazze in cemento del Southbank Centre. Prati, orti, fiori spontanei e oltre 200 specie autoctone guardano il Tamigi; è stagionale ed è ora chiuso per autunno e inverno, con riapertura annunciata ad aprile 2027.',
  editorial_hook_en='A community-grown meadow above Southbank brutalism overlooks the Thames, but remains closed until April 2027.', editorial_hook_it='Un prato comunitario sopra il brutalismo della South Bank guarda il Tamigi, ma resta chiuso fino ad aprile 2027.',
  official_url='https://www.southbankcentre.co.uk/visit/cafes-restaurants-bars/queen-elizabeth-hall-roof-garden/', access_notes_en='This is a seasonal venue. Dates, hours, booking rules and rooftop access change each year; check the official programme before travelling.', access_notes_it='È un luogo stagionale. Date, orari, prenotazioni e accesso al tetto cambiano ogni anno; controlla il programma ufficiale prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F8A41048' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.southbankcentre.co.uk/visit/cafes-restaurants-bars/queen-elizabeth-hall-roof-garden/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-F8A41048'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The planted roof above Cannon Street station belongs to the Cannon Bridge House office complex and is not a general public viewpoint. Its lawns and terraces overlook the Thames, Southwark Bridge and St Paul’s, but access is normally for building users or occasional organised events, not walk-up sightseeing.', description_it='Il tetto verde sopra Cannon Street station appartiene al complesso di uffici Cannon Bridge House e non è un punto panoramico pubblico. Prati e terrazze guardano Tamigi, Southwark Bridge e St Paul’s, ma l’accesso è normalmente riservato agli utenti dell’edificio o a eventi organizzati, non alle visite spontanee.',
  editorial_hook_en='A private office garden above railway platforms has exceptional river views but no routine public access.', editorial_hook_it='Un giardino privato sopra i binari offre vedute eccezionali sul fiume, ma nessun accesso pubblico ordinario.',
  official_url='https://www.cannonbridgehouse.co.uk/', access_notes_en='This is not an unrestricted public viewpoint. Access is limited, tour-led or event-dependent, so confirm the current arrangement before travelling.', access_notes_it='Non è un punto panoramico pubblico ad accesso libero. L’ingresso è limitato, con visita guidata o legato a eventi: verifica le modalità prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-EFD89C75' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cannonbridgehouse.co.uk/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-EFD89C75'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Marryat Road climbs the ridge east of Wimbledon Common, where gaps between houses give long views over the All England Lawn Tennis Club and toward central London. This is an ordinary residential street rather than a formal platform, so the interest lies in the sudden topographic reveal and visitors should respect residents.', description_it='Marryat Road sale sul crinale a est di Wimbledon Common, dove gli spazi tra le case aprono lunghe vedute sull’All England Lawn Tennis Club e verso il centro di Londra. È una normale strada residenziale, non una terrazza: l’interesse sta nella sorpresa topografica e occorre rispettare gli abitanti.',
  editorial_hook_en='A steep Wimbledon street unexpectedly reveals the tennis grounds and distant central skyline between houses.', editorial_hook_it='Una ripida strada di Wimbledon rivela all’improvviso i campi da tennis e lo skyline centrale tra le case.',
  official_url='https://www.merton.gov.uk/planning-and-buildings/conservation-and-heritage/conservation-areas', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2644D3DB' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.merton.gov.uk/system/files/marryat_road_ca_character_assessment.pdf','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-2644D3DB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Stave Hill is an artificial mound created from spoil during the redevelopment of Surrey Docks. A spiral path reaches a summit marker above Stave Hill Ecological Park, revealing dock basins, Canary Wharf, the City and the Thames-side towers while reedbeds and woodland below recall the area’s industrial-water landscape.', description_it='Stave Hill è una collina artificiale creata con materiali di scavo durante la riqualificazione dei Surrey Docks. Un sentiero a spirale raggiunge il cippo sommitale sopra l’Ecological Park, mostrando bacini portuali, Canary Wharf, City e torri sul Tamigi, mentre canneti e boschi ricordano il paesaggio industriale d’acqua.',
  editorial_hook_en='A spiral climb over dockland spoil ends above reedbeds, former basins and the Canary Wharf skyline.', editorial_hook_it='Una salita a spirale sui materiali dei vecchi docks termina sopra canneti, bacini e skyline di Canary Wharf.',
  official_url='https://www.tcv.org.uk/london/urbanecology/urban-ecology-sites/stave-hill-ecological-park/', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V2' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.tcv.org.uk/london/urbanecology/urban-ecology-sites/stave-hill-ecological-park/','official-or-authoritative','2026-10-16' FROM places WHERE id='V2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Peter Jones occupies a Grade II* listed modernist department store on Sloane Square, rebuilt in the 1930s. The top-floor café’s wraparound windows look over Chelsea rooftops toward Battersea and central London; this is an informal view available while using the shop’s hospitality space, not a dedicated terrace.', description_it='Peter Jones occupa un grande magazzino modernista Grade II* a Sloane Square, ricostruito negli anni Trenta. Le finestre avvolgenti del caffè all’ultimo piano guardano i tetti di Chelsea verso Battersea e il centro; è una vista informale legata al locale, non una terrazza panoramica dedicata.',
  editorial_hook_en='Wraparound café windows reveal Chelsea’s roofs from the top of a landmark 1930s department store.', editorial_hook_it='Le finestre avvolgenti del caffè mostrano i tetti di Chelsea dall’alto di un celebre grande magazzino degli anni Trenta.',
  official_url='https://www.johnlewis.com/our-shops/peter-jones', access_notes_en='This view is inside a commercial venue; opening hours, reservations, minimum spend and terrace access can change. Check directly before travelling.', access_notes_it='La vista si trova in un locale commerciale; orari, prenotazioni, consumazione minima e accesso alla terrazza possono cambiare. Verifica direttamente prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V11' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.johnlewis.com/our-shops/peter-jones','official-or-authoritative','2026-10-16' FROM places WHERE id='V11'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Frank’s Cafe crowns the multi-storey car park used by Bold Tendencies for its summer arts programme in Peckham. The open concrete roof looks west across south London to the City, St Paul’s and the Shard, with large-scale sculpture sharing the space; the 2026 season ran from 15 May to 12 September and has ended.', description_it='Frank’s Cafe occupa il tetto del parcheggio multipiano usato da Bold Tendencies per il programma artistico estivo a Peckham. Il piano di cemento aperto guarda a ovest sulla Londra sud fino a City, St Paul’s e Shard, tra sculture monumentali; la stagione 2026 è durata dal 15 maggio al 12 settembre ed è terminata.',
  editorial_hook_en='Summer sculpture, drinks and an unobstructed skyline share the roof of Peckham’s former car park.', editorial_hook_it='Sculture estive, drink e skyline senza ostacoli condividono il tetto dell’ex parcheggio di Peckham.',
  official_url='https://boldtendencies.com/visit/', access_notes_en='This is a seasonal venue. Dates, hours, booking rules and rooftop access change each year; check the official programme before travelling.', access_notes_it='È un luogo stagionale. Date, orari, prenotazioni e accesso al tetto cambiano ogni anno; controlla il programma ufficiale prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-866FB84F' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://boldtendencies.com/visit/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-866FB84F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Peckham Levels has converted seven underused floors of a multi-storey car park into studios, food spaces and cultural venues. Multi Story on Level 6 opens toward broad west-facing views across Peckham’s roofs to the City; the panorama belongs to an independent bar, café and events space with its own programme.', description_it='Peckham Levels ha trasformato sette piani sottoutilizzati di un parcheggio multipiano in studi, ristorazione e spazi culturali. Multi Story al livello 6 apre ampie vedute verso ovest sopra i tetti di Peckham fino alla City; il panorama appartiene a un bar-caffè e spazio eventi indipendente.',
  editorial_hook_en='A sixth-floor cultural venue looks from Peckham’s roofs to the City inside a repurposed car park.', editorial_hook_it='Uno spazio culturale al sesto piano guarda dai tetti di Peckham fino alla City dentro un parcheggio riconvertito.',
  official_url='https://peckhamlevels.org/', access_notes_en='This view is inside a commercial venue; opening hours, reservations, minimum spend and terrace access can change. Check directly before travelling.', access_notes_it='La vista si trova in un locale commerciale; orari, prenotazioni, consumazione minima e accesso alla terrazza possono cambiare. Verifica direttamente prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E471D939' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://peckhamlevels.org/multi-story/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-E471D939'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='John Lewis Oxford Street’s 1864 Rooftop Bar & Kitchen sits on the sixth floor above the department store. Its terrace looks over Marylebone and the West End, with the BT Tower and central skyline rising beyond; entry, tables and the view are governed by a seasonal hospitality operation rather than public-deck rules.', description_it='L’1864 Rooftop Bar & Kitchen di John Lewis Oxford Street si trova al sesto piano sopra il grande magazzino. La terrazza guarda Marylebone e West End, con BT Tower e skyline centrale sullo sfondo; ingresso, tavoli e vista seguono le regole di un locale stagionale, non di una piattaforma pubblica.',
  editorial_hook_en='A sixth-floor terrace opens an unusual department-store view across Marylebone and the West End.', editorial_hook_it='Una terrazza al sesto piano apre un’insolita veduta dal grande magazzino su Marylebone e West End.',
  official_url='https://www.johnlewis.com/our-shops/oxford-street', access_notes_en='This view is inside a commercial venue; opening hours, reservations, minimum spend and terrace access can change. Check directly before travelling.', access_notes_it='La vista si trova in un locale commerciale; orari, prenotazioni, consumazione minima e accesso alla terrazza possono cambiare. Verifica direttamente prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-ED38ED01' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.johnlewis.com/our-shops/oxford-street','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-ED38ED01'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Telegraph Hill Upper Park occupies the higher half of a Victorian public park split by Kitto Road. The sloping lawns look northwest over New Cross and Brockley toward central London, where the Shard and City towers stand clear on good days; mature trees and a restored ornamental pond frame the foreground.', description_it='Telegraph Hill Upper Park occupa la metà più alta di un parco pubblico vittoriano diviso da Kitto Road. I prati in pendenza guardano a nord-ovest sopra New Cross e Brockley verso il centro, con Shard e torri della City ben visibili nelle giornate limpide; alberi maturi e laghetto ornamentale incorniciano il primo piano.',
  editorial_hook_en='Victorian lawns descend toward a clear northwest sightline from New Cross to the Shard and City.', editorial_hook_it='Prati vittoriani scendono lungo una visuale nitida da New Cross verso Shard e City.',
  official_url='https://lewisham.gov.uk/inmyarea/openspaces/parks/telegraph-hill-park', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B1EA46B0' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://lewisham.gov.uk/inmyarea/openspaces/parks/telegraph-hill-park','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-B1EA46B0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Point is a small public open space on the steep Greenwich escarpment above Point Hill. Its protected panorama looks northwest across Deptford toward St Paul’s, the City and Canary Wharf, with roofs and railway infrastructure revealing the working fabric between Blackheath and the Thames.', description_it='The Point è un piccolo spazio pubblico sul ripido rilievo di Greenwich sopra Point Hill. Il panorama protetto guarda a nord-ovest oltre Deptford verso St Paul’s, City e Canary Wharf, mentre tetti e infrastrutture ferroviarie mostrano il tessuto urbano operativo tra Blackheath e Tamigi.',
  editorial_hook_en='A pocket green on Greenwich’s escarpment compresses Deptford, St Paul’s, the City and Canary Wharf into one protected panorama.', editorial_hook_it='Un piccolo prato sul rilievo di Greenwich riunisce Deptford, St Paul’s, City e Canary Wharf in un panorama protetto.',
  official_url='https://lewisham.gov.uk/inmyarea/openspaces/parks/the-point', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3961581E' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://lewisham.gov.uk/inmyarea/openspaces/parks/the-point','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-3961581E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Greenwich Park’s One Tree Hill is a quieter historic viewpoint east of the Royal Observatory. Once favoured before the General Wolfe terrace became dominant, it looks across the park and maritime town toward the Thames; J. M. W. Turner painted the prospect in 1809, preserving its earlier landscape character.', description_it='One Tree Hill a Greenwich Park è un punto panoramico storico più tranquillo a est del Royal Observatory. Preferito prima che dominasse la terrazza del generale Wolfe, guarda sul parco e sulla città marittima verso il Tamigi; J. M. W. Turner dipinse la veduta nel 1809, conservandone il carattere antico.',
  editorial_hook_en='Turner’s quieter Greenwich viewpoint survives east of the Observatory, looking across royal parkland toward the Thames.', editorial_hook_it='Il più tranquillo punto panoramico di Turner sopravvive a est dell’Osservatorio, sopra il parco reale verso il Tamigi.',
  official_url='https://www.royalparks.org.uk/visit/parks/greenwich-park/greenwich-park-revealed', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-21132E83' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/greenwich-park/greenwich-park-revealed','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-21132E83'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The viewpoint at Lesnes Abbey Woods stands on high ground above the ruins of an abbey founded in 1178. From the edge of ancient woodland, the land falls across Thamesmead toward the central and Docklands skylines, combining medieval remains, chalk-and-clay geology and a broad east-London horizon in one visit.', description_it='Il belvedere di Lesnes Abbey Woods si trova sull’altura sopra le rovine di un’abbazia fondata nel 1178. Dal margine del bosco antico, il terreno scende su Thamesmead verso gli skyline centrale e dei Docklands, unendo resti medievali, geologia di gesso e argilla e ampio orizzonte della Londra est.',
  editorial_hook_en='Abbey ruins and ancient woodland occupy the foreground to a long westward skyline above Thamesmead.', editorial_hook_it='Rovine abbaziali e bosco antico fanno da primo piano a un lungo skyline verso ovest sopra Thamesmead.',
  official_url='https://www.lesnesabbeywoods.org/', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-41FD7373' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lesnesabbeywoods.org/visit','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-41FD7373'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='One New Change’s public roof terrace sits immediately east of St Paul’s Cathedral. The lift and glass-walled approach turn the cathedral dome into a carefully framed close-up, while the open terrace adds views toward the Shard and City; access is free but can close for weather, security or private events.', description_it='La terrazza pubblica di One New Change si trova subito a est di St Paul’s Cathedral. L’ascensore e l’accesso tra pareti di vetro incorniciano da vicino la cupola, mentre la terrazza aperta mostra anche Shard e City; l’ingresso è gratuito ma può chiudere per meteo, sicurezza o eventi privati.',
  editorial_hook_en='Few London roofs place visitors as close to St Paul’s dome as this free terrace beside the cathedral.', editorial_hook_it='Pochi tetti londinesi portano così vicino alla cupola di St Paul’s come questa terrazza gratuita accanto alla cattedrale.',
  official_url='https://www.onenewchange.com/roof-terrace', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D509B7C2' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.onenewchange.com/roof-terrace','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-D509B7C2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Kenwood’s viewpoint lies on the northern edge of Hampstead Heath, where open pasture below the eighteenth-century house turns toward central London. The distant dome of St Paul’s anchors one of the capital’s protected viewing corridors, while the intervening heathland keeps the foreground unusually green and open.', description_it='Il punto panoramico di Kenwood si trova al margine nord di Hampstead Heath, dove i prati sotto la villa settecentesca si orientano verso il centro di Londra. La cupola lontana di St Paul’s fissa uno dei corridoi visivi protetti della capitale, mentre la brughiera mantiene il primo piano eccezionalmente verde e aperto.',
  editorial_hook_en='St Paul’s appears beyond a broad heathland foreground in one of London’s protected long-distance views.', editorial_hook_it='St Paul’s appare oltre un vasto primo piano di brughiera in una delle vedute lontane protette di Londra.',
  official_url='https://www.english-heritage.org.uk/visit/places/kenwood/', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8EEA8BAB' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.london.gov.uk/programmes-strategies/planning/implementing-london-plan/london-plan-guidance-and-spgs/london-view-management-framework','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-8EEA8BAB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Addington Hills preserves woodland and rare heath on one of south London’s highest ridges. The viewing platform, about 140 metres above sea level, opens across Croydon toward Docklands and north London; Scots pine, birch and heather make the immediate setting feel markedly wilder than the suburban landscape below.', description_it='Addington Hills conserva bosco e rara brughiera su uno dei crinali più alti della Londra sud. La piattaforma, a circa 140 metri sul mare, guarda oltre Croydon verso Docklands e nord di Londra; pini silvestri, betulle ed erica rendono l’ambiente molto più selvatico dei sobborghi sottostanti.',
  editorial_hook_en='Heath and pine woodland suddenly give way to a high platform above Croydon’s roofs and distant Docklands.', editorial_hook_it='Brughiera e pineta cedono all’improvviso a una piattaforma alta sopra i tetti di Croydon e i lontani Docklands.',
  official_url='https://www.croydon.gov.uk/leisure/parks-and-open-spaces/parks-and-open-spaces-directory/addington-hills', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-69BD4ABD' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.croydon.gov.uk/leisure/parks-and-open-spaces/parks-and-open-spaces-directory/addington-hills','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-69BD4ABD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Farthing Downs is a long chalk ridge on London’s southern boundary, managed as part of the City Commons. Its open grassland gives wide views over the Chipstead Valley and toward London, while orchids, greater yellow-rattle, ancient field systems and burial mounds make the walk as much about ecology and archaeology as skyline.', description_it='Farthing Downs è un lungo crinale calcareo sul confine meridionale di Londra, gestito tra i City Commons. I prati aperti offrono ampie vedute sulla Chipstead Valley e verso Londra; orchidee, rinanto maggiore, antichi campi e tumuli rendono la passeggiata importante quanto il panorama per ecologia e archeologia.',
  editorial_hook_en='Chalk grassland, orchids and prehistoric earthworks share a windswept ridge above the Chipstead Valley.', editorial_hook_it='Prati calcarei, orchidee e tracce preistoriche condividono un crinale ventoso sopra la Chipstead Valley.',
  official_url='https://www.cityoflondon.gov.uk/things-to-do/green-spaces/farthing-downs', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A7574105' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cityoflondon.gov.uk/things-to-do/green-spaces/farthing-downs','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-A7574105'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='This eastern Richmond Park viewpoint lies on the high ground around Broomfield Hill, where the land falls toward Roehampton and the central skyline appears beyond woodland. Unlike King Henry’s Mound’s formal St Paul’s corridor, this is a broad, changing park panorama shaped by veteran trees, bracken and seasonal visibility.', description_it='Questo punto panoramico nella parte orientale di Richmond Park si trova sulle alture di Broomfield Hill, dove il terreno scende verso Roehampton e lo skyline centrale appare oltre il bosco. Diversamente dal corridoio formale di King Henry’s Mound verso St Paul’s, è un panorama ampio e variabile tra alberi secolari e felci.',
  editorial_hook_en='Veteran trees and bracken frame a less formal central-London skyline from Richmond Park’s eastern high ground.', editorial_hook_it='Alberi secolari e felci incorniciano uno skyline centrale meno formale dalle alture orientali di Richmond Park.',
  official_url='https://www.royalparks.org.uk/visit/parks/richmond-park', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-47F6D7A8' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/richmond-park/things-to-see-and-do','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-47F6D7A8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Box Hill’s Salomons Memorial viewpoint stands high above the Mole Gap in the Surrey Hills, outside Greater London. The chalk escarpment looks over Dorking, vineyard slopes and the Weald rather than the London skyline; paths connect it with ancient box woodland, downland habitat and the steep stepping-stone route by the River Mole.', description_it='Il belvedere Salomons Memorial di Box Hill domina il Mole Gap nelle Surrey Hills, fuori dalla Greater London. La scarpata calcarea guarda Dorking, vigneti e Weald, non lo skyline londinese; i sentieri la collegano a boschi antichi di bosso, habitat di prateria e al ripido percorso delle stepping stones sul River Mole.',
  editorial_hook_en='This Surrey escarpment looks across the Mole Gap and Weald, a countryside panorama rather than a London skyline.', editorial_hook_it='Questa scarpata del Surrey guarda Mole Gap e Weald: un panorama di campagna, non dello skyline londinese.',
  official_url='https://www.nationaltrust.org.uk/visit/surrey/box-hill', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-1C199D84' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nationaltrust.org.uk/visit/surrey/box-hill/walking','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-1C199D84'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Monument, designed by Christopher Wren and Robert Hooke, rises 202 feet—the same distance from its base to the bakery in Pudding Lane where the Great Fire began. A spiral staircase of 311 steps reaches the caged viewing platform for close views of London Bridge, the Thames, the Shard and City rooftops.', description_it='The Monument, progettato da Christopher Wren e Robert Hooke, è alto 202 piedi: la stessa distanza tra la base e il forno di Pudding Lane dove iniziò il Great Fire. Una scala a chiocciola di 311 gradini raggiunge la piattaforma protetta, con vedute ravvicinate su London Bridge, Tamigi, Shard e tetti della City.',
  editorial_hook_en='Climb 311 steps inside Wren and Hooke’s Great Fire memorial for a close-range panorama of the City and Thames.', editorial_hook_it='Salendo 311 gradini nel memoriale del Great Fire di Wren e Hooke si apre un panorama ravvicinato su City e Tamigi.',
  official_url='https://www.themonument.org.uk/', access_notes_en='Admission is ticketed. Prices, opening hours, booking rules and weather-related access can change; check the official venue site before travelling.', access_notes_it='L’ingresso è a pagamento. Prezzi, orari, prenotazioni e accesso legato al meteo possono cambiare; controlla il sito ufficiale prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-30EF7A3A' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.themonument.org.uk/plan-your-visit','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-30EF7A3A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Post Building’s public roof garden crowns the redevelopment of the former Royal Mail sorting office between New Oxford Street and Holborn. Cherry trees, grasses and perennial planting occupy a high terrace with views over Bloomsbury, the West End and the City, reached through a staffed entrance with security procedures.', description_it='Il giardino pensile pubblico di The Post Building corona la trasformazione dell’ex centro di smistamento Royal Mail tra New Oxford Street e Holborn. Ciliegi, graminacee e piante perenni occupano una terrazza alta con vedute su Bloomsbury, West End e City, raggiunta da un ingresso sorvegliato con controlli.',
  editorial_hook_en='Cherry trees and perennial borders overlook Bloomsbury from the roof of a converted Royal Mail sorting office.', editorial_hook_it='Ciliegi e bordure perenni guardano Bloomsbury dal tetto di un ex centro di smistamento Royal Mail.',
  official_url='https://www.thepostbuilding.com/', access_notes_en='Advance booking, security checks, opening hours and temporary closures can change. Check the official venue site before travelling.', access_notes_it='Prenotazione, controlli di sicurezza, orari e chiusure temporanee possono cambiare. Controlla il sito ufficiale prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E489C56F' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.thepostbuilding.com/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-E489C56F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='One Tree Hill in Honor Oak is a wooded remnant of the Great North Wood, distinct from the hill of the same name in Greenwich Park. A steep climb reaches an open summit with a protected view toward St Paul’s; a marker recalls the ‘Oak of Honour’ tradition associated with Elizabeth I.', description_it='One Tree Hill a Honor Oak è un frammento boscoso dell’antica Great North Wood, distinto dall’omonima collina di Greenwich Park. Una salita ripida raggiunge la cima aperta con veduta protetta verso St Paul’s; un cippo ricorda la tradizione dell’“Oak of Honour” legata a Elisabetta I.',
  editorial_hook_en='Ancient woodland gives way to a protected St Paul’s sightline and the legend behind the name Honor Oak.', editorial_hook_it='Il bosco antico lascia spazio a una visuale protetta su St Paul’s e alla leggenda che diede il nome a Honor Oak.',
  official_url='https://www.southwark.gov.uk/parks-and-open-spaces/parks/one-tree-hill', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V7' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.southwark.gov.uk/parks-and-open-spaces/parks/one-tree-hill','official-or-authoritative','2026-10-16' FROM places WHERE id='V7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Sawyer’s Hill crosses the northern high ground of Richmond Park between the Roehampton and Richmond sides. Near Pembroke Lodge, openings in the veteran-oak landscape reveal west London and the distant central skyline; the experience is a sequence of changing roadside and footpath views rather than a single constructed platform.', description_it='Sawyer’s Hill attraversa le alture settentrionali di Richmond Park tra Roehampton e Richmond. Vicino a Pembroke Lodge, aperture nel paesaggio di querce secolari mostrano Londra ovest e lo skyline centrale lontano; l’esperienza è una sequenza di vedute variabili da strada e sentieri, non una piattaforma unica.',
  editorial_hook_en='Openings between Richmond Park’s veteran oaks reveal shifting glimpses of west and central London along the ridge.', editorial_hook_it='Le aperture tra le querce secolari di Richmond Park rivelano scorci mutevoli della Londra occidentale e centrale lungo il crinale.',
  official_url='https://www.royalparks.org.uk/visit/parks/richmond-park', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V8' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/richmond-park/things-to-see-and-do','official-or-authoritative','2026-10-16' FROM places WHERE id='V8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Harrow Viewpoint sits on the historic Harrow Hill ridge near St Mary’s church, where the land drops sharply toward north-west London. The elevated churchyard and surrounding lanes open long views toward central London and the Chilterns, while medieval fabric, school buildings and village streets give the panorama a distinctive hilltop setting.', description_it='Harrow Viewpoint si trova sullo storico crinale di Harrow Hill vicino alla chiesa di St Mary, dove il terreno scende bruscamente verso la Londra nord-occidentale. Il cimitero sopraelevato e le vie circostanti aprono lunghe vedute verso il centro e le Chilterns, tra architetture medievali, edifici scolastici e strade di villaggio.',
  editorial_hook_en='A medieval church and old village lanes crown the steep hill above north-west London’s broad urban plain.', editorial_hook_it='Una chiesa medievale e antiche vie di villaggio coronano la ripida collina sopra la vasta pianura urbana della Londra nord-occidentale.',
  official_url='https://www.harrow.gov.uk/environment-parks/harrow-hill', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V9' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1001495','official-or-authoritative','2026-10-16' FROM places WHERE id='V9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='CÉ LA VI occupies the seventeenth and eighteenth floors of Paddington Square, beside the rebuilt station. Its restaurant, sky bar and terraces survey the rail approaches, Hyde Park and west London, with the Shard visible across the centre; the view is part of a high-end hospitality venue requiring the appropriate reservation or entry.', description_it='CÉ LA VI occupa il diciassettesimo e diciottesimo piano di Paddington Square, accanto alla stazione ricostruita. Ristorante, sky bar e terrazze dominano binari, Hyde Park e Londra ovest, con Shard oltre il centro; la vista appartiene a un locale di fascia alta e richiede prenotazione o accesso appropriato.',
  editorial_hook_en='Paddington’s rail fan, Hyde Park and the distant Shard spread below two floors of restaurants, bars and terraces.', editorial_hook_it='Il fascio ferroviario di Paddington, Hyde Park e lo Shard lontano si stendono sotto due piani di ristoranti, bar e terrazze.',
  official_url='https://ldn.celavi.com/', access_notes_en='This view is inside a commercial venue; opening hours, reservations, minimum spend and terrace access can change. Check directly before travelling.', access_notes_it='La vista si trova in un locale commerciale; orari, prenotazioni, consumazione minima e accesso alla terrazza possono cambiare. Verifica direttamente prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V12' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://ldn.celavi.com/','official-or-authoritative','2026-10-16' FROM places WHERE id='V12'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Gipsy Hill follows a steep ridge west of Crystal Palace, and this point near the upper slope opens intermittent views across south London. The interest is topographic rather than monumental: Victorian terraces, mature street trees and the fall toward Norwood frame distant central towers, with no formal viewing platform or dedicated visitor facilities.', description_it='Gipsy Hill segue un ripido crinale a ovest di Crystal Palace e questo punto sul versante alto apre vedute intermittenti sulla Londra sud. L’interesse è topografico più che monumentale: terrazze vittoriane, alberi maturi e la discesa verso Norwood incorniciano le torri centrali lontane, senza piattaforma o servizi dedicati.',
  editorial_hook_en='A steep Victorian street uses the Crystal Palace ridge to reveal distant towers between trees and terraces.', editorial_hook_it='Una ripida strada vittoriana sfrutta il crinale di Crystal Palace per mostrare torri lontane tra alberi e case a schiera.',
  official_url='https://www.lambeth.gov.uk/parks-sports-leisure/parks', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V10' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lambeth.gov.uk/planning-building-control/conservation-design/conservation-areas','official-or-authoritative','2026-10-16' FROM places WHERE id='V10'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='King Henry’s Mound is a prehistoric barrow adapted as a viewpoint in Richmond Park’s Pembroke Lodge Gardens. A telescope identifies the protected ten-mile corridor to St Paul’s Cathedral between the trees; the opposite side looks west over the Thames Valley, and a traditional tale links the mound to Henry VIII.', description_it='King Henry’s Mound è un tumulo preistorico trasformato in belvedere nei Pembroke Lodge Gardens di Richmond Park. Un telescopio indica il corridoio protetto di dieci miglia verso St Paul’s tra gli alberi; sul lato opposto si apre la Thames Valley, mentre una leggenda collega il tumulo a Enrico VIII.',
  editorial_hook_en='A prehistoric mound preserves a ten-mile, legally protected keyhole view through the trees to St Paul’s.', editorial_hook_it='Un tumulo preistorico conserva una visuale di dieci miglia, protetta per legge, tra gli alberi fino a St Paul’s.',
  official_url='https://www.royalparks.org.uk/visit/parks/richmond-park/king-henrys-mound', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V3' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/richmond-park/king-henrys-mound','official-or-authoritative','2026-10-16' FROM places WHERE id='V3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Alexandra Palace occupies a ridge above north London, where its south terrace commands one of the city’s broadest free panoramas. The view runs from the Shard and St Paul’s to Canary Wharf, with the park falling away in front; the palace itself was built as a Victorian ‘People’s Palace’ and later became central to early television.', description_it='Alexandra Palace occupa un crinale sopra la Londra nord, dove la terrazza sud offre uno dei più ampi panorami gratuiti della città. La vista va da Shard e St Paul’s a Canary Wharf, con il parco che scende in primo piano; il palazzo nacque come “People’s Palace” vittoriano e fu poi centrale nella prima televisione.',
  editorial_hook_en='The People’s Palace terrace surveys almost the whole central skyline above a long green slope.', editorial_hook_it='La terrazza del People’s Palace domina quasi tutto lo skyline centrale sopra un lungo pendio verde.',
  official_url='https://www.alexandrapalace.com/', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V1' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.alexandrapalace.com/the-park/','official-or-authoritative','2026-10-16' FROM places WHERE id='V1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Pudding Lane viewing terrace is a surviving fragment of the City’s raised pedestrian walkways, reached by steps near Monument Street. The route passes through St Magnus House to an overlooked riverside platform with views of London Bridge, the Shard and Tower Bridge, while interpretation below marks the Roman waterfront.', description_it='La terrazza panoramica di Pudding Lane è un frammento superstite dei passaggi pedonali sopraelevati della City, raggiunto da scale vicino a Monument Street. Il percorso attraversa St Magnus House fino a una piattaforma fluviale nascosta con viste su London Bridge, Shard e Tower Bridge; sotto è segnalato l’antico lungofiume romano.',
  editorial_hook_en='A remnant City pedway leads through an office block to a little-known free terrace above the Thames.', editorial_hook_it='Un tratto superstite di passerella della City attraversa un edificio per raggiungere una terrazza gratuita poco nota sopra il Tamigi.',
  official_url='https://www.cityoflondon.gov.uk/things-to-do/architecture/city-walkways', access_notes_en='This is not an unrestricted public viewpoint. Access is limited, tour-led or event-dependent, so confirm the current arrangement before travelling.', access_notes_it='Non è un punto panoramico pubblico ad accesso libero. L’ingresso è limitato, con visita guidata o legato a eventi: verifica le modalità prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C2BD9C30' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.ianvisits.co.uk/articles/a-secret-viewing-platform-overlooking-the-thames-53038/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-C2BD9C30'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Severndroog Castle is an eighteenth-century Gothic tower on Shooters Hill, built as a memorial to Commodore Sir William James. Its roof platform stands about 132 metres above sea level and can see across London and, in clear weather, several surrounding counties; the narrow interior is normally visited during limited Sunday opening.', description_it='Severndroog Castle è una torre gotica settecentesca su Shooters Hill, costruita in memoria del commodoro Sir William James. La piattaforma sul tetto, a circa 132 metri sul mare, guarda Londra e, con cielo limpido, diverse contee circostanti; l’interno stretto è normalmente visitabile con apertura limitata la domenica.',
  editorial_hook_en='A Gothic memorial tower on Shooters Hill lifts visitors above the woods for views across London and several counties.', editorial_hook_it='Una torre commemorativa gotica su Shooters Hill porta sopra il bosco per vedute su Londra e diverse contee.',
  official_url='https://severndroogcastle.org.uk/', access_notes_en='Admission is ticketed. Prices, opening hours, booking rules and weather-related access can change; check the official venue site before travelling.', access_notes_it='L’ingresso è a pagamento. Prezzi, orari, prenotazioni e accesso legato al meteo possono cambiare; controlla il sito ufficiale prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-23D377C0' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://severndroogcastle.org.uk/visit/','official-or-authoritative','2026-10-16' FROM places WHERE id='LA-23D377C0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Caledonian Park’s 1855 clock tower survives from the Metropolitan Cattle Market, whose vast railings and market square once filled this site. Guided climbs reach a 360-degree balcony above Islington, revealing the City, St Paul’s, the Shard and north London; the tower is not open for casual daily access.', description_it='La torre dell’orologio del 1855 a Caledonian Park è ciò che resta del Metropolitan Cattle Market, un tempo esteso tra recinzioni e piazza del mercato. Le visite guidate salgono al balcone a 360 gradi sopra Islington, con City, St Paul’s, Shard e Londra nord; la torre non è aperta liberamente ogni giorno.',
  editorial_hook_en='A guided climb through the old cattle-market clock tower reaches a 360-degree balcony above Islington.', editorial_hook_it='Una salita guidata nella torre dell’antico mercato del bestiame raggiunge un balcone a 360 gradi sopra Islington.',
  official_url='https://callypark.london/', access_notes_en='This is not an unrestricted public viewpoint. Access is limited, tour-led or event-dependent, so confirm the current arrangement before travelling.', access_notes_it='Non è un punto panoramico pubblico ad accesso libero. L’ingresso è limitato, con visita guidata o legato a eventi: verifica le modalità prima di partire.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V5' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://callypark.london/clock-tower-tours/','official-or-authoritative','2026-10-16' FROM places WHERE id='V5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Horniman Gardens spread over sixteen acres on the Forest Hill ridge, with the London skyline visible beyond sloping lawns. The view accompanies the museum’s Arts and Crafts sunken garden, medicinal and dye planting, nature trail and bandstand, so the panorama is embedded in Frederick Horniman’s wider educational landscape.', description_it='Gli Horniman Gardens si estendono per sedici acri sul crinale di Forest Hill, con lo skyline londinese oltre i prati in pendenza. La vista accompagna il giardino incassato Arts and Crafts, le piante medicinali e tintorie, il sentiero naturalistico e il palco musicale: parte del paesaggio educativo di Frederick Horniman.',
  editorial_hook_en='Central London rises beyond sixteen acres of museum gardens on Forest Hill’s high ridge.', editorial_hook_it='La Londra centrale emerge oltre sedici acri di giardini museali sull’alto crinale di Forest Hill.',
  official_url='https://www.horniman.ac.uk/event/gardens/', access_notes_en='Outdoor access, visibility and gate times can change with weather, season or events. Check the official source before making a special journey.', access_notes_it='Accesso all’aperto, visibilità e orari dei cancelli possono cambiare per meteo, stagione o eventi. Controlla la fonte ufficiale prima di partire appositamente.',
  last_verified_at='2026-10-16', updated_at=CURRENT_TIMESTAMP
WHERE id='V4' AND category='VIEWPOINT';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.horniman.ac.uk/event/gardens/','official-or-authoritative','2026-10-16' FROM places WHERE id='V4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

INSERT INTO app_meta(key,value,updated_at) VALUES ('viewpoint_editorial_version','2026-10-16',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;
