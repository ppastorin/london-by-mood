import { MOODS, pressureLabel, rankPois } from "./ranking.js";

const LOCATIONS = [
  { id: "charing-cross", name: "Charing Cross", lat: 51.5079, lon: -0.1281 },
  { id: "kings-cross", name: "King’s Cross", lat: 51.5308, lon: -0.1238 },
  { id: "liverpool-street", name: "Liverpool Street", lat: 51.5178, lon: -0.0823 },
  { id: "victoria", name: "Victoria", lat: 51.4965, lon: -0.1447 },
  { id: "waterloo", name: "Waterloo", lat: 51.5033, lon: -0.1147 },
  { id: "paddington", name: "Paddington", lat: 51.5154, lon: -0.1755 },
  { id: "stratford", name: "Stratford", lat: 51.5413, lon: -0.0032 },
  { id: "greenwich", name: "Greenwich", lat: 51.4826, lon: -0.0077 },
  { id: "wimbledon", name: "Wimbledon", lat: 51.4214, lon: -0.2064 },
];

const state = {
  pois: [],
  mood: null,
  locationId: "charing-cross",
  customLocation: null,
  horizonHours: 0,
  weather: "dry",
  maxTravelMinutes: 45,
  wander: false,
  loaded: false,
};

const elements = {
  form: document.querySelector("#search-form"),
  moodGrid: document.querySelector("#mood-grid"),
  locationSelect: document.querySelector("#location-select"),
  locateButton: document.querySelector("#locate-button"),
  locationMessage: document.querySelector("#location-message"),
  timeControl: document.querySelector("#time-control"),
  weatherControl: document.querySelector("#weather-control"),
  travelRange: document.querySelector("#travel-range"),
  travelValue: document.querySelector("#travel-value"),
  wanderToggle: document.querySelector("#wander-toggle"),
  findButton: document.querySelector("#find-button"),
  results: document.querySelector("#results"),
  dataNote: document.querySelector("#data-note"),
};

renderMoodButtons();
bindControls();
loadPlaces();

async function loadPlaces() {
  state.loaded = false;
  elements.findButton.disabled = true;
  elements.results.setAttribute("aria-busy", "true");
  setEmptyState("Loading London", "Preparing places from the live London Advanced collection.");

  try {
    const response = await fetch("/api/pois", { headers: { Accept: "application/json" } });
    const payload = await response.json();
    if (!response.ok || !payload?.ok || !Array.isArray(payload.places)) {
      throw new Error(payload?.error || "The place data could not be loaded");
    }

    state.pois = payload.places;
    state.loaded = true;
    elements.dataNote.textContent = `${payload.count.toLocaleString("en-GB")} places across London`;
    setEmptyState("Start with a feeling", "Choose one of the eight moods, set the context and find your London.");
  } catch (error) {
    const message = error instanceof Error ? error.message : "The place data could not be loaded";
    elements.dataNote.textContent = "Place data unavailable";
    setEmptyState("London did not load", `${message}. Try again in a moment.`, true);
  } finally {
    elements.findButton.disabled = !state.loaded;
    elements.results.setAttribute("aria-busy", "false");
  }
}

function renderMoodButtons() {
  const fragment = document.createDocumentFragment();
  for (const mood of MOODS) {
    const button = document.createElement("button");
    button.type = "button";
    button.className = "mood-card";
    button.setAttribute("role", "radio");
    button.setAttribute("aria-checked", "false");
    button.dataset.mood = mood.key;
    button.style.setProperty("--mood-colour", mood.colour);

    const icon = createElement("span", "mood-icon", mood.symbol);
    icon.setAttribute("aria-hidden", "true");
    const copy = document.createElement("span");
    copy.append(
      createElement("strong", "", mood.label),
      createElement("small", "", mood.detail),
    );
    const check = createElement("span", "mood-check", "✓");
    check.hidden = true;
    check.setAttribute("aria-hidden", "true");
    button.append(icon, copy, check);
    button.addEventListener("click", () => selectMood(mood.key));
    fragment.append(button);
  }
  elements.moodGrid.replaceChildren(fragment);
}

function selectMood(key) {
  state.mood = key;
  for (const button of elements.moodGrid.querySelectorAll(".mood-card")) {
    const selected = button.dataset.mood === key;
    button.classList.toggle("selected", selected);
    button.setAttribute("aria-checked", String(selected));
    button.querySelector(".mood-check").hidden = !selected;
  }
}

function bindControls() {
  elements.locationSelect.addEventListener("change", () => {
    state.locationId = elements.locationSelect.value;
    state.customLocation = null;
    setLocationMessage("");
    const currentOption = elements.locationSelect.querySelector('option[value="current"]');
    if (currentOption) currentOption.remove();
  });

  elements.locateButton.addEventListener("click", useMyLocation);
  bindSegments(elements.timeControl, (value) => { state.horizonHours = Number(value); });
  bindSegments(elements.weatherControl, (value) => { state.weather = value; });

  elements.travelRange.addEventListener("input", () => {
    state.maxTravelMinutes = Number(elements.travelRange.value);
    elements.travelValue.textContent = `${state.maxTravelMinutes} min`;
  });

  elements.wanderToggle.addEventListener("click", () => {
    state.wander = !state.wander;
    elements.wanderToggle.classList.toggle("active", state.wander);
    elements.wanderToggle.setAttribute("aria-pressed", String(state.wander));
  });

  elements.form.addEventListener("submit", (event) => {
    event.preventDefault();
    if (!state.mood) {
      setLocationMessage("Choose a mood first.", true);
      elements.moodGrid.querySelector(".mood-card")?.focus();
      return;
    }
    if (!state.loaded) return;
    setLocationMessage("");
    renderResults();
    if (window.matchMedia("(max-width: 980px)").matches) {
      elements.results.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  });
}

function bindSegments(container, callback) {
  container.addEventListener("click", (event) => {
    const button = event.target.closest("button[data-value]");
    if (!button) return;
    for (const item of container.querySelectorAll("button[data-value]")) {
      const active = item === button;
      item.classList.toggle("active", active);
      item.setAttribute("aria-pressed", String(active));
    }
    callback(button.dataset.value);
  });
}

function useMyLocation() {
  if (!navigator.geolocation) {
    setLocationMessage("Location is not available in this browser.", true);
    return;
  }

  elements.locateButton.disabled = true;
  setLocationMessage("Finding your location…");
  navigator.geolocation.getCurrentPosition(
    ({ coords }) => {
      state.customLocation = {
        lat: coords.latitude,
        lon: coords.longitude,
        name: "My current location",
      };
      let option = elements.locationSelect.querySelector('option[value="current"]');
      if (!option) {
        option = document.createElement("option");
        option.value = "current";
        option.textContent = "My current location";
        elements.locationSelect.prepend(option);
      }
      elements.locationSelect.value = "current";
      setLocationMessage("Using your current location.");
      elements.locateButton.disabled = false;
    },
    () => {
      setLocationMessage("We could not use your location. Choose a station instead.", true);
      elements.locateButton.disabled = false;
    },
    { enableHighAccuracy: false, timeout: 8000, maximumAge: 300000 },
  );
}

function renderResults() {
  const location = selectedLocation();
  const mood = MOODS.find((item) => item.key === state.mood);
  const results = rankPois(state.pois, {
    mood: state.mood,
    lat: location.lat,
    lon: location.lon,
    horizonHours: state.horizonHours,
    maxTravelMinutes: state.maxTravelMinutes,
    weather: state.weather,
    wander: state.wander,
  });

  const heading = document.createElement("div");
  heading.className = "results-heading";
  const titleBox = document.createElement("div");
  titleBox.append(
    createElement("p", "eyebrow", "Best matches"),
    createElement("h2", "", `${mood.label} near ${location.name}`),
  );
  heading.append(
    titleBox,
    createElement(
      "p",
      "results-summary",
      results.length
        ? `Showing ${results.length} places within about ${state.maxTravelMinutes} minutes`
        : "No strong matches inside this journey time",
    ),
  );

  const content = document.createDocumentFragment();
  content.append(heading);
  if (results.length) {
    const list = document.createElement("div");
    list.className = "result-list";
    results.forEach((result, index) => list.append(createResultCard(result, index, mood)));
    content.append(list);
  } else {
    const noResults = createElement("div", "no-results");
    noResults.append(createElement("p", "", "Increase the journey time or choose another starting point."));
    content.append(noResults);
  }

  content.append(createElement(
    "p",
    "method-note",
    "Journey times are approximate. Crowd pressure combines each place’s visitor intensity with the selected day and time. Check opening and access details before travelling.",
  ));
  elements.results.replaceChildren(content);
}

function createResultCard(result, index, mood) {
  const article = document.createElement("article");
  article.className = "result-card";
  article.style.setProperty("--mood-colour", mood.colour);
  article.append(createElement("div", "result-number", String(index + 1).padStart(2, "0")));

  const content = document.createElement("div");
  const topline = document.createElement("div");
  topline.className = "result-topline";
  topline.append(
    createElement("span", "fit-label", result.moodScore === 3 ? "✦ Strong mood match" : "✦ Good mood match"),
    createElement("span", `pressure-label ${pressureTone(result.crowdPressure)}`, pressureLabel(result.crowdPressure)),
  );
  content.append(
    topline,
    createElement("h3", "", result.name),
    createElement("p", "result-hook", result.hook || "A London place that fits the selected mood."),
  );

  const facts = document.createElement("div");
  facts.className = "result-facts";
  facts.append(
    createElement("span", "", `↗ About ${result.travelMinutes} min`),
    createElement("span", "", `◷ ${result.visitMinutes || 30} min visit`),
  );
  if (result.stations?.[0]?.name) {
    facts.append(createElement("span", "", `⌖ ${result.stations[0].name.replace(" Underground Station", "")}`));
  }
  if (result.accessType === "VARIABLE") {
    facts.append(createElement("span", "access-warning", "Check access"));
  }
  if (state.wander && result.visitMode === "WALK") {
    facts.append(createElement("span", "", "↟ Good for wandering"));
  }
  content.append(facts);
  article.append(content);

  const actions = document.createElement("div");
  actions.className = "result-actions";
  const map = createLink(
    `https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(`${result.lat},${result.lon}`)}`,
    "Map ↗",
    "map-link",
  );
  actions.append(map);
  const officialUrl = safeHttpUrl(result.officialUrl);
  if (officialUrl) {
    const official = createLink(officialUrl, "Info", "official-link");
    official.setAttribute("aria-label", `Open official information for ${result.name}`);
    actions.append(official);
  }
  article.append(actions);
  return article;
}

function selectedLocation() {
  if (state.customLocation) return state.customLocation;
  return LOCATIONS.find((item) => item.id === state.locationId) ?? LOCATIONS[0];
}

function pressureTone(pressure) {
  if (pressure <= 25) return "pressure-low";
  if (pressure <= 50) return "pressure-mid";
  return "pressure-high";
}

function safeHttpUrl(value) {
  if (!value) return null;
  try {
    const url = new URL(value);
    return ["http:", "https:"].includes(url.protocol) ? url.href : null;
  } catch {
    return null;
  }
}

function createLink(href, text, className) {
  const link = createElement("a", className, text);
  link.href = href;
  link.target = "_blank";
  link.rel = "noreferrer";
  return link;
}

function createElement(tag, className = "", text = "") {
  const element = document.createElement(tag);
  if (className) element.className = className;
  if (text) element.textContent = text;
  return element;
}

function setLocationMessage(message, error = false) {
  elements.locationMessage.textContent = message;
  elements.locationMessage.classList.toggle("error", error);
}

function setEmptyState(title, message, retry = false) {
  const empty = document.createElement("div");
  empty.className = "empty-state";
  empty.append(
    createElement("span", "empty-symbol", "◉"),
    createElement("h2", "", title),
    createElement("p", "", message),
  );
  if (retry) {
    const button = createElement("button", "retry-button", "Try again");
    button.type = "button";
    button.addEventListener("click", loadPlaces);
    empty.append(button);
  }
  elements.results.replaceChildren(empty);
}
