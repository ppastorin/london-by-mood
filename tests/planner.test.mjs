import assert from "node:assert/strict";
import test from "node:test";

import { availabilityForDate, buildPlan, estimateTravel, interpretPrompt, recommendedVisitMinutes, routeMetrics } from "../public/planner/planner-core.js";

test("detailed prompt becomes a two-day west/east returning-visitor brief", () => {
  const result = interpretPrompt("I want to spend two full days during the week, one west of Hyde Park and the second east of Holborn. I like small museums, parks and quirky things. I have already visited all the major destinations as I have been to London 4 times. I like walking, but I am confident to jump on a tube. I usually start very early in the morning and go back to the hotel after dinner.");
  assert.equal(result.days, 2);
  assert.deepEqual(result.areas, ["WEST_HYDE_PARK", "EAST_HOLBORN"]);
  assert.deepEqual(result.categories.sort(), ["MUSEUM", "ODDITY", "PARK"]);
  assert.equal(result.familiarity, "returning");
  assert.equal(result.transport, "mixed");
  assert.equal(result.startTime, "08:00");
  assert.equal(result.endTime, "20:30");
});

test("short prompt captures the exclusions without requiring detailed prose", () => {
  const result = interpretPrompt("Recommend a two full days itinerary, avoiding the core areas around Piccadilly/Oxford St, no big museum, nice and uncommon places.");
  assert.equal(result.days, 2);
  assert.equal(result.avoidCore, true);
  assert.equal(result.noBigMuseums, true);
  assert.ok(result.categories.includes("MUSEUM"));
  assert.ok(result.categories.includes("ODDITY"));
});

test("a market-led weekend prompt stays distinct from a mixed itinerary with one market stop", () => {
  const mixed = interpretPrompt("One day only, east London, one interesting museum and a nice long walk looking for interesting buildings and possibly a stop in a local market");
  assert.deepEqual(mixed.categories.sort(), ["BUILDING", "MUSEUM", "SHOPPING"]);
  assert.equal(mixed.marketFocus, undefined);

  const focused = interpretPrompt("I want to spend one day going through the best, non-touristic markets in London. I can do it on a Saturday or a Sunday and I can take the tube between places.");
  assert.equal(focused.days, 1);
  assert.deepEqual(focused.categories, ["SHOPPING"]);
  assert.equal(focused.marketFocus, true);
  assert.equal(focused.weekendFlexible, true);
  assert.equal(focused.crowdSensitive, true);
  assert.equal(focused.transport, "transit");

  const places = [
    fixture("m1", "West Market", "SHOPPING", 51.50, -.22),
    fixture("m2", "Antique Market", "SHOPPING", 51.51, -.17),
    fixture("m3", "Local Market", "SHOPPING", 51.52, -.12),
    fixture("m4", "Food Market", "SHOPPING", 51.53, -.07),
    fixture("m5", "East Market", "SHOPPING", 51.54, -.02),
    fixture("odd", "Millennium Maze", "ODDITY", 51.50, -.25),
    fixture("park", "Nature Reserve", "PARK", 51.51, -.2),
  ];
  const plan = buildPlan(places, { ...focused, startDate: "2026-10-10" });
  const day = plan.days[0];
  assert.equal(day.stops.length, 5);
  assert.ok(day.stops.every((stop) => /market/i.test(stop.place.name)));
  assert.equal(new URL(day.routeUrl).searchParams.get("travelmode"), "walking");
  assert.ok(day.stops.slice(1).every((stop) => new URL(stop.legUrl).searchParams.get("travelmode") === "transit"));
  assert.ok(day.stops.slice(1).every((stop) => !new URL(stop.legUrl).searchParams.has("waypoints")));
});

test("a compact church walk in the City is geographically and categorically strict", () => {
  const intent = interpretPrompt("A nice a compact one day long walk across the best churches in the City");
  assert.equal(intent.days, 1);
  assert.deepEqual(intent.areas, ["CITY_OF_LONDON"]);
  assert.deepEqual(intent.categories, ["RELIGIOUS"]);
  assert.equal(intent.transport, "walking");
  assert.equal(intent.pace, "full");
  assert.equal(intent.churchFocus, true);
  assert.equal(intent.compactRoute, true);

  const plan = buildPlan([
    fixture("bride", "St Bride's Church", "RELIGIOUS", 51.5138, -.1055),
    fixture("bow", "St Mary-le-Bow", "RELIGIOUS", 51.5137, -.0936),
    fixture("stephen", "St Stephen Walbrook", "RELIGIOUS", 51.5127, -.09),
    fixture("magnus", "St Magnus the Martyr", "RELIGIOUS", 51.5094, -.0864),
    fixture("hallows", "All Hallows by the Tower", "RELIGIOUS", 51.5094, -.0793),
    fixture("shop", "Peter Jones & Partners", "SHOPPING", 51.499, -.159),
    fixture("outside", "St Paul's Knightsbridge", "RELIGIOUS", 51.502, -.158),
    fixture("clerkenwell", "St John Priory Church", "RELIGIOUS", 51.5228, -.1033),
  ], { ...intent, startDate: "2026-10-06" });
  const day = plan.days[0];
  assert.equal(day.area, "CITY_OF_LONDON");
  assert.equal(day.stops.length, 5);
  assert.ok(day.stops.every((stop) => stop.place.category === "RELIGIOUS"));
  assert.ok(day.stops.every((stop) => stop.place.id !== "clerkenwell"));
  assert.ok(day.stops.every((stop) => stop.place.lon >= -.1125 && stop.place.lon <= -.073));
  assert.deepEqual(day.stops.map((stop) => stop.place.id), ["bride", "bow", "stephen", "magnus", "hallows"]);
});

test("west of South Kensington is a hard geographic constraint", () => {
  const prompt = "I would like a plan for one day in west London, west of South Kensington. I like walking, nice areas and buildings, maybe some gardens and parks, and possibly an interesting museum, not the big ones. I like walking";
  const intent = interpretPrompt(prompt);
  assert.equal(intent.days, 1);
  assert.deepEqual(intent.areas, ["WEST_SOUTH_KENSINGTON"]);
  assert.equal(intent.transport, "walking");
  assert.equal(intent.noBigMuseums, true);

  const plan = buildPlan([
    fixture("alexandra", "Alexandra Palace", "VIEWPOINT", 51.594, -.13),
    fixture("west-park", "West Park", "PARK", 51.51, -.23),
    fixture("west-area", "West Area", "AREA", 51.50, -.22),
    fixture("west-museum", "West Museum", "MUSEUM", 51.505, -.20),
  ], { ...intent, startDate: "2026-10-05" });
  assert.ok(plan.days[0].stops.length >= 3);
  assert.ok(plan.days[0].stops.every((stop) => stop.place.lon < -.17));
  assert.ok(plan.days[0].stops.every((stop) => stop.place.name !== "Alexandra Palace"));
});

test("south-of-Thames route prompt captures boundary, endpoints, impact and mixed transport", () => {
  const prompt = "I want a one day itinerary south of the Thames, starting from Bermondsey and ending in Putney. Use a mix of walking and public transportation. Look for wow places, whether they are churches, areas, oddities, buildings. I need to be impressed";
  const intent = interpretPrompt(prompt);
  assert.equal(intent.days, 1);
  assert.deepEqual(intent.areas, ["SOUTH_THAMES"]);
  assert.equal(intent.routeStartQuery, "Bermondsey");
  assert.equal(intent.routeEndQuery, "Putney");
  assert.equal(intent.transport, "mixed");
  assert.equal(intent.impact, "wow");
  assert.deepEqual(intent.categories.sort(), ["AREA", "BUILDING", "RELIGIOUS"]);
  assert.ok(["beautiful", "unexpected", "atmospheric", "weird"].every((mood) => intent.moods.includes(mood)));
});

test("route endpoint parser accepts common proximity wording without consuming later clauses", () => {
  const cases = [
    ["Start at Brixton and finish near Hampstead Heath. Use the Tube.", "Brixton", "Hampstead Heath"],
    ["Begin in Canary Wharf then end by Kew Gardens; mostly public transport.", "Canary Wharf", "Kew Gardens"],
    ["A day from King's Cross to Richmond, using trains when useful.", "King's Cross", "Richmond"],
    ["Starting around Victoria and finishing at Greenwich. I like walking.", "Victoria", "Greenwich"],
  ];
  for (const [prompt, start, end] of cases) {
    const intent = interpretPrompt(prompt);
    assert.equal(intent.routeStartQuery, start, prompt);
    assert.equal(intent.routeEndQuery, end, prompt);
  }
  const partial = interpretPrompt("Start from Wimbledon. I am happy to jump on the Tube.");
  assert.equal(partial.routeStartQuery, "Wimbledon");
  assert.equal(partial.routeEndQuery, undefined);
});

test("a lone starting point guides the route without requiring a destination", () => {
  const prompt = "I need a one-day itinerary starting around Liverpool Street Station, without anything indoor, possibly with viewpoints not crowded and places where I can do some local shopping in a nice market";
  const intent = interpretPrompt(prompt);
  assert.equal(intent.days, 1);
  assert.equal(intent.routeStartQuery, "Liverpool Street Station");
  assert.equal(intent.routeEndQuery, undefined);
  assert.equal(intent.outdoorOnly, true);
  assert.equal(intent.crowdSensitive, true);
  assert.deepEqual(intent.categories.sort(), ["SHOPPING", "VIEWPOINT"]);

  const start = { label: "Liverpool Street Station", lat: 51.5178, lon: -.0823 };
  const indoor = fixture("indoor", "Indoor Gallery", "VIEWPOINT", 51.518, -.081, { accessType: "TIMETABLED", hoursStatus: "VERIFIED" });
  const ambiguousIndoor = fixture("hall", "Always Open Music Hall", "ODDITY", 51.518, -.08, { accessType: "ALWAYS_ACCESSIBLE" });
  ambiguousIndoor.hook = "A historic music hall interior.";
  const plan = buildPlan([
    indoor,
    ambiguousIndoor,
    fixture("view", "Quiet Outdoor View", "VIEWPOINT", 51.519, -.079),
    fixture("market", "Open Air Market", "SHOPPING", 51.521, -.076),
    fixture("street", "Historic Street", "AREA", 51.516, -.075),
    fixture("garden", "Pocket Garden", "PARK", 51.514, -.078),
    fixture("far", "Far Outdoor View", "VIEWPOINT", 51.59, -.21),
  ], { ...intent, startDate: "2026-10-10", pace: "relaxed", routeStart: start });
  const day = plan.days[0];
  assert.equal(day.routeLabel, "From Liverpool Street Station");
  assert.ok(day.stops.length >= 3);
  assert.ok(day.stops.every((stop) => !["indoor", "hall"].includes(stop.place.id)));
  assert.ok(day.stops.every((stop) => stop.place.id !== "far"));
  assert.notEqual(day.stops[0].legMode, "start");
  const url = new URL(day.routeUrl);
  assert.equal(url.searchParams.get("origin"), `${start.lat},${start.lon}`);
  assert.equal(url.searchParams.get("destination"), `${day.stops.at(-1).place.lat},${day.stops.at(-1).place.lon}`);
});

test("a lone destination orders the day toward that point", () => {
  const end = { label: "Greenwich", lat: 51.4826, lon: -.0077 };
  const plan = buildPlan([
    fixture("west", "West Park", "PARK", 51.494, -.045),
    fixture("middle", "Middle Street", "AREA", 51.489, -.025),
    fixture("east", "East View", "VIEWPOINT", 51.484, -.012),
  ], { days: 1, startDate: "2026-10-10", pace: "relaxed", routeEnd: end });
  const day = plan.days[0];
  assert.equal(day.routeLabel, "Finish at Greenwich");
  assert.ok(day.destinationArrival);
  assert.equal(day.stops.at(-1).place.id, "east");
  assert.equal(new URL(day.routeUrl).searchParams.get("destination"), `${end.lat},${end.lon}`);
});

test("a mainly outdoor Victoria prompt infers green and art and requests one useful clarification", () => {
  const prompt = "I want an itinerary for only one day, mainly outdoors, possibly with something green, not too crowded, but possibly with something artistic. It's ok to start anywhere around victoria, with no specific final destination";
  const intent = interpretPrompt(prompt);
  assert.equal(intent.days, 1);
  assert.equal(intent.routeStartQuery, "Victoria");
  assert.equal(intent.routeEndQuery, undefined);
  assert.equal(intent.openEnded, true);
  assert.equal(intent.outdoorPreference, true);
  assert.equal(intent.outdoorOnly, undefined);
  assert.equal(intent.crowdSensitive, true);
  assert.equal(intent.needsIndoorClarification, true);
  assert.deepEqual(intent.categories.sort(), ["MUSEUM", "PARK"]);

  const start = { label: "Victoria", lat: 51.4951, lon: -.1448 };
  const plan = buildPlan([
    fixture("park", "Victoria Garden", "PARK", 51.497, -.14),
    fixture("street", "Quiet Street", "AREA", 51.501, -.135),
    fixture("view", "Outdoor View", "VIEWPOINT", 51.505, -.13),
    fixture("oddity", "Outdoor Curiosity", "ODDITY", 51.508, -.125),
    fixture("museum-one", "Small Art Museum", "MUSEUM", 51.5, -.138, { accessType: "TIMETABLED", hoursStatus: "VERIFIED" }),
    fixture("museum-two", "Second Art Museum", "MUSEUM", 51.502, -.136, { accessType: "TIMETABLED", hoursStatus: "VERIFIED" }),
    fixture("far", "Wilton's Music Hall", "ODDITY", 51.5107, -.0669),
  ], { ...intent, startDate: "2026-10-10", routeStart: start });
  const day = plan.days[0];
  assert.equal(plan.input.transport, "walking");
  assert.equal(day.routeLabel, "From Victoria");
  assert.ok(day.stops.filter((stop) => stop.place.planning.accessType === "TIMETABLED").length <= 1);
  assert.ok(day.stops.every((stop) => stop.place.id !== "far"));
  assert.equal(new URL(day.routeUrl).searchParams.get("travelmode"), "walking");
});

test("Wimbledon to St John's Wood prompt keeps clean endpoints and excludes every museum", () => {
  const prompt = "I need a one day itinerary starting from wimbledon and ending around st john's wood. No museums, just parks, uncommon places, historical locations and something that can be enjoyed more in autumn. I live walking, but the distances may be big, so happy to jump on the tube";
  const intent = interpretPrompt(prompt);
  assert.equal(intent.routeStartQuery, "Wimbledon");
  assert.equal(intent.routeEndQuery, "St John's Wood");
  assert.equal(intent.excludeMuseums, true);
  assert.equal(intent.season, "autumn");
  assert.equal(intent.transport, "mixed");
  assert.ok(!intent.categories.includes("MUSEUM"));

  const plan = buildPlan([
    fixture("museum", "Route Museum", "MUSEUM", 51.49, -.19),
    fixture("park", "Autumn Park", "PARK", 51.48, -.19),
    fixture("oddity", "Route Oddity", "ODDITY", 51.50, -.18),
    fixture("area", "Historic Area", "AREA", 51.52, -.18),
  ], {
    ...intent, startDate: "2026-10-22", pace: "relaxed",
    routeStart: { label: "Wimbledon", lat: 51.4215, lon: -.2064 },
    routeEnd: { label: "St John's Wood", lat: 51.5317, lon: -.1742 },
  });
  assert.ok(plan.days[0].stops.length >= 3);
  assert.ok(plan.days[0].stops.every((stop) => stop.place.category !== "MUSEUM"));
});

test("route anchors constrain, order and time the day from origin through destination", () => {
  const start = { label: "Bermondsey", lat: 51.4979, lon: -.0637 };
  const end = { label: "Putney", lat: 51.4613, lon: -.2161 };
  const places = [
    fixture("south-east", "South East", "ODDITY", 51.499, -.085),
    fixture("south-mid", "South Middle", "BUILDING", 51.487, -.125),
    fixture("south-west", "South West", "PARK", 51.479, -.157),
    fixture("north-river", "North of River", "BUILDING", 51.501, -.129),
    fixture("unrelated", "Unrelated North", "ODDITY", 51.55, -.12),
  ];
  const plan = buildPlan(places, {
    days: 1, startDate: "2026-10-22", startTime: "09:00", endTime: "19:00", pace: "relaxed",
    transport: "mixed", areas: ["SOUTH_THAMES"], categories: ["ODDITY", "BUILDING", "PARK"],
    routeStart: start, routeEnd: end, impact: "wow",
  });
  const day = plan.days[0];
  assert.ok(day.stops.length >= 3);
  assert.ok(day.stops.every((stop) => !["north-river", "unrelated"].includes(stop.place.id)));
  const positions = day.stops.map((stop) => routeMetrics(stop.place, start, end).position);
  assert.deepEqual(positions, [...positions].sort((a, b) => a - b));
  assert.notEqual(day.stops[0].legMode, "start");
  assert.ok(day.destinationArrival);
  const url = new URL(day.routeUrl);
  assert.equal(url.searchParams.get("origin"), `${start.lat},${start.lon}`);
  assert.equal(url.searchParams.get("destination"), `${end.lat},${end.lon}`);
  assert.equal(url.searchParams.get("travelmode"), "walking");
});

test("visitable buildings and small museums receive realistic minimum durations", () => {
  const fenton = fixture("fenton", "Fenton House", "BUILDING", 51.56, -.18, { accessType: "TIMETABLED", hoursStatus: "VERIFIED" });
  fenton.visitMinutes = 15;
  assert.equal(recommendedVisitMinutes(fenton), 60);
  const museum = fixture("museum", "Small Museum", "MUSEUM", 51.5, -.2, { accessType: "TIMETABLED", hoursStatus: "VERIFIED" });
  museum.visitMinutes = 30;
  assert.equal(recommendedVisitMinutes(museum), 60);
});

test("scheduler omits a venue when the full visit cannot finish before closing", () => {
  const first = fixture("first", "First Area", "AREA", 51.5, -.20);
  first.visitMinutes = 120;
  const closing = fixture("closing", "Fenton House", "BUILDING", 51.50, -.205, {
    accessType: "TIMETABLED", hoursStatus: "VERIFIED",
    openingPeriods: [{ dayOfWeek: 1, opensAt: "14:00", closesAt: "14:45" }],
  });
  closing.visitMinutes = 15;
  const plan = buildPlan([first, closing, fixture("third", "Third Park", "PARK", 51.501, -.21)], {
    days: 1, startDate: "2026-10-05", startTime: "12:00", endTime: "18:00", pace: "relaxed",
    transport: "walking", areas: ["WEST_SOUTH_KENSINGTON"], categories: ["AREA", "BUILDING", "PARK"],
  });
  assert.ok(plan.days[0].stops.every((stop) => stop.place.id !== "closing"));
  assert.match(plan.warnings.join(" "), /omits 1 selected place/);
});

test("walking estimates include a conservative street-network allowance", () => {
  const leg = estimateTravel({ lat: 51.5, lon: -.20 }, { lat: 51.5, lon: -.17 }, "walking");
  assert.equal(leg.mode, "Walk");
  assert.ok(leg.minutes >= 35);
});

test("appointment-only and event-only places are not inserted unless explicitly required", () => {
  const normal = [
    fixture("area", "West Area", "AREA", 51.5, -.21), fixture("park", "West Park", "PARK", 51.501, -.22),
    fixture("museum", "West Museum", "MUSEUM", 51.502, -.23),
  ];
  const appointment = fixture("appointment", "Appointment Tower", "BUILDING", 51.503, -.225, { accessType: "APPOINTMENT_ONLY" });
  const plan = buildPlan([...normal, appointment], {
    days: 1, startDate: "2026-10-05", areas: ["WEST_SOUTH_KENSINGTON"], pace: "relaxed", transport: "walking",
  });
  assert.ok(plan.days[0].stops.every((stop) => stop.place.id !== "appointment"));
  const required = buildPlan([...normal, appointment], {
    days: 1, startDate: "2026-10-05", areas: ["WEST_SOUTH_KENSINGTON"], pace: "relaxed", transport: "walking",
    mustHaves: "Appointment Tower",
  });
  assert.ok(required.days[0].stops.some((stop) => stop.place.id === "appointment"));
});

test("date exceptions override recurring hours", () => {
  const place = fixture("m", "Museum", "MUSEUM", 51.52, -.08, { hoursStatus: "VERIFIED", accessType: "TIMETABLED",
    openingPeriods: [{ dayOfWeek: 1, opensAt: "10:00", closesAt: "17:00" }],
    openingExceptions: [{ date: "2026-10-05", isClosed: true, note: "Maintenance" }],
  });
  assert.deepEqual(availabilityForDate(place, "2026-10-05"), { status: "closed", label: "Maintenance" });
  assert.equal(availabilityForDate(place, "2026-10-12").label, "10:00–17:00");
});

test("planner creates distinct west/east days and never selects low-confidence or private places", () => {
  const places = [
    fixture("w1", "West Park", "PARK", 51.51, -.23), fixture("w2", "West Curiosity", "ODDITY", 51.50, -.22),
    fixture("w3", "West Museum", "MUSEUM", 51.515, -.20), fixture("w4", "West Street", "AREA", 51.505, -.19),
    fixture("e1", "East Park", "PARK", 51.52, -.07), fixture("e2", "East Curiosity", "ODDITY", 51.515, -.06),
    fixture("e3", "East Museum", "MUSEUM", 51.525, -.08), fixture("e4", "East Street", "AREA", 51.51, -.05),
    fixture("bad", "Low confidence", "ODDITY", 51.52, -.04, { dataConfidence: "LOW" }),
    fixture("private", "Private", "BUILDING", 51.52, -.03, { accessType: "PRIVATE_NO_PUBLIC_ACCESS" }),
  ];
  const plan = buildPlan(places, {
    days: 2, startDate: "2026-10-05", startTime: "08:00", endTime: "19:00", pace: "relaxed",
    transport: "mixed", familiarity: "returning", areas: ["WEST_HYDE_PARK", "EAST_HOLBORN"],
    categories: ["MUSEUM", "PARK", "ODDITY"], moods: ["unexpected"],
  });
  assert.equal(plan.days.length, 2);
  assert.ok(plan.days[0].stops.every((stop) => stop.place.lon < -.165));
  assert.ok(plan.days[1].stops.every((stop) => stop.place.lon > -.118));
  assert.ok(plan.days.every((day) => new URL(day.routeUrl).hostname === "www.google.com"));
  assert.ok(plan.days.flatMap((day) => day.stops).every((stop) => !["bad", "private"].includes(stop.place.id)));
});

function fixture(id, name, category, lat, lon, planning = {}) {
  return {
    id, name, category, lat, lon, touristIntensity: 25, visitMinutes: 45,
    officialUrl: `https://official.example/${id}`, mapUrl: `https://www.google.com/maps?q=${lat},${lon}`,
    hook: `${name} is a specific curated stop.`, description: "", moods: { unexpected: category === "ODDITY" ? 3 : 0, green: category === "PARK" ? 3 : 0 },
    planning: { dataConfidence: "MEDIUM", plannerReady: true, accessType: "EXTERIOR_ONLY", bookingMode: "NONE",
      descriptionQuality: "SPECIFIC", hoursStatus: "NOT_APPLICABLE", openingPeriods: [], openingExceptions: [], ...planning },
  };
}
