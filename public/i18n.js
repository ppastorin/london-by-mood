(() => {
  const params = new URLSearchParams(window.location.search);
  if (params.get("lang") !== "it") return;

  document.documentElement.lang = "it-IT";
  document.title = "Londra secondo l’umore | London Advanced";
  document.querySelector('meta[name="description"]')?.setAttribute("content", "Scegli come vuoi vivere Londra e trova luoghi adatti al tuo umore, tenendo conto della pressione della folla.");

  const translations = new Map(Object.entries({
    "Beyond the obvious": "Oltre l’ovvio", "Loading London places…": "Caricamento dei luoghi di Londra…",
    "London by Mood": "Londra secondo l’umore", "How do you want London to feel?": "Che atmosfera cerchi a Londra?", "Choose the experience first. We’ll find places that fit it—and steer around the worst crowd pressure.": "Scegli prima l’esperienza. Troveremo luoghi adatti, evitando dove possibile la pressione peggiore della folla.",
    "Map showing London Advanced places across London": "Mappa dei luoghi London Advanced a Londra", "From hidden corners to whole neighbourhoods": "Da angoli nascosti a interi quartieri",
    "Choose a mood": "Scegli un umore", "Categories stay behind the scenes.": "Le categorie restano dietro le quinte.", "Set the context": "Definisci il contesto", "Enough detail to make the result useful.": "I dettagli necessari per rendere utile il risultato.",
    "Starting from": "Punto di partenza", "or": "oppure", "Enter a London address or postcode": "Inserisci un indirizzo o CAP di Londra", "Use this place": "Usa questo luogo", "Address search by": "Ricerca indirizzi tramite", "Don’t enter confidential information.": "Non inserire informazioni riservate.",
    "When": "Quando", "Now": "Adesso", "Weather": "Meteo", "Dry": "Asciutto", "Rain": "Pioggia", "Journey by": "Spostamento in", "Public transport": "Trasporto pubblico", "Walking": "A piedi", "Maximum public transport journey": "Durata massima con il trasporto pubblico",
    "I want to wander": "Voglio esplorare", "Prefer places that reward exploring on foot": "Preferisci luoghi che meritano di essere esplorati a piedi", "Find my London": "Trova la mia Londra",
    "Loading London": "Caricamento di Londra", "Preparing places from the live London Advanced collection.": "Preparazione dei luoghi dalla raccolta live di London Advanced.", "Independent recommendations beyond the usual London checklist.": "Consigli indipendenti oltre la solita lista di Londra.", "Search data © OpenStreetMap contributors": "Dati di ricerca © collaboratori OpenStreetMap",
    "Place data unavailable": "Dati sui luoghi non disponibili", "London did not load": "Londra non è stata caricata", "The place data could not be loaded": "Impossibile caricare i dati sui luoghi", "Try again in a moment.": "Riprova tra poco.",
    "Start with a feeling": "Parti da una sensazione", "Choose one of the eight moods, set the context and find your London.": "Scegli uno degli otto umori, definisci il contesto e trova la tua Londra.",
    "Quiet": "Tranquillo", "Space to slow down": "Spazio per rallentare", "Unexpected": "Inaspettato", "Something you did not know was here": "Qualcosa che non sapevi fosse qui", "Beautiful": "Bello", "Worth stopping to look at": "Merita di fermarsi a guardare", "A little weird": "Un po’ strano", "London at its most peculiar": "La Londra più singolare", "Local": "Locale", "Neighbourhood life, not landmarks": "Vita di quartiere, non monumenti", "Green": "Verde", "Trees, gardens and open ground": "Alberi, giardini e spazi aperti", "Atmospheric": "Suggestivo", "Places with a strong sense of time": "Luoghi con un forte senso del tempo", "Lively": "Vivace", "Energy, people and movement": "Energia, persone e movimento",
    "Choose a mood first.": "Scegli prima un umore.", "Enter a London address or postcode.": "Inserisci un indirizzo o CAP di Londra.", "Searching…": "Ricerca…", "Finding that location…": "Ricerca della posizione…", "We could not find that location in London": "Non siamo riusciti a trovare questa posizione a Londra", "The address search is temporarily unavailable.": "La ricerca degli indirizzi è temporaneamente non disponibile.",
    "Best matches": "Corrispondenze migliori", "No strong matches inside this journey time": "Nessuna corrispondenza forte entro questo tempo di viaggio", "Increase the journey time or choose another starting point.": "Aumenta il tempo di viaggio o scegli un altro punto di partenza.",
    "Journey times are conservative estimates, not live TfL routing. Open Directions for a current route. Crowd pressure combines each place’s visitor intensity with the selected day and time. Check opening and access details before travelling.": "I tempi di viaggio sono stime prudenti, non itinerari TfL in tempo reale. Apri Indicazioni per un percorso aggiornato. La pressione della folla combina l’intensità dei visitatori del luogo con il giorno e l’ora selezionati. Controlla apertura e accessibilità prima di partire.",
    "✦ Strong mood match": "✦ Forte corrispondenza", "✦ Good mood match": "✦ Buona corrispondenza", "Low pressure": "Pressione bassa", "Moderate": "Moderata", "Busy": "Affollato", "Very busy": "Molto affollato", "A London place that fits the selected mood.": "Un luogo di Londra adatto all’umore selezionato.", "Check access": "Controlla l’accesso", "↟ Good for wandering": "↟ Ideale per esplorare", "Directions ↗": "Indicazioni ↗", "Info": "Info", "Try again": "Riprova"
  }));

  const patterns = [
    [/^(\d[\d.,]*) places across London$/, "$1 luoghi a Londra"],
    [/^Maximum public transport journey$/, "Durata massima con il trasporto pubblico"],
    [/^Maximum walking journey$/, "Durata massima a piedi"],
    [/^Using (.+)\.$/, "Punto di partenza: $1."],
    [/^(.+) near (.+)$/, "$1 vicino a $2"],
    [/^Showing (\d+) places within about (\d+) minutes by public transport$/, "$1 luoghi entro circa $2 minuti con il trasporto pubblico"],
    [/^Showing (\d+) places within about (\d+) minutes by walking$/, "$1 luoghi entro circa $2 minuti a piedi"],
    [/^↗ Est\. (\d+) min by public transport$/, "↗ Circa $1 min con il trasporto pubblico"],
    [/^↗ Est\. (\d+) min by walking$/, "↗ Circa $1 min a piedi"],
    [/^◷ (\d+) min visit$/, "◷ Visita di $1 min"],
    [/^Open official information for (.+)$/, "Apri le informazioni ufficiali per $1"]
  ];

  function translate(value) {
    const trimmed = value.trim();
    if (!trimmed) return value;
    let result = translations.get(trimmed);
    if (!result) {
      for (const [pattern,replacement] of patterns) {
        if (pattern.test(trimmed)) { result = trimmed.replace(pattern,replacement); break; }
      }
    }
    return result ? value.replace(trimmed,result) : value;
  }

  function translateTree(root) {
    if (root.nodeType === Node.TEXT_NODE) root.nodeValue = translate(root.nodeValue);
    if (root.nodeType !== Node.ELEMENT_NODE && root.nodeType !== Node.DOCUMENT_NODE) return;
    if (root.nodeType === Node.ELEMENT_NODE) {
      for (const name of ["aria-label","title","placeholder"]) if (root.hasAttribute(name)) root.setAttribute(name,translate(root.getAttribute(name)));
    }
    root.childNodes.forEach(translateTree);
  }

  document.querySelector(".brand")?.setAttribute("href", "https://www.londonadvanced.com/it/");
  translateTree(document);
  const observer = new MutationObserver(records => {
    observer.disconnect();
    for (const record of records) {
      record.addedNodes.forEach(translateTree);
      if (record.type === "characterData") translateTree(record.target);
    }
    observer.observe(document.body,{subtree:true,childList:true,characterData:true});
  });
  observer.observe(document.body,{subtree:true,childList:true,characterData:true});
})();
