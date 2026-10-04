import { buildGoogleMapsUrl } from "../smart-navigation/itinerary.js";

export const AREA_OPTIONS = Object.freeze({
  ANY: { label: "Best-fit London cluster", center: { lat: 51.515, lon: -0.115 } },
  WEST_HYDE_PARK: { label: "West of Hyde Park", center: { lat: 51.507, lon: -0.215 } },
  WEST_SOUTH_KENSINGTON: { label: "West of South Kensington", center: { lat: 51.505, lon: -0.245 } },
  EAST_HOLBORN: { label: "East of Holborn", center: { lat: 51.518, lon: -0.072 } },
  SOUTH_THAMES: { label: "South of the Thames", center: { lat: 51.475, lon: -0.12 } },
  NORTH: { label: "North London", center: { lat: 51.56, lon: -0.12 } },
  SOUTH: { label: "South London", center: { lat: 51.475, lon: -0.09 } },
  EAST: { label: "East London", center: { lat: 51.515, lon: -0.02 } },
  WEST: { label: "West London", center: { lat: 51.505, lon: -0.24 } },
  CENTRAL: { label: "Central London", center: { lat: 51.514, lon: -0.12 } },
});

export const CATEGORY_LABELS = Object.freeze({
  AREA: "Neighbourhoods", BUILDING: "Architecture", MUSEUM: "Small museums", ODDITY: "Quirky places",
  PARK: "Parks & gardens", RELIGIOUS: "Sacred places", SHOPPING: "Markets & local shops", VIEWPOINT: "Views",
});

const NUMBER_WORDS = Object.freeze({ one: 1, two: 2 });
const PACE_STOPS = Object.freeze({ relaxed: 4, balanced: 5, full: 6 });
const EARLY_ACCESS = new Set(["ALWAYS_ACCESSIBLE", "EXTERIOR_ONLY"]);

export function interpretPrompt(value) {
  const text = normalText(value);
  const result = { categories: [], moods: [], avoidTerms: [], insights: [] };
  const dayMatch = text.match(/\b(one|two|1|2)[\s-]+(?:full[\s-]+)?days?\b/);
  if (dayMatch) {
    result.days = Number(dayMatch[1]) || NUMBER_WORDS[dayMatch[1]];
    result.insights.push(`${result.days}-day plan`);
  }
  const routeEndpoints = extractRouteEndpoints(value);
  if (routeEndpoints.start) {
    result.routeStartQuery = routeEndpoints.start;
    result.insights.push(`start ${routeEndpoints.start}`);
  }
  if (routeEndpoints.end) {
    result.routeEndQuery = routeEndpoints.end;
    result.insights.push(`finish ${routeEndpoints.end}`);
  }
  const southThames = /\bsouth\s+of\s+(?:the\s+)?thames\b|\bsouth\s+bank\b/.test(text);
  const westHyde = /west\s+of\s+hyde\s+park/.test(text);
  const westSouthKensington = /west\s+of\s+south\s+kensington/.test(text);
  const eastHolborn = /east\s+of\s+holborn/.test(text);
  if (southThames) {
    result.areas = Array.from({ length: result.days || 1 }, () => "SOUTH_THAMES");
    result.insights.push("south of the Thames");
  } else if (westHyde || westSouthKensington || eastHolborn) {
    const westArea = westSouthKensington ? "WEST_SOUTH_KENSINGTON" : westHyde ? "WEST_HYDE_PARK" : "ANY";
    result.areas = [westArea, eastHolborn ? "EAST_HOLBORN" : "ANY"].slice(0, result.days || 2);
    if (westHyde) result.insights.push("west of Hyde Park");
    if (westSouthKensington) result.insights.push("west of South Kensington");
    if (eastHolborn) result.insights.push("east of Holborn");
  } else {
    const namedArea = [
      ["WEST", /\bwest(?:ern)?\s+london\b/], ["EAST", /\beast(?:ern)?\s+london\b/],
      ["NORTH", /\bnorth(?:ern)?\s+london\b/], ["SOUTH", /\bsouth(?:ern)?\s+london\b/],
      ["CENTRAL", /\bcentral\s+london\b/],
    ].find(([, pattern]) => pattern.test(text));
    if (namedArea) {
      result.areas = Array.from({ length: result.days || 1 }, () => namedArea[0]);
      result.insights.push(AREA_OPTIONS[namedArea[0]].label.toLowerCase());
    }
  }
  const categoryPatterns = [
    ["MUSEUM", /\b(?:(?:small|little|independent|unusual)\s+)?museums?\b|\b(?:artistic|art|galleries?|exhibitions?)\b/],
    ["PARK", /\b(?:parks?|gardens?|green spaces?|greenery|green)\b/],
    ["ODDITY", /\b(?:quirky|odd|unusual|uncommon|curious|hidden)\b/],
    ["BUILDING", /\b(?:architecture|buildings?|modernism|brutalism|heritage)\b/],
    ["VIEWPOINT", /\b(?:views?|viewpoints?|panoramas?)\b/],
    ["SHOPPING", /\b(?:independent shops?|markets?)\b/],
    ["RELIGIOUS", /\b(?:churches?|sacred|religious)\b/],
    ["AREA", /\b(?:neighbou?rhoods?|areas?|historic(?:al)? locations?|(?:nice|historic|interesting|unusual|local) streets?)\b/],
  ];
  for (const [category, pattern] of categoryPatterns) if (pattern.test(text)) result.categories.push(category);
  if (result.categories.length === 1 && result.categories[0] === "SHOPPING" && /\bmarkets\b/.test(text)) {
    result.marketFocus = true;
    result.insights.push("market-led day");
  }
  const excludesAllMuseums = /\b(?:no|without|exclude|excluding|avoid|avoiding)\s+(?:any\s+)?museums?\b/.test(text);
  if (excludesAllMuseums) {
    result.excludeMuseums = true;
    result.categories = result.categories.filter((category) => category !== "MUSEUM");
  }
  const mainlyOutdoors = /\b(?:mainly|mostly|predominantly|largely)\s+(?:outdoor|outdoors|outside)\b/.test(text);
  if (/\b(?:without|no|avoid|avoiding)\s+(?:anything\s+)?(?:indoor|indoors|inside)\b|\b(?:outdoor|outside)\s+only\b/.test(text)) {
    result.outdoorOnly = true;
    result.insights.push("outdoors only");
  } else if (mainlyOutdoors) {
    result.outdoorPreference = true;
    result.insights.push("mainly outdoors");
  }
  if (/\b(?:not(?: too)? crowded|uncrowded|avoid(?:ing)? crowds?|away from crowds?|non[- ]touristic|non[- ]touristy)\b/.test(text)) {
    result.crowdSensitive = true;
    result.insights.push("lower-crowd places");
  }
  if (/\b(?:either\s+)?(?:a\s+)?(?:saturday\s+(?:or|\/)\s+(?:a\s+)?sunday|sunday\s+(?:or|\/)\s+(?:a\s+)?saturday)\b/.test(text)) {
    result.weekendFlexible = true;
    result.insights.push("Saturday or Sunday");
  }
  if (mainlyOutdoors && /\b(?:artistic|art|galleries?|exhibitions?|museums?)\b/.test(text)) result.needsIndoorClarification = true;
  if (/\b(?:no specific|no fixed|without a specific|without a fixed)\s+(?:final\s+)?(?:destination|finish|ending|end point)\b/.test(text)) {
    result.openEnded = true;
    result.insights.push("no fixed finish");
  }
  if (result.categories.length) result.insights.push(result.categories.map((category) => CATEGORY_LABELS[category]).join(", "));
  if (/\b(?:quirky|odd|unusual|uncommon|curious|hidden)\b/.test(text)) result.moods.push("unexpected");
  if (/\b(?:parks?|gardens?|green)\b/.test(text)) result.moods.push("green");
  if (/\b(?:local|neighbou?rhood)\b/.test(text)) result.moods.push("local");
  if (/\b(?:quiet|peaceful|calm)\b/.test(text)) result.moods.push("quiet");
  if (/\b(?:autumn|autumnal)\b/.test(text)) {
    result.season = "autumn";
    result.moods.push("atmospheric", "beautiful", "green");
    result.insights.push("autumn character");
  }
  if (/\b(?:wow|impress(?:ed|ive|ing)?|spectacular|striking|memorable|dramatic)\b/.test(text)) {
    result.moods.push("beautiful", "unexpected", "atmospheric", "weird");
    result.impact = "wow";
    result.insights.push("high-impact / wow places");
  }
  if (/already visited|been to london|returning|major destinations|major sights/.test(text)) {
    result.familiarity = "returning";
    result.insights.push("returning visitor");
  }
  if (excludesAllMuseums) {
    result.insights.push("no museums");
  } else if (/\bno\s+(?:big|major|large)\s+museums?\b|avoid\s+(?:big|major|large)\s+museums?|museums?[^.]{0,35}\b(?:not|no)\s+(?:the\s+)?(?:big|major|large)\s+ones?\b/.test(text)) {
    result.noBigMuseums = true;
    result.categories = unique([...result.categories, "MUSEUM"]);
    result.insights.push("no large museums");
  }
  if (/(?:avoid|avoiding)[^.]{0,45}(?:piccadilly|oxford st(?:reet)?)/.test(text)) {
    result.avoidCore = true;
    result.insights.push("avoid Piccadilly / Oxford Street core");
  }
  if (/\b(?:walking|walk)\b/.test(text) && /\b(?:tube|underground|public transport(?:ation)?)\b/.test(text)) {
    result.transport = "mixed";
    result.insights.push("walking + Tube");
  } else if (/\b(?:tube|underground|public transport(?:ation)?)\b/.test(text)) {
    result.transport = "transit";
    result.insights.push("public transport");
  } else if (/\b(?:walking|walk)\b/.test(text)) {
    result.transport = "walking";
    result.insights.push("mostly walking");
  }
  if (/\b(?:very early|start early|early morning)\b/.test(text)) {
    result.startTime = "08:00";
    result.insights.push("early start");
  }
  if (/\bafter dinner\b|\bfull days?\b/.test(text)) {
    result.endTime = "20:30";
    result.pace = "full";
    result.insights.push("full day");
  }
  return { ...result, categories: unique(result.categories), moods: unique(result.moods), insights: unique(result.insights) };
}

export function buildPlan(places, rawInput) {
  const input = normalizeInput(rawInput);
  const warnings = [];
  const eligiblePlaces = places.filter((place) => eligible(place, input));
  const basePool = dedupeCandidates(eligiblePlaces);
  if (basePool.length < eligiblePlaces.length) {
    warnings.push(`${eligiblePlaces.length - basePool.length} duplicate catalogue ${eligiblePlaces.length - basePool.length === 1 ? "record was" : "records were"} consolidated before planning.`);
  }
  if (!basePool.length) return { days: [], warnings: ["No published places match these filters yet."], input };
  const used = new Set();
  const mustHaves = resolveMustHaves(places, input.mustHaves, warnings);
  const days = [];
  for (let index = 0; index < input.days; index += 1) {
    const date = addDays(input.startDate, index);
    const area = input.areas[index] || input.areas[0] || "ANY";
    const geoScopes = input.geoScopes.filter((scope) => scope.day === 0 || scope.day === index + 1);
    const excludedGeoScopes = input.excludeGeoScopes.filter((scope) => scope.day === 0 || scope.day === index + 1);
    const dailyMustHaves = mustHaves.filter((place) => !used.has(place.id)
      && (area === "ANY" || areaFit(place, area)) && geoScopes.every((scope) => geographyFit(place, scope)));
    let pool = basePool.filter((place) => !used.has(place.id) && availabilityForDate(place, date).status !== "closed");
    if (excludedGeoScopes.length) pool = pool.filter((place) => excludedGeoScopes.every((scope) => !geographyFit(place, scope)));
    const areaPool = pool.filter((place) => area === "ANY" || areaFit(place, area));
    if (area !== "ANY") {
      pool = areaPool;
      if (areaPool.length < Math.min(3, PACE_STOPS[input.pace])) {
        warnings.push(`Day ${index + 1} has only ${areaPool.length} catalogue places inside the requested area; the planner will not substitute places elsewhere in London.`);
      }
    }
    if (geoScopes.length) {
      const geographicPool = pool.filter((place) => geoScopes.every((scope) => geographyFit(place, scope)));
      pool = geographicPool;
      if (geographicPool.length < Math.min(3, PACE_STOPS[input.pace])) {
        const requested = geoScopes.map((scope) => scopeLabel(scope)).join(" and ");
        warnings.push(`Day ${index + 1} has only ${geographicPool.length} catalogue ${geographicPool.length === 1 ? "place" : "places"} ${requested}; the planner will not substitute another part of London.`);
      }
    }
    if (input.routeStart && input.routeEnd) {
      const corridorPool = pool.filter((place) => routeFit(place, input));
      pool = corridorPool;
      if (corridorPool.length < Math.min(3, PACE_STOPS[input.pace])) {
        warnings.push(`Day ${index + 1} has only ${corridorPool.length} catalogue places inside the requested route corridor; the planner will not add unrelated detours.`);
      }
    }
    if (input.marketFocus) {
      const marketPool = pool.filter((place) => marketExperience(place) && marketDayCompatible(place, date));
      pool = marketPool;
      if (marketPool.length < Math.min(3, PACE_STOPS[input.pace])) {
        warnings.push(`Day ${index + 1} has only ${marketPool.length} market ${marketPool.length === 1 ? "experience" : "experiences"} compatible with the selected date; the planner will not replace them with unrelated places.`);
      }
    }
    if (input.experience.strictCategory && input.primaryCategory) {
      const categoryPool = pool.filter((place) => place.category === input.primaryCategory);
      pool = categoryPool;
      if (categoryPool.length < Math.min(3, PACE_STOPS[input.pace])) {
        warnings.push(`Day ${index + 1} has only ${categoryPool.length} catalogue ${CATEGORY_LABELS[input.primaryCategory]?.toLowerCase() || "matching places"} within the requested geography.`);
      }
    }
    if (input.experience.strictConcept && input.experience.semanticTerms.length) {
      const conceptPool = pool.filter((place) => semanticFit(place, input.experience.semanticTerms));
      pool = conceptPool;
      if (conceptPool.length < Math.min(3, PACE_STOPS[input.pace])) {
        warnings.push(`Day ${index + 1} has only ${conceptPool.length} catalogue ${input.experience.label || "concept-matching"} ${conceptPool.length === 1 ? "place" : "places"} in scope.`);
      }
    }
    const selected = selectDay(pool, dailyMustHaves, input, area, date, used);
    if (!selected.length) {
      warnings.push(`Day ${index + 1} has no suitable published stops.`);
      continue;
    }
    const schedule = scheduleDay(selected, input, date);
    const scheduled = schedule.stops;
    scheduled.forEach((stop) => used.add(stop.place.id));
    if (schedule.omitted.length) {
      warnings.push(`Day ${index + 1} omits ${schedule.omitted.length} selected ${schedule.omitted.length === 1 ? "place" : "places"} that cannot fit the opening window or available day.`);
    }
    if (!scheduled.length) {
      warnings.push(`Day ${index + 1} has no stops that fit the selected times.`);
      continue;
    }
    days.push({
      dayNumber: index + 1,
      date,
      area,
      areaLabel: geoScopes.length ? geoScopes.map((scope) => scope.label).join(" · ") : AREA_OPTIONS[area]?.label || AREA_OPTIONS.ANY.label,
      routeLabel: routeLabel(input),
      routeStart: input.routeStart,
      routeEnd: input.routeEnd,
      destinationArrival: schedule.destinationArrival,
      destinationTravelMinutes: schedule.destinationTravelMinutes,
      destinationLegMode: schedule.destinationLegMode,
      stops: scheduled,
      routeUrl: dayRouteUrl(scheduled, input.transport, input.routeStart, input.routeEnd),
      provisionalCount: scheduled.filter((stop) => stop.availability.status === "check").length,
    });
  }
  if (days.some((day) => day.provisionalCount)) {
    warnings.push("Some stops have incomplete or unverified access details. Use each validation link before travelling.");
  }
  const caveatedStops = days.flatMap((day) => day.stops).filter((stop) => stop.place.planning?.caveats?.length).length;
  if (caveatedStops) {
    warnings.push(`${caveatedStops} ${caveatedStops === 1 ? "stop is" : "stops are"} included as provisional catalogue leads with explicit caveats.`);
  }
  return { days, warnings: unique(warnings), input, candidateCount: basePool.length };
}

export function availabilityForDate(place, date) {
  const planning = place.planning || {};
  if (planning.accessType === "PRIVATE_NO_PUBLIC_ACCESS") return { status: "check", label: "Exterior only — no public access confirmed" };
  if (["APPOINTMENT_ONLY", "EVENT_ONLY", "CUSTOMER_ONLY"].includes(planning.accessType) || planning.bookingMode === "REQUIRED") {
    return { status: "check", label: bookingLabel(planning) };
  }
  if (planning.hoursStatus === "NOT_APPLICABLE" || EARLY_ACCESS.has(planning.accessType)) {
    return { status: "available", label: planning.accessType === "EXTERIOR_ONLY" ? "Exterior stop" : "Open access" };
  }
  const exception = (planning.openingExceptions || []).find((entry) => entry.date === date);
  if (exception?.isClosed) return { status: "closed", label: exception.note || "Closed on this date" };
  if (exception?.opensAt && exception?.closesAt) return { status: "available", label: `${exception.opensAt}–${exception.closesAt}`, opensAt: exception.opensAt, closesAt: exception.closesAt };
  const weekday = isoDate(date).getUTCDay();
  const periods = (planning.openingPeriods || []).filter((period) => Number(period.dayOfWeek) === weekday && validOn(period, date));
  if (periods.some((period) => Number(period.closed))) return { status: "closed", label: "Closed" };
  const usable = periods.find((period) => period.opensAt && period.closesAt);
  if (usable) return { status: "available", label: `${usable.opensAt}–${usable.closesAt}`, opensAt: usable.opensAt, closesAt: usable.closesAt };
  if (planning.hoursStatus === "VERIFIED" && periods.length === 0) return { status: "closed", label: "Not listed as open" };
  return { status: "check", label: bookingLabel(planning) };
}

export function dayRouteUrl(stops, _transport = "walking", routeStart = null, routeEnd = null) {
  if (!stops?.length) return "";
  if (stops.length === 1 && !routeStart && !routeEnd) return stops[0].place.mapUrl;
  const stopPoints = stops.map((stop) => ({ lat: stop.place.lat, lon: stop.place.lon }));
  const start = routeStart || stopPoints[0];
  const end = routeEnd || stopPoints.at(-1);
  const points = [start, ...stopPoints, end].filter((point, index, values) => index === 0
    || point.lat !== values[index - 1].lat || point.lon !== values[index - 1].lon);
  return buildGoogleMapsUrl({
    start: points[0], end: points.at(-1), stops: points.slice(1, -1), travelMode: "walking",
  });
}

function normalizeInput(input) {
  const startDate = /^\d{4}-\d{2}-\d{2}$/.test(input.startDate || "") ? input.startDate : new Date().toISOString().slice(0, 10);
  return {
    days: Number(input.days) === 1 ? 1 : 2,
    startDate,
    startTime: /^\d{2}:\d{2}$/.test(input.startTime || "") ? input.startTime : "09:00",
    endTime: /^\d{2}:\d{2}$/.test(input.endTime || "") ? input.endTime : "19:00",
    pace: PACE_STOPS[input.pace] ? input.pace : "balanced",
    transport: ["walking", "mixed", "transit"].includes(input.transport) ? input.transport : "walking",
    familiarity: input.familiarity === "first" ? "first" : "returning",
    areas: (input.areas || ["ANY", "ANY"]).map((area) => AREA_OPTIONS[area] ? area : "ANY").slice(0, 2),
    categories: unique(input.categories || []), moods: unique(input.moods || []),
    categoryPreferences: normalizeCategoryPreferences(input.categoryPreferences),
    excludedCategories: unique(input.excludedCategories || []),
    primaryCategory: CATEGORY_LABELS[input.primaryCategory] ? input.primaryCategory : "",
    experience: normalizeExperience(input.experience),
    geoScopes: (input.geoScopes || []).map(normalizeGeoScope).filter(Boolean),
    excludeGeoScopes: (input.excludeGeoScopes || []).map(normalizeGeoScope).filter(Boolean),
    impact: input.impact === "wow" ? "wow" : "",
    season: input.season === "autumn" ? "autumn" : "",
    routeStart: normalizePoint(input.routeStart), routeEnd: normalizePoint(input.routeEnd),
    avoidCore: Boolean(input.avoidCore), noBigMuseums: Boolean(input.noBigMuseums), excludeMuseums: Boolean(input.excludeMuseums),
    outdoorOnly: Boolean(input.outdoorOnly), outdoorPreference: Boolean(input.outdoorPreference), crowdSensitive: Boolean(input.crowdSensitive),
    marketFocus: Boolean(input.marketFocus), weekendFlexible: Boolean(input.weekendFlexible),
    mustHaves: splitTerms(input.mustHaves), avoidTerms: splitTerms(input.avoidTerms),
  };
}

function eligible(place, input) {
  if (!Number.isFinite(Number(place.lat)) || !Number.isFinite(Number(place.lon)) || !place.name) return false;
  const searchable = normalText(`${place.name} ${place.description} ${place.hook}`);
  if (input.avoidTerms.some((term) => searchable.includes(normalText(term)))) return false;
  if (input.avoidCore && inWestEndCore(place)) return false;
  if (input.noBigMuseums && place.category === "MUSEUM" && Number(place.touristIntensity || 0) >= 55) return false;
  if (input.excludeMuseums && place.category === "MUSEUM") return false;
  if (input.excludedCategories.includes(place.category)) return false;
  if (input.outdoorOnly && !outdoorFit(place)) return false;
  return true;
}

function selectDay(pool, locked, input, area, date, used) {
  if (input.routeStart && input.routeEnd) return selectRouteDay(pool, locked, input, area, date, used);
  if (input.routeStart || input.routeEnd) return selectAnchoredDay(pool, locked, input, area, date, used);
  const desired = PACE_STOPS[input.pace];
  const selected = seedRequiredCategories(pool, uniquePlaces(locked).slice(0, desired), input, area, date, used, desired);
  const clusterRadius = input.experience.compact ? (input.transport === "walking" ? 3 : 5)
    : input.marketFocus ? 30 : input.transport === "walking" ? 4 : input.transport === "transit" ? 12 : 8;
  const daySeed = selected[0] || [...pool].sort((a, b) => seedScore(b, pool, input, area, date, clusterRadius) - seedScore(a, pool, input, area, date, clusterRadius))[0];
  if (daySeed && !selected.some((place) => place.id === daySeed.id)) selected.push(daySeed);
  while (selected.length < desired) {
    const anchor = centroid(selected);
    const next = pool.filter((place) => !used.has(place.id) && !selected.some((chosen) => chosen.id === place.id) && underCategoryMaximum(place, selected, input)
        && (!daySeed || haversineKm(daySeed.lat, daySeed.lon, place.lat, place.lon) <= clusterRadius))
      .sort((a, b) => scoreForCluster(b, anchor, selected, input, area, date) - scoreForCluster(a, anchor, selected, input, area, date))[0];
    if (!next) break;
    selected.push(next);
  }
  return routeOrder(selected, input.startTime, input, date);
}

function selectAnchoredDay(pool, locked, input, area, date, used) {
  const desired = PACE_STOPS[input.pace];
  const selected = seedRequiredCategories(pool, uniquePlaces(locked).slice(0, desired), input, area, date, used, desired);
  const anchor = input.routeStart || input.routeEnd;
  const localRadius = input.transport === "walking" ? 4 : input.transport === "transit" ? 12 : 8;
  const nearby = pool.filter((place) => haversineKm(anchor.lat, anchor.lon, place.lat, place.lon) <= localRadius);
  const candidates = nearby.length >= Math.min(3, desired) ? nearby : pool;
  while (selected.length < desired) {
    const cluster = selected.length ? centroid(selected) : anchor;
    const next = candidates.filter((place) => !used.has(place.id) && !selected.some((chosen) => chosen.id === place.id) && underCategoryMaximum(place, selected, input))
      .map((place) => {
        const anchorDistance = haversineKm(anchor.lat, anchor.lon, place.lat, place.lon);
        const clusterDistance = haversineKm(cluster.lat, cluster.lon, place.lat, place.lon);
        const repeats = categoryRepeatPenalty(place, selected, input);
        const distanceWeight = input.transport === "walking" ? 9 : input.transport === "transit" ? 3 : 5;
        return { place, score: scorePlace(place, input, area, date) - anchorDistance * distanceWeight - clusterDistance * 3 - repeats
          - indoorPreferencePenalty(place, selected, input) };
      })
      .sort((a, b) => b.score - a.score)[0]?.place;
    if (!next) break;
    selected.push(next);
  }
  return routeOrder(selected, input.startTime, input, date);
}

function selectRouteDay(pool, locked, input, area, date, used) {
  const desired = PACE_STOPS[input.pace];
  const selected = seedRequiredCategories(pool, uniquePlaces(locked).slice(0, desired), input, area, date, used, desired);
  for (let slot = selected.length; slot < desired; slot += 1) {
    const target = desired === 1 ? .5 : slot / (desired - 1);
    const next = pool.filter((place) => !used.has(place.id) && !selected.some((chosen) => chosen.id === place.id) && underCategoryMaximum(place, selected, input))
      .map((place) => {
        const route = routeMetrics(place, input.routeStart, input.routeEnd);
        const repeats = categoryRepeatPenalty(place, selected, input);
        return { place, score: scorePlace(place, input, area, date) - route.distanceKm * 9 - Math.abs(route.position - target) * 28 - repeats
          - indoorPreferencePenalty(place, selected, input) };
      })
      .sort((a, b) => b.score - a.score)[0]?.place;
    if (!next) break;
    selected.push(next);
  }
  return routeOrder(selected, input.startTime, input, date);
}

function seedScore(place, pool, input, area, date, radius) {
  const nearby = pool.filter((candidate) => candidate.id !== place.id && haversineKm(place.lat, place.lon, candidate.lat, candidate.lon) <= radius).length;
  return scorePlace(place, input, area, date) + Math.min(nearby, 8) * 3;
}

function scoreForCluster(place, anchor, selected, input, area, date) {
  const distancePenalty = anchor ? haversineKm(anchor.lat, anchor.lon, place.lat, place.lon) * (input.transport === "walking" ? 7 : 4) : 0;
  const categoryRepeat = categoryRepeatPenalty(place, selected, input);
  return scorePlace(place, input, area, date) - distancePenalty - categoryRepeat - indoorPreferencePenalty(place, selected, input);
}

function scorePlace(place, input, area, date) {
  let score = place.planning?.recommendationTier === "VERIFIED" ? 34 : place.planning?.plannerReady ? 28 : 8;
  score += place.planning?.dataConfidence === "HIGH" ? 14 : place.planning?.dataConfidence === "MEDIUM" ? 8 : 0;
  const categoryRule = input.categoryPreferences.find((item) => item.category === place.category);
  if (categoryRule) score += ({ PRIMARY: 48, REQUIRED: 38, PREFERRED: 26, OPTIONAL: 10 }[categoryRule.strength] || 0);
  else if (input.categories.includes(place.category)) score += 26;
  if (input.experience.semanticTerms.length) {
    const matches = semanticMatches(place, input.experience.semanticTerms);
    score += matches * (input.experience.strictConcept ? 18 : 8);
  }
  for (const mood of input.moods) score += Number(place.moods?.[mood] || 0) * 5;
  if (input.impact === "wow") {
    const impact = ["beautiful", "unexpected", "atmospheric", "weird"].reduce((sum, mood) => sum + Number(place.moods?.[mood] || 0), 0);
    score += impact * 2;
  }
  if (input.season === "autumn") {
    const searchable = normalText(`${place.name} ${place.description} ${place.hook} ${place.bestTime}`);
    score += place.category === "PARK" ? 14 : 0;
    score += Number(place.moods?.atmospheric || 0) * 3 + Number(place.moods?.beautiful || 0) * 2;
    if (/\b(?:autumn|autumnal|foliage|leaf colour|seasonal colour)\b/.test(searchable)) score += 18;
  }
  if (input.outdoorPreference && outdoorFit(place)) score += 18;
  if (input.marketFocus && marketExperience(place)) score += place.category === "SHOPPING" ? 30 : 56;
  if (input.crowdSensitive) score += Math.max(0, 70 - Number(place.touristIntensity || 0)) * .7;
  if (input.familiarity === "returning") score += Math.max(0, 55 - Number(place.touristIntensity || 0)) / 3;
  if (area !== "ANY") score -= haversineKm(place.lat, place.lon, AREA_OPTIONS[area].center.lat, AREA_OPTIONS[area].center.lon) * 1.8;
  if (availabilityForDate(place, date).status === "available") score += 8;
  return score;
}

function routeOrder(places, startTime, input = {}, date = input.startDate) {
  if (places.length < 2) return places;
  if (input.routeStart && input.routeEnd) {
    return [...places].sort((a, b) => routeMetrics(a, input.routeStart, input.routeEnd).position
      - routeMetrics(b, input.routeStart, input.routeEnd).position);
  }
  if (input.routeStart) return nearestNeighborOrder(places, input.routeStart);
  if (input.routeEnd) return nearestNeighborOrder(places, input.routeEnd).reverse();
  const early = timeToMinutes(startTime) < 600;
  const first = [...places].sort((a, b) => {
    const closingDifference = closingMinute(a, date) - closingMinute(b, date);
    if (closingDifference) return closingDifference;
    if (early) {
      const accessDifference = Number(EARLY_ACCESS.has(b.planning?.accessType)) - Number(EARLY_ACCESS.has(a.planning?.accessType));
      if (accessDifference) return accessDifference;
    }
    return a.lon - b.lon;
  })[0];
  const remaining = places.filter((place) => place.id !== first.id);
  const ordered = [first];
  while (remaining.length) {
    const previous = ordered.at(-1);
    remaining.sort((a, b) => haversineKm(previous.lat, previous.lon, a.lat, a.lon) - haversineKm(previous.lat, previous.lon, b.lat, b.lon));
    ordered.push(remaining.shift());
  }
  return ordered;
}

function closingMinute(place, date) {
  const closesAt = availabilityForDate(place, date).closesAt;
  return closesAt ? timeToMinutes(closesAt) : Number.POSITIVE_INFINITY;
}

function nearestNeighborOrder(places, origin) {
  const remaining = [...places];
  const ordered = [];
  let previous = origin;
  while (remaining.length) {
    remaining.sort((a, b) => haversineKm(previous.lat, previous.lon, a.lat, a.lon)
      - haversineKm(previous.lat, previous.lon, b.lat, b.lon));
    const next = remaining.shift();
    ordered.push(next);
    previous = next;
  }
  return ordered;
}

function scheduleDay(places, input, date) {
  let cursor = timeToMinutes(input.startTime);
  const end = timeToMinutes(input.endTime);
  const result = [];
  const omitted = [];
  let lunchTaken = false;
  for (let index = 0; index < places.length; index += 1) {
    const place = places[index];
    let travelMinutes = 0;
    let legMode = "start";
    const previous = result.at(-1)?.place || (result.length === 0 ? input.routeStart : null);
    if (previous) {
      const leg = estimateTravel(previous, place, input.transport);
      travelMinutes = leg.minutes;
      legMode = leg.mode;
    }
    let proposedStart = cursor + travelMinutes;
    const availability = availabilityForDate(place, date);
    if (availability.opensAt) proposedStart = Math.max(proposedStart, timeToMinutes(availability.opensAt));
    if (!EARLY_ACCESS.has(place.planning?.accessType)) proposedStart = Math.max(proposedStart, 600);
    const duration = recommendedVisitMinutes(place);
    const proposedEnd = proposedStart + duration;
    const closesAt = availability.closesAt ? timeToMinutes(availability.closesAt) : null;
    const finalTravel = input.routeEnd ? estimateTravel(place, input.routeEnd, input.transport).minutes : 0;
    if (proposedEnd + finalTravel > end || (closesAt !== null && proposedEnd > closesAt)) {
      omitted.push(place);
      continue;
    }
    const legUrl = previous && legMode === "Tube / bus" ? buildGoogleMapsUrl({ start: previous, end: place, travelMode: "transit" }) : "";
    result.push({ place, startTime: minutesToTime(proposedStart), endTime: minutesToTime(proposedEnd), travelMinutes, legMode, legUrl, availability, visitMinutes: duration });
    const lunchDue = !lunchTaken && proposedEnd >= 12 * 60 && proposedEnd <= 14 * 60;
    cursor = proposedEnd + (lunchDue ? 45 : 10);
    if (lunchDue) lunchTaken = true;
  }
  const lastPlace = result.at(-1)?.place;
  const destinationLeg = lastPlace && input.routeEnd ? estimateTravel(lastPlace, input.routeEnd, input.transport) : null;
  return {
    stops: result,
    omitted,
    destinationArrival: destinationLeg ? minutesToTime(timeToMinutes(result.at(-1).endTime) + destinationLeg.minutes) : null,
    destinationTravelMinutes: destinationLeg?.minutes || 0,
    destinationLegMode: destinationLeg?.mode || "",
  };
}

export function recommendedVisitMinutes(place) {
  const accessType = place.planning?.accessType;
  const configured = clamp(Number(place.visitMinutes || 0), 0, 180);
  if (place.visitMode === "PASS_BY" || accessType === "EXTERIOR_ONLY") return Math.max(configured, 20);
  if (place.category === "MUSEUM") return Math.max(configured, 60);
  if (place.category === "BUILDING") {
    return Math.max(configured, ["TIMETABLED", "BOOKING_REQUIRED", "APPOINTMENT_ONLY", "EVENT_ONLY"].includes(accessType) ? 60 : 30);
  }
  if (place.category === "PARK" || place.category === "AREA") return Math.max(configured, 45);
  if (place.category === "SHOPPING") return Math.max(configured, 45);
  if (place.category === "RELIGIOUS") return Math.max(configured, 35);
  if (place.category === "VIEWPOINT") return Math.max(configured, 25);
  return Math.max(configured, ["TIMETABLED", "BOOKING_REQUIRED", "APPOINTMENT_ONLY", "EVENT_ONLY"].includes(accessType) ? 45 : 25);
}

export function estimateTravel(from, to, transport = "mixed") {
  const distanceKm = haversineKm(from.lat, from.lon, to.lat, to.lon);
  const transitLeg = transport === "transit" || (transport === "mixed" && distanceKm > 2.2);
  return transitLeg
    ? { minutes: Math.ceil(12 + distanceKm * 4), mode: "Tube / bus", distanceKm }
    : { minutes: Math.ceil(5 + distanceKm * 15), mode: "Walk", distanceKm };
}

function resolveMustHaves(places, terms, warnings) {
  return terms.flatMap((term) => {
    const needle = normalText(term);
    const exact = places.find((place) => normalText(place.name) === needle);
    const partial = exact || places.find((place) => normalText(place.name).includes(needle));
    if (!partial) warnings.push(`Must-have “${term}” was not found in the current catalogue.`);
    return partial ? [partial] : [];
  });
}

function areaFit(place, area) {
  if (area === "WEST_HYDE_PARK") return place.lon < -0.165;
  if (area === "WEST_SOUTH_KENSINGTON") return place.lon < -0.17;
  if (area === "EAST_HOLBORN") return place.lon > -0.118;
  if (area === "NORTH") return place.lat > 51.535;
  if (area === "SOUTH" || area === "SOUTH_THAMES") return southOfThames(place);
  if (area === "EAST") return place.lon > -0.055;
  if (area === "WEST") return place.lon < -0.16;
  if (area === "CENTRAL") return haversineKm(place.lat, place.lon, 51.514, -0.12) < 5;
  return true;
}

function routeFit(place, input) {
  if (!input.routeStart || !input.routeEnd) return true;
  const route = routeMetrics(place, input.routeStart, input.routeEnd);
  const radius = input.transport === "walking" ? 2.5 : 3.5;
  return route.rawPosition >= -.05 && route.rawPosition <= 1.05 && route.distanceKm <= radius;
}

export function routeMetrics(place, start, end) {
  const latitude = (Number(start.lat) + Number(end.lat)) / 2;
  const cos = Math.cos(latitude * Math.PI / 180);
  const dx = (Number(end.lon) - Number(start.lon)) * 111.1 * cos;
  const dy = (Number(end.lat) - Number(start.lat)) * 111.1;
  const px = (Number(place.lon) - Number(start.lon)) * 111.1 * cos;
  const py = (Number(place.lat) - Number(start.lat)) * 111.1;
  const lengthSquared = dx * dx + dy * dy || 1;
  const rawPosition = (px * dx + py * dy) / lengthSquared;
  const position = clamp(rawPosition, 0, 1);
  return { rawPosition, position, distanceKm: Math.hypot(px - position * dx, py - position * dy) };
}

function southOfThames(place) {
  const river = [
    [-.38, 51.455], [-.31, 51.462], [-.25, 51.474], [-.215, 51.467], [-.188, 51.465],
    [-.177, 51.473], [-.166, 51.482], [-.15, 51.484], [-.135, 51.488], [-.123, 51.496],
    [-.121, 51.501], [-.115, 51.507], [-.105, 51.509], [-.075, 51.507],
    [-.055, 51.505], [-.025, 51.502], [0, 51.500], [.04, 51.493], [.09, 51.488], [.18, 51.490],
  ];
  const lon = Number(place.lon);
  const next = river.findIndex(([riverLon]) => riverLon >= lon);
  if (next <= 0) return Number(place.lat) < river[0][1];
  if (next < 0) return Number(place.lat) < river.at(-1)[1];
  const [leftLon, leftLat] = river[next - 1];
  const [rightLon, rightLat] = river[next];
  const ratio = (lon - leftLon) / (rightLon - leftLon);
  return Number(place.lat) < leftLat + (rightLat - leftLat) * ratio;
}

function routeLabel(input) {
  if (!input.routeStart && !input.routeEnd) return "";
  if (input.routeStart && input.routeEnd) return `${input.routeStart.label} → ${input.routeEnd.label}`;
  if (input.routeStart) return `From ${input.routeStart.label}`;
  return `Finish at ${input.routeEnd.label}`;
}

function outdoorFit(place) {
  const planning = place.planning || {};
  const searchable = normalText(`${place.name} ${place.description} ${place.hook} ${place.accessNotes}`);
  if (planning.accessType === "EXTERIOR_ONLY") return true;
  if (/\b(?:indoor|inside|interior)\b/.test(searchable)) return false;
  if (planning.accessType === "ALWAYS_ACCESSIBLE") {
    return ["AREA", "PARK", "VIEWPOINT"].includes(place.category) || ["PASS_BY", "WALK"].includes(place.visitMode);
  }
  if (place.visitMode === "PASS_BY") return true;
  return place.category === "PARK" || (place.category === "SHOPPING" && /\bmarket\b/.test(searchable) && place.weatherFit === "DRY");
}

function indoorPreferencePenalty(place, selected, input) {
  if (!input.outdoorPreference || outdoorFit(place)) return 0;
  return selected.some((item) => !outdoorFit(item)) ? 80 : 8;
}

function marketExperience(place) {
  const name = normalText(place.name);
  const searchable = normalText(`${place.name} ${place.description} ${place.hook}`);
  if (place.category === "SHOPPING" && /\bmarket\b/.test(name)) return true;
  return place.category === "AREA" && /\b(?:regular markets?|market days?)\b/.test(searchable);
}

function marketDayCompatible(place, date) {
  const searchable = normalText(`${place.description} ${place.hook} ${place.accessNotes}`);
  const weekday = isoDate(date).getUTCDay();
  const saysSaturday = /\bsaturdays?\b/.test(searchable);
  const saysSunday = /\bsundays?\b/.test(searchable);
  if (saysSaturday && !saysSunday) return weekday === 6;
  if (saysSunday && !saysSaturday) return weekday === 0;
  return true;
}

function normalizeCategoryPreferences(value) {
  const allowedStrengths = new Set(["PRIMARY", "REQUIRED", "PREFERRED", "OPTIONAL", "EXCLUDED"]);
  const preferences = (Array.isArray(value) ? value : []).flatMap((item) => {
    const category = String(item?.category || "").toUpperCase();
    const strength = String(item?.strength || "").toUpperCase();
    if (!CATEGORY_LABELS[category] || !allowedStrengths.has(strength)) return [];
    const minStops = clamp(Math.trunc(Number(item.minStops) || 0), 0, 6);
    const maxStops = clamp(Math.trunc(Number(item.maxStops) || 6), minStops, 6);
    return [{ category, strength, minStops, maxStops }];
  });
  return [...new Map(preferences.map((item) => [item.category, item])).values()];
}

function normalizeExperience(value) {
  const experience = value && typeof value === "object" ? value : {};
  return {
    label: String(experience.label || "").trim().slice(0, 160),
    semanticTerms: unique((Array.isArray(experience.semanticTerms) ? experience.semanticTerms : [])
      .map((term) => normalText(term).trim()).filter(Boolean)).slice(0, 10),
    strictCategory: Boolean(experience.strictCategory),
    strictConcept: Boolean(experience.strictConcept),
    compact: Boolean(experience.compact),
  };
}

function normalizeGeoScope(value) {
  const relations = new Set(["IN", "NEAR", "NORTH_OF", "SOUTH_OF", "EAST_OF", "WEST_OF"]);
  const relation = String(value?.relation || "").toUpperCase();
  const center = normalizePoint(value?.center);
  if (!relations.has(relation) || !center) return null;
  const bounds = value?.bounds && [value.bounds.south, value.bounds.north, value.bounds.west, value.bounds.east].every((item) => Number.isFinite(Number(item)))
    ? { south: Number(value.bounds.south), north: Number(value.bounds.north), west: Number(value.bounds.west), east: Number(value.bounds.east) }
    : null;
  return {
    day: clamp(Math.trunc(Number(value.day) || 0), 0, 2), relation, center, bounds,
    label: String(value.label || value.resolvedLabel || center.label).trim().slice(0, 160),
    radiusKm: clamp(Number(value.radiusKm) || 3, .5, 25), featureType: String(value.featureType || ""),
  };
}

function geographyFit(place, scope) {
  const lat = Number(place.lat); const lon = Number(place.lon);
  const distance = haversineKm(lat, lon, scope.center.lat, scope.center.lon);
  if (scope.relation === "NEAR") return distance <= scope.radiusKm;
  if (scope.relation === "IN") {
    if (!scope.bounds) return distance <= scope.radiusKm;
    const padding = Math.min(.018, Math.max(.003, scope.radiusKm / 111));
    return lat >= scope.bounds.south - padding && lat <= scope.bounds.north + padding
      && lon >= scope.bounds.west - padding && lon <= scope.bounds.east + padding;
  }
  if (distance > scope.radiusKm) return false;
  if (scope.relation === "NORTH_OF") return lat > scope.center.lat;
  if (scope.relation === "SOUTH_OF") return lat < scope.center.lat;
  if (scope.relation === "EAST_OF") return lon > scope.center.lon;
  if (scope.relation === "WEST_OF") return lon < scope.center.lon;
  return true;
}

function scopeLabel(scope) {
  const relation = ({ IN: "in", NEAR: "around", NORTH_OF: "north of", SOUTH_OF: "south of", EAST_OF: "east of", WEST_OF: "west of" })[scope.relation] || "near";
  return `${relation} ${scope.label}`;
}

function semanticMatches(place, terms) {
  const searchable = normalText(`${place.name} ${place.description} ${place.hook} ${place.accessNotes}`);
  return terms.reduce((count, term) => count + Number(termVariants(term).some((variant) => searchable.includes(variant))), 0);
}

function semanticFit(place, terms) { return semanticMatches(place, terms) > 0; }

function termVariants(value) {
  const term = normalText(value).trim();
  if (!term) return [];
  const variants = [term];
  if (term.endsWith("ies") && term.length > 4) variants.push(`${term.slice(0, -3)}y`);
  if (term.endsWith("es") && term.length > 3) variants.push(term.slice(0, -2));
  if (term.endsWith("s") && term.length > 2) variants.push(term.slice(0, -1));
  return unique(variants.filter((variant) => variant.length > 2));
}

function dedupeCandidates(places) {
  const selected = new Map();
  for (const place of places) {
    const key = `${normalText(place.name).trim()}|${Number(place.lat).toFixed(3)}|${Number(place.lon).toFixed(3)}`;
    const current = selected.get(key);
    if (!current || evidenceRank(place) > evidenceRank(current)) selected.set(key, place);
  }
  return [...selected.values()];
}

function evidenceRank(place) {
  const planning = place.planning || {};
  return Number(planning.recommendationTier === "VERIFIED") * 100
    + ({ HIGH: 30, MEDIUM: 20, LOW: 10 }[planning.dataConfidence] || 0)
    + Number(planning.descriptionQuality === "SPECIFIC") * 5
    + Number(Boolean(place.officialUrl || planning.sourceUrl));
}

function categoryRepeatPenalty(place, selected, input) {
  const repeats = selected.filter((item) => item.category === place.category).length;
  if (place.category === input.primaryCategory) return 0;
  return repeats * 8;
}

function underCategoryMaximum(place, selected, input) {
  const rule = input.categoryPreferences.find((item) => item.category === place.category);
  if (!rule) return true;
  return selected.filter((item) => item.category === place.category).length < rule.maxStops;
}

function seedRequiredCategories(pool, initial, input, area, date, used, desired) {
  const selected = [...initial];
  const rules = input.categoryPreferences.filter((item) => ["PRIMARY", "REQUIRED"].includes(item.strength) && item.minStops > 0);
  for (const rule of rules) {
    while (selected.length < desired && selected.filter((place) => place.category === rule.category).length < rule.minStops) {
      const candidate = pool.filter((place) => place.category === rule.category && !used.has(place.id)
          && !selected.some((chosen) => chosen.id === place.id))
        .sort((a, b) => scorePlace(b, input, area, date) - scorePlace(a, input, area, date))[0];
      if (!candidate) break;
      selected.push(candidate);
    }
  }
  return selected;
}

function normalizePoint(value) {
  const lat = Number(value?.lat);
  const lon = Number(value?.lon);
  if (!Number.isFinite(lat) || !Number.isFinite(lon)) return null;
  return { label: String(value.label || "Route point"), lat, lon };
}

function extractRouteEndpoints(value) {
  const source = String(value || "").replace(/\s+/g, " ").trim();
  const startMatch = source.match(/\b(?:starting|start|begin|beginning)(?:\s+anywhere)?\s+(?:from|at|in|near|around|by)\s+([^,.;]+?)(?=\s+(?:and|then)\s+(?:ending|end|finish|finishing)\b|[.,;]|$)/i);
  const endMatch = source.match(/\b(?:ending|end|finish|finishing)\s+(?:in|at|near|around|by)\s+([^,.;]+?)(?=\s+(?:using|use|with|while|without|no|just|avoiding|avoid|look|looking|i|we)\b|[.,;]|$)/i);
  const start = cleanPlacePhrase(startMatch?.[1]);
  const end = cleanPlacePhrase(endMatch?.[1]);
  if (start || end) return { start, end };

  // Only accept a compact from/to pair inside one punctuation-bounded clause.
  // This prevents a later phrase such as "happy to jump on the Tube" from
  // being mistaken for a destination separator.
  const fromTo = source.match(/(?:^|[.,;]\s*|\b(?:day|route|itinerary)\s+)from\s+([^,.;]{1,80}?)\s+to\s+([^,.;]{1,80}?)(?=\s+(?:using|use|with|while|without|no|just|avoiding|avoid|look|looking|i|we)\b|[.,;]|$)/i);
  if (!fromTo) return {};
  return { start: cleanPlacePhrase(fromTo[1]), end: cleanPlacePhrase(fromTo[2]) };
}

function cleanPlacePhrase(value) {
  const words = String(value || "").trim().split(/\s+/).filter(Boolean);
  if (!words.length || words.length > 10 || /\b(?:starting|ending|finishing|using|walking|transport|tube)\b/i.test(words.join(" "))) return "";
  return words.map((word) => word.charAt(0).toUpperCase() + word.slice(1)).join(" ");
}

function inWestEndCore(place) {
  return place.lat >= 51.505 && place.lat <= 51.526 && place.lon >= -0.185 && place.lon <= -0.105;
}

function bookingLabel(planning) {
  if (planning.bookingMode === "REQUIRED") return "Booking and hours: check official source";
  if (planning.accessType === "APPOINTMENT_ONLY") return "Appointment required: check official source";
  if (planning.accessType === "EVENT_ONLY") return "Event dates/times: check official source";
  if (planning.accessType === "CUSTOMER_ONLY") return "Customer or ticket-holder access: check official source";
  return "Opening times: check official source";
}

function validOn(period, date) {
  return (!period.validFrom || date >= period.validFrom) && (!period.validTo || date <= period.validTo);
}

function centroid(places) {
  if (!places.length) return null;
  return { lat: places.reduce((sum, place) => sum + Number(place.lat), 0) / places.length, lon: places.reduce((sum, place) => sum + Number(place.lon), 0) / places.length };
}

function haversineKm(lat1, lon1, lat2, lon2) {
  const rad = (value) => value * Math.PI / 180;
  const dLat = rad(Number(lat2) - Number(lat1));
  const dLon = rad(Number(lon2) - Number(lon1));
  const a = Math.sin(dLat / 2) ** 2 + Math.cos(rad(Number(lat1))) * Math.cos(rad(Number(lat2))) * Math.sin(dLon / 2) ** 2;
  return 6371 * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}

function addDays(date, count) { const value = isoDate(date); value.setUTCDate(value.getUTCDate() + count); return value.toISOString().slice(0, 10); }
function isoDate(value) { return new Date(`${value}T12:00:00Z`); }
function splitTerms(value) { return Array.isArray(value) ? value.filter(Boolean) : String(value || "").split(/[,;\n]/).map((term) => term.trim()).filter(Boolean); }
function timeToMinutes(value) { const [hours, minutes] = String(value).split(":").map(Number); return hours * 60 + minutes; }
function minutesToTime(value) { const safe = Math.max(0, Math.min(1439, value)); return `${String(Math.floor(safe / 60)).padStart(2, "0")}:${String(safe % 60).padStart(2, "0")}`; }
function normalText(value) { return String(value || "").normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase(); }
function unique(values) { return [...new Set(values)]; }
function uniquePlaces(values) { return [...new Map(values.map((value) => [value.id, value])).values()]; }
function clamp(value, min, max) { return Math.max(min, Math.min(max, value)); }
