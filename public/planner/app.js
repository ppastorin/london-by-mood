import { AREA_OPTIONS, CATEGORY_LABELS, buildPlan } from "./planner-core.js";

const form = document.querySelector("#planner-form");
const promptInput = document.querySelector("#planner-prompt");
const insights = document.querySelector("#prompt-insights");
const clarificationPanel = document.querySelector("#clarification-panel");
const results = document.querySelector("#results-panel");
const daySelect = document.querySelector("#days");
const area2Label = document.querySelector("#area-2-label");
let placesPromise;
const touched = new Set();
let currentInterpretation;
let currentPrompt = "";
let currentAnswers = "{}";

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

async function applyPrompt() {
  const button = document.querySelector("#interpret-button");
  button.disabled = true;
  insights.innerHTML = `<span class="insight-empty">Interpreting geography, priorities and constraints…</span>`;
  try {
    const interpretation = await requestInterpretation(promptInput.value);
    applyInterpretation(interpretation);
  } catch (error) {
    insights.innerHTML = `<span class="insight-empty">${escapeHtml(error.message)}</span>`;
    clarificationPanel.hidden = true;
  } finally {
    button.disabled = false;
  }
}

function applyInterpretation(interpretation) {
  if (interpretation.days && !touched.has("days")) daySelect.value = String(interpretation.days);
  if (interpretation.startTime && !touched.has("start-time")) document.querySelector("#start-time").value = interpretation.startTime;
  if (interpretation.endTime && !touched.has("end-time")) document.querySelector("#end-time").value = interpretation.endTime;
  if (interpretation.pace && !touched.has("pace")) document.querySelector("#pace").value = interpretation.pace;
  if (interpretation.transport && !touched.has("transport")) document.querySelector("#transport").value = interpretation.transport;
  if (interpretation.familiarity && !touched.has("familiarity")) document.querySelector("#familiarity").value = interpretation.familiarity;
  if (interpretation.preferredWeekdays?.length && !touched.has("start-date")) {
    document.querySelector("#start-date").value = nearestPreferredDate(document.querySelector("#start-date").value, interpretation.preferredWeekdays);
  }
  if (!touched.has("area-1")) document.querySelector("#area-1").value = "ANY";
  if (!touched.has("area-2")) document.querySelector("#area-2").value = "ANY";
  if (!touched.has("avoid-core")) document.querySelector("#avoid-core").checked = Boolean(interpretation.avoidCore);
  if (!touched.has("no-big-museums")) document.querySelector("#no-big-museums").checked = Boolean(interpretation.noBigMuseums);
  if (!touched.has("categories")) {
    for (const checkbox of document.querySelectorAll("[name=category]")) checkbox.checked = interpretation.categories.includes(checkbox.value);
  }
  syncDays();
  const geographicInsights = (interpretation.geoScopes || []).map((scope) => `${relationLabel(scope.relation)} ${scope.label}`);
  const insightItems = [...new Set([...(interpretation.insights || []), ...geographicInsights])];
  insights.innerHTML = insightItems.length
    ? `<span class="insight-prefix">AI understood:</span>${insightItems.map((item) => `<span class="insight-chip">${escapeHtml(item)}</span>`).join("")}`
    : `<span class="insight-empty">No specific settings found. Use the controls below—the prompt will still guide your request.</span>`;
  if (interpretation.unresolvedGeography?.length) {
    insights.innerHTML += `<span class="insight-empty">Could not resolve: ${escapeHtml(interpretation.unresolvedGeography.map((item) => item.label).join(", "))}. Please make the location more precise.</span>`;
  }
  renderClarification(interpretation);
}

async function generate(event) {
  event.preventDefault();
  const button = document.querySelector("#generate-button");
  button.disabled = true;
  results.innerHTML = `<div class="loading-state"><span></span><h2>Building coherent days…</h2><p>Balancing fit, geography and access confidence.</p></div>`;
  try {
    let prompt = promptInput.value.trim() ? await requestInterpretation(promptInput.value) : emptyInterpretation();
    const answers = collectClarificationAnswers();
    if (prompt.clarifications?.length && Object.keys(answers).length) {
      prompt = await requestInterpretation(promptInput.value, answers, true);
      applyInterpretation(prompt);
    }
    if (prompt.unresolvedGeography?.length) throw new Error(`The AI understood the location, but it could not be resolved on the London map: ${prompt.unresolvedGeography.map((item) => item.label).join(", ")}.`);
    const places = await loadPlaces();
    const checkedCategories = [...document.querySelectorAll("[name=category]:checked")].map((item) => item.value);
    const menuCategoriesOverride = touched.has("categories");
    const categoryPreferences = menuCategoriesOverride
      ? checkedCategories.map((category) => ({ category, strength: "PREFERRED", minStops: 0, maxStops: 6 }))
      : prompt.categoryPreferences;
    const plan = buildPlan(places, {
      days: promptValue("days", prompt.days, daySelect.value),
      startDate: document.querySelector("#start-date").value,
      startTime: promptValue("start-time", prompt.startTime, document.querySelector("#start-time").value),
      endTime: promptValue("end-time", prompt.endTime, document.querySelector("#end-time").value),
      pace: promptValue("pace", prompt.pace, document.querySelector("#pace").value),
      transport: promptValue("transport", prompt.transport, document.querySelector("#transport").value),
      familiarity: promptValue("familiarity", prompt.familiarity, document.querySelector("#familiarity").value),
      areas: [
        document.querySelector("#area-1").value,
        document.querySelector("#area-2").value,
      ],
      geoScopes: activeGeoScopes(prompt.geoScopes || [], Number(daySelect.value)),
      excludeGeoScopes: prompt.excludeGeoScopes || [],
      categories: menuCategoriesOverride ? checkedCategories : prompt.categories,
      categoryPreferences,
      excludedCategories: prompt.excludedCategories,
      primaryCategory: menuCategoriesOverride ? "" : prompt.primaryCategory,
      experience: menuCategoriesOverride ? { ...prompt.experience, strictCategory: false, strictConcept: false } : prompt.experience,
      moods: prompt.moods,
      impact: prompt.impact,
      season: prompt.season,
      routeStart: prompt.routeStart,
      routeEnd: prompt.routeEnd,
      avoidCore: touched.has("avoid-core") ? document.querySelector("#avoid-core").checked : document.querySelector("#avoid-core").checked || prompt.avoidCore,
      noBigMuseums: touched.has("no-big-museums") ? document.querySelector("#no-big-museums").checked : document.querySelector("#no-big-museums").checked || prompt.noBigMuseums,
      excludeMuseums: prompt.excludedCategories?.includes("MUSEUM"),
      outdoorOnly: prompt.outdoorOnly,
      outdoorPreference: prompt.outdoorPreference,
      crowdSensitive: prompt.crowdSensitive,
      marketFocus: prompt.marketFocus,
      weekendFlexible: prompt.weekendFlexible,
      mustHaves: [...(prompt.mustHaves || []), ...splitInput(document.querySelector("#must-haves").value)],
      avoidTerms: [...(prompt.avoidTerms || []), ...splitInput(document.querySelector("#avoid-terms").value)],
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
      if (!payload.places?.length) throw new Error("No published planner places are available in this sandbox.");
      return payload.places;
    }).catch((error) => { placesPromise = null; throw error; });
  return placesPromise;
}

function renderPlan(plan) {
  if (!plan.days.length) {
    results.innerHTML = `<div class="error-state"><h2>No coherent plan yet.</h2><p>${escapeHtml(plan.warnings[0] || "Try broadening the areas or categories.")}</p></div>`;
    return;
  }
  const summary = `${plan.days.length} ${plan.days.length === 1 ? "day" : "days"} · ${plan.days.reduce((sum, day) => sum + day.stops.length, 0)} stops · ${transportLabel(plan.input.transport)}`;
  results.innerHTML = `
    <div class="results-header"><div><p class="eyebrow">Your recommended plan</p><h2>London, arranged into good days</h2></div><p>${escapeHtml(summary)}</p></div>
    ${plan.warnings.length ? `<div class="warning-box"><strong>Before you go</strong>${plan.warnings.map((warning) => `<p>${escapeHtml(warning)}</p>`).join("")}</div>` : ""}
    ${plan.input.transport === "walking" ? "" : `<p class="route-map-note">The complete Google Maps itinerary opens in walking mode so every stop remains in sequence. Use the Tube or bus for the longer legs identified in the schedule.</p>`}
    <div class="day-list">${plan.days.map(renderDay).join("")}</div>
    <p class="method-note">Verified entries are preferred, but V1 can also use the wider published catalogue. Provisional stops are clearly marked and must be checked before travelling.</p>
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
  const sourceUrl = place.planning?.validationUrl || place.officialUrl || place.planning?.sourceUrl || place.mapUrl;
  const verified = place.planning?.recommendationTier === "VERIFIED";
  const caveats = place.planning?.caveats || [];
  const sourceIsMap = sourceUrl === place.mapUrl;
  return `<li class="stop-card">
    <div class="time-column"><strong>${escapeHtml(stop.startTime)}</strong>${stop.legMode === "start" ? `<span>Start</span>`
      : stop.legUrl ? `<a href="${escapeAttribute(stop.legUrl)}" target="_blank" rel="noopener">${escapeHtml(stop.legMode)} · ${stop.travelMinutes} min ↗</a>`
      : `<span>${escapeHtml(stop.legMode)} · ${stop.travelMinutes} min</span>`}</div>
    <div class="stop-body">
      <div class="stop-topline"><span class="category-label">${escapeHtml(CATEGORY_LABELS[place.category] || place.category)}</span><span class="confidence-label ${verified ? "verified" : "provisional"}">${verified ? "Verified" : "Check details"}</span></div>
      <h4>${escapeHtml(place.name)}</h4><p>${escapeHtml(description)}</p>
      <div class="stop-facts"><span>${escapeHtml(stop.startTime)}–${escapeHtml(stop.endTime)}</span><span class="${check ? "needs-check" : ""}">${check ? "⚠ " : ""}${escapeHtml(stop.availability.label)}</span></div>
      ${caveats.length ? `<ul class="stop-caveats">${caveats.map((caveat) => `<li>${escapeHtml(caveat)}</li>`).join("")}</ul>` : ""}
      <div class="stop-links"><a href="${escapeAttribute(place.mapUrl)}" target="_blank" rel="noopener">Map</a>${sourceIsMap ? "" : `<a href="${escapeAttribute(sourceUrl)}" target="_blank" rel="noopener">Check access and opening times</a>`}</div>
    </div>
  </li>`;
}

function transportLabel(value) { return ({ walking: "mostly walking", mixed: "walking + Tube", transit: "public transport" })[value] || value; }
function renderClarification(interpretation) {
  const questions = (interpretation.clarifications || []).map((item) => `
    <label for="clarification-${escapeAttribute(item.id)}">${escapeHtml(item.question)}
      ${item.reason ? `<span class="clarification-reason">${escapeHtml(item.reason)}</span>` : ""}
      <select id="clarification-${escapeAttribute(item.id)}" data-clarification-id="${escapeAttribute(item.id)}">
        <option value="" selected>Select an answer</option>
        ${item.options.map((option) => `<option value="${escapeAttribute(option.value)}">${escapeHtml(option.label)}</option>`).join("")}
      </select>
    </label>`);
  clarificationPanel.hidden = !questions.length;
  clarificationPanel.innerHTML = questions.length ? `<strong>One useful clarification before planning</strong>${questions.join("")}` : "";
}

async function requestInterpretation(value, answers = {}, force = false) {
  const prompt = String(value || "").trim();
  if (!prompt) return emptyInterpretation();
  const answerKey = JSON.stringify(answers);
  if (!force && currentInterpretation && currentPrompt === prompt
    && (currentAnswers === answerKey || (answerKey === "{}" && !currentInterpretation.clarifications?.length))) return currentInterpretation;
  const response = await fetch("/api/planner/interpret", {
    method: "POST", headers: { Accept: "application/json", "Content-Type": "application/json" },
    body: JSON.stringify({ prompt, answers }),
  });
  const payload = await response.json();
  if (!response.ok || !payload.intent) throw new Error(payload.error || `AI interpretation returned ${response.status}`);
  currentPrompt = prompt;
  currentAnswers = answerKey;
  currentInterpretation = payload.intent;
  return currentInterpretation;
}

function collectClarificationAnswers() {
  return Object.fromEntries([...document.querySelectorAll("[data-clarification-id]")]
    .filter((control) => control.value).map((control) => [control.dataset.clarificationId, control.value]));
}

function emptyInterpretation() {
  return { days: Number(daySelect.value), categories: [], categoryPreferences: [], excludedCategories: [], moods: [],
    avoidTerms: [], mustHaves: [], geoScopes: [], clarifications: [], experience: {}, insights: [] };
}

function relationLabel(value) {
  return ({ IN: "in", NEAR: "around", NORTH_OF: "north of", SOUTH_OF: "south of", EAST_OF: "east of", WEST_OF: "west of" })[value] || "near";
}
function activeGeoScopes(scopes, days) {
  return scopes.flatMap((scope) => scope.day === 0
    ? Array.from({ length: days }, (_, index) => ({ ...scope, day: index + 1 }))
    : [scope]).filter((scope) => !touched.has(`area-${scope.day}`));
}
function splitInput(value) { return String(value || "").split(/[,;\n]/).map((item) => item.trim()).filter(Boolean); }
function promptValue(control, inferred, current) { return touched.has(control) || inferred === undefined ? current : inferred; }
function nearestPreferredDate(value, weekdays) {
  const preferred = new Set(weekdays.map(Number).filter((day) => day >= 0 && day <= 6));
  const base = new Date(`${value}T12:00:00Z`);
  if (!preferred.size || Number.isNaN(base.getTime())) return value;
  const today = new Date();
  const todayUtc = new Date(Date.UTC(today.getUTCFullYear(), today.getUTCMonth(), today.getUTCDate(), 12));
  for (const offset of [0, -1, 1, -2, 2, -3, 3, 4, 5, 6, 7]) {
    const candidate = new Date(base);
    candidate.setUTCDate(candidate.getUTCDate() + offset);
    if (candidate >= todayUtc && preferred.has(candidate.getUTCDay())) return candidate.toISOString().slice(0, 10);
  }
  return value;
}
function escapeHtml(value) { return String(value ?? "").replace(/[&<>"']/g, (character) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", "\"": "&quot;", "'": "&#039;" })[character]); }
function escapeAttribute(value) { return escapeHtml(value); }
