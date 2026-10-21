import { CATEGORY_LABELS, buildPlan } from "./planner-core.js";

const MOOD_LABELS = Object.freeze({
  quiet: "Quiet", unexpected: "Unexpected", beautiful: "Beautiful", weird: "A little weird",
  local: "Local", green: "Green", atmospheric: "Atmospheric", wander: "Good for wandering",
});
const RELATION_LABELS = Object.freeze({ IN: "In", NEAR: "Around", NORTH_OF: "North of", SOUTH_OF: "South of", EAST_OF: "East of", WEST_OF: "West of" });
const ROLE_LABELS = Object.freeze({ SCOPE: "Explore", START: "Start", VIA: "Visit en route", END: "Finish", EXCLUDE: "Avoid" });
const TIME_WINDOWS = Object.freeze({ morning: ["08:30", "13:00"], afternoon: ["13:00", "18:00"], evening: ["17:00", "22:00"], full_day: ["09:00", "19:00"] });

const form = document.querySelector("#planner-form");
const promptInput = document.querySelector("#planner-prompt");
const insights = document.querySelector("#prompt-insights");
const clarificationPanel = document.querySelector("#clarification-panel");
const results = document.querySelector("#results-panel");
let placesPromise;
let currentInterpretation;
let currentPrompt = "";
let currentAnswers = "{}";
let currentPlan;
let plannerMap;
let currentRouteCoordinates = [];
const touched = new Set();

setupOptions();
setDefaultDate();
renderGeography([]);

form.addEventListener("change", handleControlChange);
document.querySelector("#interpret-button").addEventListener("click", applyPrompt);
document.querySelector("#example-button").addEventListener("click", () => {
  promptInput.value = "A Saturday in East London, starting around Liverpool Street. I want excellent local markets, unexpected architecture and an atmospheric long walk. Avoid the most touristy places; use the Tube only for longer gaps.";
  applyPrompt();
});
document.querySelector("#add-geography").addEventListener("click", () => {
  addGeographyRow({ role: "SCOPE", relation: "NEAR", label: "", radiusKm: 4 }, true);
});
document.querySelector("#time-of-day").addEventListener("change", applyTimeWindow);
document.querySelector("#duration").addEventListener("change", applyDuration);
document.querySelector("#start-time").addEventListener("change", syncDurationFromTimes);
document.querySelector("#end-time").addEventListener("change", syncDurationFromTimes);
form.addEventListener("submit", generate);

function setupOptions() {
  document.querySelector("#category-grid").innerHTML = Object.entries(CATEGORY_LABELS).map(([value, label]) => `
    <label class="choice-chip"><input type="checkbox" name="category" value="${value}"><span>${label}</span></label>
  `).join("");
  document.querySelector("#mood-grid").innerHTML = Object.entries(MOOD_LABELS).map(([value, label]) => `
    <label class="choice-chip"><input type="checkbox" name="mood" value="${value}"><span>${label}</span></label>
  `).join("");
}

function setDefaultDate() {
  const date = new Date();
  date.setDate(date.getDate() + 7);
  document.querySelector("#start-date").value = localIsoDate(date);
}

function handleControlChange(event) {
  if (event.target.closest(".geography-row")) {
    event.target.closest(".geography-row").dataset.dirty = "true";
    touched.add("geography");
    return;
  }
  const key = event.target.name === "category" ? "categories" : event.target.name === "mood" ? "moods" : event.target.id;
  if (key) touched.add(key);
}

async function applyPrompt() {
  const button = document.querySelector("#interpret-button");
  button.disabled = true;
  insights.innerHTML = `<span class="insight-empty">Interpreting geography, date, mood and practical constraints…</span>`;
  try {
    const interpretation = await requestInterpretation(promptInput.value, {}, true);
    touched.clear();
    applyInterpretation(interpretation);
  } catch (error) {
    insights.innerHTML = `<span class="insight-empty">${escapeHtml(error.message)}</span>`;
    clarificationPanel.hidden = true;
  } finally {
    button.disabled = false;
  }
}

async function refinePrompt() {
  const answers = collectClarificationAnswers();
  const expected = currentInterpretation?.clarifications?.length || 0;
  if (Object.keys(answers).length < expected) {
    clarificationPanel.querySelector(".clarification-status").textContent = "Choose an answer for each question before continuing.";
    return;
  }
  const button = document.querySelector("#refine-button");
  button.disabled = true;
  button.textContent = "Refining…";
  try {
    const interpretation = await requestInterpretation(promptInput.value, answers, true);
    applyInterpretation(interpretation);
  } catch (error) {
    clarificationPanel.querySelector(".clarification-status").textContent = error.message;
  } finally {
    button.disabled = false;
    button.textContent = "Apply answers and confirm";
  }
}

function applyInterpretation(interpretation) {
  if (interpretation.visitDate && !touched.has("start-date")) document.querySelector("#start-date").value = interpretation.visitDate;
  else if ((interpretation.preferredWeekdays?.length || interpretation.preferredMonths?.length) && !touched.has("start-date")) {
    document.querySelector("#start-date").value = nearestPreferredDate(interpretation.preferredWeekdays, interpretation.preferredMonths);
  }
  if (interpretation.timeOfDay && !touched.has("time-of-day")) document.querySelector("#time-of-day").value = interpretation.timeOfDay;
  if (interpretation.startTime && !touched.has("start-time")) document.querySelector("#start-time").value = interpretation.startTime;
  if (interpretation.endTime && !touched.has("end-time")) document.querySelector("#end-time").value = interpretation.endTime;
  if (!interpretation.startTime && !interpretation.endTime && interpretation.timeOfDay !== "flexible" && !touched.has("time-of-day")) applyTimeWindow();
  syncDurationFromTimes(false);
  if (interpretation.pace && !touched.has("pace")) document.querySelector("#pace").value = interpretation.pace;
  else if (interpretation.timeOfDay === "full_day" && !touched.has("pace")) document.querySelector("#pace").value = "full";
  if (interpretation.transport && !touched.has("transport")) document.querySelector("#transport").value = interpretation.transport;
  if (interpretation.familiarity && !touched.has("familiarity")) document.querySelector("#familiarity").value = interpretation.familiarity;
  if (!touched.has("route-style")) document.querySelector("#route-style").value = interpretation.routePolicy?.style || "UNSPECIFIED";
  if (!touched.has("max-walking-km")) document.querySelector("#max-walking-km").value = interpretation.routePolicy?.maxWalkingKm || "";
  if (!touched.has("planned-break")) document.querySelector("#planned-break").value = breakControlValue(interpretation.breaks);
  if (!touched.has("avoid-core")) document.querySelector("#avoid-core").checked = Boolean(interpretation.avoidCore);
  if (!touched.has("no-big-museums")) document.querySelector("#no-big-museums").checked = Boolean(interpretation.noBigMuseums);
  if (!touched.has("categories")) {
    for (const checkbox of document.querySelectorAll("[name=category]")) checkbox.checked = interpretation.categories.includes(checkbox.value);
  }
  if (!touched.has("moods")) {
    for (const checkbox of document.querySelectorAll("[name=mood]")) checkbox.checked = interpretation.moods.includes(checkbox.value);
  }
  if (!touched.has("geography")) renderGeography([
    ...(interpretation.resolvedGeography || []),
    ...(interpretation.unresolvedGeography || []).map((item) => ({ ...item, center: undefined })),
  ]);

  const geographicInsights = (interpretation.geography || []).map((item) => `${RELATION_LABELS[item.relation]?.toLowerCase() || "near"} ${item.label}`);
  const dateInsight = interpretation.visitDate ? [formatDate(interpretation.visitDate)] : [];
  const routeInsight = interpretation.routePolicy?.style && interpretation.routePolicy.style !== "UNSPECIFIED"
    ? [`${interpretation.routePolicy.style.toLowerCase()} route`] : [];
  const breakInsight = interpretation.breaks?.length ? [interpretation.breaks.map((item) => item.type.toLowerCase()).join(" + ")] : [];
  const insightItems = [...new Set([...(interpretation.insights || []), ...geographicInsights, ...routeInsight, ...breakInsight, ...dateInsight])];
  insights.innerHTML = insightItems.length
    ? `<span class="insight-prefix">AI understood:</span>${insightItems.map((item) => `<span class="insight-chip">${escapeHtml(item)}</span>`).join("")}`
    : `<span class="insight-empty">No firm preferences were stated. Review the controls and add anything that matters.</span>`;
  if (interpretation.unresolvedGeography?.length) {
    insights.innerHTML += `<span class="insight-warning">Could not resolve: ${escapeHtml(interpretation.unresolvedGeography.map((item) => item.label).join(", "))}. Edit the location below.</span>`;
  }
  renderClarification(interpretation);
}

async function generate(event) {
  event.preventDefault();
  const button = document.querySelector("#generate-button");
  button.disabled = true;
  results.innerHTML = `<div class="loading-state"><span></span><h2>Building one coherent day…</h2><p>Balancing fit, geography, realistic visit time and access confidence.</p></div>`;
  try {
    let intent = currentInterpretation || emptyInterpretation();
    if (promptInput.value.trim() && (!currentInterpretation || currentPrompt !== promptInput.value.trim())) {
      intent = await requestInterpretation(promptInput.value, {}, true);
      applyInterpretation(intent);
    }
    if (intent.clarifications?.length) throw new Error("Answer the AI follow-up questions and apply the answers before building the itinerary.");
    const geography = await collectResolvedGeography();
    const places = await loadPlaces();
    const checkedCategories = checkedValues("category");
    const checkedMoods = checkedValues("mood");
    const menuCategoriesOverride = touched.has("categories");
    const plan = buildPlan(places, {
      days: 1, startDate: document.querySelector("#start-date").value,
      startTime: document.querySelector("#start-time").value, endTime: document.querySelector("#end-time").value,
      pace: document.querySelector("#pace").value, transport: document.querySelector("#transport").value,
      familiarity: document.querySelector("#familiarity").value, areas: ["ANY"],
      scopeMode: touched.has("geography") ? "ALL" : intent.scopeMode,
      geoScopes: geography.filter((item) => item.role === "SCOPE"), excludeGeoScopes: geography.filter((item) => item.role === "EXCLUDE"),
      routeStart: pointForRole(geography, "START"), routeWaypoints: pointsForRole(geography, "VIA"), routeEnd: pointForRole(geography, "END"),
      routePolicy: {
        style: document.querySelector("#route-style").value,
        maxWalkingKm: Number(document.querySelector("#max-walking-km").value) || 0,
      },
      breaks: touched.has("planned-break") ? breaksFromControl(document.querySelector("#planned-break").value) : intent.breaks,
      categories: menuCategoriesOverride ? checkedCategories : intent.categories,
      categoryPreferences: menuCategoriesOverride ? checkedCategories.map((category) => ({ category, strength: "PREFERRED", minStops: 0, maxStops: 6 })) : intent.categoryPreferences,
      excludedCategories: intent.excludedCategories, primaryCategory: menuCategoriesOverride ? "" : intent.primaryCategory,
      experience: menuCategoriesOverride ? { ...intent.experience, strictCategory: false, strictConcept: false } : intent.experience,
      moods: touched.has("moods") ? checkedMoods : intent.moods, impact: intent.impact, season: intent.season,
      avoidCore: document.querySelector("#avoid-core").checked, noBigMuseums: document.querySelector("#no-big-museums").checked,
      excludeMuseums: intent.excludedCategories?.includes("MUSEUM"), outdoorOnly: intent.outdoorOnly,
      outdoorPreference: intent.outdoorPreference, crowdSensitive: intent.crowdSensitive,
      marketFocus: intent.marketFocus, weekendFlexible: intent.weekendFlexible,
      mustHaves: [...(intent.mustHaves || []), ...splitInput(document.querySelector("#must-haves").value)],
      avoidTerms: [...(intent.avoidTerms || []), ...splitInput(document.querySelector("#avoid-terms").value)],
    });
    currentPlan = plan;
    await renderPlan(plan);
  } catch (error) {
    results.innerHTML = `<div class="error-state"><h2>The itinerary is not ready yet.</h2><p>${escapeHtml(error.message)}</p><button type="button" id="retry-button">Review request</button></div>`;
    document.querySelector("#retry-button")?.addEventListener("click", () => promptInput.focus());
  } finally {
    button.disabled = false;
  }
}

async function loadPlaces() {
  placesPromise ||= fetch("/api/planner/places?limit=1200", { headers: { Accept: "application/json" } }).then(async (response) => {
    const payload = await response.json();
    if (!response.ok) throw new Error(payload.error || `Planner data returned ${response.status}`);
    if (!payload.places?.length) throw new Error("No published planner places are available in this sandbox.");
    return payload.places;
  }).catch((error) => { placesPromise = null; throw error; });
  return placesPromise;
}

async function renderPlan(plan) {
  if (!plan.days.length) {
    results.innerHTML = `<div class="error-state"><h2>No coherent plan yet.</h2><p>${escapeHtml(plan.warnings[0] || "Broaden the location, time window or categories.")}</p></div>`;
    return;
  }
  const day = plan.days[0];
  const walkingSummary = plan.input.transport === "walking" && day.estimatedWalkingKm
    ? ` · ~${day.estimatedWalkingKm.toFixed(1)} km walking` : "";
  const summary = `${day.stops.length} ${day.stops.length === 1 ? "stop" : "stops"} · ${transportLabel(plan.input.transport)}${walkingSummary} · ${plan.input.startTime}–${plan.input.endTime}`;
  results.innerHTML = `
    <div class="results-header"><div><p class="eyebrow">Your one-day plan</p><h2>${escapeHtml(day.areaLabel || "A London day")}</h2></div><p>${escapeHtml(summary)}</p></div>
    ${plan.warnings.length ? `<div class="warning-box"><strong>Before you go</strong>${plan.warnings.map((warning) => `<p>${escapeHtml(warning)}</p>`).join("")}</div>` : ""}
    <section class="map-card"><div id="itinerary-map" aria-label="OpenStreetMap itinerary map"></div>
      <div class="map-toolbar"><span id="map-status">Preparing the walking route…</span><span>Map data © OpenStreetMap contributors</span></div></section>
    ${plan.input.transport === "walking" ? "" : plan.input.transport === "river"
      ? `<p class="route-map-note">The map and Google Maps link show the land-based walking sequence. Legs marked Uber Boat include an indicative boarding, waiting and sailing allowance. <a href="https://www.thamesclippers.com/plan-your-journey/timetable" target="_blank" rel="noopener">Check the official timetable before travelling ↗</a></p>`
      : `<p class="route-map-note">The map and Google Maps link show the complete walking sequence. Follow the schedule labels when a Tube or bus hop is recommended for a longer leg.</p>`}
    <div class="result-actions"><a class="maps-button" href="${escapeAttribute(day.routeUrl)}" target="_blank" rel="noopener">Open in Google Maps ↗</a>
      <button id="download-pdf" class="download-button" type="button">Download branded PDF</button></div>
    <article class="day-card">${renderDay(day)}</article>
    <p class="method-note">Verified entries are preferred, but the wider curated catalogue remains eligible. Provisional stops are marked and should be checked before travelling.</p>`;
  await renderItineraryMap(day);
  document.querySelector("#download-pdf").addEventListener("click", downloadPdf);
  results.scrollIntoView({ behavior: "smooth", block: "start" });
}

function renderDay(day) {
  const events = [
    ...day.stops.map((stop, index) => ({ kind: "stop", startTime: stop.startTime, stop, index })),
    ...(day.breaks || []).map((item) => ({ kind: "break", startTime: item.startTime, item })),
  ].sort((a, b) => a.startTime.localeCompare(b.startTime));
  return `<header><div><span>One day</span><h3>${escapeHtml(formatDate(day.date))}</h3><p>${day.routeLabel ? escapeHtml(day.routeLabel) : "A coherent route through the selected area"}</p></div></header>
    <ol class="stop-list">${events.map((event) => event.kind === "stop" ? renderStop(event.stop, event.index) : renderBreak(event.item)).join("")}</ol>
    ${day.routeEnd && day.destinationArrival ? `<div class="route-destination"><strong>${escapeHtml(day.destinationArrival)}</strong><span>${escapeHtml(day.destinationLegMode)} · ${day.destinationTravelMinutes} min</span><p>Finish at ${escapeHtml(day.routeEnd.label)}</p></div>` : ""}`;
}

function renderBreak(item) {
  const detail = item.preference || `Time reserved for a ${item.label.toLowerCase()}.`;
  return `<li class="break-card"><div class="time-column"><span class="break-symbol">☕</span><strong>${escapeHtml(item.startTime)}</strong><span>${item.durationMinutes} min</span></div>
    <div class="break-body"><div class="stop-topline"><span class="category-label">Planned break</span></div><h4>${escapeHtml(item.label)}</h4>
      <p>${escapeHtml(detail)} Suggested around ${escapeHtml(item.anchorLabel)}; choose the venue that suits you.</p>
      <div class="stop-facts"><span>${escapeHtml(item.startTime)}–${escapeHtml(item.endTime)}</span><span>Included in the schedule</span></div>
      <div class="stop-links"><a href="${escapeAttribute(item.mapUrl)}" target="_blank" rel="noopener">Explore nearby options</a></div></div></li>`;
}

function renderStop(stop, index) {
  const place = stop.place;
  const check = stop.availability.status === "check";
  const description = place.hook || place.description || "A curated London Advanced stop.";
  const sourceUrl = validationUrl(place);
  const verified = place.planning?.recommendationTier === "VERIFIED";
  const caveats = place.planning?.caveats || [];
  return `<li class="stop-card"><div class="time-column"><span class="stop-number">${index + 1}</span><strong>${escapeHtml(stop.startTime)}</strong>${stop.legMode === "start" ? `<span>Start</span>`
      : stop.legUrl ? `<a href="${escapeAttribute(stop.legUrl)}" target="_blank" rel="noopener">${escapeHtml(stop.legMode)} · ${stop.travelMinutes} min ↗</a>`
      : `<span>${escapeHtml(stop.legMode)} · ${stop.travelMinutes} min</span>`}</div>
    <div class="stop-body"><div class="stop-topline"><span class="category-label">${escapeHtml(CATEGORY_LABELS[place.category] || place.category)}</span><span class="confidence-label ${verified ? "verified" : "provisional"}">${verified ? "Verified" : "Check details"}</span></div>
      <h4>${escapeHtml(place.name)}</h4><p>${escapeHtml(description)}</p>
      <div class="stop-facts"><span>${escapeHtml(stop.startTime)}–${escapeHtml(stop.endTime)}</span><span>${stop.visitMinutes} min visit</span><span class="${check ? "needs-check" : ""}">${check ? "⚠ " : ""}${escapeHtml(stop.availability.label)}</span></div>
      ${caveats.length ? `<ul class="stop-caveats">${caveats.map((caveat) => `<li>${escapeHtml(caveat)}</li>`).join("")}</ul>` : ""}
      <div class="stop-links"><a href="${escapeAttribute(place.mapUrl)}" target="_blank" rel="noopener">Location map</a>${sourceUrl === place.mapUrl ? "" : `<a href="${escapeAttribute(sourceUrl)}" target="_blank" rel="noopener">Access and opening information</a>`}</div>
    </div></li>`;
}

async function renderItineraryMap(day) {
  if (!globalThis.L) { document.querySelector("#map-status").textContent = "The OpenStreetMap library did not load."; return; }
  if (plannerMap) plannerMap.remove();
  const points = routePoints(day);
  plannerMap = L.map("itinerary-map", { scrollWheelZoom: false });
  L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", { maxZoom: 19, crossOrigin: true, attribution: "© OpenStreetMap contributors" }).addTo(plannerMap);
  points.forEach((point) => {
    const label = point.kind === "stop" ? String(point.number) : point.kind === "start" ? "S" : "F";
    L.marker([point.lat, point.lon], { icon: L.divIcon({ className: "route-marker-shell", html: `<span class="route-marker ${point.kind}">${label}</span>`, iconSize: [28, 28], iconAnchor: [14, 14] }) })
      .addTo(plannerMap).bindPopup(`<strong>${escapeHtml(point.label)}</strong>`);
  });
  plannerMap.fitBounds(L.latLngBounds(points.map((point) => [point.lat, point.lon])), { padding: [28, 28], maxZoom: 15 });
  currentRouteCoordinates = points.map((point) => [point.lat, point.lon]);
  if (points.length < 2) { document.querySelector("#map-status").textContent = "Single-stop map"; return; }
  try {
    const response = await fetch("/api/route", { method: "POST", headers: { "Content-Type": "application/json", Accept: "application/json" }, body: JSON.stringify({ start: points[0], end: points.at(-1), via: points.slice(1, -1) }) });
    const payload = await response.json();
    if (!response.ok || !payload.geometry?.coordinates) throw new Error(payload.error || "Walking route unavailable");
    currentRouteCoordinates = payload.geometry.coordinates.map(([lon, lat]) => [lat, lon]);
    L.polyline(currentRouteCoordinates, { color: "#d94b38", weight: 5, opacity: .88 }).addTo(plannerMap);
    const mappedKm = (payload.distanceMetres / 1000).toFixed(1);
    document.querySelector("#map-status").textContent = currentPlan?.input?.transport === "walking"
      ? `${mappedKm} km walking route`
      : `${mappedKm} km mapped route · follow the scheduled ${transportLabel(currentPlan.input.transport)} legs`;
  } catch {
    L.polyline(currentRouteCoordinates, { color: "#d94b38", weight: 4, opacity: .75, dashArray: "8 8" }).addTo(plannerMap);
    document.querySelector("#map-status").textContent = "Indicative stop sequence — refine the path in Google Maps";
  }
}

async function downloadPdf() {
  const button = document.querySelector("#download-pdf");
  button.disabled = true; button.textContent = "Preparing PDF…";
  try {
    if (!globalThis.jspdf?.jsPDF) throw new Error("The PDF library did not load. Refresh the page and try again.");
    const { jsPDF } = globalThis.jspdf;
    const doc = new jsPDF({ unit: "mm", format: "a4" });
    const day = currentPlan.days[0]; const margin = 15; let y = 16;
    doc.setFillColor(23, 33, 44); doc.rect(0, 0, 210, 31, "F");
    doc.setTextColor(255); doc.setFont("helvetica", "bold"); doc.setFontSize(18); doc.text("LONDON ADVANCED", margin, 14);
    doc.setFont("helvetica", "normal"); doc.setFontSize(9); doc.text("One-day itinerary · Beyond the obvious", margin, 21);
    y = 40; doc.setTextColor(23, 33, 44); doc.setFont("helvetica", "bold"); doc.setFontSize(18); doc.text(day.areaLabel || "Your London day", margin, y);
    y += 7; doc.setFont("helvetica", "normal"); doc.setFontSize(10); doc.setTextColor(90, 99, 107);
    doc.text(`${formatDate(day.date)} · ${currentPlan.input.startTime}–${currentPlan.input.endTime} · ${transportLabel(currentPlan.input.transport)}`, margin, y);
    y += 7; if (day.routeLabel) { doc.text(day.routeLabel, margin, y); y += 6; }
    const mapImage = await captureMapImage();
    if (mapImage) doc.addImage(mapImage, "PNG", margin, y, 180, 78, undefined, "FAST");
    else drawRouteDiagram(doc, margin, y, 180, 78, day);
    y += 84; doc.setFont("helvetica", "bold"); doc.setFontSize(10); doc.setTextColor(217, 75, 56);
    doc.textWithLink("Open the complete walking route in Google Maps", margin, y, { url: day.routeUrl }); y += 9;
    const pdfEvents = [
      ...day.stops.map((stop, index) => ({ kind: "stop", startTime: stop.startTime, stop, index })),
      ...(day.breaks || []).map((item) => ({ kind: "break", startTime: item.startTime, item })),
    ].sort((a, b) => a.startTime.localeCompare(b.startTime));
    for (const event of pdfEvents) {
      if (event.kind === "break") {
        const item = event.item;
        if (y + 24 > 278) { doc.addPage(); y = 18; }
        doc.setFillColor(238, 244, 239); doc.roundedRect(margin, y - 4, 180, 20, 2, 2, "F");
        doc.setTextColor(47, 111, 80); doc.setFont("helvetica", "bold"); doc.setFontSize(11);
        doc.text(`${item.startTime}  ${item.label}`, margin + 5, y + 2);
        doc.setFont("helvetica", "normal"); doc.setFontSize(8.5); doc.setTextColor(80, 90, 98);
        doc.text(`${item.durationMinutes} min · around ${item.anchorLabel}`, margin + 5, y + 8);
        doc.setTextColor(47, 111, 80); doc.setFont("helvetica", "bold"); doc.textWithLink("Explore nearby options", margin + 5, y + 13, { url: item.mapUrl });
        y += 25;
        continue;
      }
      const { stop, index } = event; const place = stop.place;
      const description = place.hook || place.description || "A curated London Advanced stop.";
      const descriptionLines = doc.splitTextToSize(description, 164); const caveats = place.planning?.caveats || [];
      const blockHeight = 22 + descriptionLines.length * 4.4 + Math.min(caveats.length, 3) * 4.2;
      if (y + blockHeight > 278) { doc.addPage(); y = 18; }
      doc.setFillColor(47, 111, 80); doc.circle(margin + 4, y + 1, 3.7, "F");
      doc.setTextColor(255); doc.setFont("helvetica", "bold"); doc.setFontSize(8); doc.text(String(index + 1), margin + 4, y + 2.2, { align: "center" });
      doc.setTextColor(23, 33, 44); doc.setFontSize(12); doc.text(`${stop.startTime}  ${place.name}`, margin + 11, y + 2);
      y += 7; doc.setFont("helvetica", "normal"); doc.setFontSize(8.5); doc.setTextColor(80, 90, 98);
      const incomingLeg = stop.legMode === "start" ? "" : ` · ${stop.legMode} ${stop.travelMinutes} min`;
      doc.text(`${CATEGORY_LABELS[place.category] || place.category} · ${stop.visitMinutes} min${incomingLeg} · ${stop.availability.label}`, margin + 11, y);
      y += 5; doc.setFontSize(9); doc.text(descriptionLines, margin + 11, y); y += descriptionLines.length * 4.4 + 2;
      doc.setTextColor(47, 111, 80); doc.setFont("helvetica", "bold"); doc.setFontSize(8.5);
      doc.textWithLink("Location map", margin + 11, y, { url: place.mapUrl });
      const sourceUrl = validationUrl(place);
      if (sourceUrl && sourceUrl !== place.mapUrl) doc.textWithLink("Access and opening information", margin + 40, y, { url: sourceUrl });
      y += 5;
      if (caveats.length) {
        doc.setFont("helvetica", "normal"); doc.setTextColor(138, 90, 0); doc.setFontSize(7.5);
        for (const caveat of caveats.slice(0, 3)) { doc.text(`• ${caveat}`, margin + 11, y); y += 4.2; }
      }
      y += 5;
    }
    addPdfFooters(doc); doc.save(`london-advanced-${day.date}.pdf`);
  } catch (error) { globalThis.alert(error.message); }
  finally { button.disabled = false; button.textContent = "Download branded PDF"; }
}

async function captureMapImage() {
  if (!globalThis.html2canvas) return null;
  try { const canvas = await globalThis.html2canvas(document.querySelector("#itinerary-map"), { useCORS: true, allowTaint: false, logging: false, scale: 1.5 }); return canvas.toDataURL("image/png"); }
  catch { return null; }
}

function drawRouteDiagram(doc, x, y, width, height, day) {
  doc.setFillColor(241, 243, 239); doc.roundedRect(x, y, width, height, 3, 3, "F");
  const coords = currentRouteCoordinates.length ? currentRouteCoordinates : routePoints(day).map((point) => [point.lat, point.lon]);
  const lats = coords.map(([lat]) => lat); const lons = coords.map(([, lon]) => lon);
  const minLat = Math.min(...lats), maxLat = Math.max(...lats), minLon = Math.min(...lons), maxLon = Math.max(...lons);
  const project = ([lat, lon]) => [x + 8 + ((lon - minLon) / Math.max(.0001, maxLon - minLon)) * (width - 16), y + height - 8 - ((lat - minLat) / Math.max(.0001, maxLat - minLat)) * (height - 16)];
  doc.setDrawColor(217, 75, 56); doc.setLineWidth(1.2);
  for (let index = 1; index < coords.length; index += 1) { const [x1, y1] = project(coords[index - 1]); const [x2, y2] = project(coords[index]); doc.line(x1, y1, x2, y2); }
  routePoints(day).filter((point) => point.kind === "stop").forEach((point) => { const [px, py] = project([point.lat, point.lon]); doc.setFillColor(47, 111, 80); doc.circle(px, py, 2.5, "F"); });
  doc.setFont("helvetica", "normal"); doc.setFontSize(7); doc.setTextColor(100, 108, 112); doc.text("Indicative route diagram", x + 4, y + height - 3);
}

function addPdfFooters(doc) {
  const pages = doc.getNumberOfPages();
  for (let page = 1; page <= pages; page += 1) {
    doc.setPage(page); doc.setDrawColor(220); doc.line(15, 287, 195, 287);
    doc.setFont("helvetica", "normal"); doc.setFontSize(8); doc.setTextColor(90, 98, 104);
    doc.textWithLink("Generated by London Advanced · www.londonadvanced.com", 15, 292, { url: "https://www.londonadvanced.com" });
    doc.text(`${page}/${pages}`, 195, 292, { align: "right" });
  }
}

function renderClarification(interpretation) {
  const questions = interpretation.clarifications || [];
  clarificationPanel.hidden = !questions.length;
  if (!questions.length) { clarificationPanel.innerHTML = ""; insights.innerHTML += `<span class="interpretation-confirmed">Ready to review and build</span>`; return; }
  clarificationPanel.innerHTML = `<strong>${questions.length === 1 ? "One useful question" : `${questions.length} useful questions`} before planning</strong>
    ${questions.map((item) => `<label for="clarification-${escapeAttribute(item.id)}">${escapeHtml(item.question)}${item.reason ? `<span class="clarification-reason">${escapeHtml(item.reason)}</span>` : ""}
      <select id="clarification-${escapeAttribute(item.id)}" data-clarification-id="${escapeAttribute(item.id)}"><option value="" selected>Select an answer</option>
        ${item.options.map((option) => `<option value="${escapeAttribute(option.value)}">${escapeHtml(option.label)}</option>`).join("")}
        ${item.options.some((option) => /best judgement/i.test(option.label)) ? "" : `<option value="Use your best judgement">Use your best judgement</option>`}</select></label>`).join("")}
    <button id="refine-button" class="refine-button" type="button">Apply answers and confirm</button><span class="clarification-status" aria-live="polite"></span>`;
  document.querySelector("#refine-button").addEventListener("click", refinePrompt);
}

function renderGeography(items) {
  const list = document.querySelector("#geography-list"); list.innerHTML = "";
  if (!items.length) list.innerHTML = `<p class="geography-empty">No location restriction. The planner will choose a coherent London cluster.</p>`;
  for (const item of items) addGeographyRow(item, false);
}

function addGeographyRow(item, focus) {
  const list = document.querySelector("#geography-list"); list.querySelector(".geography-empty")?.remove();
  const row = document.createElement("div"); row.className = "geography-row";
  row.dataset.dirty = item.center ? "false" : "true"; row.dataset.resolved = item.center ? JSON.stringify(item) : "";
  row.innerHTML = `<select class="geo-role" aria-label="Location role">${selectOptions(ROLE_LABELS, item.role || "SCOPE")}</select>
    <select class="geo-relation" aria-label="Geographic relation">${selectOptions(RELATION_LABELS, item.relation || "NEAR")}</select>
    <input class="geo-query" type="text" value="${escapeAttribute(item.query || item.label || "")}" placeholder="London area, landmark or station" aria-label="London location">
    <select class="geo-radius" aria-label="Area size"><option value="2">2 km</option><option value="4">4 km</option><option value="8">8 km</option><option value="15">15 km</option><option value="20">20 km</option></select>
    <button class="remove-geography" type="button" aria-label="Remove location">×</button>`;
  row.querySelector(".geo-radius").value = closestOption(row.querySelector(".geo-radius"), Number(item.radiusKm) || 4);
  row.querySelector(".geo-role").addEventListener("change", syncGeographyRole);
  row.querySelector(".remove-geography").addEventListener("click", () => { row.remove(); touched.add("geography"); if (!list.children.length) renderGeography([]); });
  list.append(row); syncGeographyRole({ target: row.querySelector(".geo-role") }); if (focus) row.querySelector(".geo-query").focus();
}

function syncGeographyRole(event) {
  const row = event.target.closest(".geography-row"); const anchor = ["START", "VIA", "END"].includes(event.target.value);
  row.querySelector(".geo-relation").disabled = anchor; row.querySelector(".geo-radius").disabled = anchor;
  if (anchor) row.querySelector(".geo-relation").value = "NEAR";
}

async function collectResolvedGeography() {
  const resolved = [];
  for (const row of document.querySelectorAll(".geography-row")) {
    const query = row.querySelector(".geo-query").value.trim(); if (!query) continue;
    const role = row.querySelector(".geo-role").value; const relation = row.querySelector(".geo-relation").value; const radiusKm = Number(row.querySelector(".geo-radius").value);
    if (row.dataset.dirty !== "true" && row.dataset.resolved) { const item = JSON.parse(row.dataset.resolved); resolved.push({ ...item, role, relation, radiusKm }); continue; }
    const response = await fetch(`/api/geocode?q=${encodeURIComponent(query)}`, { headers: { Accept: "application/json" } }); const payload = await response.json();
    if (!response.ok || !payload.result) throw new Error(`Could not resolve “${query}”. Use a London district, landmark, station or postcode.`);
    resolved.push({ day: 0, role, relation, query, label: query, radiusKm, center: { lat: payload.result.lat, lon: payload.result.lon }, bounds: payload.result.bounds });
  }
  return resolved;
}

async function requestInterpretation(value, answers = {}, force = false) {
  const prompt = String(value || "").trim(); if (!prompt) return emptyInterpretation(); const answerKey = JSON.stringify(answers);
  if (!force && currentInterpretation && currentPrompt === prompt && currentAnswers === answerKey) return currentInterpretation;
  const response = await fetch("/api/planner/interpret", { method: "POST", headers: { Accept: "application/json", "Content-Type": "application/json" }, body: JSON.stringify({ prompt, answers }) });
  const payload = await response.json(); if (!response.ok || !payload.intent) throw new Error(payload.error || `AI interpretation returned ${response.status}`);
  currentPrompt = prompt; currentAnswers = answerKey; currentInterpretation = payload.intent; return currentInterpretation;
}

function collectClarificationAnswers() { return Object.fromEntries([...document.querySelectorAll("[data-clarification-id]")].filter((control) => control.value).map((control) => [control.dataset.clarificationId, control.value])); }
function emptyInterpretation() { return { days: 1, scopeMode: "ALL", categories: [], categoryPreferences: [], excludedCategories: [], moods: [], avoidTerms: [], mustHaves: [], geography: [], clarifications: [], experience: {}, routePolicy: { style: "UNSPECIFIED", maxWalkingKm: 0 }, breaks: [], insights: [] }; }

function breakControlValue(breaks) {
  const planned = (breaks || []).find((item) => item.required) || breaks?.[0];
  if (!planned) return "none";
  const duration = [30, 45, 60, 75].sort((a, b) => Math.abs(a - planned.durationMinutes) - Math.abs(b - planned.durationMinutes))[0];
  return `${planned.type === "LUNCH" ? "LUNCH" : "COFFEE"}:${duration}`;
}

function breaksFromControl(value) {
  if (!value || value === "none") return [];
  const [type, rawDuration] = value.split(":");
  return [{ type, required: true, durationMinutes: Number(rawDuration), earliestTime: type === "LUNCH" ? "12:00" : "10:00",
    latestTime: type === "LUNCH" ? "14:30" : "17:00", preference: type === "LUNCH" ? "a pleasant lunch stop" : "a pleasant café or rest stop" }];
}
function applyTimeWindow() { const window = TIME_WINDOWS[document.querySelector("#time-of-day").value]; if (!window) return; document.querySelector("#start-time").value = window[0]; document.querySelector("#end-time").value = window[1]; syncDurationFromTimes(false); }
function applyDuration() { const start = minutes(document.querySelector("#start-time").value); const duration = Number(document.querySelector("#duration").value) * 60; document.querySelector("#end-time").value = timeFromMinutes(Math.min(23 * 60 + 59, start + duration)); }
function syncDurationFromTimes(markTouched = true) { const duration = Math.max(1, (minutes(document.querySelector("#end-time").value) - minutes(document.querySelector("#start-time").value)) / 60); document.querySelector("#duration").value = closestOption(document.querySelector("#duration"), duration); if (markTouched) touched.add("duration"); }
function nearestPreferredDate(weekdays = [], months = []) { const weekdaySet = new Set(weekdays.map(Number)); const monthSet = new Set(months.map(Number)); const start = new Date(); start.setHours(12, 0, 0, 0); for (let offset = 0; offset <= 370; offset += 1) { const candidate = new Date(start); candidate.setDate(candidate.getDate() + offset); if ((!weekdaySet.size || weekdaySet.has(candidate.getDay())) && (!monthSet.size || monthSet.has(candidate.getMonth() + 1))) return localIsoDate(candidate); } return document.querySelector("#start-date").value; }
function routePoints(day) { const points = []; if (day.routeStart) points.push({ ...day.routeStart, kind: "start", label: day.routeStart.label }); day.stops.forEach((stop, index) => points.push({ lat: stop.place.lat, lon: stop.place.lon, kind: "stop", number: index + 1, label: stop.place.name })); if (day.routeEnd) points.push({ ...day.routeEnd, kind: "finish", label: day.routeEnd.label }); return points.filter((point, index, items) => index === 0 || point.lat !== items[index - 1].lat || point.lon !== items[index - 1].lon); }
function pointForRole(items, role) { const item = items.find((candidate) => candidate.role === role); return item ? { label: item.label, ...item.center } : undefined; }
function pointsForRole(items, role) { return items.filter((candidate) => candidate.role === role).map((item) => ({ label: item.label, ...item.center })); }
function checkedValues(name) { return [...document.querySelectorAll(`[name=${name}]:checked`)].map((item) => item.value); }
function validationUrl(place) { return place.planning?.validationUrl || place.officialUrl || place.planning?.sourceUrl || place.mapUrl; }
function transportLabel(value) { return ({ walking: "mostly walking", mixed: "walking + Tube/bus", transit: "public transport", river: "walking + Uber Boat" })[value] || value; }
function splitInput(value) { return String(value || "").split(/[,;\n]/).map((item) => item.trim()).filter(Boolean); }
function minutes(value) { const [hours, mins] = String(value || "00:00").split(":").map(Number); return hours * 60 + mins; }
function timeFromMinutes(value) { return `${String(Math.floor(value / 60)).padStart(2, "0")}:${String(value % 60).padStart(2, "0")}`; }
function localIsoDate(date) { return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(date.getDate()).padStart(2, "0")}`; }
function formatDate(value) { return new Intl.DateTimeFormat("en-GB", { weekday: "long", day: "numeric", month: "long", year: "numeric" }).format(new Date(`${value}T12:00:00Z`)); }
function selectOptions(labels, selected) { return Object.entries(labels).map(([value, label]) => `<option value="${value}"${value === selected ? " selected" : ""}>${label}</option>`).join(""); }
function closestOption(select, target) { return [...select.options].sort((a, b) => Math.abs(Number(a.value) - target) - Math.abs(Number(b.value) - target))[0]?.value || select.options[0].value; }
function escapeHtml(value) { return String(value ?? "").replace(/[&<>"']/g, (character) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", "\"": "&quot;", "'": "&#039;" })[character]); }
function escapeAttribute(value) { return escapeHtml(value); }
