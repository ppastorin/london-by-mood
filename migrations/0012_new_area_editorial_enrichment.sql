-- Publish and enrich the four AREA records imported through the production editor.
-- Names are matched case-insensitively because the source CSV used abbreviated/lower-case labels.
-- Research verified against official or authoritative sources on 2026-10-25.
CREATE TABLE IF NOT EXISTS place_editorial_sources (
  place_id TEXT NOT NULL REFERENCES places(id) ON DELETE CASCADE,
  source_url TEXT NOT NULL,
  source_kind TEXT NOT NULL DEFAULT 'official-or-authoritative',
  verified_at TEXT NOT NULL,
  PRIMARY KEY(place_id, source_url)
);
CREATE INDEX IF NOT EXISTS idx_editorial_sources_place ON place_editorial_sources(place_id);

UPDATE places SET
  name='Lonsdale Road',
  slug='lonsdale-road',
  status='published',
  description_en='Lonsdale Road is a broad cobbled mews in Queen’s Park, lined by unusually complete nineteenth-century stables, workshops and small commercial buildings. Former carriage builders, contractors, upholsterers and motor workshops have given way to independent restaurants, studios and local businesses without erasing the street’s working scale.',
  description_it='Lonsdale Road è un ampio mews acciottolato di Queen’s Park, fiancheggiato da scuderie, officine e piccoli edifici commerciali ottocenteschi insolitamente ben conservati. Carrozzieri, imprese edili, tappezzieri e autorimesse hanno lasciato il posto a ristoranti, studi e attività indipendenti senza cancellarne la scala operativa.',
  editorial_hook_en='A cobbled Queen’s Park mews turns Victorian stables and workshops into one of northwest London’s strongest independent streets.',
  editorial_hook_it='Un mews acciottolato di Queen’s Park trasforma scuderie e officine vittoriane in una delle strade indipendenti più riuscite del nord-ovest londinese.',
  official_url='https://www.brent.gov.uk/media/16402724/queens-park-conservation-area-appraisal.pdf',
  price_text='Free', access_type='24H',
  access_notes_en='Publicly accessible street, but the roadway is privately owned and individual businesses keep their own hours. Visit on foot and respect deliveries, residents and commercial activity.',
  access_notes_it='Strada accessibile al pubblico, ma la carreggiata è di proprietà privata e ogni attività segue i propri orari. Visitala a piedi rispettando consegne, residenti e attività commerciali.',
  tourist_intensity=40, crowd_scope='STREET', visit_minutes=45, best_time='DAY', weather_fit='DRY', visit_mode='EXPLORE',
  mood_quiet=1, mood_unexpected=2, mood_beautiful=2, mood_weird=0, mood_local=3, mood_green=0, mood_atmospheric=2, mood_lively=2,
  mood_reviewed=1, mood_confidence='HIGH', mood_basis='EDITORIAL_RESEARCH+PLACE_CHARACTER+CATEGORY',
  last_verified_at='2026-10-25', published_at=COALESCE(published_at, CURRENT_TIMESTAMP), updated_at=CURRENT_TIMESTAMP
WHERE lower(trim(name)) IN ('lonsdale rd','lonsdale road') AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.brent.gov.uk/media/16402724/queens-park-conservation-area-appraisal.pdf','official-or-authoritative','2026-10-25'
FROM places WHERE lower(trim(name))='lonsdale road' AND category='AREA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET
  name='Aberfeldy Street Murals',
  slug='aberfeldy-street-murals',
  status='published',
  description_en='Aberfeldy Street’s shopfronts were transformed in 2020 with a continuous patchwork of colour developed with local residents. Patterns donated by the community reference Poplar’s garment-making history and the Bangladeshi kantha tradition of reusing treasured fabric, while large end-wall murals extend the scheme beyond the high street.',
  description_it='Nel 2020 le facciate commerciali di Aberfeldy Street sono state trasformate in un patchwork continuo di colori sviluppato con i residenti. I motivi donati dalla comunità richiamano la storia tessile di Poplar e la tradizione bengalese del kantha, che riutilizza stoffe care, mentre grandi murales alle estremità ampliano il progetto oltre la via principale.',
  editorial_hook_en='Community-donated textile patterns turn a Poplar high street into a vivid mural inspired by garment work and Bengali kantha.',
  editorial_hook_it='Motivi tessili donati dalla comunità trasformano una strada di Poplar in un murale ispirato al lavoro sartoriale e al kantha bengalese.',
  official_url='https://www.poplarharca.co.uk/new-homes-regeneration/regeneration/project/aberfeldy-street/',
  price_text='Free', access_type='24H',
  access_notes_en='The murals can be seen from the public street at any time. This remains a working neighbourhood high street, so avoid blocking shops, homes or pavements when taking photographs.',
  access_notes_it='I murales sono visibili dalla strada pubblica in qualsiasi momento. È una via commerciale di quartiere: fotografando, non bloccare negozi, abitazioni o marciapiedi.',
  tourist_intensity=30, crowd_scope='STREET', visit_minutes=30, best_time='DAY', weather_fit='DRY', visit_mode='WALK',
  mood_quiet=1, mood_unexpected=3, mood_beautiful=2, mood_weird=1, mood_local=3, mood_green=0, mood_atmospheric=2, mood_lively=2,
  mood_reviewed=1, mood_confidence='HIGH', mood_basis='OFFICIAL_PROJECT_DESCRIPTION+COMMUNITY_ART+CATEGORY',
  last_verified_at='2026-10-25', published_at=COALESCE(published_at, CURRENT_TIMESTAMP), updated_at=CURRENT_TIMESTAMP
WHERE lower(trim(name)) IN ('aberfeldy street mural','aberfeldy street murals') AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.poplarharca.co.uk/new-homes-regeneration/regeneration/project/aberfeldy-street/','official-or-authoritative','2026-10-25'
FROM places WHERE lower(trim(name))='aberfeldy street murals' AND category='AREA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET
  name='Turin Street',
  slug='turin-street',
  status='published',
  description_en='Turin Street follows a useful north–south line through Bethnal Green between Gosset Street and the Brick Lane side of Cheshire Street. Originally divided between Hope Town and Union Street, it was unified under its present name after 1864; surviving nineteenth-century terraces lead towards St Matthew’s Row and the eighteenth-century parish church.',
  description_it='Turin Street segue un utile asse nord-sud attraverso Bethnal Green, tra Gosset Street e Cheshire Street verso Brick Lane. In origine divisa tra Hope Town e Union Street, assunse il nome attuale dopo il 1864; le case ottocentesche superstiti conducono verso St Matthew’s Row e la chiesa parrocchiale settecentesca.',
  editorial_hook_en='A modest Bethnal Green street links Victorian terraces, an old parish route and the quieter approach to Brick Lane.',
  editorial_hook_it='Una modesta strada di Bethnal Green unisce case vittoriane, un antico percorso parrocchiale e l’accesso più tranquillo a Brick Lane.',
  official_url='https://www.towerhamlets.gov.uk/Documents/Planning-and-building-control/Strategic-Planning/Local-Plan/Green_Grid_Update_Appendicies_2017.pdf',
  price_text='Free', access_type='24H',
  access_notes_en='Public residential street. The interest is in the surviving streetscape and route rather than a single attraction; be considerate around homes, schools and the small gated garden near St Matthew’s Row.',
  access_notes_it='Strada residenziale pubblica. L’interesse è nel paesaggio urbano e nel percorso, non in una singola attrazione; rispetta abitazioni, scuole e il piccolo giardino recintato vicino a St Matthew’s Row.',
  tourist_intensity=20, crowd_scope='STREET', visit_minutes=20, best_time='DAY', weather_fit='DRY', visit_mode='WALK',
  mood_quiet=2, mood_unexpected=2, mood_beautiful=1, mood_weird=0, mood_local=3, mood_green=0, mood_atmospheric=2, mood_lively=1,
  mood_reviewed=1, mood_confidence='MEDIUM', mood_basis='COUNCIL_ROUTE_DESCRIPTION+HISTORIC_STREET_RECORD+CATEGORY',
  last_verified_at='2026-10-25', published_at=COALESCE(published_at, CURRENT_TIMESTAMP), updated_at=CURRENT_TIMESTAMP
WHERE lower(trim(name)) IN ('turin st','turin street') AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://www.towerhamlets.gov.uk/Documents/Planning-and-building-control/Strategic-Planning/Local-Plan/Green_Grid_Update_Appendicies_2017.pdf','official-or-authoritative','2026-10-25'
FROM places WHERE lower(trim(name))='turin street' AND category='AREA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

UPDATE places SET
  name='Blackheath Village',
  slug='blackheath-village',
  status='published',
  description_en='Blackheath Village gathers independent shops, cafés and pubs around the railway station before the streets open abruptly onto the heath. Historic terraces, villas and small commercial frontages sit within one of London’s oldest conservation areas, while the open ground creates long views and a distinct edge between village streets and metropolitan landscape.',
  description_it='Blackheath Village riunisce negozi indipendenti, caffè e pub attorno alla stazione, prima che le strade si aprano improvvisamente sulla brughiera. Terrazze storiche, ville e piccoli fronti commerciali appartengono a una delle più antiche conservation area londinesi, mentre lo spazio aperto crea ampie vedute e un confine netto tra borgo e paesaggio metropolitano.',
  editorial_hook_en='Independent village streets meet the sudden openness of the heath in one of southeast London’s strongest townscapes.',
  editorial_hook_it='Le strade indipendenti del borgo incontrano l’apertura improvvisa della brughiera in uno dei paesaggi urbani più riusciti del sud-est londinese.',
  official_url='https://lewisham.gov.uk/myservices/planning/conservation/conservation-areas/blackheath-conservation-area',
  price_text='Free', access_type='24H',
  access_notes_en='The streets and heath are publicly accessible, but shops and hospitality venues keep individual hours. The railway station and sloping pavements make the village busy at peak times; cross the A2 with care when continuing onto the heath.',
  access_notes_it='Strade e brughiera sono accessibili al pubblico, ma negozi e locali seguono orari propri. La stazione e i marciapiedi in pendenza rendono il borgo affollato nelle ore di punta; attraversa con attenzione la A2 per proseguire sulla brughiera.',
  tourist_intensity=45, crowd_scope='AREA', visit_minutes=75, best_time='DAY', weather_fit='ANY', visit_mode='EXPLORE',
  mood_quiet=1, mood_unexpected=1, mood_beautiful=2, mood_weird=0, mood_local=3, mood_green=2, mood_atmospheric=2, mood_lively=2,
  mood_reviewed=1, mood_confidence='HIGH', mood_basis='CONSERVATION_AREA+TOWNSCAPE+PLACE_CHARACTER',
  last_verified_at='2026-10-25', published_at=COALESCE(published_at, CURRENT_TIMESTAMP), updated_at=CURRENT_TIMESTAMP
WHERE lower(trim(name))='blackheath village' AND category='AREA';
INSERT INTO place_editorial_sources(place_id,source_url,source_kind,verified_at)
SELECT id,'https://lewisham.gov.uk/myservices/planning/conservation/conservation-areas/blackheath-conservation-area','official-or-authoritative','2026-10-25'
FROM places WHERE lower(trim(name))='blackheath village' AND category='AREA'
ON CONFLICT(place_id,source_url) DO UPDATE SET verified_at=excluded.verified_at;

-- Advance the shared data version so clients immediately invalidate their cached catalogue.
UPDATE app_meta
SET value=CAST(CAST(value AS INTEGER) + 1 AS TEXT), updated_at=CURRENT_TIMESTAMP
WHERE key='data_version';
