-- Editorial enrichment for every published area place.
-- Research verified against the recorded sources on 2026-10-14.
CREATE TABLE IF NOT EXISTS place_editorial_sources (
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  source_url TEXT NOT NULL,
  source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative',
  verified_at TEXT NOT NULL,
  PRIMARY KEY(place_id, source_url)
);
CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);

UPDATE places SET description_en='No. 19 is part of Copperfield Street’s unusually intact row of modest nineteenth-century houses, a domestic fragment of old Southwark behind the busier Southwark Bridge Road. The street also leads to the surviving fabric and garden of bomb-damaged All Hallows church.', description_it='Il civico 19 appartiene alla fila insolitamente integra di modeste case ottocentesche di Copperfield Street, frammento domestico della vecchia Southwark dietro Southwark Bridge Road. La strada conduce anche ai resti e al giardino della chiesa di All Hallows, danneggiata nel Blitz.',
  editorial_hook_en='A short Southwark terrace preserves a domestic scale almost erased from the streets around it.', editorial_hook_it='Una breve schiera di Southwark conserva una scala domestica quasi scomparsa dalle strade circostanti.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E6E32C92' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://cathedral.southwark.anglican.org/about-us/cathedral-community/all-hallows-church-community-garden/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-E6E32C92'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='This Grade II-listed former Kennedy’s sausage shop preserves a remarkably complete 1920s interior and façade. Sunburst transom lights, polished-glass signs, tiled walls, mirrors, counters and lettered cabinets record the visual language of a once-familiar South London food chain.', description_it='Questo ex negozio di salsicce Kennedy’s, tutelato di grado II, conserva in modo eccezionale facciata e interni degli anni Venti. Sopraluci a raggiera, insegne in vetro, piastrelle, specchi, banconi e vetrine documentano una storica catena alimentare del sud di Londra.',
  editorial_hook_en='Walworth’s restored Kennedy’s shop is a rare near-complete survival of 1920s food retail design.', editorial_hook_it='Il Kennedy’s restaurato di Walworth è una rara testimonianza quasi completa del design commerciale alimentare degli anni Venti.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1392595', access_notes_en='Access depends on the venue’s opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors, events or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni, eventi o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E0E4C701' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1392595','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-E0E4C701'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Fifty Electric Boulevard is one of the new buildings completing the pedestrian district around Battersea Power Station. Its publicly accessible rooftop garden and terraces frame close views of the power station’s four chimneys, the Thames and the rapidly transformed Nine Elms skyline.', description_it='Fifty Electric Boulevard è uno degli edifici che completano il nuovo quartiere pedonale attorno a Battersea Power Station. Giardino pensile e terrazze accessibili al pubblico offrono viste ravvicinate sulle quattro ciminiere, sul Tamigi e sullo skyline trasformato di Nine Elms.',
  editorial_hook_en='A rooftop beside Battersea Power Station gives an unusually close, elevated view of its four chimneys.', editorial_hook_it='Un tetto accanto a Battersea Power Station offre una vista elevata e insolitamente ravvicinata sulle quattro ciminiere.',
  official_url='https://batterseapowerstation.co.uk/', access_notes_en='Access depends on the venue’s opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors, events or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni, eventi o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2CB2ED1C' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://batterseapowerstation.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-2CB2ED1C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Pilot and the adjoining late-Georgian workers’ cottages are a rare remnant of industrial Greenwich amid the O2 developments. Their biggest pop-cultural cameo came as the setting for Blur’s 1994 ‘Parklife’ video, with the pub and terrace instantly recognisable on screen.', description_it='The Pilot e le vicine case operaie tardo-georgiane sono un raro resto della Greenwich industriale tra gli sviluppi dell’O2. La loro apparizione più celebre è nel video di “Parklife” dei Blur del 1994, dove pub e schiera di cottage sono subito riconoscibili.',
  editorial_hook_en='A row of Georgian workers’ cottages beside The Pilot became the unmistakable backdrop to Blur’s ‘Parklife’.', editorial_hook_it='Una fila di cottage operai georgiani accanto a The Pilot divenne lo sfondo inconfondibile di “Parklife” dei Blur.',
  official_url='https://www.pilotgreenwich.co.uk/history', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4570FA55' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.pilotgreenwich.co.uk/history','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-4570FA55'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Abbeville Village is the neighbourhood cluster around Abbeville Road, developed across former fields after the railway reached Clapham. Red-brick and stucco terraces, decorative gables, independent food shops and pavement cafés give this part of south Clapham a distinct small-town rhythm.', description_it='Abbeville Village è il nucleo di quartiere attorno ad Abbeville Road, sviluppato sugli antichi campi dopo l’arrivo della ferrovia a Clapham. Case in mattoni rossi e stucco, frontoni decorati, botteghe alimentari indipendenti e caffè creano un ritmo quasi da cittadina.',
  editorial_hook_en='Decorative Victorian terraces and independent food shops give south Clapham its own village-like high street.', editorial_hook_it='Terrazze vittoriane decorate e negozi alimentari indipendenti danno a Clapham sud una strada principale dall’atmosfera di paese.',
  official_url='https://www.abbevillevillage.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-50293201' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.abbevillevillage.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-50293201'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Albert Bridge opened in 1873 and was strengthened several times while retaining its delicate suspension structure and octagonal tollbooths. Painted in pale colours and illuminated after dark, it links Chelsea to Battersea Park and still carries a warning for marching troops to break step.', description_it='Albert Bridge aprì nel 1873 e fu rinforzato più volte conservando la delicata struttura sospesa e i caselli ottagonali. Dipinto in colori chiari e illuminato di notte, collega Chelsea a Battersea Park e conserva l’avviso alle truppe di interrompere il passo.',
  editorial_hook_en='Pastel steelwork, old tollbooths and a warning to marching soldiers make Albert Bridge London’s most decorative Thames crossing.', editorial_hook_it='Acciaio color pastello, antichi caselli e un avviso ai soldati in marcia fanno di Albert Bridge il ponte più decorativo sul Tamigi.',
  official_url='https://www.rbkc.gov.uk/parking-transport-and-streets/your-streets/roads-and-pavements/albert-bridge', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-289CB273' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.rbkc.gov.uk/parking-transport-and-streets/your-streets/roads-and-pavements/albert-bridge','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-289CB273'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Albury Street preserves one of Deptford’s finest early-eighteenth-century terraces, built for naval officers and shipyard figures close to the royal dockyard. Tall narrow houses, carved doorcases, shell hoods and glimpses of surviving interiors reveal the prosperity of maritime Deptford.', description_it='Albury Street conserva una delle più belle schiere settecentesche di Deptford, costruita per ufficiali navali e figure dei cantieri reali. Case alte e strette, portali scolpiti, pensiline a conchiglia e interni superstiti raccontano la prosperità della Deptford marittima.',
  editorial_hook_en='Carved shell hoods and tall merchant houses recall Deptford’s eighteenth-century naval elite.', editorial_hook_it='Pensiline scolpite a conchiglia e alte case mercantili ricordano l’élite navale della Deptford settecentesca.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1079950', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7F3BD546' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1079950','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-7F3BD546'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The All England Club has hosted the Wimbledon Championships since moving to Church Road in 1922. Beyond Centre Court, the grounds combine grass courts, the Wimbledon Lawn Tennis Museum, championship traditions and views toward Wimbledon Park, with access largely tied to tickets and tours.', description_it='L’All England Club ospita i Championships di Wimbledon da quando si trasferì a Church Road nel 1922. Oltre al Centre Court, il complesso riunisce campi in erba, museo del tennis, tradizioni del torneo e viste verso Wimbledon Park, con accesso legato a biglietti e visite.',
  editorial_hook_en='Centre Court anchors a century of grass-court history at the home of the Wimbledon Championships.', editorial_hook_it='Il Centre Court concentra un secolo di storia del tennis su erba nella sede dei Championships di Wimbledon.',
  official_url='https://www.wimbledon.com/en_GB/visit_and_tickets/museum_and_tours.html', access_notes_en='Admission and opening times vary. Check the official site for current tickets, timed entry, event-day restrictions and closures before travelling.', access_notes_it='Biglietti e orari variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni nei giorni di evento e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9868FA34' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wimbledon.com/en_GB/visit_and_tickets/museum_and_tours.html','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-9868FA34'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Amen Corner is the tiny turn between Paternoster Row and Ave Maria Lane beside St Paul’s. Tradition links its name to medieval processions finishing the Lord’s Prayer here, while the adjoining private Amen Court preserves post-Fire houses built for cathedral canons.', description_it='Amen Corner è la minuscola svolta tra Paternoster Row e Ave Maria Lane accanto a St Paul’s. La tradizione lega il nome alle processioni medievali che qui concludevano il Padre Nostro, mentre la privata Amen Court conserva case post-incendio per i canonici.',
  editorial_hook_en='A medieval prayer is embedded in the street names around this hidden turn beside St Paul’s.', editorial_hook_it='Una preghiera medievale è incorporata nei nomi delle strade attorno a questa svolta nascosta vicino a St Paul’s.',
  official_url='https://history.rcp.ac.uk/about/architecture/amen-corner', access_notes_en='This is best appreciated from the public realm. Some adjoining land or interiors are private, restricted or available only during occasional open days.', access_notes_it='Il luogo si apprezza soprattutto dallo spazio pubblico. Alcune aree o interni adiacenti sono privati, riservati o accessibili soltanto durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0C658378' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://history.rcp.ac.uk/about/architecture/amen-corner','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-0C658378'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Arnold Circus forms the circular heart of the Boundary Estate, Britain’s first major council-housing project, opened by the Prince of Wales in 1900. Its bandstand and raised garden sit on rubble from the demolished Old Nichol slum, surrounded by radiating red-brick Arts and Crafts blocks.', description_it='Arnold Circus è il cuore circolare del Boundary Estate, primo grande complesso di edilizia popolare britannico, inaugurato nel 1900. Palco e giardino rialzato poggiano sulle macerie dello slum Old Nichol, circondati da edifici Arts and Crafts in mattoni rossi.',
  editorial_hook_en='A bandstand raised on the rubble of a notorious slum centres Britain’s pioneering council estate.', editorial_hook_it='Un palco costruito sulle macerie di un famigerato slum è al centro del primo grande complesso popolare britannico.',
  official_url='https://www.friendsofarnoldcircus.org/', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-ED9A7CA5' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.friendsofarnoldcircus.org/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-ED9A7CA5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Artillery Passage is a narrow survivor of the lanes beside the former Honourable Artillery Company ground. Small shopfronts, restaurants and irregular eighteenth- and nineteenth-century buildings create a compressed approach from Bishopsgate into the historic liberty of Norton Folgate and Spitalfields.', description_it='Artillery Passage è uno stretto residuo dei vicoli accanto all’antico terreno della Honourable Artillery Company. Piccole vetrine, ristoranti ed edifici irregolari del Sette e Ottocento segnano il passaggio da Bishopsgate alla storica zona di Norton Folgate e Spitalfields.',
  editorial_hook_en='A compressed lane of old shopfronts marks the transition from Bishopsgate into historic Spitalfields.', editorial_hook_it='Uno stretto vicolo di vecchie botteghe segna il passaggio da Bishopsgate alla storica Spitalfields.',
  official_url='https://www.spitalfieldsforum.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8B8BA322' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.spitalfieldsforum.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-8B8BA322'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Bathurst Mews curves behind Sussex Gardens as one of Paddington’s best-preserved stable lanes. Nineteenth-century coach houses, painted doors and climbing plants sit beside one of central London’s last working equestrian yards, where horses still leave the mews for Hyde Park.', description_it='Bathurst Mews curva dietro Sussex Gardens come uno dei vicoli di scuderie meglio conservati di Paddington. Rimesse ottocentesche, porte dipinte e rampicanti convivono con una delle ultime scuderie attive del centro, da cui i cavalli raggiungono Hyde Park.',
  editorial_hook_en='Painted coach houses share this Paddington mews with horses still ridden daily into Hyde Park.', editorial_hook_it='Rimesse dipinte condividono questo mews di Paddington con cavalli ancora condotti ogni giorno a Hyde Park.',
  official_url='https://www.bathurstmews.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BEA33CBD' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bathurstmews.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-BEA33CBD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Battersea Power Station was built in two phases between the 1930s and 1950s to designs led by Giles Gilbert Scott. The vast brick shell, four white chimneys and restored Art Deco turbine halls now anchor a riverside district of shops, homes and public spaces.', description_it='Battersea Power Station fu costruita in due fasi tra gli anni Trenta e Cinquanta su progetti guidati da Giles Gilbert Scott. L’enorme involucro in mattoni, le quattro ciminiere bianche e le turbine hall Art Déco restaurate sono oggi il centro di un quartiere fluviale.',
  editorial_hook_en='Four restored chimneys rise above Art Deco turbine halls reborn as a new Thames-side district.', editorial_hook_it='Quattro ciminiere restaurate sovrastano turbine hall Art Déco rinate come nuovo quartiere sul Tamigi.',
  official_url='https://batterseapowerstation.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BD10B2CC' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://batterseapowerstation.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-BD10B2CC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Burlington Arcade opened in 1819 as one of Europe’s earliest covered shopping arcades. Its long glazed gallery, small uniform shopfronts and traditionally uniformed Beadles preserve a Regency retail ritual between Piccadilly and Burlington Gardens.', description_it='Burlington Arcade aprì nel 1819 come una delle prime gallerie commerciali coperte d’Europa. La lunga navata vetrata, le piccole vetrine uniformi e i Beadles in divisa conservano un rituale commerciale Regency tra Piccadilly e Burlington Gardens.',
  editorial_hook_en='Regency shopfronts and uniformed Beadles preserve two centuries of ritual beneath Burlington Arcade’s glass roof.', editorial_hook_it='Vetrine Regency e Beadles in uniforme conservano due secoli di rituali sotto il tetto vetrato di Burlington Arcade.',
  official_url='https://www.burlingtonarcade.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-860AE553' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.burlingtonarcade.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-860AE553'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Business Design Centre occupies the former Royal Agricultural Hall, opened in 1862 for livestock shows and grand exhibitions. Its enormous iron-and-glass hall, arcaded galleries and surviving Victorian engineering now house offices and events behind an imposing Islington façade.', description_it='Il Business Design Centre occupa l’ex Royal Agricultural Hall, inaugurato nel 1862 per mostre di bestiame e grandi esposizioni. L’enorme sala in ferro e vetro, le gallerie ad arcate e l’ingegneria vittoriana ospitano oggi uffici ed eventi dietro la facciata di Islington.',
  editorial_hook_en='A vast Victorian livestock hall survives as Islington’s iron-and-glass exhibition centre.', editorial_hook_it='Un’enorme sala vittoriana per il bestiame sopravvive come centro espositivo in ferro e vetro di Islington.',
  official_url='https://www.businessdesigncentre.co.uk/about-us/our-history/', access_notes_en='Access depends on the venue’s opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors, events or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni, eventi o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D38BAFBF' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.businessdesigncentre.co.uk/about-us/our-history/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D38BAFBF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Butler’s Wharf Pier projects into the Thames beside a canyon of converted Victorian warehouses. The viewpoint aligns Tower Bridge, the City and Shad Thames while recalling the wharves where tea, spices and other imported goods were unloaded and stored.', description_it='Butler’s Wharf Pier si protende nel Tamigi accanto a un canyon di magazzini vittoriani riconvertiti. Il punto di vista allinea Tower Bridge, la City e Shad Thames, ricordando i moli dove venivano scaricati e conservati tè, spezie e merci importate.',
  editorial_hook_en='A small pier frames Tower Bridge between warehouses that once handled London’s tea and spice trade.', editorial_hook_it='Un piccolo molo incornicia Tower Bridge tra magazzini che un tempo gestivano il commercio londinese di tè e spezie.',
  official_url='https://www.southwark.gov.uk/parks-and-open-spaces', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3B8D5F62' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.southwark.gov.uk/parks-and-open-spaces','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-3B8D5F62'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Bywater Street is a short Chelsea cul-de-sac known for its closely packed nineteenth-century houses painted in individual pastel colours. The changing façades create a miniature colour chart just off King’s Road, but it remains a residential street rather than a staged attraction.', description_it='Bywater Street è un breve cul-de-sac di Chelsea noto per le case ottocentesche ravvicinate, ognuna dipinta in un diverso colore pastello. Le facciate formano una piccola tavolozza appena fuori King’s Road, ma la strada resta soprattutto residenziale.',
  editorial_hook_en='A compact row of individually coloured houses turns this Chelsea cul-de-sac into a pastel streetscape.', editorial_hook_it='Una compatta fila di case dai colori individuali trasforma questo cul-de-sac di Chelsea in un paesaggio pastello.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7FEB899C' AND category='AREA';

UPDATE places SET description_en='Camden Passage is an Islington pedestrian lane whose antiques trade grew after a market opened in the 1960s. Georgian buildings now hold vintage dealers, jewellery shops, cafés and market stalls, while side passages and the former tram shed reward browsing beyond Upper Street.', description_it='Camden Passage è un vicolo pedonale di Islington il cui commercio di antiquariato crebbe con il mercato aperto negli anni Sessanta. Edifici georgiani ospitano oggi vintage, gioielli, caffè e bancarelle, mentre passaggi laterali e l’ex deposito dei tram invitano all’esplorazione.',
  editorial_hook_en='Antiques, vintage jewellery and small cafés fill a Georgian lane behind Islington’s Upper Street.', editorial_hook_it='Antiquariato, gioielli vintage e piccoli caffè riempiono un vicolo georgiano dietro Upper Street a Islington.',
  official_url='https://www.camdenpassageislington.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A6' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.camdenpassageislington.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='A6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Canada Dock boardwalk crosses newly restored wetland at the heart of the Canada Water regeneration area. Timber paths, reed beds, nesting islands and views across the historic dock turn former commercial infrastructure into an accessible habitat for water birds and local walkers.', description_it='La passerella di Canada Dock attraversa la zona umida restaurata al centro della rigenerazione di Canada Water. Percorsi in legno, canneti, isole per la nidificazione e viste sul bacino trasformano l’infrastruttura portuale in habitat accessibile a uccelli acquatici e residenti.',
  editorial_hook_en='A new timber boardwalk threads through reed beds and bird habitat inside a former working dock.', editorial_hook_it='Una nuova passerella in legno attraversa canneti e habitat per uccelli dentro un antico bacino portuale.',
  official_url='https://www.southwark.gov.uk/parks-and-open-spaces/canada-water', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-69D2786D' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.southwark.gov.uk/parks-and-open-spaces/canada-water','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-69D2786D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Canary Wharf grew from the derelict West India Docks into a financial district planned around towers, dock basins and privately managed public spaces. Beyond the skyline, Victorian warehouses, waterside walks, public art, roof gardens and the Elizabeth line reveal several layers of Docklands reinvention.', description_it='Canary Wharf è nata dai West India Docks abbandonati come quartiere finanziario di torri, bacini e spazi pubblici gestiti privatamente. Oltre allo skyline, magazzini vittoriani, passeggiate sull’acqua, arte pubblica, giardini pensili ed Elizabeth line mostrano più fasi di reinvenzione dei Docklands.',
  editorial_hook_en='Dock basins, public art and Victorian warehouses complicate the familiar skyline of London’s financial district.', editorial_hook_it='Bacini, arte pubblica e magazzini vittoriani arricchiscono il celebre skyline del quartiere finanziario londinese.',
  official_url='https://canarywharf.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2432FD1F' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://canarywharf.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-2432FD1F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Canonbury Square was laid out from the early nineteenth century and became one of Islington’s most elegant garden squares. Stucco-fronted terraces surround mature trees and lawns, with literary associations including George Orwell and Evelyn Waugh recorded on the surrounding houses.', description_it='Canonbury Square fu tracciata dall’inizio dell’Ottocento e divenne una delle piazze-giardino più eleganti di Islington. Terrazze in stucco circondano alberi maturi e prati, con memorie letterarie di George Orwell ed Evelyn Waugh sulle case circostanti.',
  editorial_hook_en='Regency terraces and literary plaques surround one of Islington’s most graceful garden squares.', editorial_hook_it='Terrazze Regency e targhe letterarie circondano una delle piazze-giardino più eleganti di Islington.',
  official_url='https://www.islington.gov.uk/parks-leisure-and-culture/parks-and-green-space', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CE26BA84' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.islington.gov.uk/parks-leisure-and-culture/parks-and-green-space','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-CE26BA84'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Carnaby Street became internationally synonymous with Swinging London when fashion boutiques such as Mary Quant’s and Lord John drew crowds in the 1960s. Its pedestrian lanes now mix chain stores with surviving independent names, music history and the ornate Liberty building nearby.', description_it='Carnaby Street divenne simbolo internazionale della Swinging London quando boutique come Mary Quant e Lord John attirarono folle negli anni Sessanta. I vicoli pedonali mescolano oggi catene e indipendenti, storia musicale e il vicino edificio decorato di Liberty.',
  editorial_hook_en='The fashion street that defined Swinging London still carries traces of its boutique and music history.', editorial_hook_it='La strada della moda che definì la Swinging London conserva tracce della propria storia di boutique e musica.',
  official_url='https://www.carnaby.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D5241C72' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.carnaby.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D5241C72'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Carter Lane follows the south side of St Paul’s through a fine-grained City streetscape rebuilt repeatedly after fire and war. Narrow frontages, pubs, small restaurants and glimpses of Wren churches make it a useful human-scale counterpoint to the cathedral and surrounding offices.', description_it='Carter Lane costeggia il lato sud di St Paul’s in un tessuto minuto della City ricostruito più volte dopo incendi e guerra. Fronti stretti, pub, piccoli ristoranti e scorci di chiese di Wren offrono un contrappunto umano alla cattedrale e agli uffici.',
  editorial_hook_en='Small pubs and narrow frontages preserve a human scale in the shadow of St Paul’s Cathedral.', editorial_hook_it='Piccoli pub e fronti stretti conservano una scala umana all’ombra di St Paul’s Cathedral.',
  official_url='https://www.cityoflondon.gov.uk/things-to-do', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0F484F43' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cityoflondon.gov.uk/things-to-do','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-0F484F43'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Castle Court is the narrow City passage linking Cornhill with Birchin Lane beside the Jamaica Wine House. The pub occupies the site associated with London’s earliest coffee house, opened by Pasqua Rosée in 1652, when the surrounding alleys became centres of news and commerce.', description_it='Castle Court è lo stretto passaggio della City che collega Cornhill a Birchin Lane accanto al Jamaica Wine House. Il pub occupa il sito legato alla prima coffee house londinese, aperta da Pasqua Rosée nel 1652, quando questi vicoli erano centri di notizie e commerci.',
  editorial_hook_en='This tiny City passage leads to the site of London’s first coffee house, opened in 1652.', editorial_hook_it='Questo minuscolo passaggio della City conduce al sito della prima coffee house londinese, aperta nel 1652.',
  official_url='https://www.jamaicawinehouse.co.uk/history', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F7AA0663' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.jamaicawinehouse.co.uk/history','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-F7AA0663'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Cecil Court is a gas-lit pedestrian lane of late-Victorian shopfronts between Charing Cross Road and St Martin’s Lane. Antiquarian booksellers, map dealers, prints, coins and esoteric specialists have made it a concentrated destination for collectors since the early twentieth century.', description_it='Cecil Court è un vicolo pedonale illuminato a gas, con vetrine tardo-vittoriane tra Charing Cross Road e St Martin’s Lane. Librai antiquari, mappe, stampe, monete e specialisti esoterici ne fanno da inizio Novecento una meta concentrata per collezionisti.',
  editorial_hook_en='Gas lamps and antiquarian shopfronts make Cecil Court a compact corridor for books, maps and curiosities.', editorial_hook_it='Lampade a gas e vetrine antiquarie fanno di Cecil Court un corridoio compatto di libri, mappe e curiosità.',
  official_url='https://www.cecilcourt.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A5DB933C' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cecilcourt.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-A5DB933C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Chalcot Square was laid out in the 1850s as part of the expansion of Primrose Hill. Its closely spaced stucco houses are painted in varied pastel colours around a small central garden, creating one of north London’s most recognisable residential compositions.', description_it='Chalcot Square fu tracciata negli anni 1850 durante l’espansione di Primrose Hill. Le case in stucco ravvicinate sono dipinte in diversi colori pastello attorno a un piccolo giardino centrale, formando una delle composizioni residenziali più riconoscibili del nord di Londra.',
  editorial_hook_en='Pastel stucco terraces wrap tightly around a small garden at the heart of Primrose Hill.', editorial_hook_it='Terrazze in stucco pastello avvolgono un piccolo giardino nel cuore di Primrose Hill.',
  official_url='https://www.camden.gov.uk/parks', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D4507260' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.camden.gov.uk/parks','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D4507260'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Charles Lane is a quiet St John’s Wood service lane whose converted stables and coach houses retain the working scale of the nineteenth-century suburb. Brick elevations, carriage arches and planted doorways form a secluded contrast to the grand terraces around Abbey Road.', description_it='Charles Lane è una tranquilla strada di servizio di St John’s Wood, dove scuderie e rimesse convertite conservano la scala operativa del sobborgo ottocentesco. Mattoni, archi carrabili e ingressi piantumati contrastano con le grandi terrazze vicino Abbey Road.',
  editorial_hook_en='Converted brick stables preserve the service architecture behind St John’s Wood’s grander terraces.', editorial_hook_it='Scuderie in mattoni convertite conservano l’architettura di servizio dietro le grandi terrazze di St John’s Wood.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BB8A4089' AND category='AREA';

UPDATE places SET description_en='Charlotte Place is a two-block Fitzrovia lane lined with small restaurants, galleries and independent businesses in narrow Georgian and Victorian buildings. Its intimate scale and proximity to Charlotte Street preserve the mixed residential and creative character that survived beside larger West End development.', description_it='Charlotte Place è un breve vicolo di Fitzrovia con piccoli ristoranti, gallerie e attività indipendenti in stretti edifici georgiani e vittoriani. La scala intima, vicino Charlotte Street, conserva il carattere residenziale e creativo sopravvissuto ai grandi sviluppi del West End.',
  editorial_hook_en='Tiny restaurants and studios occupy a two-block Fitzrovia lane with a distinctly independent scale.', editorial_hook_it='Minuscoli ristoranti e studi occupano un breve vicolo di Fitzrovia dalla scala decisamente indipendente.',
  official_url='https://fitzrovia.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-99BF7FA8' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://fitzrovia.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-99BF7FA8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Stamford Bridge has been Chelsea Football Club’s home since the club was founded in 1905. The stadium museum and tours interpret trophies, changing rooms and the evolution from an athletics ground, while the surrounding streets reveal how a major football venue fits tightly into residential Fulham.', description_it='Stamford Bridge è la casa del Chelsea Football Club dalla fondazione nel 1905. Museo e visite raccontano trofei, spogliatoi e il passaggio da pista di atletica a stadio, mentre le strade circostanti mostrano come un grande impianto si inserisca nella Fulham residenziale.',
  editorial_hook_en='Chelsea’s century-old home compresses a global football institution into the residential streets of Fulham.', editorial_hook_it='La casa centenaria del Chelsea concentra un’istituzione calcistica globale nelle strade residenziali di Fulham.',
  official_url='https://www.chelseafc.com/en/stadium-tours-and-museum', access_notes_en='Admission and opening times vary. Check the official site for current tickets, timed entry, event-day restrictions and closures before travelling.', access_notes_it='Biglietti e orari variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni nei giorni di evento e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4DFC26F3' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.chelseafc.com/en/stadium-tours-and-museum','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-4DFC26F3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Founded in 1673 by the Worshipful Society of Apothecaries, Chelsea Physic Garden is London’s oldest botanic garden. Sheltered walls and a warm riverside microclimate support medicinal plants, rare species, glasshouses and collections explaining how plants have shaped medicine and trade.', description_it='Fondato nel 1673 dalla Worshipful Society of Apothecaries, Chelsea Physic Garden è il più antico orto botanico di Londra. Muri protetti e microclima fluviale ospitano piante medicinali, specie rare, serre e collezioni sul rapporto tra botanica, medicina e commercio.',
  editorial_hook_en='London’s oldest botanic garden turns four centuries of medicinal-plant knowledge into a sheltered Thames-side landscape.', editorial_hook_it='Il più antico orto botanico di Londra trasforma quattro secoli di piante medicinali in un paesaggio protetto sul Tamigi.',
  official_url='https://www.chelseaphysicgarden.co.uk/', access_notes_en='Admission and opening times vary. Check the official site for current tickets, timed entry, event-day restrictions and closures before travelling.', access_notes_it='Biglietti e orari variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni nei giorni di evento e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8F68CB52' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.chelseaphysicgarden.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-8F68CB52'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Ching Court forms part of the Comyn Ching Triangle, a carefully restored group of Georgian and Victorian buildings around Seven Dials. Named after the architectural ironmongery firm once based here, its brick courtyard and passages create a secluded pocket behind the surrounding theatres and shops.', description_it='Ching Court appartiene al Comyn Ching Triangle, gruppo restaurato di edifici georgiani e vittoriani attorno a Seven Dials. Prende il nome dall’antica azienda di ferramenta architettonica e il cortile in mattoni crea un angolo appartato dietro teatri e negozi.',
  editorial_hook_en='A restored ironmongers’ courtyard hides inside the Georgian street pattern of Seven Dials.', editorial_hook_it='Il cortile restaurato di un’antica ferramenta si nasconde nella trama georgiana di Seven Dials.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1066402', access_notes_en='This is best appreciated from the public realm. Some adjoining land or interiors are private, restricted or available only during occasional open days.', access_notes_it='Il luogo si apprezza soprattutto dallo spazio pubblico. Alcune aree o interni adiacenti sono privati, riservati o accessibili soltanto durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A9' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1066402','official-or-authoritative','2026-10-14' FROM places WHERE id='A9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Chislehurst Caves are a twenty-two-mile network of chalk and flint workings excavated over centuries. Guided tours explore dark galleries later used for mushroom cultivation, wartime shelter for thousands of people and concerts by musicians including David Bowie and Jimi Hendrix.', description_it='Le Chislehurst Caves sono una rete di ventidue miglia di gallerie di gesso e selce scavate nel corso dei secoli. Le visite percorrono spazi poi usati per funghi, rifugio bellico per migliaia di persone e concerti di musicisti come David Bowie e Jimi Hendrix.',
  editorial_hook_en='Ancient chalk workings became a wartime underground town and, later, an unlikely rock venue.', editorial_hook_it='Antiche cave di gesso divennero una città sotterranea in guerra e poi un improbabile spazio per concerti rock.',
  official_url='https://chislehurst-caves.co.uk/', access_notes_en='Admission and opening times vary. Check the official site for current tickets, timed entry, event-day restrictions and closures before travelling.', access_notes_it='Biglietti e orari variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni nei giorni di evento e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A12' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://chislehurst-caves.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='A12'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Coal Drops Yard occupies two vast Victorian structures built to receive coal arriving by rail from northern England. Heatherwick Studio’s redevelopment joins their roofs in a dramatic ‘kissing’ form, while surviving tracks, brick arches and cobbles keep the King’s Cross freight history visible.', description_it='Coal Drops Yard occupa due grandi strutture vittoriane costruite per ricevere il carbone ferroviario dal nord dell’Inghilterra. La riconversione di Heatherwick Studio unisce i tetti in una spettacolare forma “a bacio”, mantenendo visibili binari, archi in mattoni e ciottoli.',
  editorial_hook_en='Victorian coal sheds meet in Heatherwick’s dramatic roofline while tracks and brick arches preserve their freight history.', editorial_hook_it='I depositi vittoriani di carbone si incontrano nel tetto spettacolare di Heatherwick, tra binari e archi che ricordano il passato merci.',
  official_url='https://www.kingscross.co.uk/coal-drops-yard', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-371B27E6' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.kingscross.co.uk/coal-drops-yard','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-371B27E6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Cody Dock is a community-led regeneration of a former industrial site on the lower River Lea. Gardens, artist studios, ecology projects and a tidal river walkway surround a working dock, revealing both the waterway’s polluted industrial past and its ongoing environmental recovery.', description_it='Cody Dock è la rigenerazione comunitaria di un ex sito industriale sul basso Lea. Giardini, studi d’artista, progetti ecologici e passeggiata fluviale circondano un bacino operativo, raccontando il passato inquinato e la ripresa ambientale del corso d’acqua.',
  editorial_hook_en='Gardens, studios and tidal ecology have transformed a derelict Lea-side dock into a community landscape.', editorial_hook_it='Giardini, studi e natura di marea hanno trasformato un molo abbandonato sul Lea in un paesaggio comunitario.',
  official_url='https://codydock.org.uk/', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-60671E10' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://codydock.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-60671E10'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Thomas Randall-Page’s Cody Dock Rolling Bridge crosses the mouth of the dock on the River Lea. Instead of lifting in the usual way, the steel structure curls into a wheel and rolls along toothed rails, turning a practical crossing into a piece of kinetic public sculpture.', description_it='Il Rolling Bridge di Cody Dock, progettato da Thomas Randall-Page, attraversa l’imbocco del bacino sul Lea. Invece di sollevarsi, la struttura d’acciaio si avvolge in una ruota e scorre su rotaie dentate, trasformando il ponte in scultura cinetica.',
  editorial_hook_en='This working footbridge curls into a wheel and rolls aside when boats enter Cody Dock.', editorial_hook_it='Questo ponte pedonale si arrotola in una ruota e scorre di lato quando le barche entrano a Cody Dock.',
  official_url='https://codydock.org.uk/rolling-bridge/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B48EAC0F' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://codydock.org.uk/rolling-bridge/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-B48EAC0F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='College Lane is a narrow Highgate passage of tiny cottages, former workshops and irregular plots accumulated over centuries. Its intimate bends and varied rooflines preserve the feel of a rural path absorbed into London, only moments from the formal houses of Highgate village.', description_it='College Lane è uno stretto passaggio di Highgate con minuscoli cottage, antiche botteghe e lotti irregolari stratificati nei secoli. Curve intime e tetti vari conservano l’aspetto di un sentiero rurale assorbito da Londra, vicino alle case formali del villaggio.',
  editorial_hook_en='Tiny cottages and irregular bends preserve a rural lane inside the fabric of Highgate.', editorial_hook_it='Piccoli cottage e curve irregolari conservano un vicolo rurale dentro il tessuto di Highgate.',
  official_url='https://www.highgatesociety.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F0400A1A' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.highgatesociety.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-F0400A1A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Hillgate Village is a close-knit group of nineteenth-century terraces south of Notting Hill Gate, many painted in soft but strongly contrasting colours. Built on the former grounds of Campden House, its compact streets and independent shops feel markedly different from nearby grand stucco crescents.', description_it='Hillgate Village è un gruppo compatto di terrazze ottocentesche a sud di Notting Hill Gate, molte dipinte in colori tenui ma contrastanti. Costruito sugli antichi terreni di Campden House, il quartiere differisce nettamente dalle grandi mezzelune in stucco vicine.',
  editorial_hook_en='A tightly packed palette of coloured terraces forms a small Victorian village behind Notting Hill Gate.', editorial_hook_it='Una tavolozza compatta di terrazze colorate forma un piccolo villaggio vittoriano dietro Notting Hill Gate.',
  official_url='https://www.hillgatevillage.com/the-facts', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A2' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.hillgatevillage.com/the-facts','official-or-authoritative','2026-10-14' FROM places WHERE id='A2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Colville Place is a short Fitzrovia street whose modest nineteenth-century houses face a small community garden created after wartime damage. The low scale, mature planting and traces of workshops evoke the mixed residential and artisan neighbourhood that once dominated this part of central London.', description_it='Colville Place è una breve strada di Fitzrovia, con modeste case ottocentesche di fronte a un piccolo giardino comunitario nato dopo i danni di guerra. Scala bassa, alberi maturi e tracce di botteghe ricordano il quartiere residenziale e artigiano del centro.',
  editorial_hook_en='Low brick houses face a garden made from a bomb site in this unusually quiet Fitzrovia corner.', editorial_hook_it='Basse case in mattoni guardano un giardino nato da un sito bombardato in questo tranquillo angolo di Fitzrovia.',
  official_url='https://www.camden.gov.uk/parks', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3FDC8FEB' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.camden.gov.uk/parks','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-3FDC8FEB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Conduit Mews is a compact Paddington stable lane behind grander Sussex Gardens houses. Converted coach houses retain carriage arches, brickwork and cobbled surfaces, showing the service world of horses, grooms and vehicles that supported the nineteenth-century terraces facing the main streets.', description_it='Conduit Mews è un compatto vicolo di scuderie a Paddington dietro le grandi case di Sussex Gardens. Le rimesse convertite conservano archi carrabili, mattoni e selciato, mostrando il mondo di cavalli, stallieri e veicoli al servizio delle terrazze ottocentesche.',
  editorial_hook_en='Carriage arches and cobbles reveal the working stable lane behind Paddington’s formal terraces.', editorial_hook_it='Archi carrabili e selciato rivelano il vicolo di servizio dietro le terrazze formali di Paddington.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9509CD88' AND category='AREA';

UPDATE places SET description_en='Connaught Village centres on Connaught Street and the garden squares north of Hyde Park. Early-nineteenth-century terraces now contain independent galleries, specialist food shops and restaurants, while the neighbourhood’s quieter scale reflects its separation from Oxford Street by the former Tyburnia estate.', description_it='Connaught Village ruota attorno a Connaught Street e alle piazze-giardino a nord di Hyde Park. Terrazze del primo Ottocento ospitano gallerie, botteghe alimentari e ristoranti indipendenti, mantenendo una scala più quieta rispetto a Oxford Street.',
  editorial_hook_en='Independent galleries and food shops occupy a Regency pocket between Hyde Park and Paddington.', editorial_hook_it='Gallerie e botteghe indipendenti occupano un angolo Regency tra Hyde Park e Paddington.',
  official_url='https://www.connaught-village.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-28D7329E' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.connaught-village.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-28D7329E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Covent Garden developed around Inigo Jones’s seventeenth-century piazza and later became London’s principal fruit, vegetable and flower market. The restored iron-and-glass market halls, theatres, street performers and surrounding lanes layer aristocratic planning, wholesale trade and West End entertainment.', description_it='Covent Garden si sviluppò attorno alla piazza seicentesca di Inigo Jones e divenne poi il principale mercato londinese di frutta, verdura e fiori. Padiglioni in ferro e vetro, teatri, artisti di strada e vicoli uniscono pianificazione aristocratica, commercio e spettacolo.',
  editorial_hook_en='Inigo Jones’s piazza and Victorian market halls hold four centuries of trade and performance.', editorial_hook_it='La piazza di Inigo Jones e i padiglioni vittoriani custodiscono quattro secoli di commercio e spettacolo.',
  official_url='https://www.coventgarden.london/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4F15DE84' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.coventgarden.london/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-4F15DE84'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Cranley Mews is a South Kensington stable lane laid out behind the large houses of Cranley Gardens. Two-storey coach houses, carriage arches and painted façades show how horses and servants were discreetly accommodated behind the formal Victorian streetscape.', description_it='Cranley Mews è un vicolo di scuderie di South Kensington tracciato dietro le grandi case di Cranley Gardens. Rimesse a due piani, archi carrabili e facciate dipinte mostrano come cavalli e servitù fossero collocati dietro la scena vittoriana formale.',
  editorial_hook_en='Two-storey coach houses expose the service architecture behind South Kensington’s grand Victorian homes.', editorial_hook_it='Rimesse a due piani mostrano l’architettura di servizio dietro le grandi case vittoriane di South Kensington.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-332DB965' AND category='AREA';

UPDATE places SET description_en='The David Bowie memorial opposite Brixton Underground is a permanent street artwork based on the lightning-bolt portrait from the ‘Aladdin Sane’ cover. Created by Jimmy C and unveiled in 2013, it became an informal shrine covered with flowers and messages after Bowie’s death.', description_it='Il memoriale a David Bowie di fronte alla metropolitana di Brixton è un’opera stradale permanente ispirata al ritratto con fulmine di “Aladdin Sane”. Realizzato da Jimmy C nel 2013, divenne un santuario informale di fiori e messaggi dopo la morte di Bowie.',
  editorial_hook_en='Brixton’s ‘Aladdin Sane’ mural became a spontaneous public shrine to David Bowie.', editorial_hook_it='Il murale “Aladdin Sane” di Brixton è diventato un santuario pubblico spontaneo dedicato a David Bowie.',
  official_url='https://www.brixtondesigntrail.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BF488CDB' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.brixtondesigntrail.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-BF488CDB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Denmark Street has been Britain’s ‘Tin Pan Alley’ since music publishers and songwriters concentrated here in the twentieth century. Guitar shops, rehearsal rooms, studios and surviving venues connect the street to the Rolling Stones, David Bowie, Elton John and generations of working musicians.', description_it='Denmark Street è la “Tin Pan Alley” britannica da quando editori musicali e autori si concentrarono qui nel Novecento. Negozi di chitarre, sale prova, studi e locali collegano la strada a Rolling Stones, David Bowie, Elton John e generazioni di musicisti.',
  editorial_hook_en='Guitar shops and tiny studios preserve the working music history of Britain’s Tin Pan Alley.', editorial_hook_it='Negozi di chitarre e piccoli studi conservano la storia musicale operativa della Tin Pan Alley britannica.',
  official_url='https://www.denmarkstreetonline.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A7' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.denmarkstreetonline.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='A7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Devonshire Mews South runs behind the Georgian and Victorian houses of Marylebone’s Devonshire Street. Reworked coach houses retain their compact plots, carriage openings and mixed brickwork, illustrating the concealed stable infrastructure that once served doctors and affluent residents nearby.', description_it='Devonshire Mews South corre dietro le case georgiane e vittoriane di Devonshire Street a Marylebone. Le rimesse trasformate conservano piccoli lotti, aperture carrabili e mattoni diversi, mostrando l’infrastruttura nascosta che serviva medici e residenti benestanti.',
  editorial_hook_en='Converted coach houses reveal the stable infrastructure behind medical Marylebone’s formal streets.', editorial_hook_it='Rimesse convertite rivelano l’infrastruttura delle scuderie dietro le strade formali della Marylebone medica.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-31DF40AC' AND category='AREA';

UPDATE places SET description_en='Eccleston Yards transformed a former Belgravia power station and service yard into a pedestrian courtyard of studios, wellness spaces, restaurants and public art. Retained brick industrial buildings and contemporary insertions offer a less formal counterpart to the stucco terraces around Victoria.', description_it='Eccleston Yards ha trasformato un’ex centrale e cortile di servizio di Belgravia in una corte pedonale di studi, benessere, ristoranti e arte pubblica. Edifici industriali in mattoni e interventi contemporanei contrastano con le terrazze in stucco attorno a Victoria.',
  editorial_hook_en='A former Belgravia power yard now mixes brick workshops, public art and independent businesses.', editorial_hook_it='Un antico cortile energetico di Belgravia mescola oggi laboratori in mattoni, arte pubblica e attività indipendenti.',
  official_url='https://www.ecclestonyards.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-EF871A29' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.ecclestonyards.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-EF871A29'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Edwardes Square was laid out in the early nineteenth century by builder William Porden and remains one of Kensington’s most secluded garden squares. Stucco and brick terraces surround a large private communal garden whose mature trees give the enclosure a distinctly sheltered character.', description_it='Edwardes Square fu progettata all’inizio dell’Ottocento dal costruttore William Porden e resta una delle piazze-giardino più appartate di Kensington. Terrazze in stucco e mattoni circondano un grande giardino privato con alberi maturi.',
  editorial_hook_en='Early-nineteenth-century terraces enclose one of Kensington’s oldest and most secluded communal gardens.', editorial_hook_it='Terrazze del primo Ottocento racchiudono uno dei giardini condominiali più antichi e appartati di Kensington.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1000804', access_notes_en='This is best appreciated from the public realm. Some adjoining land or interiors are private, restricted or available only during occasional open days.', access_notes_it='Il luogo si apprezza soprattutto dallo spazio pubblico. Alcune aree o interni adiacenti sono privati, riservati o accessibili soltanto durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2B23AB79' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1000804','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-2B23AB79'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Eel Pie Island is a private Thames island reached by footbridge from Twickenham. The Eel Pie Island Hotel became a legendary jazz and rock venue in the 1950s and 1960s, while today boatyards and artists’ studios open to the public only on occasional open weekends.', description_it='Eel Pie Island è un’isola privata del Tamigi raggiungibile da Twickenham con un ponte pedonale. L’Eel Pie Island Hotel fu un leggendario locale jazz e rock negli anni Cinquanta e Sessanta; oggi cantieri nautici e studi d’artista aprono solo in weekend speciali.',
  editorial_hook_en='A private Thames island carries the memory of a legendary jazz-and-rock hotel among boatyards and artists’ studios.', editorial_hook_it='Un’isola privata del Tamigi conserva la memoria di un leggendario hotel jazz e rock tra cantieri nautici e studi d’artista.',
  official_url='https://www.eelpieislandartists.co.uk/', access_notes_en='This is best appreciated from the public realm. Some adjoining land or interiors are private, restricted or available only during occasional open days.', access_notes_it='Il luogo si apprezza soprattutto dallo spazio pubblico. Alcune aree o interni adiacenti sono privati, riservati o accessibili soltanto durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A1' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.eelpieislandartists.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='A1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Elder Street is the architectural spine of the Spitalfields Trust’s campaign to save Georgian London. Early-eighteenth-century silk-weavers’ houses, panelled interiors and carefully restored brick façades show both Huguenot prosperity and the neighbourhood’s later decline and rescue.', description_it='Elder Street è il simbolo della campagna dello Spitalfields Trust per salvare la Londra georgiana. Case settecentesche di tessitori di seta, interni a pannelli e facciate restaurate raccontano prosperità ugonotta, successivo declino e recupero del quartiere.',
  editorial_hook_en='Restored silk-weavers’ houses make Elder Street a landmark of the fight to save Georgian Spitalfields.', editorial_hook_it='Le case restaurate dei tessitori di seta fanno di Elder Street un simbolo della battaglia per salvare la Spitalfields georgiana.',
  official_url='https://www.thespitalfieldstrust.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-72B4FE3D' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.thespitalfieldstrust.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-72B4FE3D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Elgin Crescent is one of the long curved terraces laid out across the Ladbroke Estate in the nineteenth century. Stucco façades, private rear gardens and the bend toward Portobello Road display the planned geometry behind Notting Hill’s apparently informal streetscape.', description_it='Elgin Crescent è una delle lunghe terrazze curve tracciate nel XIX secolo nel Ladbroke Estate. Facciate in stucco, giardini privati sul retro e la curva verso Portobello Road mostrano la geometria pianificata dietro l’apparente spontaneità di Notting Hill.',
  editorial_hook_en='A sweeping stucco crescent reveals the planned geometry beneath Notting Hill’s colourful reputation.', editorial_hook_it='Una grande mezzaluna in stucco rivela la geometria pianificata dietro la reputazione colorata di Notting Hill.',
  official_url='https://www.rbkc.gov.uk/planning-and-building-control/conservation-and-listed-buildings', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4CB44C8A' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.rbkc.gov.uk/planning-and-building-control/conservation-and-listed-buildings','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-4CB44C8A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Ely Place occupies the former London estate of the medieval bishops of Ely and retains the feel of a private precinct. St Etheldreda’s thirteenth-century chapel, Georgian houses and the tiny Ye Olde Mitre passage preserve legal quirks and ecclesiastical history behind Holborn.', description_it='Ely Place occupa l’antica proprietà londinese dei vescovi medievali di Ely e conserva l’atmosfera di un recinto privato. La cappella duecentesca di St Etheldreda, case georgiane e il passaggio verso Ye Olde Mitre custodiscono storia ecclesiastica e curiosità giuridiche.',
  editorial_hook_en='A medieval bishop’s precinct survives behind Holborn with a thirteenth-century chapel and a hidden pub passage.', editorial_hook_it='Il recinto di un vescovo medievale sopravvive dietro Holborn con cappella duecentesca e passaggio verso un pub nascosto.',
  official_url='https://www.stetheldreda.com/history/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-604AC75C' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stetheldreda.com/history/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-604AC75C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Emerald Court is a narrow passage near Lamb’s Conduit Street where small brick buildings and shopfronts preserve Bloomsbury’s workshop scale. Its name and secluded alignment add character to a network of lanes once occupied by printers, craftspeople and small traders.', description_it='Emerald Court è uno stretto passaggio vicino a Lamb’s Conduit Street, dove piccoli edifici in mattoni e vetrine conservano la scala artigiana di Bloomsbury. Il nome e l’allineamento appartato caratterizzano una rete un tempo abitata da tipografi, artigiani e commercianti.',
  editorial_hook_en='A narrow Bloomsbury passage preserves the small workshop scale behind Lamb’s Conduit Street.', editorial_hook_it='Uno stretto passaggio di Bloomsbury conserva la scala delle piccole botteghe dietro Lamb’s Conduit Street.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-59438F7C' AND category='AREA';

UPDATE places SET description_en='England’s Lane is Belsize Park’s compact neighbourhood high street, joining Haverstock Hill to Primrose Hill. Independent food shops, cafés and small businesses occupy Victorian terraces, while side streets reveal the mix of cottages and grand villas that shaped the hillside suburb.', description_it='England’s Lane è la compatta strada commerciale di Belsize Park, tra Haverstock Hill e Primrose Hill. Alimentari indipendenti, caffè e piccole attività occupano terrazze vittoriane, mentre le vie laterali mostrano cottage e grandi ville del sobborgo collinare.',
  editorial_hook_en='Independent shops animate a Victorian neighbourhood street between Belsize Park and Primrose Hill.', editorial_hook_it='Negozi indipendenti animano una strada vittoriana di quartiere tra Belsize Park e Primrose Hill.',
  official_url='https://www.englands-lane.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C6F43879' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.englands-lane.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C6F43879'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Ennismore Garden Mews is a secluded Knightsbridge stable lane behind the grand terraces around Ennismore Gardens. Painted coach houses, carriage arches and abundant planting create a small-scale service world, while the Russian Orthodox cathedral’s blue dome appears above the rooftops.', description_it='Ennismore Garden Mews è un appartato vicolo di scuderie a Knightsbridge dietro le grandi terrazze di Ennismore Gardens. Rimesse dipinte, archi e piante creano un mondo di servizio in scala ridotta, con la cupola azzurra della cattedrale ortodossa sopra i tetti.',
  editorial_hook_en='Painted coach houses frame a secluded mews beneath the blue dome of London’s Russian Orthodox cathedral.', editorial_hook_it='Rimesse dipinte incorniciano un mews appartato sotto la cupola azzurra della cattedrale russo-ortodossa.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-63CEED61' AND category='AREA';

UPDATE places SET description_en='Farriers Passage is a tiny Soho route whose name recalls the horse-related trades once needed around nearby coaching streets. Its tight proportions, service entrances and sudden connection between larger streets preserve the practical back-lane grain of the West End.', description_it='Farriers Passage è un minuscolo passaggio di Soho il cui nome ricorda i mestieri legati ai cavalli delle vicine strade di posta. Proporzioni strette, ingressi di servizio e collegamento improvviso tra vie maggiori conservano la trama pratica dei vicoli del West End.',
  editorial_hook_en='A horse-trade name survives in one of Soho’s tightest service passages.', editorial_hook_it='Il nome di un antico mestiere equestre sopravvive in uno dei passaggi di servizio più stretti di Soho.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-53E06A72' AND category='AREA';

UPDATE places SET description_en='Finsbury Circus is the City’s largest public open space and follows an elegant elliptical plan begun in the early nineteenth century. Plane trees, flower beds and the restored central lawn sit above Crossrail infrastructure, enclosed by offices including Edwin Lutyens’s Britannic House.', description_it='Finsbury Circus è il più grande spazio pubblico della City e segue un elegante disegno ellittico del primo Ottocento. Platani, aiuole e prato centrale restaurato si trovano sopra l’infrastruttura Crossrail, circondati da uffici tra cui Britannic House di Lutyens.',
  editorial_hook_en='An elliptical garden restores greenery to the City between Lutyens façades and hidden railway infrastructure.', editorial_hook_it='Un giardino ellittico restituisce verde alla City tra facciate di Lutyens e infrastrutture ferroviarie nascoste.',
  official_url='https://www.cityoflondon.gov.uk/things-to-do/city-gardens/find-a-garden/finsbury-circus-gardens', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FA9B2599' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cityoflondon.gov.uk/things-to-do/city-gardens/find-a-garden/finsbury-circus-gardens','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-FA9B2599'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The fountain in St Thomas’ Hospital gardens commemorates Mary Seacole, the Jamaican-born nurse and entrepreneur who supported British soldiers during the Crimean War. Martin Jennings’s 2016 sculpture shows her striding before a bronze disc marked by the terrain of Crimea.', description_it='La fontana nei giardini del St Thomas’ Hospital commemora Mary Seacole, infermiera e imprenditrice nata in Giamaica che assistette i soldati britannici durante la guerra di Crimea. La scultura di Martin Jennings del 2016 la mostra in cammino davanti a un disco con il paesaggio della Crimea.',
  editorial_hook_en='Mary Seacole strides toward Parliament against a bronze imprint of the Crimean landscape.', editorial_hook_it='Mary Seacole avanza verso il Parlamento davanti a un’impronta bronzea del paesaggio della Crimea.',
  official_url='https://www.maryseacoletrust.org.uk/mary-seacole-statue/', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D000E30A' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.maryseacoletrust.org.uk/mary-seacole-statue/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D000E30A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Garnault Place is a small Clerkenwell square named after Samuel Garnault, an eighteenth-century governor of the nearby New River Company. Its houses and institutional buildings sit within the former water-company estate, close to the surviving New River Head and Sadler’s Wells.', description_it='Garnault Place è una piccola piazza di Clerkenwell intitolata a Samuel Garnault, governatore settecentesco della vicina New River Company. Case ed edifici istituzionali occupano l’antica proprietà della compagnia idrica, vicino a New River Head e Sadler’s Wells.',
  editorial_hook_en='A quiet Clerkenwell square preserves the name and estate pattern of London’s pioneering New River water company.', editorial_hook_it='Una tranquilla piazza di Clerkenwell conserva il nome e la trama della pionieristica New River Company.',
  official_url='https://www.islington.gov.uk/planning/conservation', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A724E98E' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.islington.gov.uk/planning/conservation','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-A724E98E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Godfrey Street is a short Chelsea terrace whose cottages are painted in a varied sequence of bright and pastel colours. The modest nineteenth-century façades and small front gardens form a cheerful residential pocket between the larger houses of Old Church Street and King’s Road.', description_it='Godfrey Street è una breve terrazza di Chelsea, con cottage dipinti in una sequenza di colori vivaci e pastello. Le modeste facciate ottocentesche e i piccoli giardini anteriori creano un angolo residenziale allegro tra Old Church Street e King’s Road.',
  editorial_hook_en='A row of modest Chelsea cottages forms a carefully varied palette of bright residential façades.', editorial_hook_it='Una fila di modesti cottage di Chelsea forma una tavolozza attentamente variata di facciate residenziali.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D233EC24' AND category='AREA';

UPDATE places SET description_en='Golborne Road extends north from Portobello through a neighbourhood shaped by Moroccan, Portuguese and Caribbean communities. Food shops, cafés, market stalls, brutalist Trellick Tower and the tiled remains of the old railway landscape create a less polished counterpart to southern Notting Hill.', description_it='Golborne Road prosegue a nord di Portobello in un quartiere segnato da comunità marocchine, portoghesi e caraibiche. Alimentari, caffè, bancarelle, Trellick Tower e tracce ferroviarie offrono un volto meno levigato di Notting Hill.',
  editorial_hook_en='Moroccan cafés, Portuguese shops and Trellick Tower give Golborne Road a character distinct from Portobello.', editorial_hook_it='Caffè marocchini, negozi portoghesi e Trellick Tower danno a Golborne Road un carattere diverso da Portobello.',
  official_url='https://visitportobello.com/golborne-road', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5ABBE053' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://visitportobello.com/golborne-road','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-5ABBE053'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Goodwin’s Court is a narrow Covent Garden alley lined with bow-fronted houses and surviving Georgian shopfront details. Gas lamps, dark brick and the compressed perspective create a convincingly old-London scene, though the tiny passage remains a residential route rather than a film set.', description_it='Goodwin’s Court è uno stretto vicolo di Covent Garden con case a bow window e dettagli di botteghe georgiane. Lampade a gas, mattoni scuri e prospettiva compressa creano un autentico scorcio di vecchia Londra, pur restando un passaggio residenziale.',
  editorial_hook_en='Bow windows and gas lamps compress Georgian London into one of Covent Garden’s narrowest alleys.', editorial_hook_it='Bow window e lampade a gas concentrano la Londra georgiana in uno dei vicoli più stretti di Covent Garden.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C67DC12F' AND category='AREA';

UPDATE places SET description_en='Gordon Place is a secluded Kensington lane of small nineteenth-century cottages and converted service buildings near Campden Hill. Brick façades, painted doors and a sharp bend give it the intimate, irregular character of a village street hidden behind larger townhouses.', description_it='Gordon Place è un appartato vicolo di Kensington con piccoli cottage ottocenteschi ed edifici di servizio convertiti vicino Campden Hill. Facciate in mattoni, porte dipinte e una curva netta gli danno il carattere irregolare di una strada di paese dietro grandi case.',
  editorial_hook_en='Small cottages and a sharp bend make this Kensington lane feel detached from the formal streets around it.', editorial_hook_it='Piccoli cottage e una curva netta fanno sembrare questo vicolo di Kensington separato dalle strade formali circostanti.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6AB1C79F' AND category='AREA';

UPDATE places SET description_en='Gough Square is dominated by the brick house where Samuel Johnson compiled much of his Dictionary of the English Language. The courtyard’s narrow approaches, statue of Johnson’s cat Hodge and surrounding publishing history make it a concentrated literary enclave off Fleet Street.', description_it='Gough Square è dominata dalla casa in mattoni dove Samuel Johnson compilò gran parte del Dictionary of the English Language. Gli accessi stretti, la statua del gatto Hodge e la storia editoriale circostante ne fanno un concentrato angolo letterario vicino Fleet Street.',
  editorial_hook_en='Dr Johnson’s house and the statue of his cat Hodge turn this hidden square into a compact literary landmark.', editorial_hook_it='La casa di Dr Johnson e la statua del gatto Hodge trasformano questa piazza nascosta in un piccolo riferimento letterario.',
  official_url='https://www.drjohnsonshouse.org/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DF4FD9B4' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.drjohnsonshouse.org/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-DF4FD9B4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Gregory Place is a quiet Kensington passage of cottages and small houses near Kensington Church Street. Its irregular building line and human scale survive within an area better known for grand terraces, offering a glimpse of the tradespeople’s and service streets behind them.', description_it='Gregory Place è un tranquillo passaggio di Kensington con cottage e piccole case vicino Kensington Church Street. L’allineamento irregolare e la scala umana sopravvivono in una zona di grandi terrazze, mostrando le strade di artigiani e servizi alle loro spalle.',
  editorial_hook_en='An irregular row of small houses preserves the working scale behind Kensington’s grander terraces.', editorial_hook_it='Una fila irregolare di piccole case conserva la scala operativa dietro le grandi terrazze di Kensington.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4C50D574' AND category='AREA';

UPDATE places SET description_en='Halkin Mews is a compact Belgravia stable lane built to serve the grand houses around Belgrave Square. Stuccoed and brick coach houses, carriage arches and carefully planted façades show how utilitarian buildings have become some of the district’s most coveted homes.', description_it='Halkin Mews è un compatto vicolo di scuderie a Belgravia, costruito per servire le grandi case di Belgrave Square. Rimesse in stucco e mattoni, archi carrabili e facciate piantumate mostrano come edifici utilitari siano diventati abitazioni molto ambite.',
  editorial_hook_en='Belgravia’s former coach houses turn a utilitarian stable lane into a polished residential enclave.', editorial_hook_it='Le antiche rimesse di Belgravia trasformano un vicolo di servizio in una raffinata enclave residenziale.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-504317B5' AND category='AREA';

UPDATE places SET description_en='Hampstead grew from a hilltop village and spa into a district of winding lanes, Georgian houses and literary associations beside the Heath. Church Row, Flask Walk and hidden passages reward exploration, while high ground gives sudden views across London.', description_it='Hampstead si sviluppò da villaggio collinare e località termale in un quartiere di vicoli tortuosi, case georgiane e memorie letterarie accanto alla Heath. Church Row, Flask Walk e passaggi nascosti invitano all’esplorazione, con improvvise viste su Londra.',
  editorial_hook_en='Village lanes, Georgian houses and sudden skyline views meet at the edge of Hampstead Heath.', editorial_hook_it='Vicoli di paese, case georgiane e improvvise viste sullo skyline si incontrano ai margini di Hampstead Heath.',
  official_url='https://www.heathandhampstead.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-EBFBC8D2' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.heathandhampstead.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-EBFBC8D2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Harrow on the Hill clusters around a medieval church and the historic buildings of Harrow School on one of northwest London’s highest ridges. Brick and flint walls, old inns, school yards and long views preserve the character of a separate village absorbed by suburbia.', description_it='Harrow on the Hill si raccoglie attorno a una chiesa medievale e agli edifici storici della Harrow School su uno dei rilievi più alti del nord-ovest. Muri in mattoni e selce, antiche locande, cortili scolastici e viste lontane conservano un villaggio assorbito dalla città.',
  editorial_hook_en='A medieval church, old school buildings and ridge-top views preserve Harrow’s hill village identity.', editorial_hook_it='Chiesa medievale, antichi edifici scolastici e viste dal crinale conservano l’identità di villaggio collinare di Harrow.',
  official_url='https://www.harrowhilltrust.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A11' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.harrowhilltrust.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='A11'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Hartland Road is part of Camden’s colourful residential streets north of the market. Closely spaced Victorian terraces use individually painted façades, decorative mouldings and small front gardens to create a strong visual sequence away from the busier commercial routes.', description_it='Hartland Road appartiene alle strade residenziali colorate di Camden a nord del mercato. Terrazze vittoriane ravvicinate, facciate dipinte singolarmente, modanature e piccoli giardini formano una forte sequenza visiva lontano dalle vie commerciali.',
  editorial_hook_en='Individually painted Victorian terraces create a quieter colour trail north of Camden Market.', editorial_hook_it='Terrazze vittoriane dipinte singolarmente creano un percorso di colore più tranquillo a nord di Camden Market.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-971A6354' AND category='AREA';

UPDATE places SET description_en='Holland Park Mews is an exceptionally long former stable lane tucked behind Holland Park’s formal terraces. Repeated carriage arches, cobbles and two-storey coach houses create a coherent Victorian service streetscape, softened today by climbing plants and individually painted doors.', description_it='Holland Park Mews è un vicolo di antiche scuderie eccezionalmente lungo dietro le terrazze formali di Holland Park. Archi carrabili ripetuti, selciato e rimesse a due piani formano un paesaggio di servizio vittoriano oggi addolcito da rampicanti e porte colorate.',
  editorial_hook_en='A long rhythm of carriage arches preserves the Victorian service lane behind Holland Park’s grand terraces.', editorial_hook_it='Un lungo ritmo di archi carrabili conserva il vicolo di servizio vittoriano dietro le grandi terrazze di Holland Park.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F2DDB0A4' AND category='AREA';

UPDATE places SET description_en='The IFS Cloud cable car crosses the Thames between Greenwich Peninsula and the Royal Docks. Its cabins provide an elevated view of the O2, dock basins, Thames Barrier approaches and east London’s changing industrial landscape rather than serving only as a transport link.', description_it='La funivia IFS Cloud attraversa il Tamigi tra Greenwich Peninsula e Royal Docks. Le cabine offrono una vista elevata sull’O2, sui bacini, verso la Thames Barrier e sul paesaggio industriale in trasformazione dell’est di Londra, oltre alla funzione di trasporto.',
  editorial_hook_en='Cable-car cabins reveal the scale of the Thames, Royal Docks and east London’s industrial transformation.', editorial_hook_it='Le cabine mostrano la scala del Tamigi, dei Royal Docks e della trasformazione industriale dell’est londinese.',
  official_url='https://tfl.gov.uk/modes/london-cable-car/', access_notes_en='Admission and opening times vary. Check the official site for current tickets, timed entry, event-day restrictions and closures before travelling.', access_notes_it='Biglietti e orari variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni nei giorni di evento e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2DACE566' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://tfl.gov.uk/modes/london-cable-car/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-2DACE566'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Japanese roof garden at SOAS was designed as a place for quiet contemplation and remembrance. Stones, water, carefully chosen planting and the kanji character for forgiveness create a symbolic landscape above the Brunei Gallery, dedicated to those affected by war.', description_it='Il giardino pensile giapponese della SOAS fu progettato come luogo di contemplazione e memoria. Pietre, acqua, piante selezionate e il carattere kanji del perdono formano un paesaggio simbolico sopra la Brunei Gallery, dedicato alle vittime della guerra.',
  editorial_hook_en='A symbolic Japanese landscape of stone, water and forgiveness is hidden above the SOAS Brunei Gallery.', editorial_hook_it='Un paesaggio giapponese simbolico di pietra, acqua e perdono si nasconde sopra la Brunei Gallery della SOAS.',
  official_url='https://www.soas.ac.uk/about/our-campus/japanese-roof-garden', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-97CA437D' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.soas.ac.uk/about/our-campus/japanese-roof-garden','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-97CA437D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Kelly Street is a sharply curved Camden terrace famous for its sequence of brightly painted nineteenth-century houses. The repeated door and window proportions hold the composition together while each resident’s colour choice creates a distinctive arc near Kentish Town Road.', description_it='Kelly Street è una terrazza curva di Camden famosa per la sequenza di case ottocentesche dai colori vivaci. Le proporzioni ripetute di porte e finestre tengono unita la composizione, mentre ogni colore crea un arco caratteristico vicino Kentish Town Road.',
  editorial_hook_en='A sweeping curve of individually coloured Victorian houses forms one of Camden’s strongest residential compositions.', editorial_hook_it='Una grande curva di case vittoriane dipinte individualmente forma una delle composizioni residenziali più forti di Camden.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7D0D2954' AND category='AREA';

UPDATE places SET description_en='Kendrick Mews is a South Kensington stable lane behind Queen’s Gate and the museum district. Its brick coach houses, upper hayloft doors and carriage arches retain practical details from the equestrian service network that supported the surrounding Victorian townhouses.', description_it='Kendrick Mews è un vicolo di scuderie di South Kensington dietro Queen’s Gate e i musei. Le rimesse in mattoni, le porte superiori dei fienili e gli archi carrabili conservano dettagli della rete equestre che serviva le case vittoriane circostanti.',
  editorial_hook_en='Hayloft doors and carriage arches survive behind the grand townhouses of the museum district.', editorial_hook_it='Porte dei fienili e archi carrabili sopravvivono dietro le grandi case del quartiere dei musei.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6D2D60F3' AND category='AREA';

UPDATE places SET description_en='Keystone Crescent was built in the 1840s as a tight semicircle of modest houses near King’s Cross. Its unusually sharp curve, consistent brick façades and narrow roadway make the whole terrace read as a single piece of early-Victorian urban design.', description_it='Keystone Crescent fu costruita negli anni 1840 come stretto semicerchio di case modeste vicino King’s Cross. La curva molto accentuata, le facciate uniformi in mattoni e la carreggiata stretta fanno leggere la terrazza come un unico progetto urbano vittoriano.',
  editorial_hook_en='A remarkably tight semicircle turns modest early-Victorian houses into one unified urban composition.', editorial_hook_it='Un semicerchio eccezionalmente stretto trasforma modeste case vittoriane in un’unica composizione urbana.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1244167', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FB2EB2CA' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1244167','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-FB2EB2CA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Kynance Mews was built as stabling for the grand houses of Cornwall Gardens. Two stone arches mark its entrances, while converted coach houses, cobbles and Virginia creeper create a particularly complete South Kensington mews, especially vivid when the leaves turn red in autumn.', description_it='Kynance Mews fu costruito come scuderia per le grandi case di Cornwall Gardens. Due archi in pietra segnano gli ingressi, mentre rimesse convertite, selciato e vite americana formano uno dei mews più integri di South Kensington, spettacolare in autunno.',
  editorial_hook_en='Stone entrance arches and autumn-red creeper distinguish one of South Kensington’s most complete mews.', editorial_hook_it='Archi d’ingresso in pietra e rampicanti rossi in autunno distinguono uno dei mews più integri di South Kensington.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1080642', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A3' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1080642','official-or-authoritative','2026-10-14' FROM places WHERE id='A3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Lamb’s Conduit Passage and the adjoining street recall William Lamb’s sixteenth-century water conduit for Bloomsbury. Georgian and Victorian shopfronts now hold independent menswear, books, food and cafés, continuing a small-scale trading tradition between Great Ormond Street and Holborn.', description_it='Lamb’s Conduit Passage e la strada adiacente ricordano il condotto d’acqua cinquecentesco di William Lamb per Bloomsbury. Vetrine georgiane e vittoriane ospitano moda indipendente, libri, cibo e caffè, continuando una tradizione commerciale in scala ridotta.',
  editorial_hook_en='Independent shops follow the line and name of a Tudor conduit that once brought water to Bloomsbury.', editorial_hook_it='Negozi indipendenti seguono il tracciato e il nome di un condotto Tudor che portava acqua a Bloomsbury.',
  official_url='https://www.lambsconduitstreet.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A10' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lambsconduitstreet.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='A10'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Lancashire Court is a cluster of narrow Mayfair passages on the site of former stables and workshops behind New Bond Street. Small courtyards, restaurants and traces of older brick buildings provide an irregular backstreet contrast to the polished luxury shops nearby.', description_it='Lancashire Court è un gruppo di stretti passaggi di Mayfair sul sito di antiche scuderie e laboratori dietro New Bond Street. Piccoli cortili, ristoranti e tracce di edifici in mattoni offrono un contrasto irregolare con le eleganti boutique vicine.',
  editorial_hook_en='Former stable yards form an irregular network of courtyards behind Mayfair’s polished Bond Street frontage.', editorial_hook_it='Antichi cortili di scuderie formano una rete irregolare dietro l’elegante facciata di Bond Street.',
  official_url='https://www.mayfairldn.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6848ABD9' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.mayfairldn.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-6848ABD9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Lancaster Road is one of Notting Hill’s most photographed colour sequences, with nineteenth-century terraces painted in saturated blues, pinks, greens and yellows. The strongest group lies west of Portobello Road, where uniform architecture lets the contrasting façades dominate.', description_it='Lancaster Road è una delle sequenze cromatiche più fotografate di Notting Hill, con terrazze ottocentesche dipinte in blu, rosa, verdi e gialli saturi. Il gruppo principale è a ovest di Portobello Road, dove l’architettura uniforme esalta i contrasti.',
  editorial_hook_en='Saturated colour transforms a uniform Victorian terrace into one of Notting Hill’s boldest streetscapes.', editorial_hook_it='Colori saturi trasformano una terrazza vittoriana uniforme in uno dei paesaggi stradali più audaci di Notting Hill.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-89E0E43A' AND category='AREA';

UPDATE places SET description_en='Leicester Square was laid out in the 1670s and evolved from a residential garden square into the centre of London cinema premieres. The central garden contains a Shakespeare statue and film-themed sculpture trail, surrounded by major cinemas and the layered neon of the West End.', description_it='Leicester Square fu tracciata negli anni 1670 e passò da piazza residenziale a centro delle première cinematografiche londinesi. Il giardino ospita una statua di Shakespeare e un percorso di sculture dedicate al cinema, circondato da grandi sale e luci del West End.',
  editorial_hook_en='Shakespeare, film characters and red-carpet cinemas share the West End’s most theatrical public square.', editorial_hook_it='Shakespeare, personaggi del cinema e sale da red carpet condividono la piazza più teatrale del West End.',
  official_url='https://www.leicestersquare.london/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-19F851DA' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.leicestersquare.london/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-19F851DA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Little Green Street is a rare intact terrace of early-eighteenth-century houses beneath Highgate. Just eight modest homes line the narrow lane, their brick fronts, sash windows and near-rural setting surviving later redevelopment pressures with remarkable coherence.', description_it='Little Green Street è una rara terrazza integra di case del primo Settecento ai piedi di Highgate. Solo otto modeste abitazioni occupano il vicolo, con mattoni, finestre a ghigliottina e ambiente quasi rurale sopravvissuti alle pressioni edilizie.',
  editorial_hook_en='Eight early-Georgian houses preserve a near-rural lane beneath Highgate.', editorial_hook_it='Otto case del primo periodo georgiano conservano un vicolo quasi rurale ai piedi di Highgate.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1244489', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4F79FBAD' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1244489','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-4F79FBAD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Little Turnstile is one of the passages whose names recall the gates that controlled access to Lincoln’s Inn Fields. The tight pedestrian route between Holborn and the square retains small shopfronts and the legal quarter’s dense network of courts, alleys and boundaries.', description_it='Little Turnstile è uno dei passaggi il cui nome ricorda i tornelli che controllavano l’accesso a Lincoln’s Inn Fields. Lo stretto percorso pedonale tra Holborn e la piazza conserva piccole botteghe e la fitta rete di corti e confini del quartiere legale.',
  editorial_hook_en='A gate remembered only in its name marks a compact passage into London’s historic legal quarter.', editorial_hook_it='Un cancello ricordato soltanto nel nome segna un piccolo passaggio verso lo storico quartiere legale di Londra.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5CA73C40' AND category='AREA';

UPDATE places SET description_en='Little Venice is the waterside junction where the Grand Union and Regent’s canals meet near Paddington. Narrowboats, willow-lined towpaths, Browning’s Pool and waterside cafés create a distinctive basin from which walks and boat trips continue toward Camden or west London.', description_it='Little Venice è il nodo acquatico dove Grand Union e Regent’s Canal si incontrano vicino Paddington. Barche, alici lungo l’alzaia, Browning’s Pool e caffè sull’acqua formano un bacino da cui passeggiate e battelli proseguono verso Camden o ovest.',
  editorial_hook_en='Narrowboats gather beneath willows where two major London canals meet at Browning’s Pool.', editorial_hook_it='Le narrowboat si raccolgono sotto i salici dove due grandi canali londinesi si incontrano a Browning’s Pool.',
  official_url='https://canalrivertrust.org.uk/places-to-visit/little-venice', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CB550F29' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://canalrivertrust.org.uk/places-to-visit/little-venice','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-CB550F29'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Lovat Lane descends steeply through the City toward the Thames, preserving the gradient and narrowness of a medieval route. Uneven paving, close-set brick buildings and sudden views toward St Magnus and the river make the short lane unusually atmospheric among larger office blocks.', description_it='Lovat Lane scende ripidamente attraverso la City verso il Tamigi, conservando pendenza e strettezza di un percorso medievale. Pavimentazione irregolare, edifici ravvicinati e scorci verso St Magnus e il fiume rendono il breve vicolo molto suggestivo.',
  editorial_hook_en='A steep medieval lane drops between City buildings toward St Magnus and the Thames.', editorial_hook_it='Un ripido vicolo medievale scende tra gli edifici della City verso St Magnus e il Tamigi.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-1C4C9E08' AND category='AREA';

UPDATE places SET description_en='Lower Marsh is a historic trading street behind Waterloo station, with a market formally established in the nineteenth century. Independent cafés, food stalls, specialist shops and surviving shopfronts reflect its long role serving travellers, workers and the surrounding Lambeth community.', description_it='Lower Marsh è una storica strada commerciale dietro Waterloo, con mercato formalizzato nell’Ottocento. Caffè indipendenti, bancarelle, negozi specializzati e vetrine superstiti riflettono il ruolo svolto per viaggiatori, lavoratori e comunità di Lambeth.',
  editorial_hook_en='Market stalls and independent shopfronts preserve a working high street behind Waterloo station.', editorial_hook_it='Bancarelle e vetrine indipendenti conservano una strada commerciale viva dietro la stazione di Waterloo.',
  official_url='https://www.lowermarshmarket.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3D28C27A' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lowermarshmarket.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-3D28C27A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Mayfair’s historic core lies around Grosvenor Square, Mount Street, Shepherd Market and the surviving mews between them. Aristocratic estate planning, Georgian houses, embassies, luxury retail and hidden gardens reveal a district more architecturally varied than its expensive reputation suggests.', description_it='Il nucleo storico di Mayfair si estende tra Grosvenor Square, Mount Street, Shepherd Market e i mews superstiti. Pianificazione aristocratica, case georgiane, ambasciate, lusso e giardini nascosti mostrano un quartiere più vario della sola reputazione costosa.',
  editorial_hook_en='Georgian squares, hidden mews and estate gardens reveal the urban structure beneath Mayfair’s luxury image.', editorial_hook_it='Piazze georgiane, mews nascosti e giardini di proprietà rivelano la struttura urbana dietro l’immagine lussuosa di Mayfair.',
  official_url='https://www.mayfairldn.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-72B20EEC' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.mayfairldn.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-72B20EEC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The mews arch near Ennismore Gardens marks the threshold between grand Knightsbridge streets and their former service lanes. Its masonry opening frames smaller coach houses behind, making the hierarchy of townhouse, stable yard and concealed working access immediately legible.', description_it='L’arco del mews vicino Ennismore Gardens segna il passaggio tra le grandi strade di Knightsbridge e gli antichi vicoli di servizio. L’apertura in muratura incornicia piccole rimesse e rende leggibile la gerarchia tra casa, scuderia e accesso operativo.',
  editorial_hook_en='A masonry arch neatly frames the change from grand Knightsbridge terraces to their former stable lane.', editorial_hook_it='Un arco in muratura incornicia il passaggio dalle grandi terrazze di Knightsbridge all’antico vicolo delle scuderie.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F0AF8E72' AND category='AREA';

UPDATE places SET description_en='The Millennium Bridge opened in 2000 as London’s first new pedestrian Thames crossing for more than a century. Foster and Partners’ low-slung steel design preserves a direct visual axis between St Paul’s Cathedral and Tate Modern, with river traffic visible through its slender structure.', description_it='Il Millennium Bridge aprì nel 2000 come primo nuovo ponte pedonale londinese sul Tamigi dopo oltre un secolo. Il basso disegno in acciaio di Foster and Partners mantiene l’asse visivo tra St Paul’s e Tate Modern, lasciando visibile il traffico fluviale.',
  editorial_hook_en='A low steel crossing creates London’s clearest pedestrian axis between St Paul’s and Tate Modern.', editorial_hook_it='Un basso ponte d’acciaio crea il più chiaro asse pedonale di Londra tra St Paul’s e Tate Modern.',
  official_url='https://www.citybridgefoundation.org.uk/bridges/millennium-bridge', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-368AE350' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.citybridgefoundation.org.uk/bridges/millennium-bridge','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-368AE350'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Motcomb Street is a curved Belgravia shopping street linking Lowndes Square with Knightsbridge. Nineteenth-century façades, independent food shops and the landmark Pantechnicon building create a compact neighbourhood centre within the larger Grosvenor estate.', description_it='Motcomb Street è una strada commerciale curva di Belgravia tra Lowndes Square e Knightsbridge. Facciate ottocentesche, negozi alimentari indipendenti e il Pantechnicon formano un compatto centro di quartiere nel grande Grosvenor Estate.',
  editorial_hook_en='Independent food shops and the Pantechnicon animate a curved Belgravia street behind Knightsbridge.', editorial_hook_it='Negozi alimentari indipendenti e il Pantechnicon animano una strada curva di Belgravia dietro Knightsbridge.',
  official_url='https://www.belgravialdn.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-677A3AC9' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.belgravialdn.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-677A3AC9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Mount Street Gardens opened as a public garden in 1889 on the former burial ground of St George’s Hanover Square. Plane trees, exotic planting, ornate benches and the Gothic Church of the Immaculate Conception create a secluded green room behind Mayfair’s commercial streets.', description_it='Mount Street Gardens aprì come giardino pubblico nel 1889 sull’antico cimitero di St George’s Hanover Square. Platani, piante esotiche, panchine decorate e la chiesa gotica dell’Immacolata creano una stanza verde appartata dietro le vie commerciali di Mayfair.',
  editorial_hook_en='A former burial ground has become a richly planted green room behind Mayfair’s Mount Street.', editorial_hook_it='Un antico cimitero è diventato una ricca stanza verde dietro Mount Street a Mayfair.',
  official_url='https://www.westminster.gov.uk/parks-squares-and-open-spaces/mount-street-gardens', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A5' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.westminster.gov.uk/parks-squares-and-open-spaces/mount-street-gardens','official-or-authoritative','2026-10-14' FROM places WHERE id='A5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='New Row is a narrow Covent Garden shopping street running toward St Martin’s Lane. Small Georgian and Victorian frontages contain specialist food shops, pubs and independent retailers, preserving a fine-grained commercial route just outside the market piazza.', description_it='New Row è una stretta strada commerciale di Covent Garden verso St Martin’s Lane. Piccoli fronti georgiani e vittoriani ospitano alimentari specializzati, pub e negozi indipendenti, conservando una trama minuta appena fuori dalla piazza del mercato.',
  editorial_hook_en='Small historic shopfronts make New Row a fine-grained commercial link beyond Covent Garden’s piazza.', editorial_hook_it='Piccole vetrine storiche fanno di New Row un collegamento commerciale minuto oltre la piazza di Covent Garden.',
  official_url='https://www.coventgarden.london/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-AB59F1BF' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.coventgarden.london/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-AB59F1BF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Newman Passage is a narrow Fitzrovia alley associated with the opening murder scene of Michael Powell’s film ‘Peeping Tom’. Brick walls, service entrances and its abrupt turn preserve the backstage character of a district once dense with workshops and studios.', description_it='Newman Passage è uno stretto vicolo di Fitzrovia legato alla scena iniziale del delitto nel film “Peeping Tom” di Michael Powell. Muri in mattoni, ingressi di servizio e la svolta improvvisa conservano il carattere dietro le quinte di un quartiere di laboratori e studi.',
  editorial_hook_en='A cramped Fitzrovia passage carries an unsettling place in British cinema through ‘Peeping Tom’.', editorial_hook_it='Uno stretto passaggio di Fitzrovia occupa un luogo inquietante nel cinema britannico grazie a “Peeping Tom”.',
  official_url='https://fitzrovia.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-996A13CB' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://fitzrovia.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-996A13CB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Odhams Walk is a 1970s housing estate built on the former Odhams Press site in Covent Garden. Brick terraces, bridges, planted decks and traffic-free courtyards form a dense but sociable piece of low-rise architecture, sharply different from the surrounding West End streets.', description_it='Odhams Walk è un complesso residenziale degli anni Settanta costruito sul sito dell’ex Odhams Press a Covent Garden. Terrazze in mattoni, ponti, terrazze verdi e cortili senza auto formano un’architettura densa ma comunitaria, diversa dal West End circostante.',
  editorial_hook_en='Brick walkways and planted decks turn a former printing site into a distinctive traffic-free housing landscape.', editorial_hook_it='Passerelle in mattoni e terrazze verdi trasformano un’antica tipografia in un caratteristico paesaggio residenziale senza auto.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1455524', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-99258BEE' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1455524','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-99258BEE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Old Bond Street forms the southern, older section of Bond Street and has concentrated luxury retail, art dealers and auction houses for centuries. Historic façades and arcades sit among global brands, while the ‘Allies’ bench sculpture captures Churchill and Roosevelt in conversation.', description_it='Old Bond Street forma la parte meridionale e più antica di Bond Street, sede da secoli di lusso, mercanti d’arte e case d’asta. Facciate storiche e gallerie convivono con marchi globali, mentre la panchina “Allies” ritrae Churchill e Roosevelt.',
  editorial_hook_en='Art dealers, historic arcades and the seated ‘Allies’ preserve layers beneath Bond Street’s luxury frontage.', editorial_hook_it='Mercanti d’arte, gallerie storiche e gli “Allies” seduti conservano strati di storia sotto il lusso di Bond Street.',
  official_url='https://www.bondstreet.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-02A48D66' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bondstreet.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-02A48D66'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The foundations of Shakespeare’s original Globe survive beneath Anchor Terrace on Park Street, marked at street level rather than reconstructed. Built in 1599 by the Lord Chamberlain’s Men, the playhouse staged works including ‘Hamlet’ and ‘King Lear’ before burning in 1613.', description_it='Le fondazioni del Globe originale di Shakespeare sopravvivono sotto Anchor Terrace in Park Street, segnalate in superficie ma non ricostruite. Costruito nel 1599 dai Lord Chamberlain’s Men, ospitò opere come “Hamlet” e “King Lear” prima di bruciare nel 1613.',
  editorial_hook_en='A simple street marker identifies where Shakespeare’s company built the original Globe in 1599.', editorial_hook_it='Un semplice segno stradale indica dove la compagnia di Shakespeare costruì il Globe originale nel 1599.',
  official_url='https://www.shakespearesglobe.com/discover/shakespeares-world/the-globe/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A13' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.shakespearesglobe.com/discover/shakespeares-world/the-globe/','official-or-authoritative','2026-10-14' FROM places WHERE id='A13'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Osten Mews is a narrow Kensington stable lane behind the terraces near Gloucester Road. Brick coach houses, painted garage doors and surviving carriage openings reveal the service architecture once required by the district’s larger Victorian homes.', description_it='Osten Mews è uno stretto vicolo di scuderie a Kensington dietro le terrazze vicino Gloucester Road. Rimesse in mattoni, porte dipinte e aperture carrabili superstiti rivelano l’architettura di servizio delle grandi case vittoriane.',
  editorial_hook_en='Brick coach houses preserve the equestrian service lane behind Gloucester Road’s formal terraces.', editorial_hook_it='Rimesse in mattoni conservano il vicolo di servizio equestre dietro le terrazze formali di Gloucester Road.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-20118320' AND category='AREA';

UPDATE places SET description_en='Oxford Circus is the 1810s intersection of John Nash’s Regent Street with Oxford Street, later rebuilt with four matching quadrant buildings. The diagonal pedestrian crossing reveals the geometry of one of Europe’s busiest retail junctions and the sweep of Regent Street’s façades.', description_it='Oxford Circus è l’incrocio ottocentesco tra Regent Street di John Nash e Oxford Street, poi ricostruito con quattro edifici coordinati agli angoli. L’attraversamento diagonale rende leggibile la geometria di uno dei nodi commerciali più affollati d’Europa.',
  editorial_hook_en='Four matching quadrants and a diagonal crossing expose the geometry of London’s busiest retail junction.', editorial_hook_it='Quattro angoli coordinati e un attraversamento diagonale mostrano la geometria del più affollato incrocio commerciale londinese.',
  official_url='https://www.regentstreetonline.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-1523DA68' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.regentstreetonline.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-1523DA68'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Park Square Mews forms the service lane behind John Nash’s grand Park Square terraces beside Regent’s Park. Coach houses, cobbles and restrained stucco details preserve the functional counterpart to the formal Regency composition facing the private garden.', description_it='Park Square Mews è il vicolo di servizio dietro le grandi terrazze di Park Square progettate da John Nash accanto a Regent’s Park. Rimesse, selciato e sobri dettagli in stucco conservano il lato funzionale della composizione Regency affacciata sul giardino.',
  editorial_hook_en='Former coach houses reveal the working back of John Nash’s formal Park Square terraces.', editorial_hook_it='Le antiche rimesse mostrano il retro operativo delle terrazze formali di Park Square progettate da John Nash.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3785D940' AND category='AREA';

UPDATE places SET description_en='Parkland Walk follows the former Great Northern Railway branch between Finsbury Park and Highgate, with a second section toward Alexandra Palace. Platforms, bridges and tunnels have become a wooded nature reserve, including the eerie Spriggan sculpture emerging from a former railway arch.', description_it='Parkland Walk segue l’antica linea della Great Northern Railway tra Finsbury Park e Highgate, con una seconda sezione verso Alexandra Palace. Banchine, ponti e tunnel sono diventati riserva naturale boscosa, con la figura dello Spriggan che emerge da un arco ferroviario.',
  editorial_hook_en='Disused platforms, railway arches and the Spriggan sculpture hide along London’s longest linear nature reserve.', editorial_hook_it='Banchine dismesse, archi ferroviari e la scultura dello Spriggan si nascondono nella più lunga riserva naturale lineare di Londra.',
  official_url='https://www.parkland-walk.org.uk/', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A4' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.parkland-walk.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='A4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Passing Alley is linked to the former Middlesex House of Detention and the public route beside Clerkenwell Close. Its name is traditionally associated with the passage of prisoners toward execution, adding a grim layer to an otherwise modest lane near the old prison site.', description_it='Passing Alley è legato all’antica Middlesex House of Detention e al percorso pubblico vicino Clerkenwell Close. Il nome è tradizionalmente associato al passaggio dei prigionieri verso l’esecuzione, aggiungendo uno strato cupo a un modesto vicolo vicino all’ex carcere.',
  editorial_hook_en='A modest Clerkenwell alley carries the memory of prisoners passing from the old House of Detention.', editorial_hook_it='Un modesto vicolo di Clerkenwell conserva la memoria dei prigionieri in uscita dall’antica House of Detention.',
  official_url='https://www.islington.gov.uk/planning/conservation', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-40A2B300' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.islington.gov.uk/planning/conservation','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-40A2B300'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Pavilion Road was originally a service street for the grand houses of Sloane Street and Cadogan Square. Restored brick shopfronts now house artisan food specialists and independent retailers, but the narrow plots and upper floors still reveal its mews-like working origins.', description_it='Pavilion Road nacque come strada di servizio per le grandi case di Sloane Street e Cadogan Square. Le vetrine in mattoni restaurate ospitano oggi artigiani del cibo e negozi indipendenti, ma i lotti stretti e i piani superiori rivelano ancora l’origine da mews.',
  editorial_hook_en='Artisan food shops occupy the restored service street behind Chelsea’s grand Sloane Street houses.', editorial_hook_it='Botteghe alimentari artigiane occupano la restaurata strada di servizio dietro le grandi case di Sloane Street.',
  official_url='https://www.pavilionroad.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E22CEC91' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.pavilionroad.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-E22CEC91'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Piccadilly Circus was created in 1819 at the junction of Regent Street and Piccadilly. The illuminated advertising screens, Shaftesbury Memorial fountain and curving façades make it a constantly changing hinge between Soho, theatreland and the grand West End avenues.', description_it='Piccadilly Circus nacque nel 1819 all’incrocio tra Regent Street e Piccadilly. Schermi pubblicitari luminosi, fontana dello Shaftesbury Memorial e facciate curve ne fanno una cerniera in continuo cambiamento tra Soho, teatri e grandi viali del West End.',
  editorial_hook_en='Neon screens and curving Regency façades collide at the West End’s most recognisable junction.', editorial_hook_it='Schermi al neon e facciate Regency curve si incontrano nel nodo più riconoscibile del West End.',
  official_url='https://www.visitlondon.com/things-to-do/place/283719-piccadilly-circus', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E098F0C0' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.visitlondon.com/things-to-do/place/283719-piccadilly-circus','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-E098F0C0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Pont Street Mews is a Belgravia stable lane behind the red-brick mansion blocks and ‘Pont Street Dutch’ houses of the surrounding district. Converted coach houses, painted doors and carriage arches retain the smaller scale of the service network behind elite Victorian homes.', description_it='Pont Street Mews è un vicolo di scuderie di Belgravia dietro i palazzi in mattoni rossi e le case “Pont Street Dutch”. Rimesse convertite, porte dipinte e archi carrabili conservano la scala ridotta della rete di servizio delle dimore vittoriane.',
  editorial_hook_en='Coach houses preserve the small-scale service world behind Belgravia’s distinctive red-brick mansions.', editorial_hook_it='Le rimesse conservano il mondo di servizio in scala ridotta dietro le caratteristiche dimore in mattoni rossi di Belgravia.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2848996B' AND category='AREA';

UPDATE places SET description_en='Portobello Road runs through the heart of Notting Hill and hosts one of London’s best-known street markets. Antiques arcades, fruit stalls, Caribbean and Portuguese influences, pastel terraces and traces of the old Portobello farm create different characters along its length.', description_it='Portobello Road attraversa il cuore di Notting Hill e ospita uno dei mercati di strada più noti di Londra. Gallerie di antiquariato, frutta, influenze caraibiche e portoghesi, terrazze pastello e tracce dell’antica fattoria creano caratteri diversi lungo il percorso.',
  editorial_hook_en='Antiques, food stalls and colourful terraces change character block by block along Portobello Road.', editorial_hook_it='Antiquariato, bancarelle e terrazze colorate cambiano carattere isolato dopo isolato lungo Portobello Road.',
  official_url='https://visitportobello.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CBFCF482' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://visitportobello.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-CBFCF482'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Prime Meridian at Greenwich marks longitude 0°, the reference adopted internationally in 1884. A brass line in the Royal Observatory courtyard and a laser projected north after dark make the abstract division between eastern and western hemispheres physically visible.', description_it='Il meridiano di Greenwich segna la longitudine 0°, riferimento adottato a livello internazionale nel 1884. Una linea d’ottone nel cortile del Royal Observatory e un laser proiettato verso nord dopo il tramonto rendono visibile la divisione tra emisferi.',
  editorial_hook_en='Stand across longitude zero where global time and mapping were given a common reference line.', editorial_hook_it='Mettiti a cavallo della longitudine zero, dove tempo e cartografia mondiali ricevettero una linea di riferimento comune.',
  official_url='https://www.rmg.co.uk/royal-observatory/attractions/prime-meridian', access_notes_en='Admission and opening times vary. Check the official site for current tickets, timed entry, event-day restrictions and closures before travelling.', access_notes_it='Biglietti e orari variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni nei giorni di evento e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6A0691B2' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.rmg.co.uk/royal-observatory/attractions/prime-meridian','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-6A0691B2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Princelet Street preserves some of Spitalfields’ finest early-eighteenth-century houses, built for Huguenot silk weavers. No. 19 later became a synagogue and is now a museum project, while surviving attics, shutters and workshop windows show how domestic life and textile production overlapped.', description_it='Princelet Street conserva alcune delle migliori case del primo Settecento di Spitalfields, costruite per tessitori di seta ugonotti. Il civico 19 divenne poi sinagoga, mentre soffitte, persiane e finestre da laboratorio mostrano l’intreccio tra casa e produzione.',
  editorial_hook_en='Huguenot silk-weavers’ houses and a former synagogue compress centuries of migration into one Georgian street.', editorial_hook_it='Case di tessitori ugonotti e un’ex sinagoga concentrano secoli di migrazione in una sola strada georgiana.',
  official_url='https://www.19princeletstreet.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A15' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.19princeletstreet.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='A15'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Princes Gate Mews served the grand mid-Victorian terraces facing Hyde Park and Exhibition Road. Converted coach houses retain brickwork, carriage arches and traces of hayloft openings, offering a small-scale counterpoint to nearby museums and diplomatic buildings.', description_it='Princes Gate Mews serviva le grandi terrazze vittoriane affacciate su Hyde Park ed Exhibition Road. Le rimesse convertite conservano mattoni, archi carrabili e tracce dei fienili, offrendo un contrappunto in scala ridotta a musei e sedi diplomatiche.',
  editorial_hook_en='Former stables preserve a quiet service lane behind South Kensington’s museums and diplomatic terraces.', editorial_hook_it='Antiche scuderie conservano un tranquillo vicolo di servizio dietro musei e terrazze diplomatiche di South Kensington.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B071B32E' AND category='AREA';

UPDATE places SET description_en='Princess Mews is a discreet Belsize Park lane of converted stables and workshops. Brick façades, broad former carriage doors and compact upper floors preserve the practical architecture that served the larger villas and terraces of the nineteenth-century suburb.', description_it='Princess Mews è un discreto vicolo di Belsize Park con scuderie e laboratori convertiti. Facciate in mattoni, ampie porte carrabili e piani superiori compatti conservano l’architettura pratica al servizio delle ville e terrazze ottocentesche.',
  editorial_hook_en='Converted stables reveal the working lane behind Belsize Park’s larger Victorian homes.', editorial_hook_it='Scuderie convertite rivelano il vicolo operativo dietro le più grandi case vittoriane di Belsize Park.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4AD1813D' AND category='AREA';

UPDATE places SET description_en='The Pullens Estate is one of London’s last surviving Victorian tenement developments with purpose-built workshop yards. Repeated brick balconies surround compact flats, while Clements, Peacock and Iliffe Yards still support makers and open their studios on occasional weekends.', description_it='Il Pullens Estate è uno degli ultimi complessi popolari vittoriani di Londra con cortili-laboratorio costruiti appositamente. Balconi in mattoni circondano piccoli appartamenti, mentre Clements, Peacock e Iliffe Yards ospitano ancora artigiani e aperture periodiche.',
  editorial_hook_en='Victorian tenements and working craft yards survive together in an exceptional Walworth enclave.', editorial_hook_it='Case popolari vittoriane e cortili artigiani ancora attivi sopravvivono insieme in un’eccezionale enclave di Walworth.',
  official_url='https://pullensopen.org/', access_notes_en='This is best appreciated from the public realm. Some adjoining land or interiors are private, restricted or available only during occasional open days.', access_notes_it='Il luogo si apprezza soprattutto dallo spazio pubblico. Alcune aree o interni adiacenti sono privati, riservati o accessibili soltanto durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7A96FE47' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://pullensopen.org/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-7A96FE47'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Puma Court is a narrow Spitalfields passage running beside the former Truman Brewery complex. Modest brick houses and workshop remnants reflect the neighbourhood’s layers of Huguenot, Jewish and Bengali settlement away from the commercial intensity of Brick Lane.', description_it='Puma Court è uno stretto passaggio di Spitalfields accanto all’ex complesso Truman Brewery. Modeste case in mattoni e resti di laboratori riflettono gli strati di insediamento ugonotto, ebraico e bengalese lontano dall’intensità commerciale di Brick Lane.',
  editorial_hook_en='A narrow passage beside Brick Lane preserves the domestic scale of Spitalfields’ successive migrant communities.', editorial_hook_it='Uno stretto passaggio accanto a Brick Lane conserva la scala domestica delle successive comunità migranti di Spitalfields.',
  official_url='https://www.spitalfieldsforum.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-554EB24B' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.spitalfieldsforum.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-554EB24B'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Regent Street was planned by John Nash from 1811 as a ceremonial and commercial route linking Carlton House with Regent’s Park. The present sweeping Portland-stone façades largely date from the early twentieth century, preserving Nash’s curve while creating monumental unified shopfronts.', description_it='Regent Street fu progettata da John Nash dal 1811 come percorso cerimoniale e commerciale tra Carlton House e Regent’s Park. Le attuali facciate curve in pietra di Portland risalgono soprattutto al primo Novecento, conservando la curva di Nash con fronti monumentali.',
  editorial_hook_en='A great Portland-stone curve preserves John Nash’s ceremonial route through the modern West End.', editorial_hook_it='Una grande curva in pietra di Portland conserva il percorso cerimoniale di John Nash nel moderno West End.',
  official_url='https://www.regentstreetonline.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8F76933E' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.regentstreetonline.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-8F76933E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Richmond developed around a royal palace and a Thames crossing, retaining a compact Georgian centre between the river and Richmond Hill. Riverside terraces, lanes, the Green and views protected by Act of Parliament connect town life with the vast landscape of Richmond Park.', description_it='Richmond si sviluppò attorno a un palazzo reale e a un attraversamento del Tamigi, conservando un centro georgiano compatto tra fiume e collina. Terrazze fluviali, vicoli, il Green e viste protette per legge collegano la città al vasto Richmond Park.',
  editorial_hook_en='A Georgian riverside town rises toward one of London’s most carefully protected panoramic views.', editorial_hook_it='Una città georgiana sul fiume sale verso una delle viste panoramiche più protette di Londra.',
  official_url='https://www.visitrichmond.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B23BDDCA' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.visitrichmond.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-B23BDDCA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The River Neckinger is one of London’s largely hidden waterways, rising around Southwark and flowing toward St Saviour’s Dock. Its sinister name is often linked to the ‘devil’s neckcloth’ of the old gallows, while fragments of the channel survive around Bermondsey’s former tanneries.', description_it='Il River Neckinger è uno dei corsi d’acqua quasi interamente nascosti di Londra, nato a Southwark e diretto a St Saviour’s Dock. Il nome sinistro è legato al “fazzoletto del diavolo” del patibolo, mentre frammenti del canale restano tra le antiche concerie di Bermondsey.',
  editorial_hook_en='A buried river with a gallows-linked name still surfaces among Bermondsey’s former warehouses and tanneries.', editorial_hook_it='Un fiume sotterraneo dal nome legato al patibolo riaffiora tra gli antichi magazzini e le concerie di Bermondsey.',
  official_url='https://www.london.gov.uk/programmes-strategies/environment-and-climate-change/parks-green-spaces-and-biodiversity/river-restoration', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B515EEA1' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.london.gov.uk/programmes-strategies/environment-and-climate-change/parks-green-spaces-and-biodiversity/river-restoration','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-B515EEA1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Roupell Street was developed from the 1820s by the Roupell family on former marshland near Waterloo. Almost continuous rows of modest yellow-brick houses, original fanlights and corner pubs survived bombing and redevelopment, creating an exceptional early-nineteenth-century workers’ streetscape.', description_it='Roupell Street fu sviluppata dagli anni 1820 dalla famiglia Roupell su antiche paludi vicino Waterloo. File quasi continue di modeste case in mattoni gialli, sopraluci originali e pub d’angolo sono sopravvissuti a bombe e ricostruzioni, formando un raro paesaggio operaio.',
  editorial_hook_en='Yellow-brick workers’ terraces survive almost intact behind Waterloo in a remarkable nineteenth-century time capsule.', editorial_hook_it='Terrazze operaie in mattoni gialli sopravvivono quasi intatte dietro Waterloo come straordinaria capsula ottocentesca.',
  official_url='https://www.lera.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A8' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lera.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='A8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Royal Crescent in Holland Park was built in the 1840s as a grand stucco composition modelled on the crescent form popularised in Bath. Its paired curves frame a private garden and terminate in projecting end blocks, creating a formal western gateway to Notting Hill.', description_it='Royal Crescent a Holland Park fu costruita negli anni 1840 come grande composizione in stucco ispirata alle mezzelune di Bath. Le due curve incorniciano un giardino privato e terminano in blocchi sporgenti, creando un ingresso formale a Notting Hill.',
  editorial_hook_en='Twin stucco curves create a formal Victorian answer to Bath’s famous crescents in west London.', editorial_hook_it='Due curve in stucco creano nella Londra occidentale una risposta vittoriana alle celebri mezzelune di Bath.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1225182', access_notes_en='This is best appreciated from the public realm. Some adjoining land or interiors are private, restricted or available only during occasional open days.', access_notes_it='Il luogo si apprezza soprattutto dallo spazio pubblico. Alcune aree o interni adiacenti sono privati, riservati o accessibili soltanto durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B3C9D2E2' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1225182','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-B3C9D2E2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Ruislip Lido is a reservoir opened in 1811 to feed the Grand Junction Canal and later reinvented as a suburban leisure lake. Its sandy beach, surrounding woodland and twelve-inch-gauge miniature railway create an improbable seaside atmosphere at the edge of northwest London.', description_it='Ruislip Lido è un bacino aperto nel 1811 per alimentare il Grand Junction Canal e poi trasformato in lago ricreativo suburbano. Spiaggia sabbiosa, boschi e ferrovia in miniatura a scartamento ridotto creano un’improbabile atmosfera balneare ai margini nord-occidentali.',
  editorial_hook_en='A canal reservoir became a woodland beach resort complete with Britain’s longest miniature railway.', editorial_hook_it='Un bacino per canali è diventato una località balneare nel bosco con una lunga ferrovia in miniatura.',
  official_url='https://www.hillingdon.gov.uk/ruislip-lido', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D86CD792' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.hillingdon.gov.uk/ruislip-lido','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D86CD792'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Helen’s Place is a short gated City street beside the medieval church of St Helen Bishopsgate. Restrained nineteenth-century offices, livery connections and glimpses of the church form a protected enclave immediately behind the towers and traffic of Bishopsgate.', description_it='St Helen’s Place è una breve strada con accesso controllato accanto alla chiesa medievale di St Helen Bishopsgate. Sobri uffici ottocenteschi, legami con le corporazioni e scorci della chiesa formano un’enclave protetta dietro torri e traffico di Bishopsgate.',
  editorial_hook_en='A gated City enclave preserves a quiet approach to medieval St Helen’s beneath modern towers.', editorial_hook_it='Un’enclave chiusa della City conserva un tranquillo accesso alla medievale St Helen’s sotto le torri moderne.',
  official_url='', access_notes_en='This is best appreciated from the public realm. Some adjoining land or interiors are private, restricted or available only during occasional open days.', access_notes_it='Il luogo si apprezza soprattutto dallo spazio pubblico. Alcune aree o interni adiacenti sono privati, riservati o accessibili soltanto durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-508BC3BE' AND category='AREA';

UPDATE places SET description_en='Seven Dials was laid out in the 1690s by Thomas Neale, with seven streets radiating from a central column. Restored late-seventeenth- and eighteenth-century buildings, small shops and theatres make the star-shaped plan easy to read at pedestrian scale.', description_it='Seven Dials fu progettata negli anni 1690 da Thomas Neale, con sette strade a raggiera da una colonna centrale. Edifici restaurati del Sei e Settecento, piccoli negozi e teatri rendono leggibile a piedi la pianta a stella.',
  editorial_hook_en='Seven streets radiate from a restored sundial column in one of London’s clearest Baroque street plans.', editorial_hook_it='Sette strade si irradiano da una colonna-meridiana restaurata in una delle piante barocche più leggibili di Londra.',
  official_url='https://www.sevendials.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4C61F0DC' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sevendials.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-4C61F0DC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The mature ginkgo on Seymour Place brings striking fan-shaped leaves and intense autumn colour to a dense Marylebone street. Its survival among nineteenth-century terraces and modern traffic offers a useful reminder that individual trees can become local landmarks in their own right.', description_it='Il ginkgo maturo di Seymour Place porta foglie a ventaglio e un intenso colore autunnale in una densa strada di Marylebone. La sua presenza tra terrazze ottocentesche e traffico moderno ricorda che anche un singolo albero può diventare un riferimento locale.',
  editorial_hook_en='A mature ginkgo turns brilliant yellow each autumn against Marylebone’s brick and stucco terraces.', editorial_hook_it='Un ginkgo maturo diventa giallo brillante ogni autunno contro le terrazze in mattoni e stucco di Marylebone.',
  official_url='https://www.treesforstreets.org/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C82CB798' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.treesforstreets.org/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C82CB798'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Shepherd Market was laid out in the 1730s by Edward Shepherd on the site of the annual May Fair that gave Mayfair its name. Narrow lanes, small eighteenth-century houses, pubs and independent shops preserve a village-like pocket behind Piccadilly.', description_it='Shepherd Market fu progettato negli anni 1730 da Edward Shepherd sul sito della fiera di maggio che diede nome a Mayfair. Vicoli, piccole case settecentesche, pub e negozi indipendenti conservano un angolo dall’atmosfera di villaggio dietro Piccadilly.',
  editorial_hook_en='The old May Fair survives in name and street pattern within this intimate eighteenth-century market enclave.', editorial_hook_it='L’antica May Fair sopravvive nel nome e nella trama urbana di questa intima enclave settecentesca.',
  official_url='https://www.shepherdmarket.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A14' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.shepherdmarket.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='A14'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Shepherdess Walk mosaics were created with local residents to tell the history of Hoxton and Shoreditch. Colourful panels embedded along the route depict trades, housing, wartime experience and community life, turning an ordinary pavement into a distributed neighbourhood archive.', description_it='I mosaici di Shepherdess Walk furono creati con i residenti per raccontare Hoxton e Shoreditch. Pannelli colorati lungo il percorso raffigurano mestieri, case, guerra e vita comunitaria, trasformando un normale marciapiede in un archivio diffuso del quartiere.',
  editorial_hook_en='Community-made mosaics turn a Hoxton pavement into a colourful archive of local work and daily life.', editorial_hook_it='Mosaici realizzati dalla comunità trasformano un marciapiede di Hoxton in un archivio colorato di lavoro e vita quotidiana.',
  official_url='https://hackney.gov.uk/arts-and-culture', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C50CB96A' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://hackney.gov.uk/arts-and-culture','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C50CB96A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Sicilian Avenue was completed in 1910 as an ornate pedestrian approach to Southampton Row. Marble columns, urns, gilded lettering and theatrical arches turn a short shopping arcade into an exuberant piece of Edwardian commercial design.', description_it='Sicilian Avenue fu completata nel 1910 come elegante accesso pedonale a Southampton Row. Colonne di marmo, urne, scritte dorate e archi teatrali trasformano una breve galleria commerciale in un’esuberante opera edoardiana.',
  editorial_hook_en='Marble columns and gilded arches make this tiny Edwardian arcade unexpectedly theatrical.', editorial_hook_it='Colonne di marmo e archi dorati rendono questa piccola galleria edoardiana sorprendentemente teatrale.',
  official_url='https://www.sicilianavenue.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2A59FAC9' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sicilianavenue.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-2A59FAC9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Smith’s Court is one of Soho’s narrow passages between Brewer Street and the surrounding entertainment district. Its small shop units and service entrances preserve the compressed grain of workshops and trades that developed behind the neighbourhood’s main commercial streets.', description_it='Smith’s Court è uno degli stretti passaggi di Soho tra Brewer Street e il quartiere dei locali. Piccole unità commerciali e ingressi di servizio conservano la trama compressa di laboratori e mestieri sviluppati dietro le principali strade commerciali.',
  editorial_hook_en='A cramped court preserves the workshop scale behind Soho’s brighter commercial streets.', editorial_hook_it='Una corte stretta conserva la scala dei laboratori dietro le più luminose strade commerciali di Soho.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8F516FD6' AND category='AREA';

UPDATE places SET description_en='Southall is a major centre of British Punjabi and Sikh life, shaped by post-war migration and the industries around Heathrow and west London. South Road and The Broadway concentrate gurdwaras, sari shops, sweet makers, spice merchants and restaurants in one of London’s strongest South Asian high streets.', description_it='Southall è un grande centro della vita punjabi e sikh britannica, formato dalla migrazione del dopoguerra e dalle industrie dell’ovest londinese. South Road e The Broadway concentrano gurdwara, sari, dolci, spezie e ristoranti in una delle più forti high street sud-asiatiche.',
  editorial_hook_en='Gurdwaras, sari shops and Punjabi food make Southall one of London’s most distinctive South Asian town centres.', editorial_hook_it='Gurdwara, negozi di sari e cucina punjabi fanno di Southall uno dei centri sud-asiatici più caratteristici di Londra.',
  official_url='https://www.visitealing.com/explore/southall', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3E4981B2' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.visitealing.com/explore/southall','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-3E4981B2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Smith Square is organised around the former church of St John’s, Nicholas Hawksmoor’s 1720s Baroque masterpiece now used as a concert venue. Georgian houses and quiet approaches create an unexpectedly formal enclave between Westminster’s political institutions and the Thames.', description_it='Smith Square è organizzata attorno all’ex chiesa di St John’s, capolavoro barocco di Nicholas Hawksmoor degli anni 1720, oggi sala da concerto. Case georgiane e accessi tranquilli creano un’enclave formale tra le istituzioni di Westminster e il Tamigi.',
  editorial_hook_en='Hawksmoor’s four-towered Baroque church dominates a quiet Georgian square near Parliament.', editorial_hook_it='La chiesa barocca a quattro torri di Hawksmoor domina una tranquilla piazza georgiana vicino al Parlamento.',
  official_url='https://www.sinfoniasmithsq.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FBFEB63C' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sinfoniasmithsq.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-FBFEB63C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Katharine Docks opened in 1828 to designs by Thomas Telford, replacing a dense medieval neighbourhood beside the Tower. Restored warehouses, narrow quays, boats and the central basin preserve the scale of a working enclosed dock within a modern marina.', description_it='St Katharine Docks aprì nel 1828 su progetto di Thomas Telford, sostituendo un denso quartiere medievale accanto alla Torre. Magazzini restaurati, banchine strette, barche e bacino centrale conservano la scala di un porto chiuso trasformato in marina.',
  editorial_hook_en='Telford’s enclosed dock survives as a marina of boats and restored warehouses beside the Tower of London.', editorial_hook_it='Il bacino chiuso di Telford sopravvive come marina di barche e magazzini restaurati accanto alla Torre di Londra.',
  official_url='https://www.skdocks.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CD14E834' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.skdocks.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-CD14E834'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Stamford Hill is home to Europe’s largest concentration of Haredi Jewish communities, established through successive migrations during the twentieth century. Synagogues, schools, kosher shops and family life shape the streets, where visitors should remember they are entering a living religious neighbourhood rather than an attraction.', description_it='Stamford Hill ospita la maggiore concentrazione europea di comunità ebraiche haredi, formata da successive migrazioni nel Novecento. Sinagoghe, scuole, negozi kosher e vita familiare definiscono le strade, da visitare ricordando che è un quartiere religioso vivo, non un’attrazione.',
  editorial_hook_en='Synagogues, schools and kosher shops make Stamford Hill a living centre of Haredi Jewish London.', editorial_hook_it='Sinagoghe, scuole e negozi kosher fanno di Stamford Hill un centro vivo della Londra ebraica haredi.',
  official_url='https://hackney.gov.uk/stamford-hill', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F4B7AD9A' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://hackney.gov.uk/stamford-hill','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-F4B7AD9A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Stanley Crescent curves around one of the private communal gardens planned across the Ladbroke Estate. White stucco terraces, classical details and mature planting create a particularly coherent Notting Hill composition, linked visually and historically to nearby Kensington Park Gardens.', description_it='Stanley Crescent curva attorno a uno dei giardini condominiali privati progettati nel Ladbroke Estate. Terrazze bianche in stucco, dettagli classici e alberi maturi formano una composizione molto coerente di Notting Hill, legata a Kensington Park Gardens.',
  editorial_hook_en='White stucco terraces sweep around a private garden in one of Notting Hill’s most coherent estate compositions.', editorial_hook_it='Terrazze bianche in stucco curvano attorno a un giardino privato in una delle composizioni più coerenti di Notting Hill.',
  official_url='https://www.rbkc.gov.uk/planning-and-building-control/conservation-and-listed-buildings', access_notes_en='This is best appreciated from the public realm. Some adjoining land or interiors are private, restricted or available only during occasional open days.', access_notes_it='Il luogo si apprezza soprattutto dallo spazio pubblico. Alcune aree o interni adiacenti sono privati, riservati o accessibili soltanto durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C04A7091' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.rbkc.gov.uk/planning-and-building-control/conservation-and-listed-buildings','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C04A7091'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Stepping Stones cross the River Mole below Box Hill, forming a playful link on walking routes through the Surrey Hills. Their modern concrete blocks follow a long-established crossing beneath wooded slopes and chalk downland, but water levels and flooding can make them impassable.', description_it='Le Stepping Stones attraversano il River Mole sotto Box Hill e formano un collegamento suggestivo nei percorsi delle Surrey Hills. I moderni blocchi di cemento seguono un antico guado ai piedi di boschi e colline di gesso, ma piene e livelli alti possono renderli impraticabili.',
  editorial_hook_en='Concrete stepping stones carry walkers across the River Mole beneath the wooded slopes of Box Hill.', editorial_hook_it='Pietre in cemento portano i camminatori attraverso il River Mole sotto i pendii boscosi di Box Hill.',
  official_url='https://www.nationaltrust.org.uk/visit/surrey/box-hill', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-50170E47' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nationaltrust.org.uk/visit/surrey/box-hill','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-50170E47'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Stewart’s Grove is a quiet Chelsea street of nineteenth-century cottages and former service buildings between Fulham Road and Old Brompton Road. Its modest brick and stucco façades preserve a domestic scale distinct from the larger terraces and mansion blocks nearby.', description_it='Stewart’s Grove è una tranquilla strada di Chelsea con cottage ottocenteschi ed ex edifici di servizio tra Fulham Road e Old Brompton Road. Le modeste facciate in mattoni e stucco conservano una scala domestica diversa dalle grandi terrazze e palazzi vicini.',
  editorial_hook_en='Modest cottages preserve a small domestic scale between Chelsea’s larger terraces and mansion blocks.', editorial_hook_it='Modesti cottage conservano una piccola scala domestica tra le grandi terrazze e i palazzi di Chelsea.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9293B698' AND category='AREA';

UPDATE places SET description_en='Tea Trade Wharf forms part of the Shad Thames warehouse complex where imported tea and spices were once stored beside Butler’s Wharf. Heavy brick walls, iron bridges and narrow canyon-like streets preserve the physical infrastructure of London’s former river trade.', description_it='Tea Trade Wharf appartiene al complesso di magazzini di Shad Thames, dove tè e spezie importati venivano conservati vicino Butler’s Wharf. Pesanti muri in mattoni, ponti in ferro e strade strette conservano l’infrastruttura del commercio fluviale londinese.',
  editorial_hook_en='Iron bridges and massive warehouses preserve the architecture of London’s tea trade beside the Thames.', editorial_hook_it='Ponti in ferro e grandi magazzini conservano l’architettura del commercio londinese del tè sul Tamigi.',
  official_url='https://butlerswharf.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-1EA9255D' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://butlerswharf.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-1EA9255D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='At low tide, a strip of foreshore appears on the South Bank below the river wall. Shingle, worn pottery and river-smoothed fragments reveal the Thames as a tidal working landscape, but access can be slippery and mudlarking or removing objects requires the appropriate permit.', description_it='Con la bassa marea emerge una striscia di riva sotto il muro della South Bank. Ghiaia, ceramiche consumate e frammenti levigati mostrano il Tamigi come paesaggio di lavoro soggetto alle maree; l’accesso è scivoloso e cercare o rimuovere oggetti richiede permesso.',
  editorial_hook_en='Low tide exposes a temporary beach of shingle and river-worn traces beneath the South Bank.', editorial_hook_it='La bassa marea espone una spiaggia temporanea di ghiaia e tracce levigate dal fiume sotto la South Bank.',
  official_url='https://www.pla.co.uk/thames-foreshore-permits', access_notes_en='This is best appreciated from the public realm. Some adjoining land or interiors are private, restricted or available only during occasional open days.', access_notes_it='Il luogo si apprezza soprattutto dallo spazio pubblico. Alcune aree o interni adiacenti sono privati, riservati o accessibili soltanto durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C7EC96B7' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.pla.co.uk/thames-foreshore-permits','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C7EC96B7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The London Peace Pagoda was completed in Battersea Park in 1985 by monks and supporters of the Nipponzan-Myōhōji Buddhist order. Four gilded Buddha figures face the cardinal directions from the white riverside structure, which remains a focus for peace ceremonies and quiet reflection.', description_it='La London Peace Pagoda fu completata a Battersea Park nel 1985 da monaci e sostenitori dell’ordine buddhista Nipponzan-Myōhōji. Quattro Buddha dorati guardano i punti cardinali dalla struttura bianca sul fiume, centro di cerimonie per la pace e raccoglimento.',
  editorial_hook_en='Four gilded Buddhas face across the Thames from a white peace pagoda in Battersea Park.', editorial_hook_it='Quattro Buddha dorati guardano verso il Tamigi da una pagoda bianca della pace a Battersea Park.',
  official_url='https://www.wandsworth.gov.uk/leisure-and-culture/parks-and-open-spaces/battersea-park/', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-74187E6F' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wandsworth.gov.uk/leisure-and-culture/parks-and-open-spaces/battersea-park/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-74187E6F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Maze at Crystal Palace Park is one of Britain’s largest surviving hedge mazes, first planted in the 1870s. Its circular hornbeam paths were restored with community involvement and include a central feature celebrating the Girl Guides, who trace an early rally to the park.', description_it='Il Maze di Crystal Palace Park è uno dei più grandi labirinti di siepi superstiti in Gran Bretagna, piantato negli anni 1870. I percorsi circolari di carpino sono stati restaurati con la comunità e includono un elemento centrale dedicato alle Girl Guides.',
  editorial_hook_en='A restored Victorian hornbeam maze hides a Girl Guides memorial at its centre in Crystal Palace Park.', editorial_hook_it='Un labirinto vittoriano restaurato di carpino nasconde al centro un memoriale alle Girl Guides nel Crystal Palace Park.',
  official_url='https://www.bromley.gov.uk/parks-open-spaces/crystal-palace-park', access_notes_en='Outdoor site with opening times that can vary seasonally. Check the official source for current hours, closures and any restrictions before travelling.', access_notes_it='Sito all’aperto con orari che possono variare secondo la stagione. Controlla la fonte ufficiale per orari, chiusure e possibili limitazioni prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-EC43B547' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bromley.gov.uk/parks-open-spaces/crystal-palace-park','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-EC43B547'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Sherriff Centre occupies the Grade II-listed St James Church in West Hampstead. A post office, café, soft-play area and community services operate beneath the church’s Victorian arches, creating an unusual shared space that keeps both worship and everyday local facilities under one roof.', description_it='The Sherriff Centre occupa la chiesa di St James, tutelata di grado II, a West Hampstead. Ufficio postale, caffè, area giochi e servizi comunitari funzionano sotto gli archi vittoriani, mantenendo culto e strutture quotidiane sotto lo stesso tetto.',
  editorial_hook_en='A post office, café and children’s play space operate inside a working Victorian church in West Hampstead.', editorial_hook_it='Ufficio postale, caffè e area giochi funzionano dentro una chiesa vittoriana attiva a West Hampstead.',
  official_url='https://thesherriffcentre.co.uk/', access_notes_en='Access depends on the venue’s opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors, events or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni, eventi o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0DBD6415' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://thesherriffcentre.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-0DBD6415'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Stafford London is arranged around Blue Ball Yard, a cobbled courtyard entered discreetly from St James’s Place. Former stables, wine cellars used as wartime shelters and a collection of historical artefacts give the hotel an unusually layered connection to old St James’s.', description_it='The Stafford London è organizzato attorno a Blue Ball Yard, cortile acciottolato con ingresso discreto da St James’s Place. Antiche scuderie, cantine usate come rifugi in guerra e oggetti storici danno all’hotel un legame stratificato con la vecchia St James’s.',
  editorial_hook_en='A hidden cobbled yard links former stables and wartime wine cellars behind St James’s Palace.', editorial_hook_it='Un cortile acciottolato nascosto collega antiche scuderie e cantine-rifugio dietro St James’s Palace.',
  official_url='https://thestaffordlondon.com/our-history/', access_notes_en='Access depends on the venue’s opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors, events or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni, eventi o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9D806E19' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://thestaffordlondon.com/our-history/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-9D806E19'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The riverside west of Tower Bridge gives a close oblique view of the bridge’s twin Gothic Revival towers, bascules and suspended walkways. River traffic and the contrasting City skyline make this one of the clearest places to understand the bridge as both working infrastructure and theatrical architecture.', description_it='La riva a ovest di Tower Bridge offre una vista ravvicinata e obliqua sulle torri neogotiche, le bascule e le passerelle sospese. Traffico fluviale e skyline della City aiutano a leggere il ponte come infrastruttura funzionante e architettura teatrale.',
  editorial_hook_en='A close riverside angle reveals Tower Bridge’s bascules, suspended walkways and working relationship with the Thames.', editorial_hook_it='Un’angolazione ravvicinata dal fiume rivela bascule, passerelle sospese e rapporto operativo di Tower Bridge con il Tamigi.',
  official_url='https://www.towerbridge.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BBBAD130' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.towerbridge.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-BBBAD130'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The plaque at 17 St Anne’s Court marks Trident Studios, where a converted eighteenth-century building became one of Soho’s most important recording spaces. David Bowie recorded ‘Space Oddity’ and much of ‘Hunky Dory’ here, alongside sessions by the Beatles, Queen and Elton John.', description_it='La targa al 17 St Anne’s Court indica i Trident Studios, dove un edificio settecentesco convertito divenne uno dei più importanti studi di Soho. David Bowie registrò qui “Space Oddity” e gran parte di “Hunky Dory”, insieme a Beatles, Queen ed Elton John.',
  editorial_hook_en='A modest Soho doorway marks the studio where Bowie recorded ‘Space Oddity’ and Queen made early albums.', editorial_hook_it='Una modesta porta di Soho indica lo studio dove Bowie registrò “Space Oddity” e i Queen realizzarono i primi album.',
  official_url='https://tridentstudios.co.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-663FF73E' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://tridentstudios.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-663FF73E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Wallgrave Road is a short Kensington residential street of compact nineteenth-century houses near Earl’s Court Road. Brick and stucco façades, shallow front gardens and the intimate width preserve a quieter domestic layer behind the area’s larger squares and mansion blocks.', description_it='Wallgrave Road è una breve strada residenziale di Kensington con case ottocentesche compatte vicino Earl’s Court Road. Facciate in mattoni e stucco, piccoli giardini e larghezza intima conservano uno strato domestico più tranquillo dietro grandi piazze e palazzi.',
  editorial_hook_en='Compact nineteenth-century houses preserve a quiet domestic street behind Earl’s Court’s larger developments.', editorial_hook_it='Compatte case ottocentesche conservano una tranquilla strada domestica dietro i maggiori sviluppi di Earl’s Court.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D804AA0D' AND category='AREA';

UPDATE places SET description_en='Walthamstow Village centres on St Mary’s Church, Vestry House Museum and the timber-framed Ancient House. Georgian and Victorian streets, almshouses and independent businesses preserve the core of an old Essex settlement now surrounded by northeast London.', description_it='Walthamstow Village ruota attorno a St Mary’s Church, Vestry House Museum e alla Ancient House a graticcio. Strade georgiane e vittoriane, almshouse e attività indipendenti conservano il nucleo di un antico insediamento dell’Essex oggi dentro Londra.',
  editorial_hook_en='A timber-framed house, medieval church and old workhouse preserve Walthamstow’s Essex village core.', editorial_hook_it='Una casa a graticcio, una chiesa medievale e l’antica workhouse conservano il nucleo di villaggio dell’Essex a Walthamstow.',
  official_url='https://www.walthamforest.gov.uk/libraries-arts-parks-and-leisure/local-history-and-heritage/vestry-house-museum', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='A16' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.walthamforest.gov.uk/libraries-arts-parks-and-leisure/local-history-and-heritage/vestry-house-museum','official-or-authoritative','2026-10-14' FROM places WHERE id='A16'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Warren Mews is a compact Fitzrovia service lane behind the medical and residential terraces of Warren Street. Converted workshops and coach houses retain broad ground-floor openings and mixed brickwork, reflecting the district’s long combination of small industry and housing.', description_it='Warren Mews è un compatto vicolo di servizio di Fitzrovia dietro le terrazze mediche e residenziali di Warren Street. Laboratori e rimesse convertiti conservano ampie aperture e mattoni diversi, riflettendo la storica mescolanza di piccola industria e abitazioni.',
  editorial_hook_en='Converted workshops preserve Fitzrovia’s mixture of small industry and housing behind Warren Street.', editorial_hook_it='Laboratori convertiti conservano la mescolanza di piccola industria e abitazioni di Fitzrovia dietro Warren Street.',
  official_url='', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6694182D' AND category='AREA';

UPDATE places SET description_en='Whittlesey Street preserves a row of early-nineteenth-century houses in Waterloo’s Roupell Street conservation area. Yellow stock brick, fanlights and simple proportions continue the remarkably intact workers’ neighbourhood built by the Roupell family on former marshland.', description_it='Whittlesey Street conserva una fila di case del primo Ottocento nell’area protetta di Roupell Street a Waterloo. Mattoni gialli, sopraluci e proporzioni semplici continuano il quartiere operaio eccezionalmente integro costruito dai Roupell su antiche paludi.',
  editorial_hook_en='Yellow-brick workers’ houses extend Waterloo’s remarkably intact Roupell Street time capsule.', editorial_hook_it='Case operaie in mattoni gialli prolungano la straordinaria capsula ottocentesca di Roupell Street a Waterloo.',
  official_url='https://www.lera.org.uk/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E06873B4' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lera.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-E06873B4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Wimbledon Village grew around the medieval parish on the hill above the railway town. Georgian houses, independent shops, pubs and the edge of Wimbledon Common create a distinct centre, with horse riders still passing through on routes between local stables and the open land.', description_it='Wimbledon Village si sviluppò attorno alla parrocchia medievale sulla collina sopra la città ferroviaria. Case georgiane, negozi indipendenti, pub e il margine del Common formano un centro distinto, ancora attraversato da cavalieri provenienti dalle scuderie locali.',
  editorial_hook_en='Georgian streets, independent shops and passing horses mark the hilltop threshold of Wimbledon Common.', editorial_hook_it='Strade georgiane, negozi indipendenti e cavalli di passaggio segnano la soglia collinare di Wimbledon Common.',
  official_url='https://www.wimbledon-village.com/', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-EF9044C2' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wimbledon-village.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-EF9044C2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Woburn Walk was designed by Thomas Cubitt in 1822 as one of London’s earliest purpose-built pedestrian shopping streets. Its bowed shop windows, stucco façades and sheltered scale survive near Euston, with literary associations including W. B. Yeats and Dorothy L. Sayers.', description_it='Woburn Walk fu progettata da Thomas Cubitt nel 1822 come una delle prime strade commerciali pedonali costruite appositamente a Londra. Vetrine curve, facciate in stucco e scala raccolta sopravvivono vicino Euston, con legami con W. B. Yeats e Dorothy L. Sayers.',
  editorial_hook_en='Bowed shop windows preserve Thomas Cubitt’s pioneering 1822 pedestrian shopping street near Euston.', editorial_hook_it='Vetrine curve conservano la pionieristica strada commerciale pedonale progettata da Thomas Cubitt nel 1822 vicino Euston.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1113115', access_notes_en='Public street or outdoor public realm. Access is generally unrestricted, but individual shops, courtyards and buildings keep their own hours and may be private.', access_notes_it='Strada o spazio pubblico all’aperto. L’accesso è generalmente libero, ma negozi, cortili ed edifici hanno orari propri e possono essere privati.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-01838FC6' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1113115','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-01838FC6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

INSERT INTO app_meta(key,value,updated_at) VALUES ('area_editorial_version','2026-10-14',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;
