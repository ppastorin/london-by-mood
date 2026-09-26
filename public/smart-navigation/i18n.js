(() => {
  const locale = new URLSearchParams(window.location.search).get("lang") === "it" ? "it" : "en";
  const italian = {
    mapPoint: "Punto sulla mappa {lat}, {lon}",
    startSelectedOnMap: "Punto di partenza selezionato sulla mappa.",
    destinationSelectedOnMap: "Destinazione selezionata sulla mappa.",
    placesLoaded: "{count} luoghi caricati.",
    mapSelectionCancelled: "Selezione sulla mappa annullata.",
    chooseStartOnMap: "Fai clic sulla mappa per scegliere il punto di partenza.",
    chooseDestinationOnMap: "Fai clic sulla mappa per scegliere la destinazione.",
    enterAddress: "Inserisci un indirizzo, una stazione o un CAP di Londra.",
    finding: "Ricerca di {query}…",
    startSelected: "Punto di partenza selezionato.",
    destinationSelected: "Destinazione selezionata.",
    start: "Partenza",
    destination: "Destinazione",
    calculatingRoute: "Calcolo del percorso a piedi…",
    routeReady: "Percorso pronto.",
    withinRoute: "Entro {distance} m dal percorso",
    fallbackPlace: "Un luogo della raccolta London Advanced.",
    showOnMap: "Mostra sulla mappa",
    info: "Informazioni ↗",
    loadingBikes: "Caricamento della disponibilità in tempo reale…",
    bikesAndSpaces: "{distance} m · {bikes} bici · {spaces} posti liberi",
    bikesUnavailable: "La disponibilità delle biciclette è temporaneamente non disponibile.",
    requestFailed: "Richiesta non riuscita ({status})",
    addressRequired: "Inserisci un indirizzo o un CAP di Londra",
    placeNotFound: "Non è stato possibile trovare questo luogo a Londra",
    outsideLondon: "La posizione sembra essere fuori Londra",
    routePointsLondon: "Entrambi i punti del percorso devono trovarsi a Londra",
    routingUnavailable: "Servizio di calcolo del percorso non disponibile",
    routingNotConfigured: "Il calcolo del percorso non è configurato",
    unreadableRoute: "Il servizio ha restituito una risposta non leggibile",
    noRoute: "Il servizio non ha restituito alcun percorso",
    chooseLondonStart: "Scegli un punto di partenza a Londra"
  };

  function t(key, variables = {}) {
    const template = locale === "it" ? italian[key] : null;
    if (!template) return key;
    return template.replace(/\{(\w+)\}/g, (_, name) => variables[name] ?? "");
  }

  function setText(selector, value) {
    const node = document.querySelector(selector);
    if (node) node.textContent = value;
  }

  function applyItalianInterface() {
    if (locale !== "it") return;
    document.documentElement.lang = "it-IT";
    document.title = "Navigazione intelligente | London Advanced";
    document.querySelector('meta[name="description"]')?.setAttribute("content", "Crea un percorso a piedi a Londra e trova luoghi interessanti nelle vicinanze.");
    document.querySelector(".brand")?.setAttribute("href", "https://www.londonadvanced.com/it/");

    const texts = [
      [".topbar div p", "Trasforma il tragitto in una scoperta"],
      [".topbar h1", "Navigazione intelligente"],
      [".dev-badge", "Dati in tempo reale"],
      ["#message", "Caricamento della raccolta London Advanced…"],
      [".controls section:nth-of-type(1) h2", "Scegli il percorso"],
      ['label[for="start-query"]', "Punto di partenza"],
      ['button[data-search="start"]', "Cerca"],
      ["#start-choice", "Non selezionato"],
      ["#pick-start", "Scegli sulla mappa"],
      ['label[for="end-query"]', "Destinazione"],
      ['button[data-search="end"]', "Cerca"],
      ["#end-choice", "Non selezionato"],
      ["#pick-end", "Scegli sulla mappa"],
      [".controls section:nth-of-type(2) h2", "Imposta la deviazione"],
      ["#corridor legend", "Distanza dal percorso"],
      [".category-heading legend", "Luoghi da includere"],
      ["#all-categories", "Tutti"],
      ["#no-categories", "Nessuno"],
      ["#route-button", "Calcola il percorso a piedi"],
      ["#bikes-panel .step", "In tempo reale"],
      ["#bikes-panel h2", "Santander Cycles nelle vicinanze"],
      ["#refresh-bikes", "Aggiorna"],
      ["#route-summary div:nth-of-type(1) small", "Percorso a piedi"],
      ["#route-summary div:nth-of-type(2) small", "Tempo stimato"],
      ["#route-summary div:nth-of-type(3) small", "Luoghi trovati"],
      ["#reset", "Ricomincia"],
      [".results-title p", "Lungo il percorso"],
      [".results-title h2", "Deviazioni che meritano"],
      ["footer", "Dati cartografici © collaboratori OpenStreetMap. Percorsi © openrouteservice. Disponibilità biciclette © Transport for London."]
    ];
    for (const [selector, value] of texts) setText(selector, value);
    document.querySelectorAll("#start-query, #end-query").forEach((input) => input.setAttribute("placeholder", "Indirizzo, stazione o CAP"));
    document.querySelector("#map")?.setAttribute("aria-label", "Mappa interattiva del percorso");
  }

  function localizeError(value) {
    if (locale !== "it") return value;
    const exact = {
      "Enter a London address or postcode": t("addressRequired"),
      "We could not find that place in London": t("placeNotFound"),
      "That location appears to be outside London": t("outsideLondon"),
      "Both route points must be in London": t("routePointsLondon"),
      "Routing is not configured in this dev environment": t("routingNotConfigured"),
      "The routing service returned an unreadable response": t("unreadableRoute"),
      "The routing service returned no route": t("noRoute"),
      "Choose a London starting point": t("chooseLondonStart")
    };
    if (exact[value]) return exact[value];
    if (value.startsWith("Walking route service unavailable:")) return `${t("routingUnavailable")}: ${value.split(":").slice(1).join(":").trim()}`;
    if (value.startsWith("Request failed (")) return value.replace("Request failed", "Richiesta non riuscita");
    return value;
  }

  applyItalianInterface();
  window.SmartNavigationI18n = { locale, t, localizeError };
})();
