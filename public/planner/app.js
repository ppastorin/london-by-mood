import { AREA_OPTIONS, CATEGORY_LABELS, buildPlan, interpretPrompt } from "./planner-core.js";

const form = document.querySelector("#planner-form");
const promptInput = document.querySelector("#planner-prompt");
const insights = document.querySelector("#prompt-insights");
const clarificationPanel = document.querySelector("#clarification-panel");
const results = document.querySelector("#results-panel");
const daySelect = document.querySelector("#days");
const area2Label = document.querySelector("#area-2-label");
let placesPromise;
const touched = new Set();
const geocodeCache = new Map();

setupOptions();
setDefaultDate();
syncDays();

daySelect.addEventListener("change", syncDays);
form.addEventListener("change", (event) => {
  const key = event.target.name === "category" ? "categories" : event.target.id;
  if (key) touched.add(key);
});
document.querySelector("#interpret-button").addEventListener("click", applyPrompt);
document.querySelector("#example-button").addEventListener("click", () => {
  promptInput.value = "I want to spend two full days during the week, one west of Hyde Park and the second east of Holborn. I like small museums, parks and quirky things. I have already visited all the major destinations as I have been to London 4 times. I like walking, but I am confident to jump on a tube. I usually start very early in the morning and go back to the hotel after dinner.";
  applyPrompt();
});
form.addEventListener("submit", generate);

function setupOptions() {
  const areaMarkup = Object.entries(AREA_OPTIONS).map(([value, item]) => `<option value="${value}">${item.label}</option>`).join("");
  document.querySelectorAll(".area-select").forEach((select) => { select.innerHTML = areaMarkup; });
  document.querySelector("#category-grid").innerHTML = Object.entries(CATEGORY_LABELS).map(([value, label]) => `
    <label class="choice-chip"><input type="checkbox" name="category" value="${value}"><span>${label}</span></label>
  `).join("");
}

function setDefaultDate() {
  const date = new Date();
  date.setDate(date.getDate() + 7);
  document.querySelector("#start-date").value = date.toISOString().slice(0, 10);
}

function syncDays() {
  const twoDays = daySelect.value === "2";
  area2Label.hidden = !twoDays;
}

function applyPrompt() {
  const interpretation = interpretPrompt(promptInput.value);
  if (interpretation.days) daySelect.value = String(interpretation.days);
  if (interpretation.startTime) document.querySelector("#start-time").value = interpretation.startTime;
  if (interpretation.endTime) document.querySelector("#end-time").value = interpretation.endTime;
  if (interpretation.pace) document.querySelector("#pace").value = interpretation.pace;
  if (interpretation.transport) document.querySelector("#transport").value = interpretation.transport;
  if (interpretation.familiarity) document.querySelector("#familiarity").value = interpretation.familiarity;
  if (!touched.has("area-1")) document.querySelector("#area-1").value = interpretation.areas?.[0] || "ANY";
  if (!touched.has("area-2")) document.querySelector("#area-2").value = interpretation.areas?.[1] || "ANY";
  if (!touched.has("avoid-core")) document.querySelector("#avoid-core").checked = Boolean(interpretation.avoidCore);
  if (!touched.has("no-big-museums")) document.querySelector("#no-big-museums").checked = Boolean(interpretation.noBigMuseums);
  if (!touched.has("categories")) {
    for (const checkbox of document.querySelectorAll("[name=category]")) checkbox.checked = interpretation.categories.includes(checkbox.value);
  }
  syncDays();
  insights.innerHTML = interpretation.insights.length
    ? `<span class="insight-prefix">Understood:</span>${interpretation.insights.map((item) => `<span class="insight-chip">${escapeHtml(item)}</span>`).join("")}`
    : `<span class="insight-empty">No specific settings found. Use the controls below—the prompt will still guide your request.</span>`;
  renderClarification(interpretation);
}

async function generate(event) {
  event.preventDefault();
  const button = document.querySelector("#generate-button");
  button.disabled = true;
  results.innerHTML = `<div class="loading-state"><span></span><h2>Building coherent days…</h2><p>Balancing fit, geography and access confidence.</p></div>`;
  try {
    const prompt = interpretPrompt(promptInput.value);
    const routeAnchors = await resolveRouteAnchors(prompt);
    const places = await loadPlaces();
    const checkedCategories = [...document.querySelectorAll("[name=category]:checked")].map((item) => item.value);
    const indoorChoice = document.querySelector("#indoor-art-clarification")?.value || "allow-one";
    const plan = buildPlan(places, {
      days: promptValue("days", prompt.days, daySelect.value),
      startDate: document.querySelector("#start-date").value,
      startTime: promptValue("start-time", prompt.startTime, document.querySelector("#start-time").value),
      endTime: promptValue("end-time", prompt.endTime, document.querySelector("#end-time").value),
      pace: promptValue("pace", prompt.pace, document.querySelector("#pace").value),
      transport: promptValue("transport", prompt.transport, document.querySelector("#transport").value),
      familiarity: promptValue("familiarity", prompt.familiarity, document.querySelector("#familiarity").value),
      areas: [
        promptValue("area-1", prompt.areas?.[0], document.querySelector("#area-1").value),
        promptValue("area-2", prompt.areas?.[1], document.querySelector("#area-2").value),
      ],
      categories: touched.has("categories") || checkedCategories.length ? checkedCategories : prompt.categories,
      moods: prompt.moods,
      impact: prompt.impact,
      season: prompt.season,
      routeStart: routeAnchors.start,
      routeEnd: routeAnchors.end,
      avoidCore: touched.has("avoid-core") ? document.querySelector("#avoid-core").checked : document.querySelector("#avoid-core").checked || prompt.avoidCore,
      noBigMuseums: touched.has("no-big-museums") ? document.querySelector("#no-big-museums").checked : document.querySelector("#no-big-museums").checked || prompt.noBigMuseums,
      excludeMuseums: prompt.excludeMuseums,
      outdoorOnly: prompt.outdoorOnly || (prompt.needsIndoorClarification && indoorChoice === "outdoors-only"),
      outdoorPreference: prompt.outdoorPreference,
      crowdSensitive: prompt.crowdSensitive,
      marketFocus: prompt.marketFocus,
      churchFocus: prompt.churchFocus,
      compactRoute: prompt.compactRoute,
      weekendFlexible: prompt.weekendFlexible,
      mustHaves: document.querySelector("#must-haves").value,
      avoidTerms: document.querySelector("#avoid-terms").value,
    });
    renderPlan(plan);
  } catch (error) {
    results.innerHTML = `<div class="error-state"><h2>The sandbox planner could not load.</h2><p>${escapeHtml(error.message)}</p><button type="button" id="retry-button">Try again</button></div>`;
    document.querySelector("#retry-button")?.addEventListener("click", () => form.requestSubmit());
  } finally {
    button.disabled = false;
  }
}

async function loadPlaces() {
  placesPromise ||= fetch("/api/planner/places?limit=1200", { headers: { Accept: "application/json" } })
    .then(async (response) => {
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error || `Planner data returned ${response.status}`);
      if (!payload.places?.length) throw new Error("No curated planner places are available in this sandbox.");
      return payload.places;
    }).catch((error) => { placesPromise = null; throw error; });
  return placesPromise;
}

function renderPlan(plan) {
  if (!plan.days.length) {
    results.innerHTML = `<div class="error-state"><h2>No coherent plan yet.</h2><p>${escapeHtml(plan.warnings[0] || "Try broadening the areas or categories.")}</p></div>`;
    return;
  }
  const summary = `${plan.days.length} ${plan.days.length === 1 ? "day" : "days"} · ${plan.days.reduce((sum, day) => sum + day.stops.length, 0)} curated stops · ${transportLabel(plan.input.transport)}`;
  results.innerHTML = `
    <div class="results-header"><div><p class="eyebrow">Your recommended plan</p><h2>London, arranged into good days</h2></div><p>${escapeHtml(summary)}</p></div>
    ${plan.warnings.length ? `<div class="warning-box"><strong>Before you go</strong>${plan.warnings.map((warning) => `<p>${escapeHtml(warning)}</p>`).join("")}</div>` : ""}
    ${plan.input.transport === "walking" ? "" : `<p class="route-map-note">The complete Google Maps itinerary opens in walking mode so every stop remains in sequence. Use the Tube or bus for the longer legs identified in the schedule.</p>`}
    <div class="day-list">${plan.days.map(renderDay).join("")}</div>
    <p class="method-note">The first increment uses curated factual confidence, official-source availability, geographic cohesion and your stated preferences. It does not make bookings or silently assume uncertain opening hours.</p>
  `;
  results.scrollIntoView({ behavior: "smooth", block: "start" });
}

function renderDay(day) {
  const date = new Intl.DateTimeFormat("en-GB", { weekday: "long", day: "numeric", month: "long" }).format(new Date(`${day.date}T12:00:00Z`));
  return `<article class="day-card">
    <header><div><span>Day ${day.dayNumber}</span><h3>${escapeHtml(day.areaLabel)}</h3><p>${escapeHtml(date)}${day.routeLabel ? ` · ${escapeHtml(day.routeLabel)}` : ""}</p></div>
      <a class="maps-button" href="${escapeAttribute(day.routeUrl)}" target="_blank" rel="noopener">Open walking route ↗</a>
    </header>
    <ol class="stop-list">${day.stops.map(renderStop).join("")}</ol>
    ${day.routeEnd && day.destinationArrival ? `<div class="route-destination"><strong>${escapeHtml(day.destinationArrival)}</strong><span>${escapeHtml(day.destinationLegMode)} · ${day.destinationTravelMinutes} min</span><p>Finish at ${escapeHtml(day.routeEnd.label)}</p></div>` : ""}
  </article>`;
}

function renderStop(stop, index) {
  const place = stop.place;
  const check = stop.availability.status === "check";
  const description = place.hook || place.description || "A curated London Advanced stop.";
  const sourceUrl = place.officialUrl || place.planning?.sourceUrl;
  return `<li class="stop-card">
    <div class="time-column"><strong>${escapeHtml(stop.startTime)}</strong>${stop.legMode === "start" ? `<span>Start</span>`
      : stop.legUrl ? `<a href="${escapeAttribute(stop.legUrl)}" target="_blank" rel="noopener">${escapeHtml(stop.legMode)} · ${stop.travelMinutes} min ↗</a>`
      : `<span>${escapeHtml(stop.legMode)} · ${stop.travelMinutes} min</span>`}</div>
    <div class="stop-body">
      <div class="stop-topline"><span class="category-label">${escapeHtml(CATEGORY_LABELS[place.category] || place.category)}</span><span class="confidence-label">${escapeHtml(place.planning.dataConfidence)} confidence</span></div>
      <h4>${escapeHtml(place.name)}</h4><p>${escapeHtml(description)}</p>
      <div class="stop-facts"><span>${escapeHtml(stop.startTime)}–${escapeHtml(stop.endTime)}</span><span class="${check ? "needs-check" : ""}">${check ? "⚠ " : ""}${escapeHtml(stop.availability.label)}</span></div>
      <div class="stop-links"><a href="${escapeAttribute(place.mapUrl)}" target="_blank" rel="noopener">Map</a><a href="${escapeAttribute(sourceUrl)}" target="_blank" rel="noopener">Official source</a></div>
    </div>
  </li>`;
}

function transportLabel(value) { return ({ walking: "mostly walking", mixed: "walking + Tube", transit: "public transport" })[value] || value; }
function renderClarification(interpretation) {
  const questions = [];
  if (interpretation.needsIndoorClarification) questions.push(`
    <label for="indoor-art-clarification">You asked for a mainly outdoor day with something artistic. May the plan include one indoor museum or gallery?
      <select id="indoor-art-clarification">
        <option value="allow-one" selected>Yes — one indoor cultural stop is fine</option>
        <option value="outdoors-only">No — keep the whole day outdoors</option>
      </select>
    </label>`);
  const selectedDate = document.querySelector("#start-date").value;
  const selectedDay = new Date(`${selectedDate}T12:00:00Z`).getUTCDay();
  const weekendChoice = selectedDay === 0 ? "0" : selectedDay === 6 ? "6" : touched.has("start-date") ? "selected-date" : "6";
  if (interpretation.weekendFlexible) questions.push(`
    <label for="weekend-day-clarification">Which day should the opening checks and itinerary use?
      <select id="weekend-day-clarification">
        ${weekendChoice === "selected-date" ? `<option value="selected-date" selected>Keep selected date (${escapeHtml(selectedDate)})</option>` : ""}
        <option value="6"${weekendChoice === "6" ? " selected" : ""}>Saturday</option>
        <option value="0"${weekendChoice === "0" ? " selected" : ""}>Sunday</option>
      </select>
    </label>`);
  clarificationPanel.hidden = !questions.length;
  clarificationPanel.innerHTML = questions.length ? `<strong>${questions.length === 1 ? "One useful clarification" : "A couple of useful clarifications"}</strong>${questions.join("")}` : "";
  document.querySelector("#indoor-art-clarification")?.addEventListener("change", (event) => {
    if (touched.has("categories")) return;
    const museums = document.querySelector('[name="category"][value="MUSEUM"]');
    const architecture = document.querySelector('[name="category"][value="BUILDING"]');
    if (event.target.value === "outdoors-only") {
      museums.checked = false;
      architecture.checked = true;
    } else {
      museums.checked = true;
      architecture.checked = false;
    }
  });
  const weekendDay = document.querySelector("#weekend-day-clarification");
  if (weekendDay && !touched.has("start-date")) setDateToWeekday(Number(weekendDay.value));
  weekendDay?.addEventListener("change", (event) => {
    if (event.target.value !== "selected-date") setDateToWeekday(Number(event.target.value));
  });
}
function setDateToWeekday(targetDay) {
  const dateInput = document.querySelector("#start-date");
  const date = new Date(`${dateInput.value}T12:00:00Z`);
  if (!Number.isFinite(date.getTime())) return;
  date.setUTCDate(date.getUTCDate() + (targetDay - date.getUTCDay() + 7) % 7);
  dateInput.value = date.toISOString().slice(0, 10);
}
async function resolveRouteAnchors(prompt) {
  const [start, end] = await Promise.all([
    prompt.routeStartQuery ? resolveAnchor(prompt.routeStartQuery, "starting point") : null,
    prompt.routeEndQuery ? resolveAnchor(prompt.routeEndQuery, "destination") : null,
  ]);
  return { start, end };
}
async function resolveAnchor(query, role) {
  const key = query.toLowerCase();
  if (geocodeCache.has(key)) return geocodeCache.get(key);
  const response = await fetch(`/api/geocode?q=${encodeURIComponent(query)}`, { headers: { Accept: "application/json" } });
  const payload = await response.json();
  if (!response.ok || !payload.result) throw new Error(`The planner could not resolve ${role} “${query}”. Please use a London district, landmark or postcode.`);
  const point = { label: query, lat: payload.result.lat, lon: payload.result.lon };
  geocodeCache.set(key, point);
  return point;
}
function promptValue(control, inferred, current) { return touched.has(control) || inferred === undefined ? current : inferred; }
function escapeHtml(value) { return String(value ?? "").replace(/[&<>"']/g, (character) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", "\"": "&quot;", "'": "&#039;" })[character]); }
function escapeAttribute(value) { return escapeHtml(value); }
