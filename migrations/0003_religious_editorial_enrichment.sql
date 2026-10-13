-- Editorial enrichment for every published religious place.
-- Research verified against the recorded sources on 2026-10-13.
CREATE TABLE IF NOT EXISTS place_editorial_sources (
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  source_url TEXT NOT NULL,
  source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative',
  verified_at TEXT NOT NULL,
  PRIMARY KEY(place_id, source_url)
);
CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);

UPDATE places SET description_en='Barking Abbey was founded in AD 666 and became one of medieval England’s most important nunneries. The surviving stone foundations, Curfew Tower and adjoining St Margaret’s churchyard turn the former precinct into a readable open-air plan of monastic life.', description_it='L’abbazia di Barking fu fondata nel 666 e divenne uno dei monasteri femminili più importanti dell’Inghilterra medievale. Le fondazioni in pietra, la Curfew Tower e il sagrato di St Margaret rendono ancora leggibile all’aperto l’antico complesso monastico.',
  editorial_hook_en='Walk the foundations of a royal Saxon abbey beside Barking’s surviving medieval gateway.', editorial_hook_it='Percorri le fondazioni di un’abbazia reale sassone accanto alla porta medievale superstite di Barking.',
  official_url='https://www.lbbd.gov.uk/find-your-nearest/barking-abbey-ruins', access_notes_en='Outdoor heritage site with posted opening times that can vary seasonally. Check the official site before travelling; some structures may only be viewed from the grounds.', access_notes_it='Sito storico all’aperto con orari esposti che possono variare secondo la stagione. Controlla il sito ufficiale prima di partire; alcune strutture possono essere osservate soltanto dall’esterno.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E751C213' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lbbd.gov.uk/find-your-nearest/barking-abbey-ruins','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-E751C213'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Opened in 1840 as a non-denominational cemetery, Abney Park is one of London’s Magnificent Seven and an early arboretum. Its Egyptian Revival entrance, roofless Gothic chapel, woodland paths and dissenters’ memorials combine social history with an unusually wild nature reserve.', description_it='Aperto nel 1840 come cimitero non confessionale, Abney Park appartiene ai Magnificent Seven di Londra e nacque anche come arboreto. L’ingresso neoegizio, la cappella gotica senza tetto, i sentieri boscosi e i monumenti ai dissidenti uniscono storia sociale e riserva naturale.',
  editorial_hook_en='An overgrown Victorian cemetery where an Egyptian gate leads to a roofless chapel and urban woodland.', editorial_hook_it='Un cimitero vittoriano inselvatichito, dove un portale egizio conduce a una cappella senza tetto e a un bosco urbano.',
  official_url='https://abneypark.org/', access_notes_en='Cemetery grounds have daily gate times that can vary seasonally. Check the official site for current hours, tours and any restrictions on photography or access to chapels and catacombs.', access_notes_it='Il cimitero ha orari di apertura dei cancelli che possono variare secondo la stagione. Controlla il sito ufficiale per orari aggiornati, visite guidate e limitazioni a fotografie, cappelle o catacombe.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-43265391' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://abneypark.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-43265391'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='All Hallows’ Church Garden occupies the footprint of George Gilbert Scott Junior’s 1879–80 Gothic church, largely destroyed in the Blitz. Surviving arches, a chapel fragment and a cross marking the former altar make this pocket garden a compact memorial to wartime Southwark.', description_it='Il giardino di All Hallows occupa la pianta della chiesa gotica costruita nel 1879–80 da George Gilbert Scott Junior e quasi distrutta nel Blitz. Archi superstiti, un frammento di cappella e la croce sull’antico altare raccontano la Southwark del tempo di guerra.',
  editorial_hook_en='A Southwark pocket garden traces a Blitz-lost Gothic church through surviving arches and its former altar.', editorial_hook_it='Un piccolo giardino di Southwark ricorda una chiesa gotica perduta nel Blitz attraverso archi superstiti e l’antico altare.',
  official_url='https://cathedral.southwark.anglican.org/about-us/cathedral-community/all-hallows-church-community-garden/', access_notes_en='Outdoor heritage site with posted opening times that can vary seasonally. Check the official site before travelling; some structures may only be viewed from the grounds.', access_notes_it='Sito storico all’aperto con orari esposti che possono variare secondo la stagione. Controlla il sito ufficiale prima di partire; alcune strutture possono essere osservate soltanto dall’esterno.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CC343EAD' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://cathedral.southwark.anglican.org/about-us/cathedral-community/all-hallows-church-community-garden/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-CC343EAD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Founded in AD 675, All Hallows by the Tower is the oldest church in the City of London. Roman pavement, a Saxon arch, medieval brasses, the crypt museum and a model of Roman London reveal nearly two millennia beside the Tower.', description_it='Fondata nel 675, All Hallows by the Tower è la chiesa più antica della City. Pavimento romano, arco sassone, ottoni medievali, museo nella cripta e plastico della Londra romana raccontano quasi due millenni accanto alla Torre.',
  editorial_hook_en='Descend from London’s oldest City church to Roman pavement and a history-filled crypt beside the Tower.', editorial_hook_it='Scendi dalla più antica chiesa della City fino al pavimento romano e alla cripta ricca di storia accanto alla Torre.',
  official_url='https://www.ahbtt.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R7' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.ahbtt.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='R7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='All Saints Margaret Street is William Butterfield’s 1850s masterpiece of Victorian High Gothic and polychromatic design. Its compact interior is saturated with patterned brick, tile, marble, painted ceilings and later murals, creating one of central London’s most complete Anglo-Catholic ensembles.', description_it='All Saints Margaret Street è il capolavoro neogotico policromo progettato da William Butterfield negli anni 1850. L’interno raccolto, fitto di mattoni decorati, piastrelle, marmi, soffitti dipinti e murali, forma uno dei complessi anglo-cattolici più integri del centro.',
  editorial_hook_en='Butterfield’s jewel-box church wraps worshippers in Victorian colour, pattern, marble and painted vaults.', editorial_hook_it='La chiesa-scrigno di Butterfield avvolge i visitatori in colori vittoriani, motivi, marmi e volte dipinte.',
  official_url='https://asms.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C6EF7487' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://asms.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-C6EF7487'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Completed in 1995, BAPS Shri Swaminarayan Mandir was assembled from thousands of pieces of hand-carved Italian marble and Bulgarian limestone without structural steel. The adjoining haveli adds intricately carved timberwork, while exhibitions explain Hindu belief, craft and community life.', description_it='Completato nel 1995, il BAPS Shri Swaminarayan Mandir fu assemblato senza acciaio strutturale con migliaia di blocchi di marmo italiano e calcare bulgaro scolpiti a mano. L’haveli affianca intagli lignei e mostre sulla fede, l’artigianato e la comunità hindu.',
  editorial_hook_en='Neasden’s marble mandir turns hand-carved stone and timber into one of London’s great modern sacred interiors.', editorial_hook_it='Il mandir di Neasden trasforma pietra e legno intagliati a mano in uno dei grandi interni sacri moderni di Londra.',
  official_url='https://londonmandir.baps.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E3B7C329' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://londonmandir.baps.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-E3B7C329'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Bloomsbury Central Baptist Church opened in 1848, financed and built by the Baptist contractor and railway entrepreneur Samuel Morton Peto. Its imposing twin-towered façade shelters a broad preaching interior, long associated with progressive ministry, social action and public debate in the West End.', description_it='La Bloomsbury Central Baptist Church aprì nel 1848, finanziata e costruita dall’imprenditore battista Samuel Morton Peto. La monumentale facciata a due torri introduce a un’ampia sala di predicazione, legata da tempo a ministero progressista, impegno sociale e dibattito pubblico.',
  editorial_hook_en='A pioneering 1848 Baptist landmark pairs a theatrical twin-towered façade with a tradition of social action.', editorial_hook_it='Un pionieristico edificio battista del 1848 unisce una scenografica facciata a due torri a una tradizione di impegno sociale.',
  official_url='https://www.bloomsbury.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4B260399' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bloomsbury.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-4B260399'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Opened in 1840 and now managed by The Royal Parks, Brompton Cemetery is a Grade I-listed Victorian landscape laid out around a ceremonial central avenue. Domed chapels, colonnades, catacombs, monuments and wildlife fill the resting place of more than 200,000 people.', description_it='Aperto nel 1840 e oggi gestito da The Royal Parks, Brompton Cemetery è un paesaggio vittoriano di grado I organizzato attorno a un viale cerimoniale. Cappelle a cupola, colonnati, catacombe, monumenti e fauna accompagnano oltre 200.000 sepolture.',
  editorial_hook_en='A grand axial avenue leads through colonnades, domed chapels and 180 years of London lives.', editorial_hook_it='Un grande viale prospettico attraversa colonnati, cappelle a cupola e 180 anni di vite londinesi.',
  official_url='https://www.royalparks.org.uk/visit/parks/brompton-cemetery', access_notes_en='Cemetery grounds have daily gate times that can vary seasonally. Check the official site for current hours, tours and any restrictions on photography or access to chapels and catacombs.', access_notes_it='Il cimitero ha orari di apertura dei cancelli che possono variare secondo la stagione. Controlla il sito ufficiale per orari aggiornati, visite guidate e limitazioni a fotografie, cappelle o catacombe.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R1' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/brompton-cemetery','official-or-authoritative','2026-10-13' FROM places WHERE id='R1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Opened in 1982, Buddhapadipa was Britain’s first purpose-built Thai Buddhist temple. A white ubosot with red-and-gold roof detailing stands in landscaped Wimbledon grounds, while vivid interior murals weave the Buddha’s life together with modern and unmistakably London scenes.', description_it='Inaugurato nel 1982, Buddhapadipa fu il primo tempio buddhista thailandese costruito appositamente in Gran Bretagna. L’ubosot bianco con tetto rosso e oro sorge in giardini curati, mentre vivaci murali intrecciano la vita del Buddha con scene moderne e londinesi.',
  editorial_hook_en='A white-and-gold Thai temple in Wimbledon hides exuberant murals that bring Buddhist teaching into modern London.', editorial_hook_it='Un tempio thailandese bianco e oro a Wimbledon custodisce murali esuberanti che portano l’insegnamento buddhista nella Londra moderna.',
  official_url='https://buddhapadipa.com/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R4' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://buddhapadipa.com/','official-or-authoritative','2026-10-13' FROM places WHERE id='R4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Known as Farm Street Church, the Church of the Immaculate Conception has been the Jesuits’ principal London church since 1849. Its Gothic Revival interior combines Pugin-influenced design, richly carved chapels, stained glass and devotional art in an unexpectedly secluded Mayfair setting.', description_it='Nota come Farm Street Church, la chiesa dell’Immacolata Concezione è dal 1849 il principale centro gesuita di Londra. L’interno neogotico unisce influssi di Pugin, cappelle riccamente scolpite, vetrate e arte devozionale in un angolo sorprendentemente appartato di Mayfair.',
  editorial_hook_en='A hidden Mayfair passage opens into the Jesuits’ richly carved Gothic Revival sanctuary.', editorial_hook_it='Un passaggio nascosto di Mayfair si apre sul santuario neogotico riccamente scolpito dei gesuiti.',
  official_url='https://www.farmstreet.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DEE612D7' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.farmstreet.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-DEE612D7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Old Royal Naval College chapel began to Wren’s plan and was rebuilt after a 1779 fire under James ‘Athenian’ Stuart. Its pale blue and cream neoclassical interior, coffered ceiling, naval emblems and Benjamin West altarpiece form an elegant counterpart to the Painted Hall.', description_it='La cappella dell’Old Royal Naval College nacque dal progetto di Wren e fu ricostruita dopo l’incendio del 1779 da James “Athenian” Stuart. L’interno neoclassico azzurro e crema, il soffitto a cassettoni, gli emblemi navali e la pala di Benjamin West dialogano con la Painted Hall.',
  editorial_hook_en='Wren’s Greenwich chapel was reborn as a luminous neoclassical room of naval emblems and perfect symmetry.', editorial_hook_it='La cappella di Wren a Greenwich rinacque come luminoso ambiente neoclassico di emblemi navali e perfetta simmetria.',
  official_url='https://ornc.org/explore-whats-here/chapel/', access_notes_en='Visitor admission, worship access and opening times differ. Check the official site for the day’s schedule, tickets, closures and any areas reserved for services.', access_notes_it='Ingresso turistico, accesso al culto e orari sono distinti. Controlla il sito ufficiale per programma giornaliero, biglietti, chiusure e aree riservate alle funzioni.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-AE7400BB' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://ornc.org/explore-whats-here/chapel/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-AE7400BB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='George Goldie designed this richly detailed Gothic Revival hospital chapel in 1862–63. Originally built in Great Ormond Street, it was dismantled and reconstructed in St John’s Wood in 1898, preserving stained glass, carved fittings and a rare link to Victorian Catholic healthcare.', description_it='George Goldie progettò questa cappella ospedaliera neogotica nel 1862–63. Costruita originariamente a Great Ormond Street, fu smontata e ricostruita a St John’s Wood nel 1898, conservando vetrate, arredi scolpiti e un raro legame con l’assistenza cattolica vittoriana.',
  editorial_hook_en='A Victorian hospital chapel was moved across London piece by piece and rebuilt inside today’s St John’s Wood complex.', editorial_hook_it='Una cappella ospedaliera vittoriana fu trasferita attraverso Londra pezzo per pezzo e ricostruita nell’attuale complesso di St John’s Wood.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1066244', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8C8B86E8' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1066244','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-8C8B86E8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Magnus the Martyr stands at the former head of medieval London Bridge, where its churchyard passage once channelled travellers into the City. Wren’s luminous white-and-gold interior contains a detailed bridge model, historic furnishings and memorials to the Thames and Billingsgate.', description_it='St Magnus the Martyr sorge all’antico imbocco del London Bridge medievale, dove il passaggio del sagrato introduceva i viaggiatori nella City. Il luminoso interno bianco e oro di Wren conserva un plastico del ponte, arredi storici e memorie del Tamigi e di Billingsgate.',
  editorial_hook_en='Stand where medieval London Bridge met the City, then find its lost houses reconstructed in miniature inside Wren’s church.', editorial_hook_it='Fermati dove il ponte medievale incontrava la City e ritrova le sue case perdute ricostruite in miniatura nella chiesa di Wren.',
  official_url='https://www.stmagnusmartyr.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-29D7ED48' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmagnusmartyr.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-29D7ED48'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Better known as the Round Chapel, this Grade II*-listed nonconformist landmark opened in 1871 for Clapton Park Congregational Church. Its horseshoe auditorium, cast-iron columns and surrounding galleries were designed for preaching and communal assembly and now support performances and neighbourhood events.', description_it='Conosciuta come Round Chapel, questa architettura anticonformista di grado II* aprì nel 1871 per la Clapton Park Congregational Church. L’auditorium a ferro di cavallo, le colonne in ghisa e le gallerie furono pensati per predicazione e assemblee e oggi ospitano spettacoli ed eventi.',
  editorial_hook_en='Hackney’s Round Chapel turns a Victorian preaching auditorium into a dramatic community performance space.', editorial_hook_it='La Round Chapel di Hackney trasforma un auditorium vittoriano per la predicazione in un suggestivo spazio comunitario per spettacoli.',
  official_url='https://www.hhbt.org.uk/round-chapel', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-953A2878' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.hhbt.org.uk/round-chapel','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-953A2878'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Opened in 1874, Corpus Christi Maiden Lane was conceived as a shrine to the Blessed Sacrament and is now the diocesan shrine for Westminster. Its restored Early English Gothic interior layers painted decoration, carved altars, stained glass and a sense of ritual seclusion near Covent Garden.', description_it='Aperta nel 1874, Corpus Christi Maiden Lane fu concepita come santuario del Santissimo Sacramento ed è oggi santuario diocesano di Westminster. L’interno neogotico restaurato unisce decorazione dipinta, altari scolpiti, vetrate e raccoglimento rituale vicino a Covent Garden.',
  editorial_hook_en='Behind Covent Garden’s bustle, a restored Victorian shrine glows with colour, carving and Eucharistic symbolism.', editorial_hook_it='Dietro il movimento di Covent Garden, un santuario vittoriano restaurato risplende di colori, sculture e simbolismo eucaristico.',
  official_url='https://corpuschristimaidenlane.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C84EF582' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://corpuschristimaidenlane.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-C84EF582'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The former Middlesex Hospital chapel is a tiny late-Victorian masterpiece by John Loughborough Pearson and his son Frank. Mosaics, coloured marble, gilding and a starry vault create a jewel-box interior, now used for exhibitions, concerts and reflection within modern Fitzrovia.', description_it='L’antica cappella del Middlesex Hospital è un minuscolo capolavoro tardo-vittoriano di John Loughborough Pearson e del figlio Frank. Mosaici, marmi colorati, dorature e una volta stellata formano uno scrigno oggi dedicato a mostre, concerti e raccoglimento.',
  editorial_hook_en='A hospital chapel survives as a mosaic-and-marble jewel box hidden inside a modern Fitzrovia development.', editorial_hook_it='Una cappella ospedaliera sopravvive come scrigno di mosaici e marmi nascosto in un moderno complesso di Fitzrovia.',
  official_url='https://www.fitzroviachapel.org/', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R9' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.fitzroviachapel.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='R9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Built by Aston Webb in 1893, the French Protestant Church is the only active French Huguenot church in Britain. Its Flemish Gothic façade and compact Soho interior carry the story of refugees whose congregations have worshipped in London since the sixteenth century.', description_it='Costruita da Aston Webb nel 1893, la French Protestant Church è l’unica chiesa ugonotta francese ancora attiva in Gran Bretagna. La facciata gotico-fiamminga e l’interno raccolto raccontano i rifugiati le cui comunità pregano a Londra dal Cinquecento.',
  editorial_hook_en='Britain’s last active French Huguenot church keeps four centuries of refugee history alive in Soho Square.', editorial_hook_it='L’ultima chiesa ugonotta francese attiva in Gran Bretagna mantiene viva a Soho Square una storia di rifugiati lunga quattro secoli.',
  official_url='https://www.egliseprotestantelondres.org.uk/en/heritage/history-2/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-153B9809' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.egliseprotestantelondres.org.uk/en/heritage/history-2/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-153B9809'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Established in 1815 by the Western Synagogue, Fulham Road Jewish Cemetery was the first Jewish burial ground west of the City. Its compact walled plot preserves Georgian and Victorian Hebrew memorials, including graves linked to notable Anglo-Jewish families, behind an easily missed entrance.', description_it='Fondato nel 1815 dalla Western Synagogue, il cimitero ebraico di Fulham Road fu il primo luogo di sepoltura ebraico a ovest della City. Il piccolo recinto conserva lapidi georgiane e vittoriane in ebraico e tombe di importanti famiglie anglo-ebraiche.',
  editorial_hook_en='An easily missed Chelsea wall encloses the first Jewish burial ground established west of the City.', editorial_hook_it='Un muro facile da ignorare a Chelsea racchiude il primo cimitero ebraico fondato a ovest della City.',
  official_url='https://lookup.london/jewish-cemetery-fulham-road/', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-048C9EA9' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://lookup.london/jewish-cemetery-fulham-road/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-048C9EA9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Opened in 1902 as London’s first crematorium, Golders Green combines Ernest George’s red-brick and stone buildings with formal Grade I-listed memorial gardens. Colonnades, chapels, ponds and monuments commemorate figures from Sigmund Freud to Marc Bolan across a remarkably serene landscape.', description_it='Aperto nel 1902 come primo crematorio di Londra, Golders Green unisce gli edifici in mattoni e pietra di Ernest George a giardini commemorativi formali di grado I. Colonnati, cappelle, stagni e monumenti ricordano personalità da Sigmund Freud a Marc Bolan.',
  editorial_hook_en='London’s first crematorium unfolds through quiet colonnades and one of the capital’s finest memorial gardens.', editorial_hook_it='Il primo crematorio di Londra si sviluppa tra colonnati silenziosi e uno dei più raffinati giardini commemorativi della capitale.',
  official_url='https://www.thelondoncremation.co.uk/golders-green-crematorium/', access_notes_en='Cemetery grounds have daily gate times that can vary seasonally. Check the official site for current hours, tours and any restrictions on photography or access to chapels and catacombs.', access_notes_it='Il cimitero ha orari di apertura dei cancelli che possono variare secondo la stagione. Controlla il sito ufficiale per orari aggiornati, visite guidate e limitazioni a fotografie, cappelle o catacombe.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F3B9FED4' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.thelondoncremation.co.uk/golders-green-crematorium/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-F3B9FED4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Consecrated in 1882, Saint Sophia is the Greek Orthodox cathedral for the Divine Wisdom and a centre of London’s Greek community. Its restrained exterior gives way to a domed Neo-Byzantine interior enriched with marble, icons and shimmering mosaics.', description_it='Consacrata nel 1882, Saint Sophia è la cattedrale greco-ortodossa della Divina Sapienza e un centro della comunità greca londinese. L’esterno sobrio introduce a un interno neobizantino a cupola, arricchito da marmi, icone e mosaici scintillanti.',
  editorial_hook_en='A quiet Bayswater street conceals a domed Neo-Byzantine world of marble, icons and gold mosaic.', editorial_hook_it='Una tranquilla strada di Bayswater nasconde un mondo neobizantino di cupole, marmi, icone e mosaici dorati.',
  official_url='https://www.stsophia.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R3' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stsophia.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='R3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Built in 1730–31 as a proprietary chapel for the new Grosvenor estate, this elegant Georgian church retains box pews, galleries and a clear classical interior. Its Mayfair history includes American wartime worshippers and a long musical tradition connected with nearby embassies and residents.', description_it='Costruita nel 1730–31 come cappella privata del nuovo Grosvenor Estate, questa elegante chiesa georgiana conserva banchi a palco, gallerie e un nitido interno classico. La sua storia a Mayfair comprende fedeli americani in tempo di guerra e una lunga tradizione musicale.',
  editorial_hook_en='One of Mayfair’s rare surviving proprietary chapels preserves the intimate scale and box pews of Georgian worship.', editorial_hook_it='Una delle rare cappelle private superstiti di Mayfair conserva la scala intima e i banchi a palco del culto georgiano.',
  official_url='https://www.grosvenorchapel.org.uk/about-1/history/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-37072E1C' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.grosvenorchapel.org.uk/about-1/history/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-37072E1C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The purpose-built Sri Guru Singh Sabha complex opened in 2003 and serves one of Europe’s largest Sikh communities. Its vast prayer halls, domes and community facilities embody the gurdwara principles of worship, equality and service, including the free vegetarian langar offered to all.', description_it='Il complesso di Sri Guru Singh Sabha, costruito appositamente e inaugurato nel 2003, serve una delle più grandi comunità sikh d’Europa. Sale di preghiera, cupole e spazi comunitari esprimono culto, uguaglianza e servizio, compreso il langar vegetariano gratuito per tutti.',
  editorial_hook_en='Southall’s monumental gurdwara pairs vast prayer halls with the open hospitality of the communal langar.', editorial_hook_it='Il monumentale gurdwara di Southall unisce grandi sale di preghiera all’ospitalità aperta del langar comunitario.',
  official_url='https://sgsss.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B1759423' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://sgsss.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-B1759423'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Highgate Cemetery East opened in 1860 as the original western ground filled. Its winding paths pass an extraordinary cross-section of London lives, from Karl Marx and George Eliot to Douglas Adams, amid dense trees, wildlife and richly varied Victorian and modern memorials.', description_it='Highgate Cemetery East aprì nel 1860 quando il settore occidentale si riempì. I sentieri attraversano vite londinesi diversissime, da Karl Marx e George Eliot a Douglas Adams, tra alberi fitti, fauna e monumenti vittoriani e contemporanei.',
  editorial_hook_en='Marx, George Eliot and Douglas Adams share a wooded cemetery dense with political, literary and everyday London stories.', editorial_hook_it='Marx, George Eliot e Douglas Adams condividono un cimitero boscoso fitto di storie politiche, letterarie e quotidiane di Londra.',
  official_url='https://www.highgatecemetery.org/', access_notes_en='Visitor admission, worship access and opening times differ. Check the official site for the day’s schedule, tickets, closures and any areas reserved for services.', access_notes_it='Ingresso turistico, accesso al culto e orari sono distinti. Controlla il sito ufficiale per programma giornaliero, biglietti, chiusure e aree riservate alle funzioni.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DB5645D3' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.highgatecemetery.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-DB5645D3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Highgate Cemetery West opened in 1839 as part of London’s Magnificent Seven. The Egyptian Avenue, Circle of Lebanon, Terrace Catacomb and overgrown Gothic monuments create an exceptionally theatrical Victorian landscape, now protected and explored through timed admission and guided tours.', description_it='Highgate Cemetery West aprì nel 1839 come uno dei Magnificent Seven londinesi. Egyptian Avenue, Circle of Lebanon, Terrace Catacomb e monumenti gotici avvolti dalla vegetazione formano un paesaggio vittoriano eccezionalmente teatrale, visitabile con ingressi e tour programmati.',
  editorial_hook_en='Egyptian gates lead into a cedar-ringed city of Gothic tombs, ivy and Victorian spectacle.', editorial_hook_it='Portali egizi conducono a una città di tombe gotiche, edera e spettacolo vittoriano raccolta attorno a un cedro.',
  official_url='https://www.highgatecemetery.org/', access_notes_en='Visitor admission, worship access and opening times differ. Check the official site for the day’s schedule, tickets, closures and any areas reserved for services.', access_notes_it='Ingresso turistico, accesso al culto e orari sono distinti. Controlla il sito ufficiale per programma giornaliero, biglietti, chiusure e aree riservate alle funzioni.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BA6DAA66' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.highgatecemetery.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-BA6DAA66'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Hyde Park’s tiny pet cemetery began in 1881 with the burial of a Maltese terrier named Cherry near Victoria Gate Lodge. Roughly 300 miniature headstones, many carrying affectionate Victorian inscriptions, fill the secluded garden, which is normally visible only on special tours.', description_it='Il minuscolo cimitero per animali di Hyde Park nacque nel 1881 con la sepoltura del maltese Cherry vicino a Victoria Gate Lodge. Circa 300 piccole lapidi con affettuose iscrizioni vittoriane riempiono il giardino appartato, di norma accessibile solo con visite speciali.',
  editorial_hook_en='Hundreds of miniature Victorian headstones hide behind a lodge at the edge of Hyde Park.', editorial_hook_it='Centinaia di minuscole lapidi vittoriane si nascondono dietro un lodge ai margini di Hyde Park.',
  official_url='https://www.royalparks.org.uk/visit/parks/hyde-park', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C72026E2' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalparks.org.uk/visit/parks/hyde-park','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-C72026E2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Mary Woolnoth is Nicholas Hawksmoor’s compact City masterpiece, completed in 1727 with a boldly rusticated façade and paired towers. The powerful square interior, clustered columns and Baroque geometry survive directly above Bank station, now shared by an active congregation.', description_it='St Mary Woolnoth è il compatto capolavoro della City progettato da Nicholas Hawksmoor e completato nel 1727, con facciata bugnata e torri gemelle. Il vigoroso interno quadrato, le colonne raggruppate e la geometria barocca sopravvivono sopra la stazione Bank.',
  editorial_hook_en='Hawksmoor compressed monumental Baroque drama into a small square church perched above Bank station.', editorial_hook_it='Hawksmoor concentrò il dramma barocco monumentale in una piccola chiesa quadrata sospesa sopra la stazione Bank.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1064620', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4F33B327' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1064620','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-4F33B327'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='ISKCON London’s Radha-Krishna Temple has occupied Soho Street since 1979, growing from the Hare Krishna community established in London in 1968. Its intimate shrine room, daily ceremonies, vegetarian food and George Harrison associations make it a living centre of devotional Vaishnava culture.', description_it='Il tempio Radha-Krishna di ISKCON London occupa Soho Street dal 1979 e nasce dalla comunità Hare Krishna fondata a Londra nel 1968. Sala del santuario, cerimonie quotidiane, cucina vegetariana e legami con George Harrison ne fanno un centro vivo della cultura vaishnava.',
  editorial_hook_en='A small Soho temple carries the colour, music and devotion of London’s Hare Krishna story—including its George Harrison chapter.', editorial_hook_it='Un piccolo tempio di Soho custodisce colori, musica e devozione della storia Hare Krishna londinese, compreso il capitolo George Harrison.',
  official_url='https://iskcon.london/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-29FCFB6C' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://iskcon.london/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-29FCFB6C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Founded in 1833, Kensal Green was London’s first great commercial cemetery and the model for the Magnificent Seven. Its axial landscape contains Anglican and Dissenters’ chapels, catacombs, grand mausoleums and the graves of engineers, artists, reformers and members of the royal family.', description_it='Fondato nel 1833, Kensal Green fu il primo grande cimitero commerciale di Londra e il modello dei Magnificent Seven. Il paesaggio assiale comprende cappelle anglicana e anticonformista, catacombe, mausolei e tombe di ingegneri, artisti, riformatori e membri della famiglia reale.',
  editorial_hook_en='London’s first garden cemetery is a monumental avenue of chapels, catacombs and ambitious Victorian lives.', editorial_hook_it='Il primo cimitero-giardino di Londra è un viale monumentale di cappelle, catacombe e ambiziose vite vittoriane.',
  official_url='https://www.kensalgreencemetery.com/', access_notes_en='Cemetery grounds have daily gate times that can vary seasonally. Check the official site for current hours, tours and any restrictions on photography or access to chapels and catacombs.', access_notes_it='Il cimitero ha orari di apertura dei cancelli che possono variare secondo la stagione. Controlla il sito ufficiale per orari aggiornati, visite guidate e limitazioni a fotografie, cappelle o catacombe.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R2' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.kensalgreencemetery.com/','official-or-authoritative','2026-10-13' FROM places WHERE id='R2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Lesnes Abbey was founded in 1178 by Richard de Luci, traditionally as penance for his part in the events leading to Thomas Becket’s murder. The excavated Augustinian ruins sit beside ancient woodland, with interpretation revealing the church, cloister, chapter house and monastic infirmary.', description_it='Lesnes Abbey fu fondata nel 1178 da Richard de Luci, secondo la tradizione come penitenza per il suo ruolo negli eventi che portarono all’uccisione di Thomas Becket. Le rovine agostiniane sorgono accanto a un bosco antico e mostrano chiesa, chiostro e infermeria.',
  editorial_hook_en='Medieval abbey foundations meet ancient woodland at a site tied to the aftermath of Thomas Becket’s murder.', editorial_hook_it='Le fondazioni di un’abbazia medievale incontrano un bosco antico in un luogo legato alle conseguenze dell’uccisione di Thomas Becket.',
  official_url='https://www.lesnesabbeywoods.org/explore/history/', access_notes_en='Outdoor heritage site with posted opening times that can vary seasonally. Check the official site before travelling; some structures may only be viewed from the grounds.', access_notes_it='Sito storico all’aperto con orari esposti che possono variare secondo la stagione. Controlla il sito ufficiale prima di partire; alcune strutture possono essere osservate soltanto dall’esterno.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DA69C08B' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lesnesabbeywoods.org/explore/history/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-DA69C08B'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Lewisham Sivan Temple developed from London’s Tamil Saiva community and was reconstructed according to traditional Agamic principles. Its colourful shrines centre on Shiva while festivals, ritual music and teaching sustain a major South London hub for Tamil Hindu worship and culture.', description_it='Il Lewisham Sivan Temple nasce dalla comunità tamil saiva di Londra ed è stato ricostruito secondo i principi tradizionali degli Agama. I santuari colorati dedicati a Shiva, le feste, la musica rituale e l’insegnamento ne fanno un importante centro hindu tamil.',
  editorial_hook_en='Traditional Saiva architecture and festival ritual make this Lewisham temple a focal point of Tamil London.', editorial_hook_it='Architettura saiva tradizionale e rituali festivi rendono questo tempio di Lewisham un punto di riferimento della Londra tamil.',
  official_url='https://www.londonsivankovil.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B9064113' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.londonsivankovil.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-B9064113'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Consecrated in 1623 and traditionally attributed to Inigo Jones, Lincoln’s Inn Chapel stands on an open undercroft within the historic legal estate. Seventeenth-century stained glass, carved woodwork, memorials and choral music create a rare collegiate atmosphere in central London.', description_it='Consacrata nel 1623 e tradizionalmente attribuita a Inigo Jones, la cappella di Lincoln’s Inn sorge su un portico aperto nel cuore dello storico complesso legale. Vetrate seicentesche, legni scolpiti, monumenti e musica corale creano un’atmosfera collegiale rara.',
  editorial_hook_en='A seventeenth-century chapel raised above an open undercroft brings collegiate calm to London’s legal quarter.', editorial_hook_it='Una cappella seicentesca sollevata sopra un portico aperto porta calma collegiale nel quartiere legale di Londra.',
  official_url='https://www.lincolnsinn.org.uk/about-us/chapel/', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R10' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lincolnsinn.org.uk/about-us/chapel/','official-or-authoritative','2026-10-13' FROM places WHERE id='R10'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The London Oratory was completed in 1884 to Herbert Gribble’s grand Italian Baroque design and remains home to the Oratorian community. Its immense nave, dome, marble chapels, sculpture and renowned choral tradition offer a Roman scale and ceremony opposite the Victoria and Albert Museum.', description_it='Il London Oratory fu completato nel 1884 nel grandioso stile barocco italiano di Herbert Gribble ed è tuttora sede degli oratoriani. Immensa navata, cupola, cappelle marmoree, sculture e celebre musica corale portano scala e solennità romane davanti al Victoria and Albert Museum.',
  editorial_hook_en='A vast Italianate nave, marble chapels and celebrated music bring Roman Baroque grandeur to South Kensington.', editorial_hook_it='Una vasta navata all’italiana, cappelle marmoree e musica celebre portano la grandiosità barocca romana a South Kensington.',
  official_url='https://www.bromptonoratory.co.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-AB2B7401' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bromptonoratory.co.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-AB2B7401'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Founded by the local Hindu community in the 1980s, Sri Mahalakshmi Temple was consecrated at its present East Ham site in 1990. Multiple richly dressed deities, daily puja and major festival processions make it an important centre of South Indian Hindu practice.', description_it='Fondato dalla comunità hindu locale negli anni Ottanta, lo Sri Mahalakshmi Temple fu consacrato nell’attuale sede di East Ham nel 1990. Numerose divinità riccamente vestite, puja quotidiane e grandi processioni festive ne fanno un importante centro hindu sud-indiano.',
  editorial_hook_en='East Ham’s community temple comes alive through South Indian puja, flower-filled shrines and major festival processions.', editorial_hook_it='Il tempio comunitario di East Ham vive di puja sud-indiane, santuari colmi di fiori e grandi processioni festive.',
  official_url='https://www.srimahalakshmitemple.net/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DCFE8EBB' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.srimahalakshmitemple.net/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-DCFE8EBB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='London Sri Murugan Temple traces its community to 1975 and established its East Ham home in 1984. The granite-clad sacred complex, dedicated to Murugan, follows South Indian temple traditions and hosts elaborate daily worship, music and large annual festivals.', description_it='Il London Sri Murugan Temple nasce da una comunità fondata nel 1975 e si stabilì a East Ham nel 1984. Il complesso sacro rivestito in granito, dedicato a Murugan, segue la tradizione templare sud-indiana e ospita culto quotidiano, musica e grandi feste annuali.',
  editorial_hook_en='Granite shrines and vibrant festivals make this one of East London’s defining South Indian sacred spaces.', editorial_hook_it='Santuari in granito e feste vivaci rendono questo uno degli spazi sacri sud-indiani più significativi di East London.',
  official_url='https://www.londonsrimurugan.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7FDA00E9' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.londonsrimurugan.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-7FDA00E9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Hyde Park Chapel of The Church of Jesus Christ of Latter-day Saints opened in 1961 as a modernist landmark by T. P. Bennett and Son. Alongside worship spaces, a visitors’ centre and family-history facilities introduce Latter-day Saint belief and genealogy near Exhibition Road.', description_it='La Hyde Park Chapel della Chiesa di Gesù Cristo dei Santi degli Ultimi Giorni aprì nel 1961 come edificio modernista di T. P. Bennett and Son. Oltre agli spazi di culto, un centro visitatori e servizi genealogici presentano fede e storia familiare.',
  editorial_hook_en='A crisp 1960s chapel beside Exhibition Road combines worship with a public visitors’ and family-history centre.', editorial_hook_it='Una nitida cappella degli anni Sessanta accanto a Exhibition Road unisce culto, centro visitatori e ricerca genealogica.',
  official_url='https://www.churchofjesuschrist.org/comeuntochrist/uk/community/hyde-park-chapel', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-99778983' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.churchofjesuschrist.org/comeuntochrist/uk/community/hyde-park-chapel','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-99778983'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Completed in 1879, the Grade I-listed New West End Synagogue was designed by George Audsley and Nathan Joseph. Its extraordinary interior blends Gothic, Moorish and Byzantine motifs in gilded arcades, patterned surfaces, stained glass and a monumental Torah ark.', description_it='Completata nel 1879, la New West End Synagogue di grado I fu progettata da George Audsley e Nathan Joseph. Lo straordinario interno fonde motivi gotici, moreschi e bizantini in arcate dorate, superfici decorate, vetrate e una monumentale arca della Torah.',
  editorial_hook_en='Gilded arcades and a monumental ark make this one of Britain’s most spectacular Victorian synagogues.', editorial_hook_it='Arcate dorate e un’arca monumentale rendono questa una delle sinagoghe vittoriane più spettacolari della Gran Bretagna.',
  official_url='https://www.newwestend.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-28E4FE09' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.newwestend.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-28E4FE09'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Opened in 1840 as one of the Magnificent Seven, Nunhead Cemetery has matured into a woodland nature reserve. A roofless Gothic chapel, steep paths, sculpted monuments and a protected view toward St Paul’s reward exploration of this dramatic South London landscape.', description_it='Aperto nel 1840 come uno dei Magnificent Seven, Nunhead Cemetery è divenuto una riserva naturale boscosa. Cappella gotica senza tetto, sentieri ripidi, monumenti scolpiti e una vista protetta verso St Paul’s rendono memorabile il paesaggio.',
  editorial_hook_en='A roofless chapel and a distant St Paul’s view emerge from one of London’s wildest Victorian cemeteries.', editorial_hook_it='Una cappella senza tetto e la vista lontana di St Paul’s emergono da uno dei cimiteri vittoriani più selvaggi di Londra.',
  official_url='https://www.fonc.org.uk/', access_notes_en='Cemetery grounds have daily gate times that can vary seasonally. Check the official site for current hours, tours and any restrictions on photography or access to chapels and catacombs.', access_notes_it='Il cimitero ha orari di apertura dei cancelli che possono variare secondo la stagione. Controlla il sito ufficiale per orari aggiornati, visite guidate e limitazioni a fotografie, cappelle o catacombe.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R8' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.fonc.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='R8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Our Lady of Victories succeeded a grand 1869 pro-cathedral that was destroyed by wartime bombing. Adrian Gilbert Scott’s replacement opened in 1959, giving Kensington a spacious modern Catholic church whose restrained exterior leads to a warm, high-volume interior.', description_it='Our Lady of Victories sostituisce la grande pro-cattedrale del 1869 distrutta dai bombardamenti. La nuova chiesa di Adrian Gilbert Scott aprì nel 1959 e offre a Kensington un ampio spazio cattolico moderno, sobrio all’esterno e caldo, slanciato all’interno.',
  editorial_hook_en='A post-war church by Adrian Gilbert Scott carries forward the memory of Kensington’s bombed Victorian pro-cathedral.', editorial_hook_it='Una chiesa del dopoguerra di Adrian Gilbert Scott porta avanti la memoria della pro-cattedrale vittoriana bombardata di Kensington.',
  official_url='https://www.ourladyofvictories.net/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5148B5AA' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.ourladyofvictories.net/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-5148B5AA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='William Wardell designed Our Ladye Star of the Sea in 1851 as a richly detailed Decorated Gothic church for maritime Greenwich. Its landmark spire, carved stone, stained glass and fittings associated with the Pugin circle reflect the confidence of London’s revived nineteenth-century Catholic community.', description_it='William Wardell progettò Our Ladye Star of the Sea nel 1851 come ricca chiesa gotico-decorata per la Greenwich marittima. La guglia, la pietra scolpita, le vetrate e gli arredi legati all’ambiente di Pugin esprimono la rinascita cattolica ottocentesca.',
  editorial_hook_en='A needle spire and Pugin-era detail mark Greenwich’s confident nineteenth-century Catholic revival.', editorial_hook_it='Una guglia sottile e dettagli dell’epoca di Pugin segnano la sicura rinascita cattolica ottocentesca di Greenwich.',
  official_url='https://ourladyestaroftheseagreenwich.church/heritage/our-story', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-505641E6' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://ourladyestaroftheseagreenwich.church/heritage/our-story','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-505641E6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Paddington Old Cemetery opened in 1855 with a distinctive horseshoe plan, paired chapels and mature avenues. Among its varied monuments is the grave of Paddington Bear creator Michael Bond, whose headstone carries a tender reference to the bear he gave the world.', description_it='Paddington Old Cemetery aprì nel 1855 con una caratteristica pianta a ferro di cavallo, cappelle gemelle e viali alberati. Tra i molti monumenti si trova la tomba di Michael Bond, creatore di Paddington Bear, con un affettuoso richiamo all’orso.',
  editorial_hook_en='Victorian avenues lead to Michael Bond’s grave and a final, affectionate nod to Paddington Bear.', editorial_hook_it='I viali vittoriani conducono alla tomba di Michael Bond e a un ultimo, affettuoso richiamo a Paddington Bear.',
  official_url='https://www.brent.gov.uk/births-deaths-marriages-and-citizenship/deaths-and-funerals/cemeteries/paddington-old-cemetery', access_notes_en='Cemetery grounds have daily gate times that can vary seasonally. Check the official site for current hours, tours and any restrictions on photography or access to chapels and catacombs.', access_notes_it='Il cimitero ha orari di apertura dei cancelli che possono variare secondo la stagione. Controlla il sito ufficiale per orari aggiornati, visite guidate e limitazioni a fotografie, cappelle o catacombe.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3C975BDC' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.brent.gov.uk/births-deaths-marriages-and-citizenship/deaths-and-funerals/cemeteries/paddington-old-cemetery','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-3C975BDC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='This Devonia Road church began as a nineteenth-century Swedenborgian building and became the Polish Catholic parish of Our Lady of Częstochowa and St Casimir in 1930. Its art, memorials and Adam Bunsch stained glass record the faith and wartime experience of London’s Polish diaspora.', description_it='Questa chiesa di Devonia Road nacque nell’Ottocento per gli Swedenborgiani e nel 1930 divenne la parrocchia cattolica polacca di Nostra Signora di Częstochowa e San Casimiro. Arte, memorie e vetrate di Adam Bunsch raccontano fede ed esperienza bellica della diaspora polacca.',
  editorial_hook_en='A former Swedenborgian church became a living archive of Polish faith, exile and wartime London.', editorial_hook_it='Un’ex chiesa swedenborgiana è diventata un archivio vivo di fede polacca, esilio e Londra in guerra.',
  official_url='https://www.devonia.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-13C92B98' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.devonia.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-13C92B98'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Russian Orthodox Cathedral of the Dormition occupies a church built in 1849 and adapted for Orthodox worship after 1956. Its iconostasis, icons and incense-filled liturgy transform an Italianate Victorian building into the cathedral of the Diocese of Sourozh.', description_it='La cattedrale russo-ortodossa della Dormizione occupa una chiesa del 1849, adattata al culto ortodosso dopo il 1956. Iconostasi, icone e liturgia avvolta dall’incenso trasformano l’edificio vittoriano italianeggiante nella cattedrale della diocesi di Sourozh.',
  editorial_hook_en='A Victorian church near Knightsbridge has been transformed by icons and liturgy into London’s Russian Orthodox cathedral.', editorial_hook_it='Una chiesa vittoriana vicino a Knightsbridge è stata trasformata da icone e liturgia nella cattedrale russo-ortodossa di Londra.',
  official_url='https://www.sourozh.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B25923E0' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sourozh.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-B25923E0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Russian Orthodox Cathedral of the Nativity of the Mother of God and Holy Royal Martyrs was purpose-built in Chiswick from the late 1990s. White walls, blue roofs, gilded domes, icons and a traditional interior create a distinct Orthodox landmark beside the Thames.', description_it='La cattedrale russo-ortodossa della Natività della Madre di Dio e dei Santi Martiri Imperiali fu costruita appositamente a Chiswick dalla fine degli anni Novanta. Pareti bianche, tetti azzurri, cupole dorate, icone e interni tradizionali ne fanno un riferimento ortodosso sul Tamigi.',
  editorial_hook_en='Blue roofs and gilded onion domes announce a purpose-built Orthodox cathedral beside the Thames at Chiswick.', editorial_hook_it='Tetti azzurri e cupole a cipolla dorate annunciano una cattedrale ortodossa costruita appositamente sul Tamigi a Chiswick.',
  official_url='https://www.russianchurchlondon.org/En/Home.html', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A66C50FA' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.russianchurchlondon.org/En/Home.html','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-A66C50FA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Sacred Heart Wimbledon was founded through Edith Arendrup’s patronage and built from 1887 to designs by Frederick Walters. The Grade II*-listed late-Decorated Gothic church has a soaring nave, carved stone, stained glass and a strong Jesuit and local community history.', description_it='Sacred Heart Wimbledon nacque grazie al patrocinio di Edith Arendrup e fu costruita dal 1887 su progetto di Frederick Walters. La chiesa gotico-decorata di grado II* offre navata slanciata, pietra scolpita, vetrate e una forte storia gesuita e comunitaria.',
  editorial_hook_en='A soaring Jesuit Gothic church in Wimbledon owes its creation to the vision and patronage of Edith Arendrup.', editorial_hook_it='Una slanciata chiesa gotica gesuita a Wimbledon deve la propria nascita alla visione e al patrocinio di Edith Arendrup.',
  official_url='https://www.sacredheartwimbledon.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DCFED3D4' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sacredheartwimbledon.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-DCFED3D4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The present St Botolph without Aldgate was completed in 1744 by George Dance the Elder on a medieval site just outside the City wall. Its calm Georgian proportions contain notable monuments, a richly remodelled Victorian chancel and carved angels associated with C. F. A. Voysey.', description_it='L’attuale St Botolph without Aldgate fu completata nel 1744 da George Dance il Vecchio su un sito medievale appena fuori dalle mura. Le sobrie proporzioni georgiane racchiudono monumenti, un presbiterio vittoriano e angeli scolpiti associati a C. F. A. Voysey.',
  editorial_hook_en='A serene Georgian church at the old City gate hides an unexpectedly rich Victorian chancel and carved angels.', editorial_hook_it='Una serena chiesa georgiana presso l’antica porta cittadina nasconde un presbiterio vittoriano e angeli scolpiti.',
  official_url='https://www.stbotolphs.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-AFE20A19' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stbotolphs.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-AFE20A19'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Dunstan in the East was founded around 1100, rebuilt with a Wren tower after the Great Fire and gutted in the Blitz. Since 1970 its roofless Gothic walls have framed a City garden where palms, climbers and fountain planting soften dramatic bomb-damaged masonry.', description_it='St Dunstan in the East fu fondata intorno al 1100, ricostruita con una torre di Wren dopo il Grande Incendio e svuotata dal Blitz. Dal 1970 le pareti gotiche senza tetto incorniciano un giardino cittadino di palme, rampicanti e fontana.',
  editorial_hook_en='Blitz-ruined Gothic walls and Wren’s tower have become a lush garden in the heart of the City.', editorial_hook_it='Muri gotici rovinati dal Blitz e la torre di Wren sono diventati un giardino rigoglioso nel cuore della City.',
  official_url='https://www.cityoflondon.gov.uk/things-to-do/city-gardens/find-a-garden/st-dunstan-in-the-east-church-garden', access_notes_en='Outdoor heritage site with posted opening times that can vary seasonally. Check the official site before travelling; some structures may only be viewed from the grounds.', access_notes_it='Sito storico all’aperto con orari esposti che possono variare secondo la stagione. Controlla il sito ufficiale prima di partire; alcune strutture possono essere osservate soltanto dall’esterno.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E4BE50C8' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cityoflondon.gov.uk/things-to-do/city-gardens/find-a-garden/st-dunstan-in-the-east-church-garden','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-E4BE50C8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Mary the Virgin, Merton stands on a site recorded before Domesday, with the present church dating from about 1115. Norman stonework, a medieval chancel and ancient timber roof chart almost nine centuries of parish life beside the former Merton Priory landscape.', description_it='St Mary the Virgin a Merton sorge su un sito anteriore al Domesday Book e l’edificio attuale risale circa al 1115. Muratura normanna, presbiterio medievale e antico tetto ligneo raccontano quasi nove secoli di vita parrocchiale vicino a Merton Priory.',
  editorial_hook_en='Norman masonry and an ancient timber roof preserve nearly nine centuries of Merton parish life.', editorial_hook_it='Muratura normanna e un antico tetto ligneo conservano quasi nove secoli di vita parrocchiale a Merton.',
  official_url='https://www.stmarysmerton.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C32C69BD' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmarysmerton.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-C32C69BD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Founded by Sri Lankan Tamil families in 1979, Shree Ghanapathy Temple opened in Wimbledon in 1981 as Britain’s first fully consecrated Hindu temple. Its Ganesha-centred shrines, daily puja, music, teaching and festivals anchor a major community institution.', description_it='Fondato da famiglie tamil dello Sri Lanka nel 1979, lo Shree Ghanapathy Temple aprì a Wimbledon nel 1981 come primo tempio hindu pienamente consacrato della Gran Bretagna. Santuari dedicati a Ganesha, puja, musica, insegnamento e feste sostengono una grande istituzione comunitaria.',
  editorial_hook_en='Britain’s first fully consecrated Hindu temple grew from a Sri Lankan Tamil community in Wimbledon.', editorial_hook_it='Il primo tempio hindu pienamente consacrato della Gran Bretagna nacque dalla comunità tamil dello Sri Lanka a Wimbledon.',
  official_url='https://shreeghanapathy.co.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A323C989' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://shreeghanapathy.co.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-A323C989'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Shri Sanatan Hindu Mandir opened in 2010 after artisans in India carved its limestone and marble components using traditional methods. The richly ornamented Wembley temple brings multiple deities, carved pillars, domes and narrative sculpture together in a major modern expression of Sanatan Hindu practice.', description_it='Lo Shri Sanatan Hindu Mandir aprì nel 2010 dopo che artigiani in India avevano scolpito a mano i suoi elementi in calcare e marmo. Il ricco tempio di Wembley riunisce molte divinità, pilastri, cupole e sculture narrative in una grande espressione moderna della tradizione Sanatan.',
  editorial_hook_en='Hand-carved stone shipped from India turns a Wembley street into an exuberant modern Hindu landmark.', editorial_hook_it='Pietra scolpita a mano in India trasforma una strada di Wembley in un esuberante riferimento hindu moderno.',
  official_url='https://www.shreesanatanhindumandir.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-92D8E311' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.shreesanatanhindumandir.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-92D8E311'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Sir John Soane designed this Grade I-listed mausoleum in 1816 for his wife Eliza and later joined her there. Its shallow dome, inventive openings and sculptural silhouette became an unexpected design source for Giles Gilbert Scott’s iconic red K2 telephone kiosk.', description_it='Sir John Soane progettò questo mausoleo di grado I nel 1816 per la moglie Eliza e vi fu poi sepolto. La cupola ribassata, le aperture inventive e la sagoma scultorea ispirarono in modo sorprendente la celebre cabina telefonica rossa K2 di Giles Gilbert Scott.',
  editorial_hook_en='Soane’s intensely personal family tomb supplied the silhouette for Britain’s classic red telephone box.', editorial_hook_it='La tomba familiare intensamente personale di Soane fornì la sagoma della classica cabina telefonica rossa britannica.',
  official_url='https://historicengland.org.uk/listing/the-list/list-entry/1113238', access_notes_en='Outdoor heritage site with posted opening times that can vary seasonally. Check the official site before travelling; some structures may only be viewed from the grounds.', access_notes_it='Sito storico all’aperto con orari esposti che possono variare secondo la stagione. Controlla il sito ufficiale prima di partire; alcune strutture possono essere osservate soltanto dall’esterno.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-EB2D295A' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1113238','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-EB2D295A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Southwark Cathedral grew from the Augustinian priory church of St Mary Overie, established in 1106 on a much older sacred site. Gothic fabric, the retrochoir, Shakespeare memorial, Harvard Chapel and monuments to local lives reveal the long relationship between Bankside, theatre, trade and worship.', description_it='Southwark Cathedral deriva dalla chiesa del priorato agostiniano di St Mary Overie, fondato nel 1106 su un sito sacro più antico. Strutture gotiche, retrocoro, memoriale di Shakespeare, Harvard Chapel e monumenti locali raccontano Bankside tra teatro, commercio e culto.',
  editorial_hook_en='Eight centuries of Gothic fabric connect medieval priors, Shakespeare’s Bankside and today’s Borough Market.', editorial_hook_it='Otto secoli di architettura gotica collegano priori medievali, la Bankside di Shakespeare e l’odierno Borough Market.',
  official_url='https://cathedral.southwark.anglican.org/about-us/our-history/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9133AB10' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://cathedral.southwark.anglican.org/about-us/our-history/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-9133AB10'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Anne’s was consecrated in 1686 for the new parish of Soho and became closely entwined with the district’s immigrant, theatrical and musical life. The Blitz left only its distinctive 1803 tower, around which the present church and garden were rebuilt and reopened in 1991.', description_it='St Anne’s fu consacrata nel 1686 per la nuova parrocchia di Soho e si legò profondamente alla vita immigrata, teatrale e musicale del quartiere. Il Blitz lasciò soltanto la caratteristica torre del 1803, attorno alla quale chiesa e giardino furono ricostruiti e riaperti nel 1991.',
  editorial_hook_en='Soho’s rebuilt parish church gathers three centuries of immigrant, theatrical and musical lives around its surviving tower.', editorial_hook_it='La chiesa parrocchiale ricostruita di Soho raccoglie tre secoli di vite immigrate, teatrali e musicali attorno alla torre superstite.',
  official_url='https://www.stannes-soho.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F55EE81F' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stannes-soho.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-F55EE81F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='John Loughborough Pearson designed St Augustine’s Kilburn from 1870 as a monumental Anglo-Catholic church, later nicknamed the Cathedral of North London. Its soaring brick vaults, long nave, chapels, screens and stained glass create one of the capital’s most powerful Victorian Gothic interiors.', description_it='John Loughborough Pearson progettò St Augustine’s Kilburn dal 1870 come monumentale chiesa anglo-cattolica, poi soprannominata Cattedrale del Nord di Londra. Volte in mattoni, lunga navata, cappelle, transenne e vetrate creano uno dei più potenti interni gotici vittoriani della capitale.',
  editorial_hook_en='Kilburn’s ‘Cathedral of North London’ is a soaring Victorian Gothic world of brick vaults, screens and ritual.', editorial_hook_it='La “Cattedrale del Nord di Londra” a Kilburn è un mondo gotico vittoriano di volte in mattoni, transenne e ritualità.',
  official_url='https://www.staugustine.london/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-03752923' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.staugustine.london/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-03752923'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Founded in 1123 by Rahere, St Bartholomew the Great preserves the most substantial Norman church interior in central London. Massive round arches, the medieval choir, Rahere’s tomb and the timber-framed gatehouse make entry from Smithfield feel like a passage into another city.', description_it='Fondata nel 1123 da Rahere, St Bartholomew the Great conserva il più importante interno ecclesiastico normanno del centro di Londra. Massicci archi a tutto sesto, coro medievale, tomba di Rahere e portale a graticcio trasformano l’ingresso da Smithfield in un passaggio verso un’altra città.',
  editorial_hook_en='Pass beneath a Tudor gatehouse into London’s most complete Norman church and the shadowed tomb of its founder.', editorial_hook_it='Attraversa un portale Tudor ed entra nella chiesa normanna più completa di Londra, accanto alla tomba in ombra del fondatore.',
  official_url='https://greatstbarts.com/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2405DFBC' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://greatstbarts.com/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-2405DFBC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Bartholomew the Less began as the chapel of St Bartholomew’s Hospital and remains embedded within its historic precinct. A medieval tower opens into an unusual octagonal Georgian interior remodelled by George Dance the Younger, linking centuries of worship with Britain’s oldest working hospital.', description_it='St Bartholomew the Less nacque come cappella dell’ospedale di St Bartholomew ed è ancora inserita nel suo recinto storico. Una torre medievale introduce a un insolito interno georgiano ottagonale rinnovato da George Dance il Giovane, unendo culto e storia ospedaliera.',
  editorial_hook_en='A medieval hospital chapel hides an elegant octagonal Georgian interior inside the working Barts precinct.', editorial_hook_it='Una cappella ospedaliera medievale nasconde un elegante interno georgiano ottagonale nel complesso ancora attivo di Barts.',
  official_url='https://greatstbarts.com/st-bartholomew-the-less/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8C7DBDDB' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://greatstbarts.com/st-bartholomew-the-less/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-8C7DBDDB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Bride’s is the journalists’ church of Fleet Street, rebuilt by Christopher Wren after the Great Fire and again after the Blitz. Its tiered wedding-cake spire, Roman and medieval crypt remains, printing memorials and superb acoustic connect sacred architecture with London’s press history.', description_it='St Bride’s è la chiesa dei giornalisti di Fleet Street, ricostruita da Christopher Wren dopo il Grande Incendio e ancora dopo il Blitz. La guglia a piani simile a una torta nuziale, i resti romani e medievali della cripta e i memoriali della stampa legano architettura e giornalismo.',
  editorial_hook_en='Wren’s wedding-cake spire rises above a crypt of Roman remains and a church devoted to Fleet Street’s press.', editorial_hook_it='La guglia a torta nuziale di Wren sovrasta una cripta con resti romani e una chiesa dedicata alla stampa di Fleet Street.',
  official_url='https://www.stbrides.com/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-88A8D5DC' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stbrides.com/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-88A8D5DC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Edward Middleton Barry designed St Christopher’s Chapel for Great Ormond Street Hospital in 1875. When the surrounding building was replaced in the 1980s, the richly decorated Italianate chapel was encased, moved on rails and restored, preserving a beloved sanctuary for patients, families and staff.', description_it='Edward Middleton Barry progettò la St Christopher’s Chapel per il Great Ormond Street Hospital nel 1875. Negli anni Ottanta la ricca cappella italianeggiante fu ingabbiata, spostata su rotaie e restaurata, conservando un luogo molto amato da pazienti, famiglie e personale.',
  editorial_hook_en='This ornate hospital chapel survived redevelopment by being wrapped in steel and moved whole along rails.', editorial_hook_it='Questa cappella ospedaliera decorata sopravvisse alla ricostruzione grazie a una gabbia d’acciaio e a uno spostamento intero su rotaie.',
  official_url='https://www.gosh.nhs.uk/about-us/our-history/st-christophers-chapel/', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-44104C28' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.gosh.nhs.uk/about-us/our-history/st-christophers-chapel/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-44104C28'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='A. W. N. Pugin’s St George’s opened in 1848 and became the Roman Catholic cathedral for Southwark. Badly damaged in 1941, it was rebuilt by Romilly Craze in 1958, blending surviving Gothic elements, post-war design and a continuing role at the centre of Catholic South London.', description_it='La St George’s di A. W. N. Pugin aprì nel 1848 e divenne la cattedrale cattolica di Southwark. Gravemente danneggiata nel 1941, fu ricostruita da Romilly Craze nel 1958, fondendo elementi gotici superstiti, design del dopoguerra e vita cattolica contemporanea.',
  editorial_hook_en='Pugin’s bomb-damaged cathedral was reborn in the 1950s as a striking dialogue between Gothic survival and post-war renewal.', editorial_hook_it='La cattedrale bombardata di Pugin rinacque negli anni Cinquanta in un dialogo tra sopravvivenza gotica e rinnovamento del dopoguerra.',
  official_url='https://www.stgeorgescathedral.org.uk/about/history/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-83548C54' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stgeorgescathedral.org.uk/about/history/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-83548C54'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Completed in 1730, St George’s Bloomsbury was Nicholas Hawksmoor’s final London church. Its portico faces the British Museum quarter while the extraordinary stepped steeple—topped by George I and guarded by lions and unicorns—turns ancient Mausoleum imagery into exuberant English Baroque.', description_it='Completata nel 1730, St George’s Bloomsbury fu l’ultima chiesa londinese di Nicholas Hawksmoor. Il portico guarda verso il British Museum, mentre l’insolito campanile a gradoni, coronato da Giorgio I e sorvegliato da leoni e unicorni, trasforma l’antico Mausoleo in Barocco inglese.',
  editorial_hook_en='Hawksmoor crowned his last London church with George I, lions and unicorns on a wildly theatrical stepped spire.', editorial_hook_it='Hawksmoor coronò la sua ultima chiesa londinese con Giorgio I, leoni e unicorni su una teatrale guglia a gradoni.',
  official_url='https://www.stgeorgesbloomsbury.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-65589691' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stgeorgesbloomsbury.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-65589691'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St James Clerkenwell stands on the site of a twelfth-century Benedictine nunnery. James Carr’s 1792 preaching church retains broad galleries and a spacious interior, while the surrounding churchyard and nearby medieval gate place it within Clerkenwell’s remarkable monastic and civic landscape.', description_it='St James Clerkenwell sorge sul sito di un monastero benedettino femminile del XII secolo. La chiesa di predicazione costruita da James Carr nel 1792 conserva ampie gallerie, mentre il sagrato e la vicina porta medievale la inseriscono nel paesaggio monastico e civile di Clerkenwell.',
  editorial_hook_en='A broad Georgian preaching house occupies the ground of Clerkenwell’s lost medieval nunnery.', editorial_hook_it='Un’ampia chiesa georgiana per la predicazione occupa il terreno dell’antico monastero femminile di Clerkenwell.',
  official_url='https://inspirelondon.org/church-history', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9ED348AC' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://inspirelondon.org/church-history','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-9ED348AC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='G. E. Street designed St James the Less in 1858–61 as a robust, polychromatic Gothic church for Pimlico. Red brick, striped stone, a detached Italianate campanile and a richly articulated interior make this Grade I-listed building an influential statement of Victorian ecclesiastical design.', description_it='G. E. Street progettò St James the Less nel 1858–61 come vigorosa chiesa gotica policroma per Pimlico. Mattoni rossi, fasce di pietra, campanile italianeggiante separato e un interno riccamente articolato ne fanno un’opera vittoriana influente di grado I.',
  editorial_hook_en='Striped brickwork and a free-standing Italianate tower make G. E. Street’s Pimlico church instantly distinctive.', editorial_hook_it='Mattoni a fasce e un campanile italianeggiante isolato rendono immediatamente riconoscibile la chiesa di G. E. Street a Pimlico.',
  official_url='https://www.sjtl.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C6F171EC' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sjtl.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-C6F171EC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Christopher Wren completed St James’s Piccadilly in 1684 as a broad, light-filled preaching church. Grinling Gibbons carved its celebrated reredos, font and organ case, while a long artistic tradition, busy courtyard market and programme of music keep the building unusually connected to West End life.', description_it='Christopher Wren completò St James’s Piccadilly nel 1684 come ampia e luminosa chiesa di predicazione. Grinling Gibbons scolpì pala, fonte e cassa d’organo, mentre tradizione artistica, mercato nel cortile e musica mantengono l’edificio legato alla vita del West End.',
  editorial_hook_en='Wren’s airy West End church pairs Grinling Gibbons carving with an artists’ tradition and a lively courtyard market.', editorial_hook_it='La luminosa chiesa di Wren nel West End unisce gli intagli di Grinling Gibbons a una tradizione artistica e a un vivace mercato nel cortile.',
  official_url='https://www.sjp.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3D7A39CF' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sjp.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-3D7A39CF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St James’s Spanish Place grew from the chapel of the Spanish Embassy and opened in its present form in 1890. Edward Goldie’s lofty English Gothic interior includes a hammerbeam roof, carved chapels and Spanish royal associations, sustaining one of London’s most distinctive Catholic parishes.', description_it='St James’s Spanish Place deriva dalla cappella dell’ambasciata spagnola e aprì nella forma attuale nel 1890. L’alto interno gotico inglese di Edward Goldie comprende tetto a capriate lignee, cappelle scolpite e legami con la monarchia spagnola.',
  editorial_hook_en='Embassy roots and Spanish royal links animate one of central London’s grandest late-Victorian Catholic interiors.', editorial_hook_it='Origini diplomatiche e legami con la monarchia spagnola animano uno dei più grandiosi interni cattolici tardo-vittoriani del centro.',
  official_url='https://www.sjrcc.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3BA68FDC' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sjrcc.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-3BA68FDC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Priory Church of St John preserves the twelfth-century crypt of the Knights Hospitaller’s Clerkenwell headquarters. The later church above, adjoining St John’s Gate and the museum, links medieval crusading orders with the modern Order of St John and St John Ambulance.', description_it='La Priory Church of St John conserva la cripta del XII secolo del quartier generale dei Cavalieri Ospitalieri a Clerkenwell. La chiesa successiva, con St John’s Gate e il museo, collega gli ordini medievali al moderno Order of St John e a St John Ambulance.',
  editorial_hook_en='Beneath Clerkenwell lies the Norman crypt of the Knights Hospitaller, ancestor of today’s St John Ambulance tradition.', editorial_hook_it='Sotto Clerkenwell si trova la cripta normanna dei Cavalieri Ospitalieri, antenati della tradizione odierna di St John Ambulance.',
  official_url='https://museumstjohn.org.uk/museum-order-st-john/church/', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-1838C086' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://museumstjohn.org.uk/museum-order-st-john/church/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-1838C086'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Christ Church Chelsea was built in 1839 to designs by Edward Blore for a rapidly growing riverside district. Its later Arts and Crafts west front by W. D. Caröe and strong tradition of local service make it both an architectural layer-cake and a record of nineteenth-century social Chelsea.', description_it='Christ Church Chelsea fu costruita nel 1839 da Edward Blore per un quartiere fluviale in rapida crescita. La successiva facciata Arts and Crafts di W. D. Caröe e la tradizione di servizio locale ne fanno un palinsesto architettonico e sociale della Chelsea ottocentesca.',
  editorial_hook_en='Blore’s Victorian parish church gained an Arts and Crafts face while keeping deep roots in working Chelsea.', editorial_hook_it='La chiesa vittoriana di Blore acquistò un volto Arts and Crafts mantenendo profonde radici nella Chelsea popolare.',
  official_url='https://chelseaparish.org/about-us/history/christ-church-history/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A00E4399' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://chelseaparish.org/about-us/history/christ-church-history/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-A00E4399'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Margaret Pattens was rebuilt by Christopher Wren in 1687 and escaped major Blitz damage. Its slender 200-foot medieval-style spire, rare canopied churchwardens’ pews and display of pattens—the raised overshoes traditionally linked to its name—make it exceptionally characterful.', description_it='St Margaret Pattens fu ricostruita da Christopher Wren nel 1687 e sfuggì ai gravi danni del Blitz. La sottile guglia medievaleggiante alta 200 piedi, i rari banchi coperti dei churchwardens e l’esposizione di pattens, le soprascarpe legate al nome, le danno un carattere unico.',
  editorial_hook_en='Wren’s only true medieval-style spire rises above rare canopied pews and the curious overshoes that gave the church its name.', editorial_hook_it='L’unica vera guglia medievaleggiante di Wren sovrasta rari banchi coperti e le curiose soprascarpe che diedero nome alla chiesa.',
  official_url='https://www.stmargaretpattens.org/the-building', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6685CCC2' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmargaretpattens.org/the-building','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-6685CCC2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Margaret’s Westminster has served the House of Commons as its parish church since the seventeenth century. Rebuilt in the late fifteenth and early sixteenth centuries, it holds brilliant stained glass, parliamentary memorials and the graves of figures including Walter Raleigh beside Westminster Abbey.', description_it='St Margaret’s Westminster è la chiesa parrocchiale della Camera dei Comuni dal Seicento. Ricostruita tra fine Quattrocento e inizio Cinquecento, conserva splendide vetrate, memorie parlamentari e tombe di figure come Walter Raleigh accanto a Westminster Abbey.',
  editorial_hook_en='The parish church of Parliament preserves Tudor glass and political memory in Westminster Abbey’s shadow.', editorial_hook_it='La chiesa parrocchiale del Parlamento conserva vetrate Tudor e memoria politica all’ombra di Westminster Abbey.',
  official_url='https://www.westminster-abbey.org/st-margarets-church/', access_notes_en='Visitor admission, worship access and opening times differ. Check the official site for the day’s schedule, tickets, closures and any areas reserved for services.', access_notes_it='Ingresso turistico, accesso al culto e orari sono distinti. Controlla il sito ufficiale per programma giornaliero, biglietti, chiusure e aree riservate alle funzioni.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B86D3E65' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.westminster-abbey.org/st-margarets-church/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-B86D3E65'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Margaret Lothbury was rebuilt by Christopher Wren and completed in 1692, with a tower by Robert Hooke. Its restrained City exterior hides exceptional seventeenth-century woodwork rescued from demolished churches, including a reredos, font, communion rails and screen associated with Grinling Gibbons.', description_it='St Margaret Lothbury fu ricostruita da Christopher Wren e completata nel 1692, con torre di Robert Hooke. L’esterno sobrio nasconde straordinari legni seicenteschi salvati da chiese demolite, tra cui pala, fonte, balaustra e transenna associati a Grinling Gibbons.',
  editorial_hook_en='A quiet Wren church has become a treasury of carved woodwork rescued from vanished City churches.', editorial_hook_it='Una tranquilla chiesa di Wren è diventata un tesoro di legni scolpiti salvati da chiese scomparse della City.',
  official_url='https://stml.org.uk/about/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B4270280' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://stml.org.uk/about/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-B4270280'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Mark’s Regent’s Park was designed by Thomas Little and consecrated in 1853 opposite the park’s northern edge. Burned by an incendiary bomb in 1940 and subsequently restored, the ‘Zoo Church’ now combines Victorian parish architecture, music and a leafy Primrose Hill setting.', description_it='St Mark’s Regent’s Park fu progettata da Thomas Little e consacrata nel 1853 di fronte al margine nord del parco. Incendiata da una bomba nel 1940 e poi restaurata, la “Zoo Church” unisce architettura parrocchiale vittoriana, musica e l’ambiente verde di Primrose Hill.',
  editorial_hook_en='The ‘Zoo Church’ faces Regent’s Park with a Victorian silhouette rebuilt after a devastating wartime fire.', editorial_hook_it='La “Zoo Church” guarda Regent’s Park con una sagoma vittoriana ricostruita dopo un devastante incendio di guerra.',
  official_url='https://www.stmarksregentspark.org.uk/history/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E2618500' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmarksregentspark.org.uk/history/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-E2618500'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='George Gilbert Scott rebuilt St Mary Abbots in 1872 in an exceptionally tall Early English Gothic style. Its 278-foot spire dominates Kensington, while the vaulted interior, stained glass, monuments and surviving medieval features preserve the memory of earlier churches on the site.', description_it='George Gilbert Scott ricostruì St Mary Abbots nel 1872 in un altissimo stile gotico Early English. La guglia di 278 piedi domina Kensington, mentre interno voltato, vetrate, monumenti e resti medievali conservano la memoria delle chiese precedenti.',
  editorial_hook_en='Kensington’s skyline is pierced by George Gilbert Scott’s 278-foot spire above a richly vaulted parish church.', editorial_hook_it='Lo skyline di Kensington è trafitto dalla guglia di 278 piedi di George Gilbert Scott sopra una ricca chiesa voltata.',
  official_url='https://www.smaw8.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4E5C28DD' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.smaw8.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-4E5C28DD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Mary Abchurch was rebuilt after the Great Fire by Christopher Wren and completed in 1686. Its plain brick exterior conceals a luminous domed ceiling painted by William Snow, a carved Grinling Gibbons reredos and an intimate, almost theatrical Baroque interior.', description_it='St Mary Abchurch fu ricostruita dopo il Grande Incendio da Christopher Wren e completata nel 1686. Il semplice esterno in mattoni nasconde una cupola luminosa dipinta da William Snow, una pala di Grinling Gibbons e un intimo interno barocco quasi teatrale.',
  editorial_hook_en='A plain City exterior opens into Wren’s intimate painted dome and one of Grinling Gibbons’s richest reredoses.', editorial_hook_it='Un semplice esterno della City si apre sulla cupola dipinta di Wren e su una delle più ricche pale di Grinling Gibbons.',
  official_url='https://www.stmaryabchurch.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-705DDA4B' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmaryabchurch.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-705DDA4B'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Rebuilt after the Great Fire and attributed to Wren’s office, St Mary Aldermary is an unusual City church in late Gothic rather than classical dress. Its spectacular fan-vaulted plaster ceiling, clustered columns and chequered history now frame the welcoming Host Café and Moot community.', description_it='Ricostruita dopo il Grande Incendio e attribuita allo studio di Wren, St Mary Aldermary è un’insolita chiesa della City in veste tardo-gotica anziché classica. Lo spettacolare soffitto a ventaglio, le colonne e la storia stratificata oggi accolgono Host Café e la comunità Moot.',
  editorial_hook_en='Gothic fan vaults—not classical Baroque—make this one of the most surprising churches rebuilt after the Great Fire.', editorial_hook_it='Volte gotiche a ventaglio, non Barocco classico, fanno di questa una delle chiese più sorprendenti ricostruite dopo il Grande Incendio.',
  official_url='https://www.stmaryaldermary.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-497D92F8' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmaryaldermary.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-497D92F8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='James Gibbs designed St Mary le Strand, completed in 1717 as the first of Queen Anne’s Fifty New Churches. Its compact Baroque exterior is densely sculpted, while a richly ornamented interior turns the narrow traffic island into an unexpectedly elaborate sacred room.', description_it='James Gibbs progettò St Mary le Strand, completata nel 1717 come prima delle Cinquanta Nuove Chiese della regina Anna. L’esterno barocco compatto è fitto di sculture, mentre il ricco interno trasforma l’isola spartitraffico in una sorprendente sala sacra.',
  editorial_hook_en='A tiny traffic island holds James Gibbs’s exuberant first church for Queen Anne’s ambitious building programme.', editorial_hook_it='Una minuscola isola spartitraffico ospita l’esuberante prima chiesa di James Gibbs per l’ambizioso programma della regina Anna.',
  official_url='https://www.stmarylestrand.com/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-188FAC2E' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmarylestrand.com/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-188FAC2E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Mary the Virgin, Mortlake has medieval origins but was substantially rebuilt in 1543 and later enlarged. Its riverside parish history includes Tudor brickwork, monuments to local families and the burial of Elizabeth I’s astrologer John Dee somewhere within the church or churchyard.', description_it='St Mary the Virgin a Mortlake ha origini medievali, ma fu in gran parte ricostruita nel 1543 e poi ampliata. La sua storia fluviale comprende muratura Tudor, monumenti di famiglie locali e la sepoltura dell’astrologo di Elisabetta I, John Dee, nella chiesa o nel sagrato.',
  editorial_hook_en='A Tudor riverside church keeps the elusive burial story of royal astrologer and polymath John Dee.', editorial_hook_it='Una chiesa Tudor sul fiume custodisce l’elusiva storia della sepoltura dell’astrologo reale e poliedrico John Dee.',
  official_url='https://stmarymortlake.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-70F860F1' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://stmarymortlake.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-70F860F1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Mary-le-Bow was rebuilt by Christopher Wren after the Great Fire and crowned with one of his most accomplished steeples. The bells define the traditional soundscape of Cockney identity, while the crypt, post-Blitz interior and Australian memorial chapel deepen the church’s global City story.', description_it='St Mary-le-Bow fu ricostruita da Christopher Wren dopo il Grande Incendio e coronata da uno dei suoi campanili più riusciti. Le campane definiscono l’identità cockney, mentre cripta, interno ricostruito dopo il Blitz e cappella australiana ampliano la storia internazionale della chiesa.',
  editorial_hook_en='The sound of Bow Bells defines a Cockney, beneath one of Wren’s most elegant City steeples.', editorial_hook_it='Il suono delle Bow Bells definisce un vero cockney sotto uno dei più eleganti campanili della City progettati da Wren.',
  official_url='https://www.stmarylebow.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F5A195D0' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmarylebow.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-F5A195D0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Mary’s Harrow on the Hill was consecrated in 1094 and occupies the borough’s highest point. Medieval fabric, a landmark spire, ancient churchyard and memorials associated with Harrow School—including the spot where Byron dreamed—create a remarkable hilltop historical landscape.', description_it='St Mary’s Harrow on the Hill fu consacrata nel 1094 e occupa il punto più alto del borough. Strutture medievali, guglia dominante, antico cimitero e memorie legate alla Harrow School, compreso il luogo caro a Byron, formano un notevole paesaggio storico.',
  editorial_hook_en='An ancient hilltop church, visible across northwest London, shares its churchyard with memories of Byron and Harrow School.', editorial_hook_it='Un’antica chiesa in cima alla collina, visibile da tutta la zona nord-occidentale, condivide il sagrato con ricordi di Byron e Harrow School.',
  official_url='https://stmarysharrow.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B977AF30' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://stmarysharrow.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-B977AF30'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Mary’s Hornsey Rise is a community-focused Anglican church serving the Andover Estate and surrounding streets. The present building and its active hall support worship, food and family programmes, making the site valuable less as a monument than as a working piece of neighbourhood infrastructure.', description_it='St Mary’s Hornsey Rise è una chiesa anglicana fortemente comunitaria al servizio dell’Andover Estate e delle strade vicine. L’edificio e la sala sostengono culto, iniziative alimentari e attività per famiglie, come infrastruttura viva del quartiere più che come monumento.',
  editorial_hook_en='This modest Hornsey Rise church is best understood through the food, family and community work happening inside.', editorial_hook_it='Questa semplice chiesa di Hornsey Rise si comprende soprattutto attraverso le attività alimentari, familiari e comunitarie che ospita.',
  official_url='https://www.stmaryshornseyrise.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-53E02D56' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmaryshornseyrise.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-53E02D56'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Thomas Hardwick completed the present St Marylebone Parish Church in 1817 with a Corinthian portico and a graceful cupola. Its crypt, historic organ, stained glass and associations with figures from Charles Dickens to Elizabeth Barrett Browning reflect the changing life of Marylebone.', description_it='Thomas Hardwick completò l’attuale St Marylebone Parish Church nel 1817 con portico corinzio e aggraziata cupola. Cripta, organo storico, vetrate e legami con figure da Charles Dickens a Elizabeth Barrett Browning riflettono la vita mutevole di Marylebone.',
  editorial_hook_en='A Regency portico and cupola shelter a parish history entwined with Dickens, Browning and medical Marylebone.', editorial_hook_it='Un portico Regency e una cupola custodiscono una storia parrocchiale intrecciata con Dickens, Browning e la Marylebone medica.',
  official_url='https://stmarylebone.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7A5189CE' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://stmarylebone.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-7A5189CE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Olave Hart Street is a rare medieval City church that escaped the Great Fire. Its low nave, Tudor monuments and crypt carry associations with Samuel Pepys, who worshipped here and is buried beside his wife, while the skull-crowned churchyard gate inspired Dickens.', description_it='St Olave Hart Street è una rara chiesa medievale della City sfuggita al Grande Incendio. La bassa navata, i monumenti Tudor e la cripta ricordano Samuel Pepys, qui sepolto con la moglie, mentre il portale del sagrato coronato da teschi ispirò Dickens.',
  editorial_hook_en='Pepys lies beneath a medieval survivor whose skull-topped gate gave Dickens the name ‘St Ghastly Grim.’', editorial_hook_it='Pepys riposa in una chiesa medievale il cui portale coronato da teschi spinse Dickens a chiamarla “St Ghastly Grim”.',
  official_url='https://www.stolavehartstreet.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D038802D' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stolavehartstreet.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-D038802D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Pancras Old Church stands beside the lost Fleet River on a site with ancient Christian associations, although much of the building was renewed in 1848. The churchyard contains the Hardy Tree memorial, Sir John Soane’s family mausoleum and graves tied to London’s literary and migrant history.', description_it='St Pancras Old Church sorge presso il corso scomparso del Fleet su un sito di antiche tradizioni cristiane, anche se gran parte dell’edificio fu rinnovata nel 1848. Il sagrato ospita il memoriale Hardy Tree, il mausoleo Soane e tombe legate alla storia letteraria e migrante.',
  editorial_hook_en='An ancient-feeling churchyard beside the lost Fleet gathers the Hardy Tree, Soane’s tomb and layers of literary London.', editorial_hook_it='Un sagrato dall’atmosfera antica presso il Fleet scomparso riunisce Hardy Tree, tomba Soane e strati di Londra letteraria.',
  official_url='https://stpancrasoldchurch.posp.co.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R5' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://stpancrasoldchurch.posp.co.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='R5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Patrick’s Soho Square traces its mission to 1792 and occupies a church rebuilt in 1893, with a major restoration completed in 2011. Its Italianate interior, extensive outreach to homeless and vulnerable people and long connection to Soho’s migrant communities define the parish.', description_it='St Patrick’s Soho Square fa risalire la propria missione al 1792 e occupa una chiesa ricostruita nel 1893, restaurata profondamente nel 2011. L’interno italianeggiante, l’aiuto a persone senza dimora e il legame con le comunità migranti definiscono la parrocchia.',
  editorial_hook_en='Behind Soho Square’s façade, ornate Catholic worship and practical outreach to vulnerable Londoners share one home.', editorial_hook_it='Dietro la facciata di Soho Square convivono culto cattolico riccamente decorato e aiuto concreto ai londinesi vulnerabili.',
  official_url='https://stpatricksoho.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9832DDAE' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://stpatricksoho.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-9832DDAE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Paul’s Knightsbridge opened in 1843 and became a formative church of the Victorian Anglo-Catholic revival. Its richly coloured interior, rood screen, sculpture and memorials—including an acclaimed memorial to First World War nurse Fanny—contrast sharply with the restrained brick exterior.', description_it='St Paul’s Knightsbridge aprì nel 1843 e divenne un luogo fondamentale della rinascita anglo-cattolica vittoriana. L’interno ricco di colore, il tramezzo, le sculture e i monumenti, compreso quello alla nurse Fanny della Prima guerra mondiale, contrastano con l’esterno sobrio.',
  editorial_hook_en='A restrained Knightsbridge exterior gives way to one of London’s richest Anglo-Catholic interiors and a haunting nurses’ memorial.', editorial_hook_it='Un esterno sobrio a Knightsbridge introduce a uno dei più ricchi interni anglo-cattolici di Londra e a un toccante monumento alle infermiere.',
  official_url='https://www.stpaulsknightsbridge.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-020AE92F' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stpaulsknightsbridge.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-020AE92F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Christopher Wren rebuilt St Stephen Walbrook in the 1670s and used its pioneering dome as a testing ground before St Paul’s Cathedral. Twelve Corinthian columns create a luminous centralised interior, now focused on Henry Moore’s circular stone altar and the church’s Samaritans legacy.', description_it='Christopher Wren ricostruì St Stephen Walbrook negli anni 1670 e usò la cupola innovativa come prova prima di St Paul’s Cathedral. Dodici colonne corinzie formano un luminoso interno centrale, oggi segnato dall’altare circolare di Henry Moore e dall’eredità dei Samaritans.',
  editorial_hook_en='Wren’s rehearsal for St Paul’s dome now centres on a radical circular altar carved by Henry Moore.', editorial_hook_it='La prova di Wren per la cupola di St Paul’s ruota oggi attorno al radicale altare circolare scolpito da Henry Moore.',
  official_url='https://www.ststephenwalbrook.net/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R12' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.ststephenwalbrook.net/','official-or-authoritative','2026-10-13' FROM places WHERE id='R12'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Benet Paul’s Wharf was rebuilt by Wren in 1683 and is his only City church to retain its original internal arrangement substantially intact. Since 1879 it has served London’s Welsh-speaking Anglican community, pairing a compact Baroque interior with regular worship in Welsh.', description_it='St Benet Paul’s Wharf fu ricostruita da Wren nel 1683 ed è l’unica sua chiesa della City a conservare sostanzialmente l’assetto interno originale. Dal 1879 serve la comunità anglicana gallese di Londra, unendo un raccolto interno barocco al culto in lingua gallese.',
  editorial_hook_en='Wren’s best-preserved original City interior has carried Welsh-language Anglican worship since Victorian times.', editorial_hook_it='L’interno originale di Wren meglio conservato nella City ospita culto anglicano in gallese dall’epoca vittoriana.',
  official_url='https://www.stbenetwelshchurch.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E08F15AC' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stbenetwelshchurch.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-E08F15AC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Etheldreda’s is the surviving chapel of the medieval bishops of Ely, built in the late thirteenth century. Its undercroft, stone vaulting and stained glass make it one of London’s oldest Catholic churches and a rare intact fragment of a great medieval town palace.', description_it='St Etheldreda’s è la cappella superstite del palazzo medievale dei vescovi di Ely, costruita alla fine del XIII secolo. Cripta, volte in pietra e vetrate ne fanno una delle più antiche chiese cattoliche di Londra e un raro frammento integro di palazzo medievale.',
  editorial_hook_en='A narrow passage in Holborn leads to the thirteenth-century chapel and undercroft of the medieval bishops of Ely.', editorial_hook_it='Uno stretto passaggio a Holborn conduce alla cappella duecentesca e alla cripta dei vescovi medievali di Ely.',
  official_url='https://www.stetheldreda.com/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BC0453DA' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stetheldreda.com/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-BC0453DA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Mary The Boltons was designed by George Godwin and completed in 1850 at the centre of an elegant garden square. Its twin roofs, warm brick, stained glass and intimate scale make it a characteristic Victorian parish church embedded in the planned landscape of west Chelsea.', description_it='St Mary The Boltons fu progettata da George Godwin e completata nel 1850 al centro di un elegante giardino residenziale. Tetti gemelli, mattoni caldi, vetrate e scala intima ne fanno una tipica chiesa parrocchiale vittoriana inserita nel paesaggio pianificato di Chelsea ovest.',
  editorial_hook_en='A warm-brick Victorian church anchors the leafy, lens-shaped garden square of The Boltons.', editorial_hook_it='Una chiesa vittoriana in mattoni caldi occupa il cuore del verde giardino lenticolare dei Boltons.',
  official_url='https://www.stmarytheboltons.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5437A841' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stmarytheboltons.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-5437A841'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Christopher Wren’s St Paul’s Cathedral was completed in 1710 after the Great Fire and crowned by one of the world’s great domes. The nave, mosaics, crypt, monuments and dome galleries tell a national story of worship, art, war, science and ceremony across three centuries.', description_it='La St Paul’s Cathedral di Christopher Wren fu completata nel 1710 dopo il Grande Incendio e coronata da una delle grandi cupole del mondo. Navata, mosaici, cripta, monumenti e gallerie della cupola raccontano tre secoli di culto, arte, guerra, scienza e cerimonia nazionale.',
  editorial_hook_en='Climb Wren’s defining dome after exploring a cathedral of mosaics, national memorials and London resilience.', editorial_hook_it='Sali sulla cupola simbolo di Wren dopo aver esplorato una cattedrale di mosaici, memorie nazionali e resilienza londinese.',
  official_url='https://www.stpauls.co.uk/', access_notes_en='Visitor admission, worship access and opening times differ. Check the official site for the day’s schedule, tickets, closures and any areas reserved for services.', access_notes_it='Ingresso turistico, accesso al culto e orari sono distinti. Controlla il sito ufficiale per programma giornaliero, biglietti, chiusure e aree riservate alle funzioni.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9B4A399A' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stpauls.co.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-9B4A399A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Knights Templar built Temple Church in the late twelfth century, giving it a circular nave modelled on Jerusalem’s Holy Sepulchre. Medieval effigies of knights, the Gothic chancel, exceptional acoustics and its continuing role for Inner and Middle Temple unite crusading and legal history.', description_it='I Cavalieri Templari costruirono Temple Church alla fine del XII secolo, con navata circolare ispirata al Santo Sepolcro di Gerusalemme. Effigi medievali di cavalieri, coro gotico, acustica eccezionale e ruolo per Inner e Middle Temple uniscono storia crociata e legale.',
  editorial_hook_en='Stone knights lie inside the Templars’ round church at the historic heart of London’s legal world.', editorial_hook_it='Cavalieri di pietra riposano nella chiesa circolare dei Templari, cuore storico del mondo legale londinese.',
  official_url='https://www.templechurch.com/', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-176B80D9' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.templechurch.com/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-176B80D9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Katharine Cree was rebuilt in 1628–31, making it a rare City church from the decades between the Reformation and Wren. Its classical arcades, Jacobean furnishings, rose window and association with Archbishop Laud preserve an unusual pre-Civil War religious interior.', description_it='St Katharine Cree fu ricostruita nel 1628–31 ed è una rara chiesa della City del periodo tra Riforma e Wren. Arcate classiche, arredi giacobiani, rosone e legame con l’arcivescovo Laud conservano un insolito interno religioso precedente alla guerra civile.',
  editorial_hook_en='A rare pre-Civil War City church preserves Jacobean fittings and a bold classical experiment before Wren.', editorial_hook_it='Una rara chiesa della City precedente alla guerra civile conserva arredi giacobiani e un audace esperimento classico prima di Wren.',
  official_url='https://www.sanctuaryinthecity.net/st-katharine-cree', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6DEC2529' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.sanctuaryinthecity.net/st-katharine-cree','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-6DEC2529'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The King’s Chapel of the Savoy occupies the site of Henry VII’s Tudor hospital and is a Chapel Royal belonging directly to the monarch. Rebuilt after a fire in 1864, its intimate Victorian Gothic interior contains notable stained glass, heraldry and links to the Royal Victorian Order.', description_it='The King’s Chapel of the Savoy occupa il sito dell’ospedale Tudor di Enrico VII ed è una Chapel Royal appartenente direttamente al sovrano. Ricostruita dopo l’incendio del 1864, conserva un intimo interno gotico vittoriano con vetrate, araldica e legami con il Royal Victorian Order.',
  editorial_hook_en='A hidden Chapel Royal preserves Tudor foundations and royal ceremony behind the Strand.', editorial_hook_it='Una Chapel Royal nascosta conserva fondazioni Tudor e cerimoniale monarchico dietro lo Strand.',
  official_url='https://www.royalchapelsavoy.org/', access_notes_en='Public access is limited and may require a tour, appointment or attendance at a service or event. Check the official source before making a special journey.', access_notes_it='L’accesso pubblico è limitato e può richiedere una visita guidata, un appuntamento o la partecipazione a una funzione o a un evento. Controlla la fonte ufficiale prima di organizzare la visita.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R11' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalchapelsavoy.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='R11'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Welsh Church of Central London has served Welsh-speaking Nonconformists in the capital since the eighteenth century and occupies a purpose-built chapel in Eastcastle Street. Worship, preaching, music and social events continue primarily in Welsh, sustaining a distinctive cultural home in Fitzrovia.', description_it='La Welsh Church of Central London serve i nonconformisti di lingua gallese nella capitale dal Settecento e occupa una cappella appositamente costruita in Eastcastle Street. Culto, predicazione, musica ed eventi soprattutto in gallese mantengono una casa culturale distinta a Fitzrovia.',
  editorial_hook_en='Welsh-language hymns and preaching sustain a living piece of Wales in the middle of Fitzrovia.', editorial_hook_it='Inni e predicazione in gallese mantengono vivo un frammento del Galles nel cuore di Fitzrovia.',
  official_url='https://www.eglwysgymreiglundain.org/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-67B94737' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.eglwysgymreiglundain.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-67B94737'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Opened in 1841 as one of the Magnificent Seven, Tower Hamlets Cemetery closed to burials and became London’s first urban woodland nature reserve. War memorials, ivy-covered graves, mature trees and local volunteers now make it both a record of East End communities and a rich wildlife habitat.', description_it='Aperto nel 1841 come uno dei Magnificent Seven, Tower Hamlets Cemetery fu chiuso alle sepolture e divenne la prima riserva naturale boscosa urbana di Londra. Monumenti di guerra, tombe coperte d’edera, alberi maturi e volontari raccontano le comunità dell’East End e la biodiversità.',
  editorial_hook_en='East End social history and genuine urban woodland have grown together across a former Victorian cemetery.', editorial_hook_it='Storia sociale dell’East End e vero bosco urbano sono cresciuti insieme in un ex cimitero vittoriano.',
  official_url='https://www.fothcp.org/', access_notes_en='Cemetery grounds have daily gate times that can vary seasonally. Check the official site for current hours, tours and any restrictions on photography or access to chapels and catacombs.', access_notes_it='Il cimitero ha orari di apertura dei cancelli che possono variare secondo la stagione. Controlla il sito ufficiale per orari aggiornati, visite guidate e limitazioni a fotografie, cappelle o catacombe.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0D6B91CF' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.fothcp.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-0D6B91CF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Tyburn Convent stands near the former Tyburn gallows and was founded in 1903 by Benedictine Adorers of the Sacred Heart. Its shrine commemorates Catholic martyrs executed nearby, while the enclosed community maintains perpetual prayer in a quiet sanctuary just beyond Marble Arch.', description_it='Tyburn Convent sorge vicino all’antico patibolo di Tyburn e fu fondato nel 1903 dalle Benedettine Adoratrici del Sacro Cuore. Il santuario commemora i martiri cattolici giustiziati nei pressi, mentre la comunità di clausura mantiene la preghiera perpetua vicino a Marble Arch.',
  editorial_hook_en='Beside the memory of Tyburn’s gallows, an enclosed Benedictine community keeps a shrine to executed Catholic martyrs.', editorial_hook_it='Accanto alla memoria del patibolo di Tyburn, una comunità benedettina di clausura custodisce un santuario ai martiri cattolici giustiziati.',
  official_url='https://www.tyburnconvent.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-870B1D53' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.tyburnconvent.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-870B1D53'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Ukrainian Catholic Cathedral of the Holy Family in Exile occupies a red-brick church designed by Alfred Waterhouse and acquired by the Ukrainian community in 1967. Its iconostasis, icons and Byzantine liturgy give architectural form to a diaspora shaped by displacement and renewed by recent arrivals.', description_it='La cattedrale greco-cattolica ucraina della Sacra Famiglia in Esilio occupa una chiesa in mattoni rossi di Alfred Waterhouse, acquisita dalla comunità nel 1967. Iconostasi, icone e liturgia bizantina danno forma a una diaspora segnata dall’esilio e rinnovata dai nuovi arrivi.',
  editorial_hook_en='Waterhouse’s red-brick church has become an icon-filled spiritual home for generations of Ukrainians in exile.', editorial_hook_it='La chiesa in mattoni rossi di Waterhouse è diventata una casa spirituale colma di icone per generazioni di ucraini in esilio.',
  official_url='https://parish.rcdow.org.uk/ukrainianchurch/about-the-parish/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='R6' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://parish.rcdow.org.uk/ukrainianchurch/about-the-parish/','official-or-authoritative','2026-10-13' FROM places WHERE id='R6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='West Norwood opened in 1837 as the South Metropolitan Cemetery and is one of London’s Magnificent Seven. Its Greek Orthodox necropolis, Gothic monuments, catacombs and graves of scientists, artists and reformers survive within a dramatic landscape that also contains a modern crematorium.', description_it='West Norwood aprì nel 1837 come South Metropolitan Cemetery ed è uno dei Magnificent Seven. Necropoli greco-ortodossa, monumenti gotici, catacombe e tombe di scienziati, artisti e riformatori sopravvivono in un paesaggio suggestivo con crematorio moderno.',
  editorial_hook_en='A Greek necropolis, Gothic monuments and hidden catacombs make West Norwood one of London’s richest cemetery landscapes.', editorial_hook_it='Una necropoli greca, monumenti gotici e catacombe nascoste fanno di West Norwood uno dei paesaggi cimiteriali più ricchi di Londra.',
  official_url='https://www.fownc.org/', access_notes_en='Cemetery grounds have daily gate times that can vary seasonally. Check the official site for current hours, tours and any restrictions on photography or access to chapels and catacombs.', access_notes_it='Il cimitero ha orari di apertura dei cancelli che possono variare secondo la stagione. Controlla il sito ufficiale per orari aggiornati, visite guidate e limitazioni a fotografie, cappelle o catacombe.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CB5ABCE5' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.fownc.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-CB5ABCE5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Westminster Abbey is a royal church with more than a thousand years of history and the coronation site of English and British monarchs since 1066. Henry III’s Gothic rebuilding, the Cosmati pavement, royal tombs, Poets’ Corner and Chapter House form an unmatched national archive in stone.', description_it='Westminster Abbey è una chiesa reale con oltre mille anni di storia e sede delle incoronazioni dei monarchi inglesi e britannici dal 1066. La ricostruzione gotica di Enrico III, il pavimento cosmatesco, le tombe reali, Poets’ Corner e la Chapter House formano un archivio nazionale in pietra.',
  editorial_hook_en='Coronations, royal tombs, poets and a medieval Cosmati pavement make the Abbey Britain’s ceremonial memory in stone.', editorial_hook_it='Incoronazioni, tombe reali, poeti e un pavimento cosmatesco medievale fanno dell’Abbazia la memoria cerimoniale britannica in pietra.',
  official_url='https://www.westminster-abbey.org/', access_notes_en='Visitor admission, worship access and opening times differ. Check the official site for the day’s schedule, tickets, closures and any areas reserved for services.', access_notes_it='Ingresso turistico, accesso al culto e orari sono distinti. Controlla il sito ufficiale per programma giornaliero, biglietti, chiusure e aree riservate alle funzioni.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-8944F43B' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.westminster-abbey.org/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-8944F43B'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Westminster Cathedral, opened in 1903, is the mother church of Roman Catholics in England and Wales. John Francis Bentley’s striped brick Byzantine design centres on a vast nave, baldacchino and marble-lined chapels, while much of the upper interior remains dramatically unfinished.', description_it='Westminster Cathedral, aperta nel 1903, è la chiesa madre dei cattolici romani in Inghilterra e Galles. Il progetto bizantino in mattoni striati di John Francis Bentley comprende vasta navata, baldacchino e cappelle marmoree, mentre le parti alte restano suggestivamente incompiute.',
  editorial_hook_en='Striped brick, marble chapels and dark unfinished vaults give Britain’s Catholic mother church its singular Byzantine power.', editorial_hook_it='Mattoni striati, cappelle marmoree e scure volte incompiute danno alla chiesa madre cattolica britannica una singolare forza bizantina.',
  official_url='https://westminstercathedral.org.uk/', access_notes_en='Active place of worship. Visitor access may change around services, ceremonies and community events; check the official site before travelling and behave respectfully during worship.', access_notes_it='Luogo di culto attivo. L’accesso dei visitatori può variare durante funzioni, cerimonie ed eventi comunitari; controlla il sito ufficiale prima di partire e mantieni un comportamento rispettoso durante il culto.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BD9CA8DC' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://westminstercathedral.org.uk/','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-BD9CA8DC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Opened in 1873, Willesden Jewish Cemetery is a Grade II-listed landscape and the resting place of many leading figures in British Jewish history. Its funerary architecture, mature grounds and House of Life visitor experience interpret traditions of mourning alongside stories of science, commerce, art and public service.', description_it='Aperto nel 1873, il cimitero ebraico di Willesden è un paesaggio di grado II e luogo di sepoltura di molte figure della storia ebraica britannica. Architettura funeraria, parco maturo e percorso House of Life raccontano lutto, scienza, commercio, arte e servizio pubblico.',
  editorial_hook_en='The House of Life opens a major Victorian Jewish cemetery through the stories of families who shaped modern Britain.', editorial_hook_it='La House of Life apre un grande cimitero ebraico vittoriano attraverso le storie di famiglie che contribuirono alla Gran Bretagna moderna.',
  official_url='https://www.theus.org.uk/category/willesden-cemetery', access_notes_en='Cemetery grounds have daily gate times that can vary seasonally. Check the official site for current hours, tours and any restrictions on photography or access to chapels and catacombs.', access_notes_it='Il cimitero ha orari di apertura dei cancelli che possono variare secondo la stagione. Controlla il sito ufficiale per orari aggiornati, visite guidate e limitazioni a fotografie, cappelle o catacombe.',
  last_verified_at='2026-10-13', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D7222CD8' AND category='RELIGIOUS';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.theus.org.uk/category/willesden-cemetery','official-or-authoritative','2026-10-13' FROM places WHERE id='LA-D7222CD8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

INSERT INTO app_meta(key,value,updated_at) VALUES ('religious_editorial_version','2026-10-13',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;
