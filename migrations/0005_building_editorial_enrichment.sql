-- Editorial enrichment for every published building place.
-- Research verified against the recorded sources on 2026-10-14.
CREATE TABLE IF NOT EXISTS place_editorial_sources (
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  source_url TEXT NOT NULL,
  source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative',
  verified_at TEXT NOT NULL,
  PRIMARY KEY(place_id, source_url)
);
CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);

UPDATE places SET description_en='30 St Mary Axe, completed in 2004 by Foster + Partners with Arup, replaced the bomb-damaged Baltic Exchange. Its tapering profile, spiralling light wells and triangulated steel diagrid made the ‘Gherkin’ a landmark of environmentally minded early twenty-first-century office design.', description_it='30 St Mary Axe, completato nel 2004 da Foster + Partners con Arup, sostituì il Baltic Exchange danneggiato da un attentato. Il profilo rastremato, i pozzi di luce a spirale e la maglia diagonale in acciaio hanno reso il “Gherkin” un simbolo dell’architettura sostenibile d’inizio secolo.',
  editorial_hook_en='A spiralling steel diagrid gives the Gherkin its instantly recognisable profile and column-free floors.', editorial_hook_it='Una maglia diagonale d’acciaio crea il profilo inconfondibile del Gherkin e piani privi di colonne.',
  official_url='https://www.fosterandpartners.com/projects/30-st-mary-axe', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5E8B92CE' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.fosterandpartners.com/projects/30-st-mary-axe','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-5E8B92CE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Society of Apothecaries established its hall on this site in 1632; most of the present courtyard complex was rebuilt after the Great Fire and completed in 1672. A sober brick exterior conceals a richly panelled Great Hall, court room and laboratory linked to the history of pharmacy and medical education.', description_it='La Society of Apothecaries si stabilì qui nel 1632; gran parte dell’attuale complesso a corte fu ricostruita dopo il Grande Incendio e completata nel 1672. Dietro il sobrio mattone si trovano la Great Hall rivestita in legno, la sala del tribunale e il laboratorio legati alla storia della farmacia e della medicina.',
  editorial_hook_en='One of the City’s oldest surviving livery halls hides seventeenth-century rooms behind a quiet courtyard.', editorial_hook_it='Una delle più antiche sedi delle corporazioni della City nasconde sale seicentesche dietro una corte discreta.',
  official_url='https://www.apothecaries.org/the-hall/', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DC429397' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.apothecaries.org/the-hall/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-DC429397'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Anish Kapoor and engineer Cecil Balmond designed the 114.5-metre ArcelorMittal Orbit as the sculptural landmark of the 2012 Olympic Park. Its looping red lattice deliberately resists a single viewpoint; Carsten Höller’s later tunnel slide coils around the structure on the descent.', description_it='Anish Kapoor e l’ingegnere Cecil Balmond progettarono l’ArcelorMittal Orbit, alto 114,5 metri, come landmark scultoreo del Parco Olimpico del 2012. Il reticolo rosso ad anelli cambia da ogni angolazione; lo scivolo a tubo aggiunto da Carsten Höller avvolge la struttura in discesa.',
  editorial_hook_en='Kapoor’s looping red tower turns engineering into a deliberately unstable-looking Olympic sculpture.', editorial_hook_it='La torre rossa ad anelli di Kapoor trasforma l’ingegneria in una scultura olimpica volutamente instabile.',
  official_url='https://www.queenelizabetholympicpark.co.uk/things-to-do/arcelormittal-orbit', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E731CFD2' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.queenelizabetholympicpark.co.uk/things-to-do/arcelormittal-orbit','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-E731CFD2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Chamberlin, Powell and Bon designed the Barbican Estate as a raised, traffic-separated city after wartime destruction. Built mainly from the 1960s to the 1980s, its bush-hammered concrete towers, terrace blocks, lake, gardens and elevated walkways form one of Britain’s most ambitious Brutalist residential ensembles.', description_it='Chamberlin, Powell and Bon progettarono il Barbican Estate come città sopraelevata e separata dal traffico dopo le distruzioni belliche. Costruito soprattutto tra anni Sessanta e Ottanta, unisce torri in cemento martellinato, blocchi terrazzati, lago, giardini e passerelle in uno dei maggiori complessi brutalisti britannici.',
  editorial_hook_en='Concrete towers, lakes and high walks turn a bomb-damaged district into a complete Brutalist cityscape.', editorial_hook_it='Torri di cemento, laghi e passerelle trasformano un quartiere bombardato in un paesaggio brutalista completo.',
  official_url='https://www.cityoflondon.gov.uk/services/barbican-estate', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-46163074' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cityoflondon.gov.uk/services/barbican-estate','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-46163074'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Broadcasting House opened in 1932 as the BBC’s purpose-built radio headquarters, designed by George Val Myer in a restrained Art Deco manner. Its curved Portland-stone prow carries Eric Gill’s controversial Prospero and Ariel sculpture; the later John Peel Wing expanded the complex for digital news broadcasting.', description_it='Broadcasting House aprì nel 1932 come sede radiofonica appositamente costruita per la BBC, progettata da George Val Myer in sobrio stile Art Déco. La prua curva in pietra di Portland reca la discussa scultura Prospero and Ariel di Eric Gill; la successiva John Peel Wing ampliò il complesso per le notizie digitali.',
  editorial_hook_en='The BBC’s stone-clad 1932 radio headquarters still reads like an ocean liner pointed down Regent Street.', editorial_hook_it='La sede radiofonica della BBC del 1932 sembra ancora un transatlantico di pietra puntato verso Regent Street.',
  official_url='https://www.bbc.co.uk/historyofthebbc/buildings/broadcasting-house/', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F21267DD' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bbc.co.uk/historyofthebbc/buildings/broadcasting-house/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-F21267DD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Beckenham Place Mansion was built in the 1760s for timber merchant and later MP John Cator, probably to designs associated with Stiff Leadbetter. The Palladian house crowns a broad park landscape; restored rooms now host exhibitions, studios, events and community uses.', description_it='Beckenham Place Mansion fu costruita negli anni 1760 per il mercante di legname e futuro parlamentare John Cator, probabilmente su progetto legato a Stiff Leadbetter. La villa palladiana domina un vasto parco; le sale restaurate ospitano mostre, studi, eventi e attività comunitarie.',
  editorial_hook_en='A Palladian merchant’s mansion now anchors the renewed landscape of Beckenham Place Park.', editorial_hook_it='Una villa palladiana di un mercante è oggi il fulcro del paesaggio rinnovato di Beckenham Place Park.',
  official_url='https://beckenhamplace.org/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-655E1E1C' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://beckenhamplace.org/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-655E1E1C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Bell House is a substantial Grade II-listed Georgian villa built in 1767 for stationer and later Lord Mayor Thomas Wright. Its symmetrical brick front, pedimented doorway, surviving interiors and walled garden recall Dulwich before suburban expansion; today a charity uses it for education and community events.', description_it='Bell House è una grande villa georgiana di grado II costruita nel 1767 per il cartolaio e futuro Lord Mayor Thomas Wright. La facciata simmetrica in mattoni, il portale a frontone, gli interni e il giardino murato ricordano Dulwich prima dell’espansione suburbana; oggi ospita attività educative e comunitarie.',
  editorial_hook_en='A 1767 merchant’s villa preserves Georgian Dulwich behind walls and mature garden trees.', editorial_hook_it='Una villa mercantile del 1767 conserva la Dulwich georgiana dietro muri e alberi maturi.',
  official_url='https://www.bellhouse.co.uk/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D96B5380' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bellhouse.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D96B5380'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='This pin coincides with Bolton House at 14–16 Cullum Street; no separate historic ‘Bollom House’ is documented at the mapped position. The surviving building is the 1907 Art Nouveau office with blue-white faience, arched windows and a foliage frieze described in the adjoining Bolton House entry.', description_it='Questo punto coincide con Bolton House ai numeri 14–16 di Cullum Street; nella posizione indicata non risulta documentato un edificio storico distinto chiamato “Bollom House”. L’edificio esistente è l’ufficio Art Nouveau del 1907 con maioliche bianche e blu, finestre ad arco e fregio vegetale descritto nella voce Bolton House.',
  editorial_hook_en='The mapped ‘Bollom House’ is a duplicate-name error for Cullum Street’s documented Bolton House.', editorial_hook_it='Il “Bollom House” della mappa è un duplicato errato del documentato Bolton House di Cullum Street.',
  official_url='', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C733D437' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://tilesoc.org.uk/tile-gazetteer/city-of-london.html','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C733D437'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Bolton House was completed in 1907 to designs by A. I. Selby, an unusually exuberant Art Nouveau survival in the commercial City. Blue, white and green faience frames tall arched windows, while foliage ornament and the heraldic device of Prior William Bolton animate its narrow Cullum Street façade.', description_it='Bolton House fu completata nel 1907 su progetto di A. I. Selby ed è una rara e vivace testimonianza Art Nouveau nella City commerciale. Maioliche blu, bianche e verdi incorniciano alte finestre ad arco; motivi vegetali e lo stemma del priore William Bolton animano la stretta facciata su Cullum Street.',
  editorial_hook_en='Blue-green faience and a foliage frieze make this 1907 office a rare City Art Nouveau flourish.', editorial_hook_it='Maioliche blu-verdi e un fregio vegetale rendono questo ufficio del 1907 un raro guizzo Art Nouveau nella City.',
  official_url='', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-488D2211' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://tilesoc.org.uk/tile-gazetteer/city-of-london.html','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-488D2211'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Boston Manor House was completed in 1623 for Lady Mary Reade and later occupied for centuries by the Clitherow family. The Jacobean brick manor preserves an exceptional State Drawing Room with a richly modelled plaster ceiling, alongside restored domestic rooms that reveal how the house changed over four hundred years.', description_it='Boston Manor House fu completata nel 1623 per Lady Mary Reade e fu poi abitata per secoli dalla famiglia Clitherow. La villa giacobiana in mattoni conserva un’eccezionale State Drawing Room con soffitto in stucco modellato e ambienti restaurati che mostrano quattro secoli di trasformazioni domestiche.',
  editorial_hook_en='A spectacular Jacobean plaster ceiling is the centrepiece of this restored 1623 manor house.', editorial_hook_it='Uno spettacolare soffitto giacobiano in stucco è il fulcro di questa villa restaurata del 1623.',
  official_url='https://bostonmanorhouse.org/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B11' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://bostonmanorhouse.org/','official-or-authoritative','2026-10-14' FROM places WHERE id='B11'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Buckingham House began as the Duke of Buckingham’s townhouse in 1703 and was acquired by George III in 1761. John Nash transformed it into a palace in the 1820s, Edward Blore completed the quadrangle, and the familiar east front and balcony were remodelled in the early twentieth century.', description_it='Buckingham House nacque nel 1703 come residenza cittadina del duca di Buckingham e fu acquistata da Giorgio III nel 1761. John Nash la trasformò in palazzo negli anni 1820, Edward Blore completò il quadrilatero e l’attuale facciata est con balcone fu rielaborata all’inizio del Novecento.',
  editorial_hook_en='Behind the ceremonial balcony lies a palace assembled in stages from an early-eighteenth-century house.', editorial_hook_it='Dietro il balcone cerimoniale si trova un palazzo costruito per fasi attorno a una casa del primo Settecento.',
  official_url='https://www.rct.uk/visit/buckingham-palace', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7319332B' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.rct.uk/visit/buckingham-palace','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-7319332B'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Canonbury Tower was built between about 1509 and 1532 as part of the country residence of the priors of St Bartholomew’s, Smithfield. The brick Tudor tower later housed figures including Francis Bacon and Oliver Goldsmith; its panelled rooms and rooftop views are normally seen only on arranged tours.', description_it='Canonbury Tower fu costruita tra circa il 1509 e il 1532 come parte della residenza di campagna dei priori di St Bartholomew’s a Smithfield. La torre Tudor in mattoni ospitò poi personaggi come Francis Bacon e Oliver Goldsmith; sale rivestite in legno e panorama dal tetto si visitano normalmente solo su prenotazione.',
  editorial_hook_en='Islington’s Tudor tower links a medieval priory estate with residents including Bacon and Goldsmith.', editorial_hook_it='La torre Tudor di Islington collega un’antica proprietà priorale a residenti come Bacon e Goldsmith.',
  official_url='https://www.canonburytower.com/', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B10' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.canonburytower.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='B10'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Carshalton Water Tower was built in the early eighteenth century to supply Carshalton House and its formal gardens. The compact Baroque garden building combined a water-powered pump with an orangery, saloon and tiled plunge bath; surviving machinery and restored garden structures explain both engineering and leisure on the estate.', description_it='La Carshalton Water Tower fu costruita all’inizio del Settecento per rifornire Carshalton House e i suoi giardini formali. Il piccolo edificio barocco riuniva pompa idraulica, aranciera, salone e vasca rivestita di piastrelle; macchinari e strutture restaurate raccontano ingegneria e svago della tenuta.',
  editorial_hook_en='A Baroque garden ornament ingeniously combined an orangery, plunge bath and water-pumping machinery.', editorial_hook_it='Un ornamento barocco da giardino riuniva ingegnosamente aranciera, vasca e macchinari per pompare l’acqua.',
  official_url='https://carshaltonwatertower.co.uk/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-AF078B4E' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://carshaltonwatertower.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-AF078B4E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Central Hall Westminster was built in 1905–11 by Lanchester and Rickards as a monumental Methodist meeting place opposite Westminster Abbey. Its steel-framed domed auditorium hosted the first meeting of the United Nations General Assembly in 1946 and continues to serve worship, conferences and public events.', description_it='Central Hall Westminster fu costruita nel 1905–11 da Lanchester e Rickards come monumentale sede metodista di fronte a Westminster Abbey. L’auditorium a cupola con struttura d’acciaio ospitò nel 1946 la prima riunione dell’Assemblea generale delle Nazioni Unite e continua ad accogliere culto, conferenze ed eventi.',
  editorial_hook_en='A vast Methodist dome opposite the Abbey hosted the UN General Assembly’s first meeting in 1946.', editorial_hook_it='Una vasta cupola metodista di fronte all’Abbazia ospitò nel 1946 la prima Assemblea generale dell’ONU.',
  official_url='https://www.c-h-w.com/about-us/our-history/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-195EC386' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.c-h-w.com/about-us/our-history/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-195EC386'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='John Nash designed Clarence House in 1825–27 for the Duke of Clarence, the future William IV, beside St James’s Palace. Successive royal residents altered its restrained stucco interiors; it is now the London residence of King Charles III and Queen Camilla and opens only under limited seasonal arrangements.', description_it='John Nash progettò Clarence House nel 1825–27 per il duca di Clarence, futuro Guglielmo IV, accanto a St James’s Palace. I successivi residenti reali modificarono i sobri interni in stucco; oggi è la residenza londinese di re Carlo III e della regina Camilla e apre solo in periodi limitati.',
  editorial_hook_en='Nash’s restrained 1820s royal townhouse remains a working residence beside St James’s Palace.', editorial_hook_it='La sobria residenza reale degli anni 1820 progettata da Nash è ancora in uso accanto a St James’s Palace.',
  official_url='https://www.rct.uk/visit/clarence-house', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C6853AF0' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.rct.uk/visit/clarence-house','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C6853AF0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Sir Robert Taylor designed Danson House in the 1760s for sugar merchant Sir John Boyd, placing the compact Palladian villa above a landscaped lake. Rescued from severe decay and restored by English Heritage and Bexley, it retains an oval salon, decorative plasterwork and carefully reconstructed period colour schemes.', description_it='Sir Robert Taylor progettò Danson House negli anni 1760 per il mercante di zucchero Sir John Boyd, collocando la compatta villa palladiana sopra un lago paesaggistico. Salvata dal degrado e restaurata da English Heritage e Bexley, conserva salone ovale, stucchi e colori d’epoca ricostruiti.',
  editorial_hook_en='A restored Palladian villa rises above Danson Park’s lake with an elegant oval salon at its heart.', editorial_hook_it='Una villa palladiana restaurata domina il lago di Danson Park con un elegante salone ovale al centro.',
  official_url='https://www.bexley.gov.uk/services/leisure-parks-and-libraries/danson-house', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FDC2CED0' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bexley.gov.uk/services/leisure-parks-and-libraries/danson-house','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-FDC2CED0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Halsey Ricardo designed Debenham House in 1905–07 for department-store owner Ernest Debenham. The Grade I Arts and Crafts house uses deep green and blue glazed bricks, Royal Doulton Carrara ware and William De Morgan mosaics to create one of London’s most richly coloured private façades.', description_it='Halsey Ricardo progettò Debenham House nel 1905–07 per Ernest Debenham, proprietario dei grandi magazzini. La casa Arts and Crafts di grado I usa mattoni smaltati verde e blu, ceramica Carrara di Royal Doulton e mosaici di William De Morgan, creando una delle facciate private più colorate di Londra.',
  editorial_hook_en='Glazed blue-green brick and De Morgan mosaics turn this Arts and Crafts house into a ceramic jewel.', editorial_hook_it='Mattoni smaltati blu-verdi e mosaici di De Morgan trasformano questa casa Arts and Crafts in un gioiello ceramico.',
  official_url='', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CA5AFA5D' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1080783','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-CA5AFA5D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The surviving Doulton building, now Southbank House, was completed in 1878 by Robert Stark Wilkinson as offices and a showroom for the Lambeth pottery. Red brick, buff and pink terracotta, a corner turret and George Tinworth reliefs made the façade a permanent catalogue of Doulton craftsmanship.', description_it='L’edificio Doulton superstite, oggi Southbank House, fu completato nel 1878 da Robert Stark Wilkinson come uffici e showroom della ceramica di Lambeth. Mattoni rossi, terracotta rosa e color crema, una torretta angolare e rilievi di George Tinworth trasformarono la facciata in un catalogo permanente dell’abilità Doulton.',
  editorial_hook_en='Doulton used its own terracotta and sculpted reliefs to make this Victorian headquarters a full-scale showroom.', editorial_hook_it='Doulton usò la propria terracotta e rilievi scolpiti per trasformare la sede vittoriana in uno showroom a grandezza naturale.',
  official_url='', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3A8DA488' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lambeth.gov.uk/sites/default/files/2021-07/CA57AlbertEmbankmentDesignationReport.pdf','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-3A8DA488'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Emirates Stadium opened in 2006 as Arsenal Football Club’s new home, designed by HOK Sport, now Populous. Its four-tier bowl seats more than 60,000 spectators beneath a sweeping roof; the surrounding podium, bridges, statues and giant player graphics turn match-day circulation into a club history display.', description_it='L’Emirates Stadium aprì nel 2006 come nuova casa dell’Arsenal, progettato da HOK Sport, oggi Populous. L’anello a quattro livelli accoglie oltre 60.000 spettatori sotto una copertura continua; podio, ponti, statue e grandi immagini dei giocatori trasformano il percorso dei tifosi in un racconto del club.',
  editorial_hook_en='Arsenal’s four-tier bowl wraps more than 60,000 seats in a continuous roof and club-history podium.', editorial_hook_it='L’anello a quattro livelli dell’Arsenal racchiude oltre 60.000 posti sotto una copertura continua e un podio celebrativo.',
  official_url='https://www.arsenal.com/the-club/emirates-stadium', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B8C78714' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.arsenal.com/the-club/emirates-stadium','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-B8C78714'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Farm House at 22 Farm Street is an early-twentieth-century rebuilding of a house whose site preserves the memory of Mayfair’s former Hay Hill Farm. Its theatrical half-timbered Gothic façade, leaded windows and reused Jacobean interior woodwork contrast sharply with the restrained stucco terraces around it.', description_it='Farm House al 22 di Farm Street è una ricostruzione del primo Novecento di una casa il cui sito conserva il ricordo dell’antica Hay Hill Farm di Mayfair. La scenografica facciata gotica a graticcio, le finestre piombate e gli elementi lignei giacobiani riutilizzati contrastano con le sobrie case in stucco circostanti.',
  editorial_hook_en='A theatrical half-timbered farmhouse fantasy interrupts Mayfair’s orderly stucco terraces.', editorial_hook_it='Una fantasiosa casa rurale a graticcio interrompe l’ordine delle terrazze in stucco di Mayfair.',
  official_url='', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5850CBFC' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wetherell.co.uk/articles/gothic-farm-house-exudes-grandeur-and-mayfair-history','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-5850CBFC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Forty Hall was built in 1629–32 for Sir Nicholas Rainton, a wealthy City haberdasher who became Lord Mayor of London. The symmetrical Jacobean house combines red brick, classical detail and a compact courtyard plan; its interiors and estate landscape trace the relationship between London wealth and the rural Lea valley.', description_it='Forty Hall fu costruita nel 1629–32 per Sir Nicholas Rainton, ricco merciaio della City e futuro Lord Mayor. La simmetrica casa giacobiana combina mattoni rossi, dettagli classici e una corte compatta; interni e paesaggio della tenuta mostrano il legame tra ricchezza londinese e campagna della valle del Lea.',
  editorial_hook_en='A City merchant’s 1630s country house survives with its Jacobean courtyard and Lea-valley estate.', editorial_hook_it='La casa di campagna seicentesca di un mercante della City conserva corte giacobiana e tenuta nella valle del Lea.',
  official_url='https://www.fortyhallestate.co.uk/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2645EF9B' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.fortyhallestate.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-2645EF9B'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Fulham Palace was the country residence of the bishops of London for more than twelve centuries, from around 704 until 1973. The surviving Tudor courtyard, Georgian rooms, chapel, museum and thirteen-acre botanical garden reveal repeated rebuilding as well as the bishops’ global plant collecting.', description_it='Fulham Palace fu la residenza di campagna dei vescovi di Londra per oltre dodici secoli, dal circa 704 al 1973. La corte Tudor, le sale georgiane, la cappella, il museo e il giardino botanico di tredici acri raccontano continue ricostruzioni e la raccolta mondiale di piante dei vescovi.',
  editorial_hook_en='A Tudor courtyard and botanical garden preserve twelve centuries of the bishops of London’s country estate.', editorial_hook_it='Una corte Tudor e un giardino botanico conservano dodici secoli della tenuta di campagna dei vescovi di Londra.',
  official_url='https://www.fulhampalace.org/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-609640E0' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.fulhampalace.org/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-609640E0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='This record marks one of the Victorian houses on Garnault Place rather than a separately named public monument. Stock brick, sash windows and modest classical dressings contribute to the small Clerkenwell square developed on the former New River Company estate beside New River Head and Sadler’s Wells.', description_it='Questa voce indica una delle case vittoriane di Garnault Place, non un monumento pubblico con nome proprio. Mattoni gialli, finestre a ghigliottina e sobri dettagli classici contribuiscono alla piccola piazza di Clerkenwell sviluppata sull’antica proprietà della New River Company accanto a New River Head e Sadler’s Wells.',
  editorial_hook_en='A modest Victorian house gains meaning from Garnault Place’s compact New River Company estate setting.', editorial_hook_it='Una modesta casa vittoriana acquista significato nel raccolto contesto della proprietà della New River Company.',
  official_url='https://www.islington.gov.uk/planning/conservation', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-37145B89' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.islington.gov.uk/planning/conservation','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-37145B89'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Gillette factory opened on the Great West Road in 1937, designed by Sir Banister Fletcher’s practice as a landmark headquarters and manufacturing plant. Its symmetrical Art Deco frontage, long white colonnade, stepped clock tower and neon name advertised modern mass production to motorists on the ‘Golden Mile’.', description_it='La fabbrica Gillette aprì sulla Great West Road nel 1937, progettata dallo studio di Sir Banister Fletcher come sede e stabilimento monumentale. La facciata Art Déco simmetrica, il lungo colonnato bianco, la torre dell’orologio a gradoni e il nome al neon pubblicizzavano la produzione moderna agli automobilisti del “Golden Mile”.',
  editorial_hook_en='A stepped clock tower and long white colonnade made Gillette’s factory the emblem of the Great West Road.', editorial_hook_it='Torre dell’orologio a gradoni e lungo colonnato bianco fecero della fabbrica Gillette l’emblema della Great West Road.',
  official_url='', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4C69C257' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1079609','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-4C69C257'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Granada Tooting opened in 1931, designed by Cecil Masey with spectacular interiors by theatre designer Theodore Komisarjevsky. Behind the restrained façade lies a fantasy of Gothic, Moorish and Spanish Baroque detail; the Grade I auditorium later became a bingo hall while retaining much of its original decoration.', description_it='Il Granada Tooting aprì nel 1931, progettato da Cecil Masey con spettacolari interni dello scenografo Theodore Komisarjevsky. Dietro la facciata sobria si nasconde una fantasia gotica, moresca e barocca spagnola; l’auditorium di grado I divenne poi sala bingo conservando gran parte della decorazione originale.',
  editorial_hook_en='Komisarjevsky’s fantastical Moorish-Gothic auditorium survives inside an otherwise restrained 1931 cinema.', editorial_hook_it='Il fantastico auditorium moresco-gotico di Komisarjevsky sopravvive dentro un cinema del 1931 dall’esterno sobrio.',
  official_url='', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B4' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1065472','official-or-authoritative','2026-10-14' FROM places WHERE id='B4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Hall Place began in 1537 as a Tudor mansion built for former Lord Mayor Sir John Champneys, using an eye-catching chequerboard of flint and stone. A seventeenth-century brick extension doubled the house; panelled rooms, a Great Hall, heraldic details and formal riverside gardens reveal its layered ownership.', description_it='Hall Place nacque nel 1537 come villa Tudor per l’ex Lord Mayor Sir John Champneys, con un vistoso motivo a scacchiera di selce e pietra. Un ampliamento seicentesco in mattoni raddoppiò la casa; sale rivestite in legno, Great Hall, stemmi e giardini sul fiume raccontano i diversi proprietari.',
  editorial_hook_en='Tudor flint-and-stone chequerwork meets a red-brick Jacobean extension beside the River Cray.', editorial_hook_it='La scacchiera Tudor di selce e pietra incontra un ampliamento giacobiano in mattoni rossi lungo il Cray.',
  official_url='https://www.hallplace.org.uk/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-248B4B8F' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.hallplace.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-248B4B8F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Ham House was built in 1610 for courtier Thomas Vavasour and transformed in the 1670s by the Duke and Duchess of Lauderdale. Its formal plan, richly furnished rooms, lacquer cabinets, textiles and gardens form an unusually complete record of elite Stuart taste and political ambition.', description_it='Ham House fu costruita nel 1610 per il cortigiano Thomas Vavasour e trasformata negli anni 1670 dal duca e dalla duchessa di Lauderdale. Pianta formale, sale riccamente arredate, mobili laccati, tessuti e giardini offrono una testimonianza eccezionalmente completa del gusto e dell’ambizione politica degli Stuart.',
  editorial_hook_en='Rich 1670s interiors and formal gardens make Ham House one of Britain’s most complete Stuart ensembles.', editorial_hook_it='Interni degli anni 1670 e giardini formali fanno di Ham House uno dei complessi Stuart più integri della Gran Bretagna.',
  official_url='https://www.nationaltrust.org.uk/visit/london/ham-house-and-garden', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B9' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nationaltrust.org.uk/visit/london/ham-house-and-garden','official-or-authoritative','2026-10-14' FROM places WHERE id='B9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Cardinal Wolsey began Hampton Court Palace around 1515 before Henry VIII took possession and expanded its Tudor courts, kitchens and Great Hall. William III and Mary II later commissioned Christopher Wren’s Baroque apartments; gardens, fountains and the famous maze preserve the palace’s competing royal visions.', description_it='Il cardinale Wolsey iniziò Hampton Court Palace intorno al 1515; Enrico VIII ne prese possesso e ampliò corti Tudor, cucine e Great Hall. Guglielmo III e Maria II affidarono poi a Christopher Wren gli appartamenti barocchi; giardini, fontane e il celebre labirinto conservano visioni reali concorrenti.',
  editorial_hook_en='Henry VIII’s Tudor courts collide spectacularly with Wren’s Baroque palace and formal gardens.', editorial_hook_it='Le corti Tudor di Enrico VIII incontrano in modo spettacolare il palazzo barocco di Wren e i giardini formali.',
  official_url='https://www.hrp.org.uk/hampton-court-palace/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6886A4AB' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.hrp.org.uk/hampton-court-palace/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-6886A4AB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Harmondsworth Great Barn was erected in 1425–27 by Winchester College to store grain from its manor. Twelve timber bays, huge aisle posts and an intact medieval roof create the scale that led John Betjeman to call it the ‘Cathedral of Middlesex’; it is among England’s finest surviving medieval barns.', description_it='Il Great Barn di Harmondsworth fu eretto nel 1425–27 dal Winchester College per conservare il grano della tenuta. Dodici campate lignee, enormi pilastri e il tetto medievale integro creano la scala che spinse John Betjeman a chiamarlo “Cattedrale del Middlesex”; è tra i migliori granai medievali inglesi.',
  editorial_hook_en='Twelve vast timber bays justify this fifteenth-century grain barn’s nickname, the ‘Cathedral of Middlesex’.', editorial_hook_it='Dodici immense campate lignee giustificano il soprannome di questo granaio quattrocentesco: “Cattedrale del Middlesex”.',
  official_url='https://www.english-heritage.org.uk/visit/places/harmondsworth-barn/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-42B3A62A' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.english-heritage.org.uk/visit/places/harmondsworth-barn/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-42B3A62A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='George Gilbert Scott designed Harrow School Chapel, completed in 1855, in a muscular Gothic Revival style suited to its hilltop setting. Flint and stone, a prominent bell turret, stained glass and memorial fittings make it both the school’s place of worship and a record of generations of pupils.', description_it='George Gilbert Scott progettò la cappella della Harrow School, completata nel 1855, in un deciso stile neogotico adatto alla posizione sulla collina. Selce e pietra, torre campanaria, vetrate e monumenti la rendono luogo di culto e memoria di generazioni di studenti.',
  editorial_hook_en='Scott’s flint-and-stone chapel gives Harrow’s hilltop campus its emphatic Victorian Gothic landmark.', editorial_hook_it='La cappella in selce e pietra di Scott dà al campus collinare di Harrow il suo deciso punto di riferimento neogotico.',
  official_url='https://www.harrowschool.org.uk/', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A8CCC3AB' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1193335','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-A8CCC3AB'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Old Speech Room was built in 1819–21 so Harrow pupils could practise public speaking before an audience. Now a gallery, it displays the school’s collections of antiquities, art, natural history, rare books and material connected with former pupils including Byron, Churchill and Cecil Beaton.', description_it='L’Old Speech Room fu costruita nel 1819–21 affinché gli studenti di Harrow potessero esercitarsi a parlare in pubblico. Oggi galleria, espone antichità, arte, storia naturale, libri rari e materiali legati ad ex allievi come Byron, Churchill e Cecil Beaton.',
  editorial_hook_en='A purpose-built 1820s speaking chamber now holds Harrow’s unusually wide teaching and alumni collections.', editorial_hook_it='Una sala degli anni 1820 nata per l’oratoria ospita oggi le ampie collezioni didattiche e storiche di Harrow.',
  official_url='https://www.harrowschool.org.uk/learning-2/arts-and-culture/old-speech-room-gallery', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B8AE762C' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.harrowschool.org.uk/learning-2/arts-and-culture/old-speech-room-gallery','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-B8AE762C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Ironmongers’ Hall was completed in 1925 by Sydney Tatchell for one of the City’s medieval livery companies. Its restrained Tudor Revival exterior gives way to oak panelling, heraldic glass, carved screens and historic portraits; remarkably, it survived the surrounding destruction of the Second World War.', description_it='Ironmongers’ Hall fu completata nel 1925 da Sydney Tatchell per una delle antiche corporazioni della City. L’esterno neotudor sobrio introduce pannelli di quercia, vetrate araldiche, schermi intagliati e ritratti storici; sopravvisse sorprendentemente alle distruzioni belliche circostanti.',
  editorial_hook_en='A 1920s Tudor Revival hall preserves the Ironmongers’ heraldry and collections amid the rebuilt Barbican district.', editorial_hook_it='Una sede neotudor degli anni Venti conserva araldica e collezioni degli Ironmongers nel quartiere ricostruito del Barbican.',
  official_url='https://www.ironmongers.org/the-hall/', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D62073EC' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.ironmongers.org/the-hall/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D62073EC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Robert Adam remodelled Kenwood House in the 1760s and 1770s for Lord Chief Justice Mansfield, adding its celebrated white-stucco library and north front. The free collection assembled by Edward Guinness, Earl of Iveagh, includes Rembrandt, Vermeer, Gainsborough and Reynolds within landscaped Hampstead Heath.', description_it='Robert Adam rinnovò Kenwood House negli anni 1760 e 1770 per il Lord Chief Justice Mansfield, aggiungendo la celebre biblioteca in stucco bianco e il fronte nord. La collezione gratuita di Edward Guinness, conte di Iveagh, comprende Rembrandt, Vermeer, Gainsborough e Reynolds nel paesaggio di Hampstead Heath.',
  editorial_hook_en='Adam’s luminous neoclassical library frames an exceptional free art collection on Hampstead Heath.', editorial_hook_it='La luminosa biblioteca neoclassica di Adam accoglie un’eccezionale collezione d’arte gratuita a Hampstead Heath.',
  official_url='https://www.english-heritage.org.uk/visit/places/kenwood/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B2' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.english-heritage.org.uk/visit/places/kenwood/','official-or-authoritative','2026-10-14' FROM places WHERE id='B2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='London Scottish House opened in 1886 as the drill hall and headquarters of the London Scottish Regiment. The red-brick building combines military utility with battlements, memorials and regimental emblems; its hall and rooms continue as an events venue while maintaining links to the regiment and its museum collection.', description_it='London Scottish House aprì nel 1886 come sala d’addestramento e quartier generale del London Scottish Regiment. L’edificio in mattoni rossi unisce funzione militare, merli, monumenti ed emblemi; sala e ambienti sono oggi sede di eventi mantenendo il legame con il reggimento e il suo museo.',
  editorial_hook_en='A castellated Victorian drill hall keeps the London Scottish Regiment’s identity visible in Westminster.', editorial_hook_it='Una sala d’addestramento vittoriana merlata mantiene visibile a Westminster l’identità del London Scottish Regiment.',
  official_url='https://www.londonscottishhouse.org/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B7' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.londonscottishhouse.org/','official-or-authoritative','2026-10-14' FROM places WHERE id='B7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Wapping Police Station stands on the Thames site used by the Marine Police since 1798, making it the historic base of one of the world’s earliest organised preventive police forces. The present riverside station dates largely from 1907 and remains the operational home of the Metropolitan Police Marine Policing Unit.', description_it='La stazione di polizia di Wapping occupa il sito sul Tamigi usato dalla Marine Police dal 1798, base storica di una delle prime forze di polizia preventiva organizzata al mondo. L’attuale edificio fluviale risale in gran parte al 1907 ed è ancora la sede operativa della Marine Policing Unit.',
  editorial_hook_en='London’s river police have worked from this Wapping site since 1798; the current station remains operational.', editorial_hook_it='La polizia fluviale di Londra opera da questo sito di Wapping dal 1798; la stazione è tuttora in servizio.',
  official_url='https://www.met.police.uk/police-forces/metropolitan-police/areas/c/careers/police-officer-roles/police-constable/overview/roles-and-opportunities/marine-policing-unit-mpu/', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-952AC374' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.met.police.uk/police-forces/metropolitan-police/areas/c/careers/police-officer-roles/police-constable/overview/roles-and-opportunities/marine-policing-unit-mpu/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-952AC374'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Michelin House was completed in 1911 by François Espinasse as the tyre company’s British headquarters, depot and fitting station. Its colourful tiled panels depict early motoring scenes and the Bibendum mascot, while stained-glass windows and curved corner turrets turn commercial branding into exuberant architecture.', description_it='Michelin House fu completata nel 1911 da François Espinasse come sede britannica, deposito e officina della casa di pneumatici. Pannelli di maiolica raffigurano scene automobilistiche e la mascotte Bibendum; vetrate e torrette curve trasformano il marchio commerciale in architettura esuberante.',
  editorial_hook_en='Bibendum stained glass and motoring tiles make Michelin’s 1911 headquarters an early masterpiece of brand architecture.', editorial_hook_it='Vetrate di Bibendum e piastrelle automobilistiche fanno della sede Michelin del 1911 un capolavoro precoce di architettura del marchio.',
  official_url='', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B12' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1080656','official-or-authoritative','2026-10-14' FROM places WHERE id='B12'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Squire & Partners designed Montcalm East, completed in 2015, as an optical landmark opposite Moorfields Eye Hospital. A faceted, diamond-like form and irregular diagonal windows make the façade appear to shift with viewpoint, while its lower skin lifts to reveal the hotel lobby, restaurant and public activity.', description_it='Squire & Partners progettò Montcalm East, completato nel 2015, come landmark ottico di fronte al Moorfields Eye Hospital. La forma sfaccettata a diamante e le finestre diagonali irregolari fanno cambiare la facciata con il punto di vista, mentre il rivestimento inferiore si solleva rivelando hall e ristorante.',
  editorial_hook_en='Diagonal windows turn a Shoreditch hotel into an optical illusion opposite Moorfields Eye Hospital.', editorial_hook_it='Finestre diagonali trasformano un hotel di Shoreditch in un’illusione ottica di fronte al Moorfields Eye Hospital.',
  official_url='https://montcalmcollection.com/montcalm-east', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-881D6645' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://squireandpartners.com/architecture/hospitality/montcalm-east-shoreditch/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-881D6645'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Fenton House is a late-seventeenth-century merchant’s house on Hampstead’s highest ground, acquired for the National Trust with the collection of Major Benton Fletcher. Panelled rooms contain early keyboard instruments, porcelain and needlework, while a walled garden preserves orchard, kitchen beds and formal planting.', description_it='Fenton House è una casa mercantile del tardo Seicento sul punto più alto di Hampstead, acquisita dal National Trust con la collezione del maggiore Benton Fletcher. Sale rivestite in legno ospitano antichi strumenti a tastiera, porcellane e ricami; il giardino murato conserva frutteto, orto e aiuole formali.',
  editorial_hook_en='Early keyboards fill a seventeenth-century merchant’s house above a walled Hampstead orchard.', editorial_hook_it='Antichi strumenti a tastiera riempiono una casa mercantile seicentesca sopra un frutteto murato di Hampstead.',
  official_url='https://www.nationaltrust.org.uk/visit/london/fenton-house-and-garden', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-7561A581' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nationaltrust.org.uk/visit/london/fenton-house-and-garden','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-7561A581'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Philip Webb designed Red House in 1859 for William and Jane Morris as a home shaped around art, craft and communal making. Red brick, steep roofs and an informal L-plan reject Victorian symmetry; furniture, stained glass and painted decoration by Morris’s circle helped seed the Arts and Crafts movement.', description_it='Philip Webb progettò Red House nel 1859 per William e Jane Morris come casa fondata su arte, artigianato e lavoro condiviso. Mattoni rossi, tetti ripidi e pianta a L rifiutano la simmetria vittoriana; mobili, vetrate e decorazioni del circolo di Morris contribuirono alla nascita dell’Arts and Crafts.',
  editorial_hook_en='Morris and Webb turned a red-brick family home into a manifesto for the Arts and Crafts movement.', editorial_hook_it='Morris e Webb trasformarono una casa familiare in mattoni rossi in un manifesto del movimento Arts and Crafts.',
  official_url='https://www.nationaltrust.org.uk/visit/london/red-house', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FEC30DB4' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nationaltrust.org.uk/visit/london/red-house','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-FEC30DB4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Sutton House was built in 1535 for Ralph Sadleir, a leading courtier of Henry VIII, and is the oldest surviving domestic building in Hackney. Its brick Tudor ranges contain an oak-panelled parlour, carved fireplace and courtyard, alongside later Georgian alterations and traces of its twentieth-century squatters.', description_it='Sutton House fu costruita nel 1535 per Ralph Sadleir, importante cortigiano di Enrico VIII, ed è il più antico edificio domestico superstite di Hackney. Le ali Tudor in mattoni conservano salotto in quercia, camino scolpito e corte, accanto ad aggiunte georgiane e tracce degli occupanti abusivi novecenteschi.',
  editorial_hook_en='Hackney’s oldest house layers a Tudor courtier’s brick home with Georgian rooms and squatter history.', editorial_hook_it='La casa più antica di Hackney sovrappone la dimora Tudor di un cortigiano, sale georgiane e storia degli squatters.',
  official_url='https://www.nationaltrust.org.uk/visit/london/sutton-house-and-breakers-yard', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-54A730BF' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nationaltrust.org.uk/visit/london/sutton-house-and-breakers-yard','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-54A730BF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Netil House is a former mid-twentieth-century council and educational building recast as a workspace for Hackney’s independent creative businesses. Its robust concrete frame now contains studios, workshops, food and music venues, while the rooftop looks across London Fields and the railway arches.', description_it='Netil House è un ex edificio civico e scolastico del Novecento trasformato in spazio di lavoro per attività creative indipendenti di Hackney. La robusta struttura in cemento ospita studi, laboratori, ristorazione e musica; dal tetto si guarda verso London Fields e gli archi ferroviari.',
  editorial_hook_en='A utilitarian concrete block has become a dense vertical neighbourhood of Hackney studios and venues.', editorial_hook_it='Un blocco utilitario in cemento è diventato un fitto quartiere verticale di studi e locali di Hackney.',
  official_url='https://www.netilhouse.com/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-04F0FB66' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.netilhouse.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-04F0FB66'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Charles Barry and A. W. N. Pugin rebuilt the Palace of Westminster after the fire of 1834, combining a rational parliamentary plan with intensely detailed Gothic Revival decoration. River terraces, courtyards, the hammer-beam Westminster Hall and the Elizabeth Tower form a working legislature layered over a medieval royal site.', description_it='Charles Barry e A. W. N. Pugin ricostruirono il Palace of Westminster dopo l’incendio del 1834, unendo una pianta parlamentare razionale a una ricchissima decorazione neogotica. Terrazze sul fiume, corti, Westminster Hall e Elizabeth Tower formano un parlamento attivo su un sito reale medievale.',
  editorial_hook_en='Barry’s disciplined plan and Pugin’s Gothic detail created the world’s most recognisable parliamentary complex.', editorial_hook_it='La pianta disciplinata di Barry e i dettagli gotici di Pugin crearono il complesso parlamentare più riconoscibile al mondo.',
  official_url='https://www.parliament.uk/visiting/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CECB7A4F' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.parliament.uk/visiting/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-CECB7A4F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The former Queens Cinema opened on Bishop’s Bridge Road in 1932 with a streamlined Art Deco façade. After the cinema closed in 1988, a 2014 redevelopment by Stiff + Trevillion retained and restored the curved landmark frontage, placing shops and new apartments behind its cream ceramic skin.', description_it='L’ex Queens Cinema aprì su Bishop’s Bridge Road nel 1932 con una facciata Art Déco aerodinamica. Dopo la chiusura nel 1988, il progetto del 2014 di Stiff + Trevillion conservò e restaurò il fronte curvo, inserendo negozi e nuovi appartamenti dietro il rivestimento ceramico color crema.',
  editorial_hook_en='A restored 1932 cinema façade now curves around shops and apartments at the edge of Bayswater.', editorial_hook_it='Una facciata cinematografica del 1932 restaurata avvolge oggi negozi e appartamenti ai margini di Bayswater.',
  official_url='', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FDFDE1A3' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.stiffandtrevillion.com/projects/queens-bayswater','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-FDFDE1A3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Rio traces its cinema use to 1909; the present auditorium and bold blue frontage were remodelled in 1937 by F. E. Bromige in an exuberant Art Deco style. Curving bands, a vertical fin and neon announce one of London’s longest-running independent cinemas, still screening repertory and new releases.', description_it='Il Rio ospita proiezioni dal 1909; l’attuale sala e la vivace facciata blu furono ridisegnate nel 1937 da F. E. Bromige in esuberante stile Art Déco. Fasce curve, pinna verticale e neon annunciano uno dei cinema indipendenti più longevi di Londra, ancora attivo con film nuovi e di repertorio.',
  editorial_hook_en='Bromige’s blue, neon-lit 1937 façade still announces a fiercely independent Dalston cinema.', editorial_hook_it='La facciata blu al neon progettata da Bromige nel 1937 annuncia ancora un cinema fieramente indipendente di Dalston.',
  official_url='https://www.riocinema.org.uk/about-us/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-12091D93' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.riocinema.org.uk/about-us/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-12091D93'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Royal Albert Hall opened in 1871 as part of Prince Albert’s vision for a district devoted to arts and science. Designed by Francis Fowke and Henry Y. D. Scott, its vast elliptical brick-and-terracotta drum carries a mosaic frieze; the famous suspended acoustic diffusers tame the domed auditorium’s echo.', description_it='La Royal Albert Hall aprì nel 1871 come parte della visione del principe Alberto per un quartiere dedicato ad arti e scienze. Progettata da Francis Fowke e Henry Y. D. Scott, la vasta ellisse in mattoni e terracotta porta un fregio musivo; i celebri diffusori sospesi correggono l’eco della cupola.',
  editorial_hook_en='A terracotta ellipse, mosaic frieze and airborne acoustic ‘mushrooms’ define Britain’s great circular concert hall.', editorial_hook_it='Un’ellisse in terracotta, un fregio musivo e i “funghi” acustici sospesi definiscono la grande sala da concerto circolare britannica.',
  official_url='https://www.royalalberthall.com/about-the-hall/our-history/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-180AF830' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalalberthall.com/about-the-hall/our-history/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-180AF830'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='George Edmund Street designed the Royal Courts of Justice, opened in 1882, as a vast Gothic Revival complex for the senior civil courts. A soaring stone Great Hall acts as its internal street, feeding an intricate network of courts, corridors, staircases and courtyards behind the Strand’s pinnacled façade.', description_it='George Edmund Street progettò le Royal Courts of Justice, aperte nel 1882, come vasto complesso neogotico per le corti civili superiori. La grande hall in pietra funge da strada interna, distribuendo un intricato sistema di aule, corridoi, scale e corti dietro la facciata a pinnacoli sullo Strand.',
  editorial_hook_en='Street’s soaring Great Hall forms the internal avenue of London’s labyrinthine Gothic law courts.', editorial_hook_it='La svettante Great Hall di Street forma il viale interno del labirintico palazzo di giustizia neogotico londinese.',
  official_url='https://www.gov.uk/courts-tribunals/royal-courts-of-justice', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D41325AD' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.gov.uk/courts-tribunals/royal-courts-of-justice','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D41325AD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Royal Embassy of Saudi Arabia occupies a purpose-built reconstruction of Nos. 30–32 Charles Street. The earlier Georgian terrace was replaced with a larger diplomatic complex whose carefully proportioned brick-and-stucco façade reproduces the rhythm of neighbouring Mayfair houses while concealing modern secure accommodation.', description_it='La Royal Embassy of Saudi Arabia occupa una ricostruzione appositamente realizzata dei numeri 30–32 di Charles Street. La precedente terrazza georgiana fu sostituita da un complesso diplomatico più grande, la cui facciata in mattoni e stucco riprende il ritmo delle case di Mayfair nascondendo spazi moderni e protetti.',
  editorial_hook_en='A modern secure embassy disguises its larger scale behind a carefully reconstructed Georgian Mayfair terrace.', editorial_hook_it='Una moderna ambasciata protetta nasconde la scala maggiore dietro una terrazza georgiana di Mayfair accuratamente ricostruita.',
  official_url='https://embassies.mofa.gov.sa/sites/uk/EN/Pages/default.aspx', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-181CA2D0' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.londonpicturearchive.org.uk/view-item?i=131618','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-181CA2D0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Edward Middleton Barry designed the Royal Opera House’s Floral Hall in 1858–60 as a glass-and-iron winter garden and flower market, inspired by the Crystal Palace. Restored and incorporated into the opera house redevelopment, its slender columns, sweeping stair and glazed barrel roof now form the public Paul Hamlyn Hall.', description_it='Edward Middleton Barry progettò il Floral Hall della Royal Opera House nel 1858–60 come giardino d’inverno e mercato dei fiori in vetro e ferro, ispirato al Crystal Palace. Restaurato e integrato nel teatro, con colonne sottili, grande scala e volta vetrata, è oggi la Paul Hamlyn Hall aperta al pubblico.',
  editorial_hook_en='A Crystal Palace-inspired flower market survives as the Royal Opera House’s luminous public foyer.', editorial_hook_it='Un mercato dei fiori ispirato al Crystal Palace sopravvive come luminoso foyer pubblico della Royal Opera House.',
  official_url='https://www.roh.org.uk/visit', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-514269D2' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.roh.org.uk/visit','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-514269D2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Royal Victoria Patriotic Building was constructed in 1857–59 by Rohde Hawkins as a school for daughters orphaned during the Crimean War. Its long, turreted Gothic Revival frontage later served military and hospital uses; restored after years of dereliction, it now contains studios, homes and hospitality spaces.', description_it='Il Royal Victoria Patriotic Building fu costruito nel 1857–59 da Rohde Hawkins come scuola per le figlie rimaste orfane durante la guerra di Crimea. La lunga facciata neogotica con torrette ebbe poi usi militari e ospedalieri; restaurata dopo anni di abbandono, ospita studi, abitazioni e locali.',
  editorial_hook_en='A turreted Crimean War orphan school has become a many-layered creative enclave on Wandsworth Common.', editorial_hook_it='Una scuola merlata per orfane della guerra di Crimea è diventata un complesso creativo stratificato a Wandsworth Common.',
  official_url='https://www.rvpb.com/history', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-20BFE633' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.rvpb.com/history','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-20BFE633'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Architect Richard Jupp built Severndroog Castle in 1784 for Lady James as a memorial to her husband, Commodore Sir William James, whose naval victory at Suvarnadurg inspired its name. The triangular Gothic tower crowns Shooter’s Hill; restored rooms and a roof platform give long views across London and Kent.', description_it='L’architetto Richard Jupp costruì Severndroog Castle nel 1784 per Lady James in memoria del marito, il commodoro Sir William James, la cui vittoria navale a Suvarnadurg ispirò il nome. La torre gotica triangolare corona Shooter’s Hill; sale restaurate e terrazza offrono ampie vedute su Londra e Kent.',
  editorial_hook_en='A triangular Georgian memorial tower turns a naval victory into one of south-east London’s best viewpoints.', editorial_hook_it='Una torre commemorativa georgiana triangolare trasforma una vittoria navale in uno dei migliori belvedere del sud-est di Londra.',
  official_url='https://severndroogcastle.org.uk/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B6' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://severndroogcastle.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='B6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Shakespeare’s Globe opened in 1997 after actor-director Sam Wanamaker’s campaign to recreate the open-air playhouse near its original Bankside site. Architect Theo Crosby and historical craftsmen used green oak, lime plaster and a thatched roof to reinterpret Elizabethan building methods for a modern working theatre.', description_it='Shakespeare’s Globe aprì nel 1997 dopo la campagna dell’attore e regista Sam Wanamaker per ricreare il teatro all’aperto vicino al sito originale di Bankside. Theo Crosby e artigiani specializzati usarono quercia verde, intonaco di calce e tetto di paglia per reinterpretare tecniche elisabettiane in un teatro moderno.',
  editorial_hook_en='Green oak, lime plaster and thatch make this modern theatre a working experiment in Elizabethan construction.', editorial_hook_it='Quercia verde, calce e paglia fanno di questo teatro moderno un esperimento vivo di costruzione elisabettiana.',
  official_url='https://www.shakespearesglobe.com/discover/about-us/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-95A39316' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.shakespearesglobe.com/discover/about-us/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-95A39316'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Spencer House was built from 1756 for the first Earl Spencer, with John Vardy designing the Palladian exterior and James ‘Athenian’ Stuart creating pioneering neoclassical interiors. Restored state rooms overlook Green Park and preserve one of London’s finest surviving eighteenth-century aristocratic townhouses.', description_it='Spencer House fu costruita dal 1756 per il primo conte Spencer: John Vardy progettò l’esterno palladiano e James “Athenian” Stuart i pionieristici interni neoclassici. Le sale di rappresentanza restaurate affacciano su Green Park e conservano una delle migliori residenze aristocratiche settecentesche di Londra.',
  editorial_hook_en='Palladian restraint outside gives way to some of London’s earliest and richest neoclassical rooms.', editorial_hook_it='La sobrietà palladiana esterna lascia il posto ad alcuni dei primi e più ricchi interni neoclassici di Londra.',
  official_url='https://www.spencerhouse.co.uk/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C57F6571' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.spencerhouse.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C57F6571'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='James Gibbs designed St Bartholomew’s Hospital’s North Wing in the 1730s around a grand staircase and Great Hall. William Hogarth donated the vast biblical paintings on the stair walls, while portraits, plasterwork and archives connect the architecture to the hospital’s history since its foundation in 1123.', description_it='James Gibbs progettò la North Wing del St Bartholomew’s Hospital negli anni 1730 attorno a una grande scala e alla Great Hall. William Hogarth donò gli enormi dipinti biblici sulle pareti; ritratti, stucchi e archivi collegano l’architettura alla storia dell’ospedale fondato nel 1123.',
  editorial_hook_en='Hogarth’s monumental paintings climb the staircase of Gibbs’s eighteenth-century hospital wing.', editorial_hook_it='I monumentali dipinti di Hogarth salgono lungo la scala dell’ala ospedaliera settecentesca di Gibbs.',
  official_url='https://bartsnorthwing.org.uk/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B3' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://bartsnorthwing.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='B3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St John’s Gate was built in 1504 as the south entrance to the medieval priory of the Knights of St John. The crenellated stone gateway later housed a tavern, the Gentleman’s Magazine and antiquarian collections; today its rooms form part of the Museum of the Order of St John.', description_it='St John’s Gate fu costruita nel 1504 come ingresso meridionale al priorato medievale dei Cavalieri di San Giovanni. La porta merlata in pietra ospitò poi una taverna, il Gentleman’s Magazine e collezioni antiquarie; oggi le sale fanno parte del Museum of the Order of St John.',
  editorial_hook_en='A 1504 priory gate has served as tavern, printing address and museum of the Order of St John.', editorial_hook_it='Una porta priorale del 1504 è stata taverna, sede editoriale e museo dell’Ordine di San Giovanni.',
  official_url='https://museumstjohn.org.uk/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D201E694' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://museumstjohn.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D201E694'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='St Pancras combines William Henry Barlow’s vast 1868 iron-and-glass train shed with George Gilbert Scott’s 1873 Midland Grand Hotel, a polychrome Gothic Revival landmark. Saved from demolition and restored for Eurostar in 2007, the complex makes Victorian railway engineering inseparable from theatrical urban architecture.', description_it='St Pancras unisce l’immensa tettoia ferroviaria in ferro e vetro di William Henry Barlow del 1868 al Midland Grand Hotel neogotico policromo di George Gilbert Scott del 1873. Salvato dalla demolizione e restaurato per Eurostar nel 2007, lega ingegneria ferroviaria vittoriana e architettura urbana teatrale.',
  editorial_hook_en='Barlow’s record-breaking train shed meets Scott’s exuberant Gothic hotel in a rescued Victorian landmark.', editorial_hook_it='La tettoia da record di Barlow incontra l’esuberante hotel gotico di Scott in un monumento vittoriano salvato.',
  official_url='https://stpancras.com/history', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F0C1DEE1' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://stpancras.com/history','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-F0C1DEE1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Staple Inn preserves the timber-framed frontage of a Tudor Inn of Chancery, with its present Holborn elevation dating largely from 1585 and carefully restored after wartime damage. Through the arch, quiet brick courtyards and a hall recall the legal training communities that once clustered around the Inns of Court.', description_it='Staple Inn conserva la facciata a graticcio di un’Inn of Chancery Tudor, con l’attuale fronte su Holborn risalente in gran parte al 1585 e restaurato dopo i danni bellici. Oltre l’arco, corti tranquille in mattoni e una hall ricordano le comunità di formazione legale attorno agli Inns of Court.',
  editorial_hook_en='A black-and-white Tudor frontage opens into the last surviving Inn of Chancery courtyards.', editorial_hook_it='Una facciata Tudor bianca e nera conduce alle corti dell’ultimo Inn of Chancery superstite.',
  official_url='', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A0081CBE' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1378783','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-A0081CBE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Horace Walpole transformed Strawberry Hill between 1749 and 1776 into a deliberately theatrical ‘little Gothic castle’. Drawing on medieval tombs, chapels and fan vaults rather than archaeological consistency, its white towers, coloured glass and gilded interiors helped launch the Gothic Revival and the Gothic novel.', description_it='Horace Walpole trasformò Strawberry Hill tra il 1749 e il 1776 in un teatrale “piccolo castello gotico”. Ispirandosi a tombe, cappelle e volte medievali senza rigore archeologico, torri bianche, vetri colorati e interni dorati contribuirono a lanciare il Gothic Revival e il romanzo gotico.',
  editorial_hook_en='Walpole’s playful white castle turned fragments of imagined medieval design into the Gothic Revival.', editorial_hook_it='Il giocoso castello bianco di Walpole trasformò frammenti di Medioevo immaginato nel Gothic Revival.',
  official_url='https://www.strawberryhillhouse.org.uk/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C46F735A' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.strawberryhillhouse.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C46F735A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Syon House has been the London seat of the Dukes of Northumberland since the sixteenth century. Robert Adam remodelled its principal interiors in the 1760s as a sequence of dazzling neoclassical rooms, while Capability Brown shaped the surrounding park beside the Thames and the later conservatory added a glass landmark.', description_it='Syon House è la residenza londinese dei duchi di Northumberland dal Cinquecento. Robert Adam ridisegnò gli ambienti principali negli anni 1760 come spettacolare sequenza neoclassica; Capability Brown modellò il parco lungo il Tamigi e la successiva serra aggiunse un landmark in vetro.',
  editorial_hook_en='Adam’s procession of neoclassical rooms opens toward Capability Brown’s Thames-side park.', editorial_hook_it='La sequenza di sale neoclassiche di Adam si apre sul parco lungo il Tamigi di Capability Brown.',
  official_url='https://www.syonpark.co.uk/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2D02CF27' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.syonpark.co.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-2D02CF27'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Ancient House is a timber-framed hall house built around 1435, when Walthamstow was still a small Essex village. Now divided into homes, its jettied upper storey, exposed beams and irregular plaster panels preserve a rare medieval domestic form opposite St Mary’s churchyard.', description_it='The Ancient House è una casa a sala con struttura lignea costruita intorno al 1435, quando Walthamstow era ancora un piccolo villaggio dell’Essex. Oggi divisa in abitazioni, conserva piano superiore aggettante, travi e pannelli d’intonaco irregolari, rara forma domestica medievale di fronte a St Mary’s.',
  editorial_hook_en='A jettied timber hall house from about 1435 survives at the heart of Walthamstow Village.', editorial_hook_it='Una casa a sala lignea aggettante del 1435 circa sopravvive nel cuore di Walthamstow Village.',
  official_url='', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DB1CFF86' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1190795','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-DB1CFF86'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Architectural theorist Charles Jencks transformed his Holland Park home with Terry Farrell between 1978 and 1983 into a manifesto of Postmodern design. Rooms, stairs, furniture and garden encode cosmology, time and the seasons through colour, geometry and symbolic ornament, making the house itself an inhabited argument.', description_it='Il teorico dell’architettura Charles Jencks trasformò la propria casa di Holland Park con Terry Farrell tra il 1978 e il 1983 in un manifesto postmoderno. Stanze, scale, mobili e giardino codificano cosmologia, tempo e stagioni tramite colore, geometria e simboli, facendo della casa un’argomentazione abitata.',
  editorial_hook_en='Jencks made cosmology inhabitable, turning every stair, room and motif into Postmodern argument.', editorial_hook_it='Jencks rese abitabile la cosmologia, trasformando ogni scala, stanza e motivo in un’argomentazione postmoderna.',
  official_url='https://www.jencksfoundation.org/the-cosmic-house', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DC349A89' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.jencksfoundation.org/the-cosmic-house','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-DC349A89'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Old Vic opened in 1818 as the Royal Coburg Theatre and gained its present name after becoming the Royal Victoria. Its long history ranges from music hall and temperance lectures to Lilian Baylis’s influential Shakespeare and opera seasons; the compact auditorium remains one of London’s defining producing theatres.', description_it='The Old Vic aprì nel 1818 come Royal Coburg Theatre e assunse il nome attuale dopo essere diventato Royal Victoria. La storia va dal music hall e dalle conferenze sulla temperanza alle influenti stagioni shakespeariane e liriche di Lilian Baylis; la sala raccolta resta uno dei principali teatri di produzione londinesi.',
  editorial_hook_en='An 1818 theatre survived music hall, temperance and wartime damage to become a cornerstone of London drama.', editorial_hook_it='Un teatro del 1818 ha attraversato music hall, temperanza e danni bellici diventando un pilastro della scena londinese.',
  official_url='https://www.oldvictheatre.com/about-us/history/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3E404737' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.oldvictheatre.com/about-us/history/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-3E404737'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Tower Bridge was built in 1886–94 by engineer John Wolfe Barry to a Gothic design by Horace Jones, allowing road traffic to cross without blocking busy Pool of London shipping. Twin bascules still lift between stone-clad towers; high-level walkways and preserved engine rooms explain the original steam-hydraulic machinery.', description_it='Tower Bridge fu costruito nel 1886–94 dall’ingegnere John Wolfe Barry su disegno gotico di Horace Jones, permettendo al traffico stradale di attraversare senza bloccare le navi del Pool of London. Le due bascule si sollevano ancora tra torri rivestite in pietra; passerelle e sale macchine illustrano il sistema idraulico a vapore originale.',
  editorial_hook_en='Gothic stone towers disguise the steelwork and moving bascules of a brilliantly practical Victorian bridge.', editorial_hook_it='Torri gotiche in pietra nascondono acciaio e bascule mobili di un ponte vittoriano brillantemente pratico.',
  official_url='https://www.towerbridge.org.uk/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-324D78AD' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.towerbridge.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-324D78AD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='William the Conqueror began the Tower of London in the 1070s, with the massive White Tower asserting Norman power over the city. Successive monarchs expanded it as fortress, palace, prison, armoury and mint; walls, towers, chapel, ravens and Crown Jewels embody nearly a millennium of contested royal history.', description_it='Guglielmo il Conquistatore iniziò la Tower of London negli anni 1070, con la massiccia White Tower a imporre il potere normanno sulla città. I sovrani successivi la ampliarono come fortezza, palazzo, prigione, arsenale e zecca; mura, torri, cappella, corvi e Gioielli della Corona incarnano quasi mille anni di storia reale contesa.',
  editorial_hook_en='The Norman White Tower anchors a fortress repeatedly adapted as palace, prison, armoury and treasury.', editorial_hook_it='La White Tower normanna è il fulcro di una fortezza trasformata in palazzo, prigione, arsenale e tesoro.',
  official_url='https://www.hrp.org.uk/tower-of-london/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6C9110FF' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.hrp.org.uk/tower-of-london/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-6C9110FF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Ernő Goldfinger’s Trellick Tower was completed in 1972 as a 31-storey council housing block. Its separate service tower, linked by bridges at every third floor, leaves flats free of lifts and ducts; bold bush-hammered concrete, generous maisonettes and a rooftop plant room define its uncompromising Brutalist silhouette.', description_it='La Trellick Tower di Ernő Goldfinger fu completata nel 1972 come edificio di edilizia pubblica di 31 piani. La torre di servizio separata, collegata da ponti ogni tre piani, libera gli alloggi da ascensori e impianti; cemento martellinato, maisonette generose e locale tecnico in cima definiscono la silhouette brutalista.',
  editorial_hook_en='Goldfinger separated homes from services, giving Trellick its dramatic tower-and-bridge silhouette.', editorial_hook_it='Goldfinger separò abitazioni e servizi, dando a Trellick la sua spettacolare silhouette di torre e ponti.',
  official_url='https://trellicktower.com/', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B1' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1246688','official-or-authoritative','2026-10-14' FROM places WHERE id='B1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Samuel Wyatt designed Trinity House, completed in 1796, for the corporation responsible for lighthouses and maritime safety. Its Portland-stone classical façade overlooks Trinity Square; reconstructed after wartime bombing, ceremonial rooms display navigational instruments, portraits and models linked to Britain’s seafaring history.', description_it='Samuel Wyatt progettò Trinity House, completata nel 1796, per l’ente responsabile di fari e sicurezza marittima. La facciata classica in pietra di Portland guarda Trinity Square; ricostruite dopo i bombardamenti, le sale cerimoniali espongono strumenti nautici, ritratti e modelli legati alla storia marittima britannica.',
  editorial_hook_en='Wyatt’s Portland-stone headquarters gives Britain’s lighthouse authority a dignified face beside the Tower.', editorial_hook_it='La sede in pietra di Portland di Wyatt offre un volto solenne all’autorità britannica dei fari accanto alla Torre.',
  official_url='https://www.trinityhouse.co.uk/about-us/trinity-house-london', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B69DCEB6' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.trinityhouse.co.uk/about-us/trinity-house-london','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-B69DCEB6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Painter J. M. W. Turner designed Sandycombe Lodge as his country retreat, completed in 1813 with advice from his friend Sir John Soane. The compact villa’s central top-lit stair, shallow arches and carefully framed rooms show an artist thinking architecturally; restoration has recovered its Regency proportions and finishes.', description_it='Il pittore J. M. W. Turner progettò Sandycombe Lodge come rifugio di campagna, completato nel 1813 con consigli dell’amico Sir John Soane. La scala centrale illuminata dall’alto, gli archi bassi e le stanze inquadrate mostrano un artista che pensa da architetto; il restauro ha recuperato proporzioni e finiture Regency.',
  editorial_hook_en='Turner’s own compact villa reveals the painter experimenting with Soane-like light and space.', editorial_hook_it='La compatta villa di Turner mostra il pittore mentre sperimenta luce e spazio alla maniera di Soane.',
  official_url='https://turnershouse.org/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2529E94E' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://turnershouse.org/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-2529E94E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Valentines Mansion was built around 1696 for Elizabeth Tillotson, widow of the Archbishop of Canterbury, and enlarged by later owners. Restored rooms range from a Georgian drawing room to a Victorian kitchen, while the surrounding park retains formal gardens, a canal, grottoes and historic trees.', description_it='Valentines Mansion fu costruita intorno al 1696 per Elizabeth Tillotson, vedova dell’arcivescovo di Canterbury, e ampliata dai proprietari successivi. Le sale restaurate vanno dal salotto georgiano alla cucina vittoriana; il parco conserva giardini formali, canale, grotte e alberi storici.',
  editorial_hook_en='A late-seventeenth-century country house opens onto surviving formal gardens and waterways in Ilford.', editorial_hook_it='Una residenza di campagna del tardo Seicento si apre su giardini formali e corsi d’acqua superstiti a Ilford.',
  official_url='https://valentinesmansion.com/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C1542295' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://valentinesmansion.com/','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-C1542295'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Architect and dramatist Sir John Vanbrugh built Vanbrugh Castle around 1719 as his own home, shaping a compact house to resemble a medieval fortress. Round towers, battlements and massive walls give theatrical weight to a domestic plan; the Grade I building is now divided into private residences.', description_it='L’architetto e drammaturgo Sir John Vanbrugh costruì Vanbrugh Castle intorno al 1719 come propria casa, dando a un edificio compatto l’aspetto di una fortezza medievale. Torri rotonde, merli e mura massicce conferiscono peso teatrale alla pianta domestica; l’edificio di grado I è oggi diviso in residenze private.',
  editorial_hook_en='Vanbrugh compressed his taste for heroic castle architecture into his own compact Greenwich home.', editorial_hook_it='Vanbrugh condensò il gusto per l’architettura eroica dei castelli nella propria casa compatta di Greenwich.',
  official_url='', access_notes_en='The exterior is visible from the public realm. The building itself is not a general visitor attraction; respect private entrances, residents and on-site security.', access_notes_it='L’esterno è visibile dallo spazio pubblico. L’edificio non è un’attrazione aperta in generale: rispetta ingressi privati, residenti e controlli di sicurezza.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-46AC4436' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1078943','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-46AC4436'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Wapping Hydraulic Power Station was built in 1889–93 for the London Hydraulic Power Company. Steam-driven pumps pressurised a citywide network that silently operated dock gates, cranes, theatre curtains and lifts; the robust brick engine house survives as a rare monument to London’s lost hydraulic utility.', description_it='La Wapping Hydraulic Power Station fu costruita nel 1889–93 per la London Hydraulic Power Company. Pompe a vapore pressurizzavano una rete urbana che azionava silenziosamente porte dei docks, gru, sipari e ascensori; la robusta sala macchine in mattoni è un raro monumento a questa rete scomparsa.',
  editorial_hook_en='A Victorian pumping station once powered lifts, cranes and theatre curtains through high-pressure water beneath London.', editorial_hook_it='Una centrale vittoriana azionava ascensori, gru e sipari con acqua ad alta pressione sotto Londra.',
  official_url='', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-F7159BD9' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/heritage-gateway/results/record/0d636742-8028-4a8c-8b7c-e1f9aaf2d338/42adccd2-c918-46bf-b4e7-0f29dcdde864','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-F7159BD9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Warrington was built in the mid-nineteenth century and remodelled around 1900 into an unusually lavish Maida Vale pub. Glazed tiles, etched glass, carved wood, decorative plaster and a sweeping staircase preserve the confidence of the late-Victorian gin palace, with hotel rooms occupying the floors above.', description_it='The Warrington fu costruito a metà Ottocento e rinnovato intorno al 1900 come pub insolitamente sontuoso di Maida Vale. Piastrelle smaltate, vetri incisi, legno intagliato, stucchi e una scala scenografica conservano l’opulenza del gin palace tardo-vittoriano, con camere d’albergo ai piani superiori.',
  editorial_hook_en='Etched glass, glazed tiles and carved wood preserve the theatrical interior of a Maida Vale gin palace.', editorial_hook_it='Vetri incisi, piastrelle smaltate e legno intagliato conservano l’interno teatrale di un gin palace di Maida Vale.',
  official_url='https://www.thewarringtonhotel.co.uk/', access_notes_en='Public access depends on the venue’s current opening hours, programme and security arrangements. Check the official site before travelling, especially for interiors or guided visits.', access_notes_it='L’accesso dipende da orari, programma e controlli del luogo. Controlla il sito ufficiale prima di partire, soprattutto per interni o visite guidate.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9A4BE645' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1066319','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-9A4BE645'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The present Wembley Stadium opened in 2007, designed by Foster + Partners and Populous on the site of the 1923 Empire Stadium. Its 133-metre-high steel arch supports much of the retractable roof and replaces the old Twin Towers as the national stadium’s skyline marker; the bowl seats 90,000.', description_it='L’attuale Wembley Stadium aprì nel 2007, progettato da Foster + Partners e Populous sul sito dell’Empire Stadium del 1923. L’arco d’acciaio alto 133 metri sostiene gran parte del tetto retrattile e sostituisce le vecchie Twin Towers come segno nello skyline; l’anello contiene 90.000 posti.',
  editorial_hook_en='A 133-metre arch carries the roof and announces Britain’s 90,000-seat national stadium across London.', editorial_hook_it='Un arco di 133 metri sostiene il tetto e segnala in tutta Londra lo stadio nazionale da 90.000 posti.',
  official_url='https://www.wembleystadium.com/plan-your-visit/stadium-tour', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D6A1F882' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.wembleystadium.com/plan-your-visit/stadium-tour','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-D6A1F882'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='William II began Westminster Hall in 1097, making it the oldest surviving part of the Palace of Westminster. Richard II’s rebuilding of the 1390s added Hugh Herland’s immense hammer-beam timber roof; coronation banquets, state trials, lying-in-state ceremonies and parliamentary addresses have filled the hall for nine centuries.', description_it='Guglielmo II iniziò Westminster Hall nel 1097, oggi la parte più antica superstite del Palace of Westminster. La ricostruzione di Riccardo II negli anni 1390 aggiunse l’immenso tetto ligneo a capriate di Hugh Herland; banchetti d’incoronazione, processi di Stato e cerimonie vi si sono svolti per nove secoli.',
  editorial_hook_en='An immense medieval hammer-beam roof spans the ceremonial heart of Parliament’s oldest surviving building.', editorial_hook_it='Un’immensa copertura medievale a capriate sovrasta il cuore cerimoniale del più antico edificio superstite del Parlamento.',
  official_url='https://www.parliament.uk/about/living-heritage/building/palace/westminsterhall/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B5' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.parliament.uk/about/living-heritage/building/palace/westminsterhall/','official-or-authoritative','2026-10-14' FROM places WHERE id='B5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Wilton’s combines five eighteenth-century houses with the music hall John Wilton built behind them in 1859. Once a sailors’ entertainment hall and later a mission, it survived dereliction with layers of paint, plaster and repair deliberately visible; careful conservation keeps that accumulated texture within a working theatre.', description_it='Wilton’s unisce cinque case settecentesche alla music hall costruita sul retro da John Wilton nel 1859. Prima sala per marinai e poi missione, sopravvisse all’abbandono con strati di pittura, intonaco e riparazioni volutamente visibili; il restauro conserva questa patina in un teatro ancora attivo.',
  editorial_hook_en='A fragile 1859 music hall keeps its peeling layers visible while functioning again as a theatre.', editorial_hook_it='Una fragile music hall del 1859 mantiene visibili i suoi strati scrostati tornando a funzionare come teatro.',
  official_url='https://wiltons.org.uk/', access_notes_en='Admission, opening times and tour availability vary. Check the official site for current tickets, timed entry, event restrictions and closures before travelling.', access_notes_it='Biglietti, orari e visite variano. Controlla il sito ufficiale per ingressi, prenotazioni, limitazioni durante gli eventi e chiusure prima di partire.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='B8' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://wiltons.org.uk/','official-or-authoritative','2026-10-14' FROM places WHERE id='B8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Woolwich Town Hall opened in 1906, designed by Alfred Brumwell Thomas as an emphatic expression of the new metropolitan borough. Its Edwardian Baroque exterior leads to a marble-lined entrance hall, stained glass celebrating local military and industrial history, and richly decorated civic rooms still used by Greenwich Council.', description_it='Woolwich Town Hall aprì nel 1906, progettato da Alfred Brumwell Thomas come espressione monumentale del nuovo municipio metropolitano. L’esterno barocco edoardiano introduce una hall rivestita di marmo, vetrate sulla storia militare e industriale locale e sale civiche ancora usate dal Greenwich Council.',
  editorial_hook_en='Marble, stained glass and Edwardian Baroque ceremony proclaim Woolwich’s former borough identity.', editorial_hook_it='Marmo, vetrate e solennità barocca edoardiana proclamano l’antica identità municipale di Woolwich.',
  official_url='https://www.royalgreenwich.gov.uk/directory_record/1035/woolwich_town_hall', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-08BB5C1A' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.royalgreenwich.gov.uk/directory_record/1035/woolwich_town_hall','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-08BB5C1A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Zoroastrian Centre occupies the former Grosvenor Cinema, opened in 1936 to a striking Art Deco design by F. E. Bromige. Its streamlined corner tower, stepped forms and richly modelled auditorium survived later bingo use; acquired by the Zoroastrian Trust Funds of Europe, it reopened as a religious and cultural centre in 2000.', description_it='Lo Zoroastrian Centre occupa l’ex Grosvenor Cinema, aperto nel 1936 su notevole progetto Art Déco di F. E. Bromige. Torre angolare aerodinamica, volumi a gradoni e auditorium decorato sopravvissero all’uso come bingo; acquistato dagli Zoroastrian Trust Funds of Europe, riaprì nel 2000 come centro religioso e culturale.',
  editorial_hook_en='Bromige’s streamlined 1936 cinema now serves as Europe’s largest Zoroastrian religious and cultural centre.', editorial_hook_it='Il cinema aerodinamico di Bromige del 1936 è oggi il maggiore centro religioso e culturale zoroastriano d’Europa.',
  official_url='https://www.ztfe.com/', access_notes_en='This is primarily a working or private building and is best appreciated from the public realm. Interior access is limited to authorised visits or occasional open days.', access_notes_it='È soprattutto un edificio operativo o privato, da osservare dallo spazio pubblico. Gli interni sono accessibili solo con autorizzazione o durante aperture occasionali.',
  last_verified_at='2026-10-14', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-16606F1F' AND category='BUILDING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1261435','official-or-authoritative','2026-10-14' FROM places WHERE id='LA-16606F1F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

INSERT INTO app_meta(key,value,updated_at) VALUES ('building_editorial_version','2026-10-14',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;
