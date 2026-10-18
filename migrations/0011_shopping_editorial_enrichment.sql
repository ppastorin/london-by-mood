-- Bilingual, place-specific editorial enrichment for every published shopping-category place.
-- Research verified against the recorded official or authoritative sources on 2026-10-18.
CREATE TABLE IF NOT EXISTS place_editorial_sources (
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  source_url TEXT NOT NULL,
  source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative',
  verified_at TEXT NOT NULL,
  PRIMARY KEY(place_id, source_url)
);
CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);

UPDATE places SET description_en='This Sunday market lines the pedestrianised stretch inside Victoria Park near Bonner Gate. Independent traders focus on prepared food, seasonal produce, bread, cheese and small-batch goods, turning a park walk into an East London neighbourhood lunch stop rather than a conventional retail trip.', description_it='Questo mercato domenicale occupa il tratto pedonale di Victoria Park vicino a Bonner Gate. Venditori indipendenti propongono cibo pronto, prodotti stagionali, pane, formaggi e specialità artigianali, trasformando una passeggiata nel parco in una sosta gastronomica di quartiere.',
  editorial_hook_en='Victoria Park Market: This Sunday market lines the pedestrianised stretch inside Victoria Park near Bonner Gate.', editorial_hook_it='Victoria Park Market: Questo mercato domenicale occupa il tratto pedonale di Victoria Park vicino a Bonner Gate.',
  official_url='https://victoriaparkmarket.com/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S7' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://victoriaparkmarket.com/','official-or-authoritative','2026-10-18' FROM places WHERE id='S7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Primrose Hill Food Market gathers farmers, bakers and specialist producers at St Paul’s School on Saturdays. The compact courtyard market is strongest for vegetables, meat, fish, bread and ready-to-eat food, serving local weekly shopping rather than the souvenir trade of central London markets.', description_it='Primrose Hill Food Market riunisce il sabato agricoltori, panettieri e produttori specializzati presso St Paul’s School. Il piccolo mercato nel cortile è dedicato soprattutto a verdure, carne, pesce, pane e cibo pronto, con una funzione di spesa settimanale locale più che turistica.',
  editorial_hook_en='Primrose Hill Food Market: Primrose Hill Food Market gathers farmers, bakers and specialist producers at St Paul’s School on Saturdays.', editorial_hook_it='Primrose Hill Food Market: Primrose Hill Food Market riunisce il sabato agricoltori, panettieri e produttori specializzati presso St Paul’s School.',
  official_url='https://www.lfm.org.uk/markets/primrose-hill/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-61180A5D' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lfm.org.uk/markets/primrose-hill/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-61180A5D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Camden Market is a network of trading areas around Camden Lock, the former Pickfords stables and the Regent’s Canal, not a single market hall. Fashion, crafts, records and global street food fill brick viaducts, yards and converted horse stalls, with its industrial fabric as important as the shopping.', description_it='Camden Market è una rete di spazi commerciali attorno a Camden Lock, alle ex scuderie Pickfords e al Regent’s Canal, non un unico mercato coperto. Moda, artigianato, dischi e street food internazionale occupano viadotti in mattoni, cortili e vecchi box per cavalli.',
  editorial_hook_en='Camden Market: Camden Market is a network of trading areas around Camden Lock, the former Pickfords stables and the Regent’s Canal, not a single market hall.', editorial_hook_it='Camden Market: Camden Market è una rete di spazi commerciali attorno a Camden Lock, alle ex scuderie Pickfords e al Regent’s Canal, non un unico mercato coperto.',
  official_url='https://camdenmarket.com/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E5480647' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://camdenmarket.com/about','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-E5480647'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Borough Market traces its trading history back roughly a thousand years and now occupies iron-and-glass halls beneath the railway beside Southwark Cathedral. Produce traders, cheesemakers, bakers and prepared-food kitchens make it a serious food market, while the surviving Victorian structure explains its distinctive atmosphere.', description_it='Borough Market vanta circa mille anni di attività e oggi occupa strutture in ferro e vetro sotto la ferrovia accanto a Southwark Cathedral. Banchi di prodotti freschi, formaggi, pane e cucine rendono il luogo un vero mercato alimentare, valorizzato dall’architettura vittoriana superstite.',
  editorial_hook_en='Borough Market: Borough Market traces its trading history back roughly a thousand years and now occupies iron-and-glass halls beneath the railway beside Southwark Cathedral.', editorial_hook_it='Borough Market: Borough Market vanta circa mille anni di attività e oggi occupa strutture in ferro e vetro sotto la ferrovia accanto a Southwark Cathedral.',
  official_url='https://boroughmarket.org.uk/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0C287E77' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://boroughmarket.org.uk/our-story/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-0C287E77'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Maltby Street Market runs through Ropewalk, a narrow lane beneath Bermondsey’s railway arches. Weekend traders specialise in compact, high-quality street-food menus, drinks and artisan groceries, while neighbouring arches contain permanent producers and bars linked to the area’s warehouse and food-making revival.', description_it='Maltby Street Market si sviluppa lungo Ropewalk, uno stretto passaggio sotto gli archi ferroviari di Bermondsey. Nel weekend piccoli operatori propongono street food, bevande e prodotti artigianali; negli archi vicini lavorano produttori e locali nati dalla rinascita dei magazzini della zona.',
  editorial_hook_en='Maltby Street Market: Maltby Street Market runs through Ropewalk, a narrow lane beneath Bermondsey’s railway arches.', editorial_hook_it='Maltby Street Market: Maltby Street Market si sviluppa lungo Ropewalk, uno stretto passaggio sotto gli archi ferroviari di Bermondsey.',
  official_url='https://www.maltbystreetmarket.co.uk/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-12DFBA93' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.maltbystreetmarket.co.uk/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-12DFBA93'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Smithfield is London’s historic central meat market, housed in Horace Jones’s great nineteenth-century buildings beside St Bartholomew’s. It is a working wholesale operation active before dawn rather than a visitor food hall; the architecture, underground railway sidings and centuries of meat trading define the site.', description_it='Smithfield è lo storico mercato centrale della carne di Londra, ospitato nei grandi edifici ottocenteschi di Horace Jones accanto a St Bartholomew’s. È un mercato all’ingrosso attivo prima dell’alba, non una food hall turistica; architettura, binari sotterranei e secoli di commercio ne definiscono il carattere.',
  editorial_hook_en='Smithfield Market: Smithfield is London’s historic central meat market, housed in Horace Jones’s great nineteenth-century buildings beside St Bartholomew’s.', editorial_hook_it='Smithfield Market: Smithfield è lo storico mercato centrale della carne di Londra, ospitato nei grandi edifici ottocenteschi di Horace Jones accanto a St Bartholomew’s.',
  official_url='https://www.smithfieldmarket.com/', access_notes_en='This is a working wholesale market with very early trading and restricted visitor conditions; verify access before travelling.', access_notes_it='È un mercato all’ingrosso operativo, con orari molto mattutini e accesso regolato: verifica prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CE3D5929' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cityoflondon.gov.uk/supporting-businesses/business-support-and-advice/wholesale-markets/smithfield-market','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-CE3D5929'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Brixton Market combines the outdoor stalls of Electric Avenue with the covered Brixton Village and Market Row arcades. Caribbean, African, Latin American and Asian groceries sit beside fabric shops, household traders and small restaurants, reflecting the communities that reshaped Brixton after the Second World War.', description_it='Brixton Market unisce le bancarelle all’aperto di Electric Avenue alle gallerie coperte di Brixton Village e Market Row. Alimentari caraibici, africani, latinoamericani e asiatici convivono con tessuti, casalinghi e piccoli ristoranti, riflettendo le comunità che hanno trasformato Brixton.',
  editorial_hook_en='Brixton Market: Brixton Market combines the outdoor stalls of Electric Avenue with the covered Brixton Village and Market Row arcades.', editorial_hook_it='Brixton Market: Brixton Market unisce le bancarelle all’aperto di Electric Avenue alle gallerie coperte di Brixton Village e Market Row.',
  official_url='https://www.brixtonvillage.com/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BFEEF6E1' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lambeth.gov.uk/business-rates-services-licensing/markets/brixton-markets','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-BFEEF6E1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Tooting Market has traded from its covered 1930s hall beside Tooting Broadway for more than eighty years. Traditional butchers, grocers and fabric shops now share the aisles with South Asian food counters, independent bars and small creative businesses, preserving a genuinely mixed everyday market.', description_it='Tooting Market opera da oltre ottant’anni nel mercato coperto degli anni Trenta vicino a Tooting Broadway. Macellai, alimentari e negozi di tessuti condividono oggi i corridoi con cucine dell’Asia meridionale, bar indipendenti e piccole attività creative, mantenendo un vero mercato quotidiano.',
  editorial_hook_en='Tooting Market: Tooting Market has traded from its covered 1930s hall beside Tooting Broadway for more than eighty years.', editorial_hook_it='Tooting Market: Tooting Market opera da oltre ottant’anni nel mercato coperto degli anni Trenta vicino a Tooting Broadway.',
  official_url='https://tootingmarket.com/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E1411FDC' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://tootingmarket.com/about/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-E1411FDC'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Netil Market is a compact creative yard beside London Fields, developed as a home for independent makers and food traders. Small studios, design stalls and permanent kiosks cluster around a central courtyard, with the rooftop bar and neighbouring Netil House connecting it to Hackney’s wider workshop culture.', description_it='Netil Market è un piccolo cortile creativo vicino a London Fields, nato per ospitare artigiani indipendenti e operatori gastronomici. Studi, bancarelle di design e chioschi permanenti circondano lo spazio centrale; il rooftop bar e Netil House lo collegano alla cultura dei laboratori di Hackney.',
  editorial_hook_en='Netil Market: Netil Market is a compact creative yard beside London Fields, developed as a home for independent makers and food traders.', editorial_hook_it='Netil Market: Netil Market è un piccolo cortile creativo vicino a London Fields, nato per ospitare artigiani indipendenti e operatori gastronomici.',
  official_url='https://www.netilmarket.co.uk/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-302EC634' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.netilmarket.co.uk/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-302EC634'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Greenwich Market occupies a covered eighteenth-century market site within the Maritime Greenwich World Heritage area. Its daily mix changes between designer-makers, antiques, prints, jewellery and international food, while narrow entrances connect the central court to the independent shops of the surrounding lanes.', description_it='Greenwich Market occupa un sito mercatale coperto del Settecento nel patrimonio mondiale di Maritime Greenwich. L’offerta quotidiana varia tra designer, antiquariato, stampe, gioielli e cibo internazionale; passaggi stretti collegano il cortile centrale ai negozi indipendenti delle vie circostanti.',
  editorial_hook_en='Greenwich Market: Greenwich Market occupies a covered eighteenth-century market site within the Maritime Greenwich World Heritage area.', editorial_hook_it='Greenwich Market: Greenwich Market occupa un sito mercatale coperto del Settecento nel patrimonio mondiale di Maritime Greenwich.',
  official_url='https://www.greenwichmarket.london/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D13F4A91' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.greenwichmarket.london/history','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-D13F4A91'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Broadway Market fills the street between London Fields and the Regent’s Canal each Saturday. Produce, cheese, bread, books, vintage clothing and prepared food extend a trading tradition recorded since the nineteenth century, while permanent cafés and independent shops keep the street active beyond market hours.', description_it='Broadway Market riempie ogni sabato la strada tra London Fields e Regent’s Canal. Prodotti freschi, formaggi, pane, libri, abiti vintage e cibo pronto continuano una tradizione commerciale ottocentesca, mentre caffè e negozi indipendenti mantengono viva la via durante la settimana.',
  editorial_hook_en='Broadway Market: Broadway Market fills the street between London Fields and the Regent’s Canal each Saturday.', editorial_hook_it='Broadway Market: Broadway Market riempie ogni sabato la strada tra London Fields e Regent’s Canal.',
  official_url='https://broadwaymarket.co.uk/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E36CA94C' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://broadwaymarket.co.uk/history/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-E36CA94C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Billingsgate is the United Kingdom’s largest inland fish market, operating in a purpose-built Docklands hall since moving from the City in 1982. Trading begins in the early hours for fishmongers and restaurants; this is a working wholesale environment, not a leisurely visitor market, and access rules matter.', description_it='Billingsgate è il maggiore mercato ittico interno del Regno Unito, attivo in una struttura dei Docklands dal trasferimento dalla City nel 1982. Le contrattazioni iniziano nelle prime ore per pescherie e ristoranti: è un ambiente all’ingrosso operativo, non un mercato turistico, e le regole di accesso sono importanti.',
  editorial_hook_en='Billingsgate Market: Billingsgate is the United Kingdom’s largest inland fish market, operating in a purpose-built Docklands hall since moving from the City in 1982.', editorial_hook_it='Billingsgate Market: Billingsgate è il maggiore mercato ittico interno del Regno Unito, attivo in una struttura dei Docklands dal trasferimento dalla City nel 1982.',
  official_url='https://www.cityoflondon.gov.uk/supporting-businesses/business-support-and-advice/wholesale-markets/billingsgate-market', access_notes_en='This is a working wholesale market with very early trading and restricted visitor conditions; verify access before travelling.', access_notes_it='È un mercato all’ingrosso operativo, con orari molto mattutini e accesso regolato: verifica prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5D7BD6DF' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.cityoflondon.gov.uk/supporting-businesses/business-support-and-advice/wholesale-markets/billingsgate-market','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-5D7BD6DF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Brick Lane’s Sunday market spreads through streets, yards and halls around the Old Truman Brewery. Second-hand furniture, clothing, records, household oddities and food reflect the area’s successive Jewish, Bangladeshi and creative economies; the experience is dispersed and rough-edged rather than neatly curated.', description_it='Il mercato domenicale di Brick Lane si distribuisce tra strade, cortili e spazi dell’Old Truman Brewery. Mobili usati, abiti, dischi, oggetti insoliti e cibo riflettono le successive economie ebraiche, bangladesi e creative della zona; è un’esperienza diffusa e poco patinata.',
  editorial_hook_en='Brick Lane Market: Brick Lane’s Sunday market spreads through streets, yards and halls around the Old Truman Brewery.', editorial_hook_it='Brick Lane Market: Il mercato domenicale di Brick Lane si distribuisce tra strade, cortili e spazi dell’Old Truman Brewery.',
  official_url='https://www.trumanbrewery.com/markets', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-29E23D38' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.towerhamlets.gov.uk/lgnl/business/markets/Brick_Lane_Market.aspx','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-29E23D38'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Walthamstow Market runs for close to a kilometre along High Street and is often described as Europe’s longest outdoor street market. Everyday fruit and vegetables, fabrics, clothing and household goods serve a highly diverse local population, with the indoor 17&Central market and historic shopfronts alongside.', description_it='Walthamstow Market si estende per quasi un chilometro lungo High Street ed è spesso indicato come il più lungo mercato all’aperto d’Europa. Frutta e verdura, tessuti, abbigliamento e casalinghi servono una popolazione locale molto diversificata, accanto al centro coperto 17&Central e alle facciate storiche.',
  editorial_hook_en='Walthamstow Market: Walthamstow Market runs for close to a kilometre along High Street and is often described as Europe’s longest outdoor street market.', editorial_hook_it='Walthamstow Market: Walthamstow Market si estende per quasi un chilometro lungo High Street ed è spesso indicato come il più lungo mercato all’aperto d’Europa.',
  official_url='https://www.walthamforest.gov.uk/businesses/markets/walthamstow-market', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S5' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.walthamforest.gov.uk/businesses/markets/walthamstow-market','official-or-authoritative','2026-10-18' FROM places WHERE id='S5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='This pin marks the Broadway end of Tooting Market, where the covered aisles meet the transport hub and Upper Tooting Road. Enter here for South Asian groceries, long-established service traders and the newer food-and-drink courtyard; it is a second entrance to the same historic market, not a separate attraction.', description_it='Questo punto indica l’ingresso lato Broadway di Tooting Market, dove i corridoi coperti incontrano la stazione e Upper Tooting Road. Da qui si raggiungono alimentari sudasiatici, attività storiche e il più recente cortile gastronomico: è un secondo accesso allo stesso mercato, non un’attrazione distinta.',
  editorial_hook_en='Tooting Market – Broadway entrance: This pin marks the Broadway end of Tooting Market, where the covered aisles meet the transport hub and Upper Tooting Road.', editorial_hook_it='Tooting Market – Broadway entrance: Questo punto indica l’ingresso lato Broadway di Tooting Market, dove i corridoi coperti incontrano la stazione e Upper Tooting Road.',
  official_url='https://tootingmarket.com/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4E68E539' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://tootingmarket.com/about/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-4E68E539'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Upmarket occupies part of the Old Truman Brewery complex on Brick Lane. Independent kitchens serve food from many regional traditions while stalls focus on fashion, accessories, art and gifts; it is the more organised indoor counterpart to the looser Sunday trading spread along Brick Lane.', description_it='Upmarket occupa una parte del complesso Old Truman Brewery su Brick Lane. Cucine indipendenti propongono specialità di molte tradizioni regionali, mentre le bancarelle vendono moda, accessori, arte e regali; è la versione coperta e più organizzata del commercio domenicale della zona.',
  editorial_hook_en='Upmarket: Upmarket occupies part of the Old Truman Brewery complex on Brick Lane.', editorial_hook_it='Upmarket: Upmarket occupa una parte del complesso Old Truman Brewery su Brick Lane.',
  official_url='https://www.trumanbrewery.com/markets', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-9637D780' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.trumanbrewery.com/markets','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-9637D780'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Bermondsey Antique Market takes over Bermondsey Square on Friday mornings, continuing the district’s association with antiques and the former New Caledonian Market. Dealers bring silver, ceramics, jewellery, prints and collectables; the strongest selection appears early and the market is much smaller than its historic predecessor.', description_it='Bermondsey Antique Market occupa Bermondsey Square il venerdì mattina, continuando il legame della zona con l’antiquariato e l’ex New Caledonian Market. I commercianti portano argenti, ceramiche, gioielli, stampe e collezionismo; la scelta migliore è presto e il mercato è più piccolo del predecessore storico.',
  editorial_hook_en='Bermondsey Antique Market: Bermondsey Antique Market takes over Bermondsey Square on Friday mornings, continuing the district’s association with antiques and the former New Caledonian Market.', editorial_hook_it='Bermondsey Antique Market: Bermondsey Antique Market occupa Bermondsey Square il venerdì mattina, continuando il legame della zona con l’antiquariato e l’ex New Caledonian Market.',
  official_url='https://www.bermondseysquare.co.uk/antiques-market', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-1BAA225C' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bermondseysquare.co.uk/antiques-market','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-1BAA225C'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Old Spitalfields Market occupies a restored Victorian market hall on a site licensed for trading since 1638. Rotating stalls sell design, fashion, vinyl, crafts and food beneath the iron roof, surrounded by permanent shops and restaurants; themed market days make the offer different across the week.', description_it='Old Spitalfields Market occupa un mercato vittoriano restaurato in un luogo autorizzato al commercio dal 1638. Bancarelle a rotazione vendono design, moda, vinili, artigianato e cibo sotto il tetto in ferro, circondate da negozi e ristoranti; i temi cambiano durante la settimana.',
  editorial_hook_en='Old Spitalfields Market: Old Spitalfields Market occupies a restored Victorian market hall on a site licensed for trading since 1638.', editorial_hook_it='Old Spitalfields Market: Old Spitalfields Market occupa un mercato vittoriano restaurato in un luogo autorizzato al commercio dal 1638.',
  official_url='https://oldspitalfieldsmarket.com/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CE3A1E89' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://oldspitalfieldsmarket.com/history/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-CE3A1E89'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Brick Lane Vintage Market fills a basement beneath the Old Truman Brewery with specialist dealers in clothing from the 1920s onward. Denim, workwear, sportswear and designer pieces are organised by trader and era, making it a concentrated fashion archive rather than a general flea market.', description_it='Brick Lane Vintage Market occupa un seminterrato sotto l’Old Truman Brewery con commercianti specializzati in abiti dagli anni Venti in poi. Denim, workwear, sportswear e capi firmati sono organizzati per venditore ed epoca, creando un archivio di moda concentrato più che un mercatino generico.',
  editorial_hook_en='Brick Lane Vintage Market: Brick Lane Vintage Market fills a basement beneath the Old Truman Brewery with specialist dealers in clothing from the 1920s onward.', editorial_hook_it='Brick Lane Vintage Market: Brick Lane Vintage Market occupa un seminterrato sotto l’Old Truman Brewery con commercianti specializzati in abiti dagli anni Venti in poi.',
  official_url='https://www.trumanbrewery.com/markets/vintage-market', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-5E16B6E0' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.trumanbrewery.com/markets/vintage-market','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-5E16B6E0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Royal Exchange is a grand nineteenth-century trading building on the site where London merchants first gathered under one roof in the 1560s. Its arcaded courtyard now contains luxury boutiques and dining beneath classical columns, while the exterior statues and Bank junction setting preserve its mercantile symbolism.', description_it='The Royal Exchange è un grande edificio commerciale ottocentesco sul luogo dove i mercanti londinesi si riunirono per la prima volta al coperto nel Cinquecento. Il cortile porticato ospita boutique di lusso e ristorazione tra colonne classiche, mentre statue e Bank junction ne conservano il simbolismo mercantile.',
  editorial_hook_en='The Royal Exchange: The Royal Exchange is a grand nineteenth-century trading building on the site where London merchants first gathered under one roof in the 1560s.', editorial_hook_it='The Royal Exchange: The Royal Exchange è un grande edificio commerciale ottocentesco sul luogo dove i mercanti londinesi si riunirono per la prima volta al coperto nel Cinquecento.',
  official_url='https://www.theroyalexchange.co.uk/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FDCDBE7E' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.theroyalexchange.co.uk/history/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-FDCDBE7E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Harrods occupies a terracotta landmark covering an entire Knightsbridge block, developed from Charles Henry Harrod’s nineteenth-century grocery. Its Food Halls retain elaborate tiles, marble and themed rooms, while fashion, jewellery and services across multiple floors make the building itself a spectacle of department-store history.', description_it='Harrods occupa un edificio in terracotta che copre un intero isolato di Knightsbridge, nato dalla drogheria ottocentesca di Charles Henry Harrod. Le Food Halls conservano piastrelle, marmi e sale decorate, mentre moda, gioielli e servizi su più piani raccontano la storia del grande magazzino.',
  editorial_hook_en='Harrods: Harrods occupies a terracotta landmark covering an entire Knightsbridge block, developed from Charles Henry Harrod’s nineteenth-century grocery.', editorial_hook_it='Harrods: Harrods occupa un edificio in terracotta che copre un intero isolato di Knightsbridge, nato dalla drogheria ottocentesca di Charles Henry Harrod.',
  official_url='https://www.harrods.com/en-gb/store-guide', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E8ADABFE' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.harrods.com/en-gb/c/stories/history-of-harrods','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-E8ADABFE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Mare Street Market combines a restaurant and bar with florist, record counter, workspace and displays of salvage and antiques in a former Hackney industrial building. Much of its theatrical interior comes from dealer Pure White Lines, so browsing vintage furniture and objects is part of the hospitality experience.', description_it='Mare Street Market combina ristorante e bar con fiorista, dischi, spazi di lavoro e collezioni di recupero e antiquariato in un ex edificio industriale di Hackney. Gran parte dell’interno teatrale proviene dal rivenditore Pure White Lines, quindi curiosare tra mobili e oggetti vintage è parte dell’esperienza.',
  editorial_hook_en='Mare Street Market: Mare Street Market combines a restaurant and bar with florist, record counter, workspace and displays of salvage and antiques in a former Hackney industrial building.', editorial_hook_it='Mare Street Market: Mare Street Market combina ristorante e bar con fiorista, dischi, spazi di lavoro e collezioni di recupero e antiquariato in un ex edificio industriale di Hackney.',
  official_url='https://marestreetmarket.com/', access_notes_en='This is primarily a food or hospitality venue; opening hours, menus and booking arrangements can change.', access_notes_it='È soprattutto un locale gastronomico o di ristorazione; orari, menu e prenotazioni possono cambiare.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-702BB1E7' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://marestreetmarket.com/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-702BB1E7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Berwick Street Market has traded in Soho since the eighteenth century and remains embedded in an ordinary working street. Fruit and vegetable stalls now mix with street food and independent fabric, record and fashion shops nearby, retaining a fragment of old Soho commerce amid media offices and restaurants.', description_it='Berwick Street Market opera a Soho dal Settecento ed è ancora inserito in una normale strada di lavoro. Le bancarelle di frutta e verdura si mescolano oggi a street food e ai vicini negozi indipendenti di tessuti, dischi e moda, conservando un frammento del vecchio commercio di Soho.',
  editorial_hook_en='Berwick Street Market: Berwick Street Market has traded in Soho since the eighteenth century and remains embedded in an ordinary working street.', editorial_hook_it='Berwick Street Market: Berwick Street Market opera a Soho dal Settecento ed è ancora inserito in una normale strada di lavoro.',
  official_url='https://www.westminster.gov.uk/leisure-libraries-and-community/markets/berwick-street-market', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-31A9713E' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.westminster.gov.uk/leisure-libraries-and-community/markets/berwick-street-market','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-31A9713E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Liberty’s mock-Tudor Great Marlborough Street building was assembled in the 1920s using timber from two former Royal Navy ships. Inside, galleried oak atriums display the store’s influential prints, fabrics, fashion and homewares, making its Arts and Crafts interiors as distinctive as the merchandise.', description_it='L’edificio neo-Tudor di Liberty in Great Marlborough Street fu costruito negli anni Venti con legname proveniente da due ex navi della Royal Navy. All’interno, atri in quercia a gallerie espongono celebri stampe, tessuti, moda e oggetti per la casa, rendendo gli interni Arts and Crafts parte essenziale della visita.',
  editorial_hook_en='Liberty London: Liberty’s mock-Tudor Great Marlborough Street building was assembled in the 1920s using timber from two former Royal Navy ships.', editorial_hook_it='Liberty London: L’edificio neo-Tudor di Liberty in Great Marlborough Street fu costruito negli anni Venti con legname proveniente da due ex navi della Royal Navy.',
  official_url='https://www.libertylondon.com/uk/information/our-history.html', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2F57D8F5' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.libertylondon.com/uk/information/our-history.html','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-2F57D8F5'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Heal’s has sold furniture on Tottenham Court Road since 1818 and helped introduce modern design to British homes. The long frontage conceals connected showrooms, the Cecil Brewer spiral staircase and the Heal’s Cat sculpture, while contemporary furniture sits within layers of Arts and Crafts and modernist retail history.', description_it='Heal’s vende mobili in Tottenham Court Road dal 1818 e contribuì a introdurre il design moderno nelle case britanniche. La lunga facciata nasconde showroom collegati, la scala a chiocciola di Cecil Brewer e la scultura Heal’s Cat, con arredi contemporanei in un contesto Arts and Crafts e modernista.',
  editorial_hook_en='Heal’s: Heal’s has sold furniture on Tottenham Court Road since 1818 and helped introduce modern design to British homes.', editorial_hook_it='Heal’s: Heal’s vende mobili in Tottenham Court Road dal 1818 e contribuì a introdurre il design moderno nelle case britanniche.',
  official_url='https://www.heals.com/store/tottenham-court-road', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0F75B51E' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.heals.com/heals-heritage','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-0F75B51E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='London Toy Shop is a specialist dealer at Brown’s Garden Village in Crews Hill, buying and selling vintage toys, comics and collectables. Its appeal lies in older action figures, model vehicles and childhood memorabilia rather than current high-street ranges; the limited weekend opening makes advance checking essential.', description_it='London Toy Shop è un rivenditore specializzato presso Brown’s Garden Village a Crews Hill, che compra e vende giocattoli vintage, fumetti e collezionismo. Il richiamo sta in action figure, modellini e ricordi d’infanzia più che nei prodotti moderni; l’apertura limitata al weekend richiede una verifica preventiva.',
  editorial_hook_en='London Toy Shop: London Toy Shop is a specialist dealer at Brown’s Garden Village in Crews Hill, buying and selling vintage toys, comics and collectables.', editorial_hook_it='London Toy Shop: London Toy Shop è un rivenditore specializzato presso Brown’s Garden Village a Crews Hill, che compra e vende giocattoli vintage, fumetti e collezionismo.',
  official_url='https://thelondontoyshop.co.uk/', access_notes_en='The current visitor offer or public access is limited or uncertain; confirm directly before making a special journey.', access_notes_it='L’offerta attuale o l’accesso pubblico sono limitati o incerti: verifica direttamente prima di partire appositamente.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-35BF8664' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://thelondontoyshop.co.uk/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-35BF8664'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Chrisp Street Market was designed by Frederick Gibberd as part of the 1951 Festival of Britain’s Live Architecture exhibition. Its clock tower, market square and Lansbury Estate setting frame everyday fruit, clothing and household stalls, making it both a neighbourhood market and a surviving piece of post-war planning.', description_it='Chrisp Street Market fu progettato da Frederick Gibberd per la mostra Live Architecture del Festival of Britain del 1951. Torre dell’orologio, piazza e Lansbury Estate incorniciano bancarelle quotidiane di frutta, abiti e casalinghi, rendendolo insieme mercato di quartiere e testimonianza urbanistica del dopoguerra.',
  editorial_hook_en='Chrisp Street Market: Chrisp Street Market was designed by Frederick Gibberd as part of the 1951 Festival of Britain’s Live Architecture exhibition.', editorial_hook_it='Chrisp Street Market: Chrisp Street Market fu progettato da Frederick Gibberd per la mostra Live Architecture del Festival of Britain del 1951.',
  official_url='https://www.towerhamlets.gov.uk/lgnl/business/markets/Chrisp_Street_Market.aspx', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-A87A566F' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://historicengland.org.uk/listing/the-list/list-entry/1430998','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-A87A566F'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Golborne Road Market extends north from Portobello Road but has its own North African and Portuguese character. Produce, household goods and second-hand stalls sit among Moroccan cafés, Portuguese grocers and architectural-salvage shops, with Trellick Tower terminating the view to the west.', description_it='Golborne Road Market prosegue a nord di Portobello Road ma conserva un carattere nordafricano e portoghese distinto. Prodotti freschi, casalinghi e usato convivono con caffè marocchini, alimentari portoghesi e negozi di recupero architettonico, con Trellick Tower sullo sfondo.',
  editorial_hook_en='Golborne Road Market: Golborne Road Market extends north from Portobello Road but has its own North African and Portuguese character.', editorial_hook_it='Golborne Road Market: Golborne Road Market prosegue a nord di Portobello Road ma conserva un carattere nordafricano e portoghese distinto.',
  official_url='https://www.rbkc.gov.uk/leisure-and-culture/markets-and-street-trading/portobello-and-golborne-markets', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-11E644FF' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.rbkc.gov.uk/leisure-and-culture/markets-and-street-trading/portobello-and-golborne-markets','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-11E644FF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Brook Green Market is a small Saturday farmers’ and street-food market held in the grounds of St Paul’s School. Produce, bread, cheese, flowers and prepared dishes are selected for local weekly shopping, with the school courtyard and green giving it a quieter scale than London’s destination markets.', description_it='Brook Green Market è un piccolo mercato del sabato con agricoltori e street food nei terreni di St Paul’s School. Prodotti freschi, pane, formaggi, fiori e piatti pronti sono pensati per la spesa settimanale locale; il cortile scolastico e il vicino green gli danno una scala raccolta.',
  editorial_hook_en='Brook Green Market: Brook Green Market is a small Saturday farmers’ and street-food market held in the grounds of St Paul’s School.', editorial_hook_it='Brook Green Market: Brook Green Market è un piccolo mercato del sabato con agricoltori e street food nei terreni di St Paul’s School.',
  official_url='https://www.brookgreenmarket.co.uk/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B861F604' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.brookgreenmarket.co.uk/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-B861F604'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Hamleys has traded in toys since 1760 and its Regent Street flagship spreads demonstrations, games and themed departments across seven floors. The shop is deliberately theatrical and busy, with staff performances and interactive displays continuing the tradition of William Hamley’s original ‘Noah’s Ark’ toy business.', description_it='Hamleys vende giocattoli dal 1760 e il flagship di Regent Street distribuisce dimostrazioni, giochi e reparti tematici su sette piani. Il negozio è volutamente teatrale e vivace, con personale e installazioni interattive che continuano la tradizione dell’originario emporio “Noah’s Ark” di William Hamley.',
  editorial_hook_en='Hamleys: Hamleys has traded in toys since 1760 and its Regent Street flagship spreads demonstrations, games and themed departments across seven floors.', editorial_hook_it='Hamleys: Hamleys vende giocattoli dal 1760 e il flagship di Regent Street distribuisce dimostrazioni, giochi e reparti tematici su sette piani.',
  official_url='https://www.hamleys.com/stores/regent-street', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-51296A9A' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.hamleys.com/our-history','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-51296A9A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Shepherd’s Bush Market has occupied the railway arches and narrow lane between Goldhawk Road and Uxbridge Road since 1914. Fabric shops, halal butchers, Caribbean and Middle Eastern groceries, household traders and cafés serve the surrounding communities, with textiles remaining a particular strength.', description_it='Shepherd’s Bush Market occupa dal 1914 gli archi ferroviari e lo stretto passaggio tra Goldhawk Road e Uxbridge Road. Tessuti, macellerie halal, alimentari caraibici e mediorientali, casalinghi e caffè servono le comunità vicine, con una particolare specializzazione nelle stoffe.',
  editorial_hook_en='Shepherd’s Bush Market: Shepherd’s Bush Market has occupied the railway arches and narrow lane between Goldhawk Road and Uxbridge Road since 1914.', editorial_hook_it='Shepherd’s Bush Market: Shepherd’s Bush Market occupa dal 1914 gli archi ferroviari e lo stretto passaggio tra Goldhawk Road e Uxbridge Road.',
  official_url='https://shepherdsbushmarket.org/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S6' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://shepherdsbushmarket.org/our-history/','official-or-authoritative','2026-10-18' FROM places WHERE id='S6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Every Sunday Columbia Road becomes a dense open-air flower and plant market, with traders calling prices between Victorian shopfronts. Cut flowers, bedding plants, herbs and shrubs fill the street, while the permanent galleries, garden shops and cafés make the surrounding terrace worth examining after the stalls close.', description_it='Ogni domenica Columbia Road diventa un fitto mercato all’aperto di fiori e piante, con i venditori che chiamano i prezzi tra facciate vittoriane. Fiori recisi, piante da aiuola, erbe e arbusti riempiono la strada; gallerie, negozi di giardinaggio e caffè restano anche dopo la chiusura.',
  editorial_hook_en='Columbia Road Flower Market: Every Sunday Columbia Road becomes a dense open-air flower and plant market, with traders calling prices between Victorian shopfronts.', editorial_hook_it='Columbia Road Flower Market: Ogni domenica Columbia Road diventa un fitto mercato all’aperto di fiori e piante, con i venditori che chiamano i prezzi tra facciate vittoriane.',
  official_url='https://www.columbiaroad.info/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-36EE3D05' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.towerhamlets.gov.uk/lgnl/business/markets/Columbia_Road_Flower_Market.aspx','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-36EE3D05'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Chapel Market is an Islington street market with a practical local focus: fruit and vegetables, fish, household goods, clothing and inexpensive food. It occupies a broad pedestrianised street near the Angel, and its remaining traditional stalls contrast with the restaurants and independent shops that have grown around it.', description_it='Chapel Market è un mercato di strada di Islington dalla funzione pratica e locale: frutta e verdura, pesce, casalinghi, abbigliamento e cibo economico. Occupa un’ampia via pedonale vicino ad Angel; le bancarelle tradizionali contrastano con ristoranti e negozi indipendenti circostanti.',
  editorial_hook_en='Chapel Market: Chapel Market is an Islington street market with a practical local focus: fruit and vegetables, fish, household goods, clothing and inexpensive food.', editorial_hook_it='Chapel Market: Chapel Market è un mercato di strada di Islington dalla funzione pratica e locale: frutta e verdura, pesce, casalinghi, abbigliamento e cibo economico.',
  official_url='https://www.islington.gov.uk/business/licences-permits-registration/trading-on-our-streets/chapel-market', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-85EA8890' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.islington.gov.uk/business/licences-permits-registration/trading-on-our-streets/chapel-market','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-85EA8890'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Truefitt & Hill was founded in 1805 and presents itself as the world’s oldest barbershop. The St James’s premises combines traditional barbering with shaving brushes, razors, fragrances and grooming preparations, preserving the discreet service culture of London’s historic gentlemen’s outfitters.', description_it='Truefitt & Hill fu fondato nel 1805 e si presenta come il barbiere più antico del mondo. La sede di St James’s unisce servizi tradizionali a pennelli da barba, rasoi, profumi e prodotti per la cura personale, conservando la discreta cultura dei fornitori storici per gentiluomini londinesi.',
  editorial_hook_en='Truefitt & Hill: Truefitt & Hill was founded in 1805 and presents itself as the world’s oldest barbershop.', editorial_hook_it='Truefitt & Hill: Truefitt & Hill fu fondato nel 1805 e si presenta come il barbiere più antico del mondo.',
  official_url='https://www.truefittandhill.co.uk/pages/our-history', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-554993F6' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.truefittandhill.co.uk/pages/our-history','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-554993F6'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Japan House London is a cultural centre in a 1930s Kensington building, combining free exhibitions with a carefully curated shop, library and Japanese restaurant. The retail floor presents contemporary craft, stationery, textiles, tableware and regional products with detailed information about their makers and techniques.', description_it='Japan House London è un centro culturale in un edificio anni Trenta di Kensington, con mostre gratuite, negozio curato, biblioteca e ristorante giapponese. Il piano commerciale presenta artigianato contemporaneo, cartoleria, tessuti, stoviglie e prodotti regionali con informazioni su autori e tecniche.',
  editorial_hook_en='Japan House London: Japan House London is a cultural centre in a 1930s Kensington building, combining free exhibitions with a carefully curated shop, library and Japanese restaurant.', editorial_hook_it='Japan House London: Japan House London è un centro culturale in un edificio anni Trenta di Kensington, con mostre gratuite, negozio curato, biblioteca e ristorante giapponese.',
  official_url='https://www.japanhouselondon.uk/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S2' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.japanhouselondon.uk/discover/the-shop/','official-or-authoritative','2026-10-18' FROM places WHERE id='S2'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Daunt Books occupies an Edwardian bookshop built for bookselling, with oak galleries, skylights and a long window at the end of the travel room. Founded here in 1990, the modern shop arranges much of its stock by country, combining travel writing, history and fiction in one of London’s finest retail interiors.', description_it='Daunt Books occupa una libreria edoardiana costruita appositamente, con gallerie in quercia, lucernari e una grande finestra in fondo alla sala viaggi. Fondata qui nel 1990, organizza molti titoli per paese, unendo narrativa, storia e letteratura di viaggio in uno dei più bei negozi londinesi.',
  editorial_hook_en='Daunt Books Marylebone: Daunt Books occupies an Edwardian bookshop built for bookselling, with oak galleries, skylights and a long window at the end of the travel room.', editorial_hook_it='Daunt Books Marylebone: Daunt Books occupa una libreria edoardiana costruita appositamente, con gallerie in quercia, lucernari e una grande finestra in fondo alla sala viaggi.',
  official_url='https://dauntbooks.co.uk/shops/marylebone/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-CF05718E' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://dauntbooks.co.uk/about/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-CF05718E'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='BookMongers is a densely stocked second-hand bookshop on Coldharbour Lane, founded in 1992. Shelves, floor piles and handwritten sections reward patient searching across literature, art and non-fiction, while the shop’s resident-dog tradition and deliberately unpolished interior embody Brixton’s independent bookselling culture.', description_it='BookMongers è una fitta libreria dell’usato su Coldharbour Lane, fondata nel 1992. Scaffali, pile sul pavimento e sezioni scritte a mano premiano la ricerca paziente tra narrativa, arte e saggistica; la tradizione del cane residente e l’interno non patinato incarnano la cultura indipendente di Brixton.',
  editorial_hook_en='BookMongers: BookMongers is a densely stocked second-hand bookshop on Coldharbour Lane, founded in 1992.', editorial_hook_it='BookMongers: BookMongers è una fitta libreria dell’usato su Coldharbour Lane, fondata nel 1992.',
  official_url='https://bookmongers.com/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0E09FC96' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://bookmongers.com/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-0E09FC96'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Judd Books is a family-run shop near Russell Square specialising in discounted new books and a substantial academic second-hand basement. History, philosophy, art, architecture and social sciences dominate, making it especially useful for serious browsing away from the more polished general bookshops nearby.', description_it='Judd Books è una libreria familiare vicino a Russell Square, specializzata in libri nuovi scontati e in un ampio seminterrato accademico dell’usato. Storia, filosofia, arte, architettura e scienze sociali dominano l’offerta, ideale per ricerche approfondite lontano dalle librerie più patinate.',
  editorial_hook_en='Judd Books: Judd Books is a family-run shop near Russell Square specialising in discounted new books and a substantial academic second-hand basement.', editorial_hook_it='Judd Books: Judd Books è una libreria familiare vicino a Russell Square, specializzata in libri nuovi scontati e in un ampio seminterrato accademico dell’usato.',
  official_url='https://juddbooks.com/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-E32EEDA4' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://juddbooks.com/about-us/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-E32EEDA4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Daunt Books Cheapside brings the bookseller’s country-by-country approach into the City, close to St Paul’s. Travel writing and literary fiction sit beside history, biography and current non-fiction selected for office workers and visitors; unlike the Marylebone branch, this is a contemporary shop rather than an Edwardian landmark.', description_it='Daunt Books Cheapside porta nella City, vicino a St Paul’s, l’organizzazione per paesi tipica della catena. Letteratura di viaggio e narrativa affiancano storia, biografie e saggistica scelte per lavoratori e visitatori; diversamente da Marylebone, è una libreria contemporanea, non un edificio edoardiano storico.',
  editorial_hook_en='Daunt Books Cheapside: Daunt Books Cheapside brings the bookseller’s country-by-country approach into the City, close to St Paul’s.', editorial_hook_it='Daunt Books Cheapside: Daunt Books Cheapside porta nella City, vicino a St Paul’s, l’organizzazione per paesi tipica della catena.',
  official_url='https://dauntbooks.co.uk/shops/cheapside/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-4763B350' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://dauntbooks.co.uk/shops/cheapside/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-4763B350'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='John Sandoe Books has filled three small interconnected Chelsea shops since 1957. Books climb floor-to-ceiling across narrow rooms, with strong literary fiction, poetry, biography, history and art selections; knowledgeable hand-selling and the domestic scale matter more here than elaborate display.', description_it='John Sandoe Books occupa dal 1957 tre piccoli negozi collegati a Chelsea. I libri salgono dal pavimento al soffitto in stanze strette, con ottime sezioni di narrativa, poesia, biografie, storia e arte; la competenza dei librai e la scala domestica contano più dell’allestimento.',
  editorial_hook_en='John Sandoe Books: John Sandoe Books has filled three small interconnected Chelsea shops since 1957.', editorial_hook_it='John Sandoe Books: John Sandoe Books occupa dal 1957 tre piccoli negozi collegati a Chelsea.',
  official_url='https://johnsandoe.com/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BDB06A79' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://johnsandoe.com/about-us/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-BDB06A79'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Walden Books is a small second-hand shop on Chalk Farm Road with books spilling across outdoor tables and closely packed interior shelves. Literature, art, music and counterculture are particular strengths, and the shop’s handwritten categories retain the exploratory character of an older Camden book trade.', description_it='Walden Books è una piccola libreria dell’usato su Chalk Farm Road, con volumi sui tavoli esterni e scaffali interni molto fitti. Letteratura, arte, musica e controculture sono punti forti; le categorie scritte a mano conservano il carattere esplorativo del vecchio commercio librario di Camden.',
  editorial_hook_en='Walden Books: Walden Books is a small second-hand shop on Chalk Farm Road with books spilling across outdoor tables and closely packed interior shelves.', editorial_hook_it='Walden Books: Walden Books è una piccola libreria dell’usato su Chalk Farm Road, con volumi sui tavoli esterni e scaffali interni molto fitti.',
  official_url='https://www.waldenbooks.co.uk/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-88665BAF' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.waldenbooks.co.uk/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-88665BAF'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Sokol Books is an antiquarian specialist in rare books and manuscripts from the fifteenth to eighteenth centuries. Its Chelsea premises handles incunabula, early printing, bindings and scholarly works for collectors and institutions; this is appointment-led specialist dealing, not casual general-bookshop browsing.', description_it='Sokol Books è una libreria antiquaria specializzata in libri rari e manoscritti dal Quattrocento al Settecento. La sede di Chelsea tratta incunaboli, prime edizioni a stampa, legature e opere erudite per collezionisti e istituzioni: è commercio specialistico su appuntamento, non una libreria generalista.',
  editorial_hook_en='Sokol Books: Sokol Books is an antiquarian specialist in rare books and manuscripts from the fifteenth to eighteenth centuries.', editorial_hook_it='Sokol Books: Sokol Books è una libreria antiquaria specializzata in libri rari e manoscritti dal Quattrocento al Settecento.',
  official_url='https://sokol.co.uk/', access_notes_en='The current visitor offer or public access is limited or uncertain; confirm directly before making a special journey.', access_notes_it='L’offerta attuale o l’accesso pubblico sono limitati o incerti: verifica direttamente prima di partire appositamente.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-43ABD940' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://sokol.co.uk/about-us/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-43ABD940'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Books for Cooks has specialised entirely in food writing from its Notting Hill shop since 1983. Thousands of cookbooks surround a tiny test kitchen and café where recipes from the shelves are cooked for lunch, turning the shop into both an international culinary archive and a practical laboratory.', description_it='Books for Cooks è specializzata esclusivamente in letteratura gastronomica dal 1983 nella sede di Notting Hill. Migliaia di ricettari circondano una minuscola cucina di prova e un caffè dove a pranzo si preparano ricette tratte dagli scaffali, rendendo il negozio insieme archivio culinario e laboratorio pratico.',
  editorial_hook_en='Books for Cooks: Books for Cooks has specialised entirely in food writing from its Notting Hill shop since 1983.', editorial_hook_it='Books for Cooks: Books for Cooks è specializzata esclusivamente in letteratura gastronomica dal 1983 nella sede di Notting Hill.',
  official_url='https://www.booksforcooks.com/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B14DD3E9' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.booksforcooks.com/about-us/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-B14DD3E9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='This second pin identifies the Coldharbour Lane entrance to BookMongers, Brixton’s long-running second-hand bookshop. The cramped front room leads into deeper shelves of literature, art, politics and social history; it is the same independent business as the nearby BookMongers record, not another branch.', description_it='Questo secondo punto identifica l’ingresso di BookMongers su Coldharbour Lane, storica libreria dell’usato di Brixton. La stanza affollata conduce a scaffali più profondi di narrativa, arte, politica e storia sociale; è la stessa attività del vicino record BookMongers, non un’altra filiale.',
  editorial_hook_en='BookMongers – Brixton entrance: This second pin identifies the Coldharbour Lane entrance to BookMongers, Brixton’s long-running second-hand bookshop.', editorial_hook_it='BookMongers – Brixton entrance: Questo secondo punto identifica l’ingresso di BookMongers su Coldharbour Lane, storica libreria dell’usato di Brixton.',
  official_url='https://bookmongers.com/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-B46237A3' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://bookmongers.com/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-B46237A3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Chestnut Bakery occupies a corner near Elizabeth Street in Belgravia, producing sourdough, laminated pastries and Middle Eastern-influenced bakes on site. The open bakery counter and neighbourhood café make it a food stop rather than a general shopping destination, with bread and seasonal pastries the main reason to visit.', description_it='Chestnut Bakery occupa un angolo vicino a Elizabeth Street a Belgravia e produce in sede lievito madre, sfoglie e prodotti da forno con influenze mediorientali. Il banco aperto e il caffè di quartiere ne fanno una sosta gastronomica, non una destinazione commerciale generica; pane e dolci stagionali sono il richiamo principale.',
  editorial_hook_en='Chestnut Bakery Belgravia: Chestnut Bakery occupies a corner near Elizabeth Street in Belgravia, producing sourdough, laminated pastries and Middle Eastern-influenced bakes on site.', editorial_hook_it='Chestnut Bakery Belgravia: Chestnut Bakery occupa un angolo vicino a Elizabeth Street a Belgravia e produce in sede lievito madre, sfoglie e prodotti da forno con influenze mediorientali.',
  official_url='https://www.chestnutbakery.com/', access_notes_en='This is primarily a food or hospitality venue; opening hours, menus and booking arrangements can change.', access_notes_it='È soprattutto un locale gastronomico o di ristorazione; orari, menu e prenotazioni possono cambiare.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-DB3045E3' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.chestnutbakery.com/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-DB3045E3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Exmouth Market is a short Clerkenwell street of independent shops and restaurants with weekday lunchtime food stalls along its centre. Its surviving shopfronts, nearby Spa Fields history and concentration of small kitchens make it strongest at lunch, rather than a full-scale produce or weekend market.', description_it='Exmouth Market è una breve strada di Clerkenwell con negozi e ristoranti indipendenti e bancarelle gastronomiche nei giorni feriali. Le facciate storiche, la vicina storia di Spa Fields e la concentrazione di piccole cucine la rendono particolarmente viva a pranzo, più che un grande mercato alimentare o del weekend.',
  editorial_hook_en='Exmouth Market: Exmouth Market is a short Clerkenwell street of independent shops and restaurants with weekday lunchtime food stalls along its centre.', editorial_hook_it='Exmouth Market: Exmouth Market è una breve strada di Clerkenwell con negozi e ristoranti indipendenti e bancarelle gastronomiche nei giorni feriali.',
  official_url='https://www.islington.gov.uk/business/licences-permits-registration/trading-on-our-streets/exmouth-market', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-3FE43EF7' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.islington.gov.uk/business/licences-permits-registration/trading-on-our-streets/exmouth-market','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-3FE43EF7'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Lock & Co. has made and sold hats in St James’s since 1676, making it one of the world’s oldest family businesses. The narrow shop retains wooden hat boxes, fitted cabinetry and royal warrants, while bowlers, top hats, Panamas and contemporary felt styles connect ceremonial craft with modern use.', description_it='Lock & Co. produce e vende cappelli a St James’s dal 1676, risultando una delle più antiche imprese familiari al mondo. Il negozio conserva scatole in legno, arredi su misura e royal warrants; bombette, cilindri, Panama e modelli moderni collegano artigianato cerimoniale e uso contemporaneo.',
  editorial_hook_en='Lock & Co. Hatters: Lock & Co. has made and sold hats in St James’s since 1676, making it one of the world’s oldest family businesses.', editorial_hook_it='Lock & Co. Hatters: Lock & Co. produce e vende cappelli a St James’s dal 1676, risultando una delle più antiche imprese familiari al mondo.',
  official_url='https://www.lockhatters.com/pages/heritage', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-6DFB8100' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.lockhatters.com/pages/heritage','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-6DFB8100'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Japan Centre’s Leicester Square food hall combines a Japanese supermarket with bakery, hot-food counters, sushi and specialist ingredients. Rice, noodles, seasonings, tableware and regional products make it useful for home cooking, while the depachika-style layout compresses several Japanese food traditions into one basement space.', description_it='La food hall Japan Centre di Leicester Square unisce supermercato giapponese, panetteria, banchi caldi, sushi e ingredienti specializzati. Riso, noodles, condimenti, stoviglie e prodotti regionali servono chi cucina a casa, mentre l’impianto da depachika concentra varie tradizioni alimentari in un unico seminterrato.',
  editorial_hook_en='Japan Centre: Japan Centre’s Leicester Square food hall combines a Japanese supermarket with bakery, hot-food counters, sushi and specialist ingredients.', editorial_hook_it='Japan Centre: La food hall Japan Centre di Leicester Square unisce supermercato giapponese, panetteria, banchi caldi, sushi e ingredienti specializzati.',
  official_url='https://www.japancentre.com/en/pages/15-our-stores', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-BD7051AD' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.japancentre.com/en/pages/15-our-stores','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-BD7051AD'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Duck Pond Market brings independent makers, ethical businesses and food producers to the historic Manor Farm site in Ruislip on selected Sundays. Stalls occupy the Great Barn and surrounding grounds, pairing crafts, gifts and produce with a medieval farm complex rather than a permanent high-street market.', description_it='Duck Pond Market riunisce produttori, artigiani e imprese etiche nello storico complesso Manor Farm di Ruislip in alcune domeniche. Le bancarelle occupano il Great Barn e gli spazi circostanti, unendo artigianato, regali e alimentari a una fattoria medievale invece che a un mercato permanente.',
  editorial_hook_en='Duck Pond Market Ruislip: Duck Pond Market brings independent makers, ethical businesses and food producers to the historic Manor Farm site in Ruislip on selected Sundays.', editorial_hook_it='Duck Pond Market Ruislip: Duck Pond Market riunisce produttori, artigiani e imprese etiche nello storico complesso Manor Farm di Ruislip in alcune domeniche.',
  official_url='https://duckpondmarket.com/ruislip', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-01643C93' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://duckpondmarket.com/ruislip','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-01643C93'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Berry Bros. & Rudd has traded wine from No. 3 St James’s Street since 1698. Sloping wooden floors, old weighing scales, cellars beneath the street and a maze of historic rooms preserve the atmosphere of a Georgian wine merchant, while the business remains a working specialist retailer and educator.', description_it='Berry Bros. & Rudd commercia vino al numero 3 di St James’s Street dal 1698. Pavimenti in legno inclinati, antiche bilance, cantine sotto la strada e stanze storiche conservano l’atmosfera di un mercante georgiano, mentre l’azienda resta un rivenditore specializzato e centro di formazione attivo.',
  editorial_hook_en='Berry Bros. & Rudd: Berry Bros. & Rudd has traded wine from No.', editorial_hook_it='Berry Bros. & Rudd: Berry Bros. & Rudd commercia vino al numero 3 di St James’s Street dal 1698.',
  official_url='https://www.bbr.com/about/history', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2256C7B9' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.bbr.com/about/history','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-2256C7B9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Keith Fawkes is a long-established Hampstead dealer whose small frontage opens into rooms crowded with architectural salvage, fireplaces, doors, ironwork and domestic antiques. The stock is practical as well as decorative, rewarding close inspection for fragments of London buildings rather than polished showroom pieces.', description_it='Keith Fawkes è uno storico rivenditore di Hampstead: dietro la piccola facciata si aprono stanze affollate di recupero architettonico, camini, porte, ferri e oggetti domestici. L’assortimento è pratico oltre che decorativo e permette di cercare frammenti di edifici londinesi più che pezzi da showroom patinato.',
  editorial_hook_en='Keith Fawkes: Keith Fawkes is a long-established Hampstead dealer whose small frontage opens into rooms crowded with architectural salvage, fireplaces, doors, ironwork and domestic antiques.', editorial_hook_it='Keith Fawkes: Keith Fawkes è uno storico rivenditore di Hampstead: dietro la piccola facciata si aprono stanze affollate di recupero architettonico, camini, porte, ferri e oggetti domestici.',
  official_url='https://www.keithfawkes.com/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-31BDCEA0' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.keithfawkes.com/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-31BDCEA0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Dawat is a large Pakistani and Indian restaurant on Upper Tooting Road, known for grilled meats, curries, breads, breakfast and a busy takeaway counter. It is included in the source map’s shopping category, but visitors should treat it as a food stop serving Tooting’s South Asian community, not as a retail market.', description_it='Dawat è un grande ristorante pakistano e indiano su Upper Tooting Road, noto per carni alla griglia, curry, pane, colazioni e un vivace banco takeaway. È classificato come shopping nella mappa originale, ma va considerato una sosta gastronomica per la comunità sudasiatica di Tooting, non un mercato.',
  editorial_hook_en='Dawat Tooting: Dawat is a large Pakistani and Indian restaurant on Upper Tooting Road, known for grilled meats, curries, breads, breakfast and a busy takeaway counter.', editorial_hook_it='Dawat Tooting: Dawat è un grande ristorante pakistano e indiano su Upper Tooting Road, noto per carni alla griglia, curry, pane, colazioni e un vivace banco takeaway.',
  official_url='https://dawatgroup.co.uk/', access_notes_en='This is primarily a food or hospitality venue; opening hours, menus and booking arrangements can change.', access_notes_it='È soprattutto un locale gastronomico o di ristorazione; orari, menu e prenotazioni possono cambiare.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-53DEB44D' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://dawatgroup.co.uk/menu/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-53DEB44D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Old Cinema occupies a former Chiswick picture house and is described as London’s oldest antiques emporium. Multiple dealers fill its rambling floors with twentieth-century furniture, lighting, decorative salvage, taxidermy and curios, using the old auditorium’s scale to create an unusually theatrical browsing experience.', description_it='The Old Cinema occupa un ex cinema di Chiswick ed è presentato come il più antico emporio d’antiquariato di Londra. Vari commercianti riempiono i piani con mobili del Novecento, lampade, recupero decorativo, tassidermia e curiosità, sfruttando la scala dell’antica sala per una visita teatrale.',
  editorial_hook_en='The Old Cinema: The Old Cinema occupies a former Chiswick picture house and is described as London’s oldest antiques emporium.', editorial_hook_it='The Old Cinema: The Old Cinema occupa un ex cinema di Chiswick ed è presentato come il più antico emporio d’antiquariato di Londra.',
  official_url='https://www.theoldcinema.co.uk/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-FC20623D' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.theoldcinema.co.uk/pages/about-us','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-FC20623D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Venn Street Market is a Saturday food market on a pedestrianised street beside Clapham Common. Producers sell meat, fish, cheese, bread, vegetables and prepared dishes, with an emphasis on traceable ingredients and small suppliers; surrounding cinemas, cafés and shops extend the visit beyond the stalls.', description_it='Venn Street Market è un mercato alimentare del sabato su una strada pedonale vicino a Clapham Common. I produttori vendono carne, pesce, formaggi, pane, verdure e piatti pronti, con attenzione a provenienza e piccoli fornitori; cinema, caffè e negozi circostanti completano la visita.',
  editorial_hook_en='Venn Street Market: Venn Street Market is a Saturday food market on a pedestrianised street beside Clapham Common.', editorial_hook_it='Venn Street Market: Venn Street Market è un mercato alimentare del sabato su una strada pedonale vicino a Clapham Common.',
  official_url='https://www.vennstreetmarket.co.uk/', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C824CF2D' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.vennstreetmarket.co.uk/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-C824CF2D'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Point 64 is mapped on the residential southern edge of Clapham Common, but no reliable current public retail presence can be confirmed at this location. The name may refer to a former or privately operated business; it should not be presented as an established shopping attraction without fresh on-site confirmation.', description_it='Point 64 è indicato sul margine residenziale meridionale di Clapham Common, ma non è possibile confermare una presenza commerciale pubblica attuale e affidabile. Il nome può riferirsi a un’attività passata o privata e non va presentato come meta shopping senza una nuova verifica sul posto.',
  editorial_hook_en='Point 64: Point 64 is mapped on the residential southern edge of Clapham Common, but no reliable current public retail presence can be confirmed at this location.', editorial_hook_it='Point 64: Point 64 è indicato sul margine residenziale meridionale di Clapham Common, ma non è possibile confermare una presenza commerciale pubblica attuale e affidabile.',
  official_url='https://www.lambeth.gov.uk/business-rates-services-licensing', access_notes_en='The current visitor offer or public access is limited or uncertain; confirm directly before making a special journey.', access_notes_it='L’offerta attuale o l’accesso pubblico sono limitati o incerti: verifica direttamente prima di partire appositamente.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-C5062EB0' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://find-and-update.company-information.service.gov.uk/company/10127460','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-C5062EB0'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Osterley Bookshop is a famously crowded second-hand shop near Osterley station, with books stacked into narrow passages across several rooms. General fiction, history, transport, art and old paperbacks appear in little apparent order, making the pleasure the physical search itself rather than a polished or quickly searchable collection.', description_it='Osterley Bookshop è una celebre libreria dell’usato vicino alla stazione di Osterley, con volumi impilati in passaggi stretti attraverso varie stanze. Narrativa, storia, trasporti, arte e vecchi tascabili appaiono in ordine minimo: il piacere sta nella ricerca fisica, non in una collezione patinata o rapidamente consultabile.',
  editorial_hook_en='Osterley Bookshop: Osterley Bookshop is a famously crowded second-hand shop near Osterley station, with books stacked into narrow passages across several rooms.', editorial_hook_it='Osterley Bookshop: Osterley Bookshop è una celebre libreria dell’usato vicino alla stazione di Osterley, con volumi impilati in passaggi stretti attraverso varie stanze.',
  official_url='https://www.atlasobscura.com/places/osterley-bookshop', access_notes_en='The current visitor offer or public access is limited or uncertain; confirm directly before making a special journey.', access_notes_it='L’offerta attuale o l’accesso pubblico sono limitati o incerti: verifica direttamente prima di partire appositamente.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S3' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.atlasobscura.com/places/osterley-bookshop','official-or-authoritative','2026-10-18' FROM places WHERE id='S3'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Stableyard shop at Morden Hall Park sells donated second-hand books inside the National Trust estate’s former service buildings. Fiction, children’s books and general non-fiction support conservation work, and the modest shop is best combined with the Wandle, snuff mill and park rather than treated as a standalone retail destination.', description_it='La libreria Stableyard di Morden Hall Park vende libri usati donati negli ex edifici di servizio della tenuta National Trust. Narrativa, libri per bambini e saggistica finanziano la conservazione; il piccolo negozio si combina meglio con Wandle, mulino da tabacco e parco che come meta commerciale autonoma.',
  editorial_hook_en='The Stableyard Second-hand Bookshop: The Stableyard shop at Morden Hall Park sells donated second-hand books inside the National Trust estate’s former service buildings.', editorial_hook_it='The Stableyard Second-hand Bookshop: La libreria Stableyard di Morden Hall Park vende libri usati donati negli ex edifici di servizio della tenuta National Trust.',
  official_url='https://www.nationaltrust.org.uk/visit/london/morden-hall-park', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-2B0C2BDE' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.nationaltrust.org.uk/visit/london/morden-hall-park','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-2B0C2BDE'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Clifton Nurseries has occupied a hidden Little Venice garden site since 1851. Glasshouses, brick walls and mature planting frame displays of houseplants, garden trees, pots and tools, while design services and a café preserve the feel of a working Victorian nursery inside dense central London.', description_it='Clifton Nurseries occupa dal 1851 un giardino nascosto a Little Venice. Serre, muri in mattoni e piante mature incorniciano piante da interno, alberi, vasi e attrezzi; servizi di progettazione e caffè conservano l’atmosfera di un vivaio vittoriano attivo nel centro della città.',
  editorial_hook_en='Clifton Nurseries: Clifton Nurseries has occupied a hidden Little Venice garden site since 1851.', editorial_hook_it='Clifton Nurseries: Clifton Nurseries occupa dal 1851 un giardino nascosto a Little Venice.',
  official_url='https://www.clifton.co.uk/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-639F868A' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.clifton.co.uk/pages/our-history','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-639F868A'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Bookshop on the Heath at 74 Tranquil Vale is an independent second-hand bookshop facing Blackheath’s village centre. Its distinctive blue frontage leads to shelves of literature, history, art and collectable editions selected for browsing, giving the address a clear identity beyond its source-data label.', description_it='The Bookshop on the Heath al 74 Tranquil Vale è una libreria indipendente dell’usato di fronte al centro di Blackheath. La caratteristica facciata blu introduce scaffali di narrativa, storia, arte ed edizioni da collezione scelti per essere esplorati, dando all’indirizzo un’identità precisa oltre l’etichetta del database.',
  editorial_hook_en='The Bookshop on the Heath: The Bookshop on the Heath at 74 Tranquil Vale is an independent second-hand bookshop facing Blackheath’s village centre.', editorial_hook_it='The Bookshop on the Heath: The Bookshop on the Heath al 74 Tranquil Vale è una libreria indipendente dell’usato di fronte al centro di Blackheath.',
  official_url='https://www.instagram.com/thebookshopontheheath/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-0581B888' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.instagram.com/thebookshopontheheath/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-0581B888'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Roman Road Market has served Bow for more than a century, with traditional stalls lining the street on its main trading days. Clothing, fabrics, household goods, produce and inexpensive food retain a practical East End focus, while independent shops and cafés connect the market to the surrounding residential neighbourhood.', description_it='Roman Road Market serve Bow da oltre un secolo, con bancarelle tradizionali lungo la strada nei principali giorni di attività. Abbigliamento, tessuti, casalinghi, prodotti freschi e cibo economico mantengono una funzione pratica dell’East End, collegata ai negozi e caffè del quartiere residenziale.',
  editorial_hook_en='Roman Road Market: Roman Road Market has served Bow for more than a century, with traditional stalls lining the street on its main trading days.', editorial_hook_it='Roman Road Market: Roman Road Market serve Bow da oltre un secolo, con bancarelle tradizionali lungo la strada nei principali giorni di attività.',
  official_url='https://www.towerhamlets.gov.uk/lgnl/business/markets/Roman_Road_Market.aspx', access_notes_en='Trading days and stall line-ups change; check the official market source before travelling.', access_notes_it='Giorni di mercato e bancarelle cambiano: controlla la fonte ufficiale prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-D0DE9DA4' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://romanroadlondon.com/market/','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-D0DE9DA4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Alfies Antique Market fills a large Egyptian-style former department store in Marylebone with dozens of independent dealers. Art Deco furniture, twentieth-century design, jewellery, fashion and collectables occupy several floors, and the rooftop café offers a pause above one of London’s most concentrated antiques centres.', description_it='Alfies Antique Market riempie un grande ex magazzino in stile egizio a Marylebone con decine di commercianti indipendenti. Mobili Art Déco, design del Novecento, gioielli, moda e collezionismo occupano più piani; il caffè sul tetto offre una pausa sopra uno dei maggiori centri antiquari londinesi.',
  editorial_hook_en='Alfies Antique Market: Alfies Antique Market fills a large Egyptian-style former department store in Marylebone with dozens of independent dealers.', editorial_hook_it='Alfies Antique Market: Alfies Antique Market riempie un grande ex magazzino in stile egizio a Marylebone con decine di commercianti indipendenti.',
  official_url='https://alfiesantiques.com/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S8' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://alfiesantiques.com/about/','official-or-authoritative','2026-10-18' FROM places WHERE id='S8'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Maison Assouline occupies a listed former bank designed by Edwin Lutyens on Piccadilly. Oversized illustrated books on travel, fashion, art and design share the grand banking hall with curated objects and a bar, turning the publisher’s flagship into a highly staged library, shop and hospitality space.', description_it='Maison Assouline occupa un’ex banca tutelata progettata da Edwin Lutyens su Piccadilly. Grandi libri illustrati su viaggi, moda, arte e design condividono il salone bancario con oggetti selezionati e un bar, trasformando il flagship dell’editore in biblioteca, negozio e spazio di ospitalità scenografico.',
  editorial_hook_en='Maison Assouline: Maison Assouline occupies a listed former bank designed by Edwin Lutyens on Piccadilly.', editorial_hook_it='Maison Assouline: Maison Assouline occupa un’ex banca tutelata progettata da Edwin Lutyens su Piccadilly.',
  official_url='https://eu.assouline.com/pages/maison', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S9' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://eu.assouline.com/pages/maison','official-or-authoritative','2026-10-18' FROM places WHERE id='S9'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Poetry Pharmacy’s London dispensary uses the language of medicine to match poems and books to emotional needs. Shelves are organised around literary ‘prescriptions’, with poetry collections, gifts, events and a coffee counter inside the Lush building, making bibliotherapy the concept rather than conventional genre shelving.', description_it='La sede londinese di Poetry Pharmacy usa il linguaggio della medicina per abbinare poesie e libri ai bisogni emotivi. Gli scaffali seguono “prescrizioni” letterarie, con raccolte, regali, eventi e caffè nell’edificio Lush: la biblioterapia sostituisce la normale organizzazione per generi.',
  editorial_hook_en='Poetry Pharmacy: Poetry Pharmacy’s London dispensary uses the language of medicine to match poems and books to emotional needs.', editorial_hook_it='Poetry Pharmacy: La sede londinese di Poetry Pharmacy usa il linguaggio della medicina per abbinare poesie e libri ai bisogni emotivi.',
  official_url='https://poetrypharmacy.co.uk/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S11' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://poetrypharmacy.co.uk/pages/london','official-or-authoritative','2026-10-18' FROM places WHERE id='S11'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Fortnum & Mason has traded from Piccadilly since 1707, and its lower floors remain centred on tea, preserves, biscuits, confectionery and luxury provisions. Historic clocks, uniformed service and elaborate displays turn grocery shopping into theatre, while the firm’s royal warrants connect the store to centuries of court supply.', description_it='Fortnum & Mason opera a Piccadilly dal 1707 e i piani inferiori restano dedicati a tè, conserve, biscotti, dolci e alimentari di lusso. Orologi storici, servizio in uniforme e vetrine elaborate trasformano la spesa in teatro; i royal warrants collegano il negozio a secoli di forniture alla corte.',
  editorial_hook_en='Fortnum & Mason Food Hall: Fortnum & Mason has traded from Piccadilly since 1707, and its lower floors remain centred on tea, preserves, biscuits, confectionery and luxury provisions.', editorial_hook_it='Fortnum & Mason Food Hall: Fortnum & Mason opera a Piccadilly dal 1707 e i piani inferiori restano dedicati a tè, conserve, biscotti, dolci e alimentari di lusso.',
  official_url='https://www.fortnumandmason.com/our-history', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-15CF6577' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.fortnumandmason.com/our-history','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-15CF6577'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Benjamin Pollock’s Toyshop specialises in toy theatres, paper models, puppets and optical amusements descended from the Victorian theatrical-print trade. The Covent Garden shop preserves a fragile form of imaginative play through printed scenery and characters, alongside carefully chosen traditional and contemporary toys.', description_it='Benjamin Pollock’s Toyshop è specializzato in teatrini, modelli di carta, marionette e giochi ottici derivati dalla stampa teatrale vittoriana. Il negozio di Covent Garden conserva questa fragile forma di gioco con scenografie e personaggi stampati, accanto a giocattoli tradizionali e contemporanei selezionati.',
  editorial_hook_en='Benjamin Pollock’s Toyshop: Benjamin Pollock’s Toyshop specialises in toy theatres, paper models, puppets and optical amusements descended from the Victorian theatrical-print trade.', editorial_hook_it='Benjamin Pollock’s Toyshop: Benjamin Pollock’s Toyshop è specializzato in teatrini, modelli di carta, marionette e giochi ottici derivati dalla stampa teatrale vittoriana.',
  official_url='https://www.pollocks-coventgarden.co.uk/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-39277534' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.pollocks-coventgarden.co.uk/pages/about-us','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-39277534'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Hurlingham Books is a second-hand bookshop in Fulham with shelves and outdoor boxes packed far beyond the scale suggested by its small frontage. Literature, history, art and general non-fiction reward unhurried searching, while the owner’s warehouse stock underpins a collection broader than the visible shop alone.', description_it='Hurlingham Books è una libreria dell’usato di Fulham con scaffali e cassette esterne molto più fitti di quanto suggerisca la piccola facciata. Narrativa, storia, arte e saggistica premiano una ricerca lenta, mentre il magazzino del proprietario sostiene una collezione più ampia del solo negozio visibile.',
  editorial_hook_en='Hurlingham Books: Hurlingham Books is a second-hand bookshop in Fulham with shelves and outdoor boxes packed far beyond the scale suggested by its small frontage.', editorial_hook_it='Hurlingham Books: Hurlingham Books è una libreria dell’usato di Fulham con scaffali e cassette esterne molto più fitti di quanto suggerisca la piccola facciata.',
  official_url='https://hurlinghambooks.com/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S1' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://hurlinghambooks.com/about-us/','official-or-authoritative','2026-10-18' FROM places WHERE id='S1'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Wood Street Indoor Market occupies a former cinema and market building in Walthamstow, its small units gathered around covered passages and an open yard. Vintage clothing, records, furniture, repairs, studios and cafés create a low-key creative cluster that remains tied to Wood Street’s everyday high street.', description_it='Wood Street Indoor Market occupa un ex cinema e mercato a Walthamstow, con piccole unità raccolte attorno a passaggi coperti e un cortile. Abiti vintage, dischi, mobili, riparazioni, studi e caffè formano un nucleo creativo informale ancora legato alla vita quotidiana di Wood Street.',
  editorial_hook_en='Wood Street Indoor Market: Wood Street Indoor Market occupies a former cinema and market building in Walthamstow, its small units gathered around covered passages and an open yard.', editorial_hook_it='Wood Street Indoor Market: Wood Street Indoor Market occupa un ex cinema e mercato a Walthamstow, con piccole unità raccolte attorno a passaggi coperti e un cortile.',
  official_url='https://www.woodstreetindoormarket.co.uk/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S10' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.woodstreetindoormarket.co.uk/about','official-or-authoritative','2026-10-18' FROM places WHERE id='S10'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='International Magic is a specialist Clerkenwell shop serving professional and amateur magicians with cards, apparatus, books and instructional material. Founded in 1960, it also has a close association with London’s International Magic Convention, so advice and performance knowledge matter as much as the compact stockroom.', description_it='International Magic è un negozio specializzato di Clerkenwell per illusionisti professionisti e dilettanti, con carte, attrezzature, libri e materiali didattici. Fondato nel 1960, è legato anche all’International Magic Convention di Londra: consulenza e conoscenza performativa contano quanto il piccolo magazzino.',
  editorial_hook_en='International Magic Shop: International Magic is a specialist Clerkenwell shop serving professional and amateur magicians with cards, apparatus, books and instructional material.', editorial_hook_it='International Magic Shop: International Magic è un negozio specializzato di Clerkenwell per illusionisti professionisti e dilettanti, con carte, attrezzature, libri e materiali didattici.',
  official_url='https://www.internationalmagic.com/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='LA-492E6464' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.internationalmagic.com/about-us','official-or-authoritative','2026-10-18' FROM places WHERE id='LA-492E6464'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='The Junk Shop in Greenwich mixes antiques, vintage furniture, china, pictures and architectural odds and ends in densely layered rooms. Objects are arranged for discovery rather than by museum-like category, and its tea-room element encourages a longer look through domestic fragments from different periods.', description_it='The Junk Shop a Greenwich mescola antiquariato, mobili vintage, porcellane, quadri e frammenti architettonici in stanze densamente stratificate. Gli oggetti sono disposti per la scoperta più che per categorie museali; la sala da tè invita a esplorare con calma reperti domestici di epoche diverse.',
  editorial_hook_en='The Junk Shop: The Junk Shop in Greenwich mixes antiques, vintage furniture, china, pictures and architectural odds and ends in densely layered rooms.', editorial_hook_it='The Junk Shop: The Junk Shop a Greenwich mescola antiquariato, mobili vintage, porcellane, quadri e frammenti architettonici in stanze densamente stratificate.',
  official_url='https://www.junkshoplondon.co.uk/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S4' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.junkshoplondon.co.uk/','official-or-authoritative','2026-10-18' FROM places WHERE id='S4'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET description_en='Hoxton Street Monster Supplies presents itself as a provisions shop for monsters, selling tins of ‘mortal terror’, bottled ‘human snot’ and other carefully designed fictional goods. The shop supports the Ministry of Stories writing charity, so the deadpan Victorian retail theatre directly funds creative programmes for young people.', description_it='Hoxton Street Monster Supplies si presenta come emporio per mostri, vendendo scatole di “terrore mortale”, bottiglie di “muco umano” e altri prodotti immaginari accuratamente progettati. Il negozio sostiene l’associazione Ministry of Stories: il teatro commerciale vittoriano finanzia programmi di scrittura per giovani.',
  editorial_hook_en='Hoxton Street Monster Supplies: Hoxton Street Monster Supplies presents itself as a provisions shop for monsters, selling tins of ‘mortal terror’, bottled ‘human snot’ and other carefully designed fictional goods.', editorial_hook_it='Hoxton Street Monster Supplies: Hoxton Street Monster Supplies si presenta come emporio per mostri, vendendo scatole di “terrore mortale”, bottiglie di “muco umano” e altri prodotti immaginari accuratamente progettati.',
  official_url='https://www.monstersupplies.org/', access_notes_en='Opening hours and stock can change; check the retailer’s official site before travelling.', access_notes_it='Orari e assortimento possono cambiare: controlla il sito ufficiale del negozio prima di partire.',
  last_verified_at='2026-10-18', updated_at=CURRENT_TIMESTAMP
WHERE id='S12' AND category='SHOPPING';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.monstersupplies.org/pages/our-story','official-or-authoritative','2026-10-18' FROM places WHERE id='S12'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

INSERT INTO app_meta(key,value,updated_at) VALUES ('shopping_editorial_version','2026-10-18',CURRENT_TIMESTAMP)
ON CONFLICT(key) DO UPDATE SET value=excluded.value, updated_at=CURRENT_TIMESTAMP;
