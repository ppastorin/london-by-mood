const MODEL = "@cf/meta/llama-3.3-70b-instruct-fp8-fast";
const CATEGORIES = ["AREA", "BUILDING", "MUSEUM", "ODDITY", "PARK", "RELIGIOUS", "SHOPPING", "VIEWPOINT"];
const STRENGTHS = ["PRIMARY", "REQUIRED", "PREFERRED", "OPTIONAL", "EXCLUDED"];
const RELATIONS = ["IN", "NEAR", "NORTH_OF", "SOUTH_OF", "EAST_OF", "WEST_OF"];
const ROLES = ["SCOPE", "START", "VIA", "END", "EXCLUDE"];
const MOODS = ["quiet", "unexpected", "beautiful", "weird", "local", "green", "atmospheric", "wander"];
const WEEKDAYS = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"];
const MONTHS = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"];
const ROUTE_STYLES = ["DIRECT", "COMPACT", "SCENIC", "EXPLORATORY", "UNSPECIFIED"];
const BREAK_TYPES = ["LUNCH", "COFFEE", "REST"];

export const PLANNER_INTENT_SCHEMA_VERSION = "18";

export const PLANNER_INTENT_SCHEMA = Object.freeze({
  type: "object",
  additionalProperties: false,
  properties: {
    days: { type: "integer", minimum: 1, maximum: 1 },
    visitDate: { type: "string" },
    timeOfDay: { type: "string", enum: ["morning", "afternoon", "evening", "full_day", "flexible"] },
    startTime: { type: "string" },
    endTime: { type: "string" },
    pace: { type: "string", enum: ["relaxed", "balanced", "full", "unspecified"] },
    transport: { type: "string", enum: ["walking", "mixed", "transit", "river", "unspecified"] },
    familiarity: { type: "string", enum: ["first", "returning", "unspecified"] },
    scopeMode: { type: "string", enum: ["ALL", "ANY"] },
    geography: {
      type: "array",
      maxItems: 6,
      items: {
        type: "object",
        additionalProperties: false,
        properties: {
          day: { type: "integer", minimum: 0, maximum: 2 },
          role: { type: "string", enum: ROLES },
          relation: { type: "string", enum: RELATIONS },
          query: { type: "string" },
          label: { type: "string" },
          radiusKm: { type: "number", minimum: 0.5, maximum: 25 },
        },
        required: ["day", "role", "relation", "query", "label", "radiusKm"],
      },
    },
    categoryPreferences: {
      type: "array",
      maxItems: 8,
      items: {
        type: "object",
        additionalProperties: false,
        properties: {
          category: { type: "string", enum: CATEGORIES },
          strength: { type: "string", enum: STRENGTHS },
          minStops: { type: "integer", minimum: 0, maximum: 6 },
          maxStops: { type: "integer", minimum: 0, maximum: 6 },
          maxStopsExplicit: { type: "boolean" },
        },
        required: ["category", "strength", "minStops", "maxStops", "maxStopsExplicit"],
      },
    },
    experience: {
      type: "object",
      additionalProperties: false,
      properties: {
        label: { type: "string" },
        semanticTerms: { type: "array", maxItems: 10, items: { type: "string" } },
        strictCategory: { type: "boolean" },
        strictConcept: { type: "boolean" },
        compact: { type: "boolean" },
      },
      required: ["label", "semanticTerms", "strictCategory", "strictConcept", "compact"],
    },
    routePolicy: {
      type: "object",
      additionalProperties: false,
      properties: {
        style: { type: "string", enum: ROUTE_STYLES },
        maxWalkingKm: { type: "number", minimum: 0, maximum: 30 },
      },
      required: ["style", "maxWalkingKm"],
    },
    breaks: {
      type: "array",
      maxItems: 3,
      items: {
        type: "object",
        additionalProperties: false,
        properties: {
          type: { type: "string", enum: BREAK_TYPES },
          required: { type: "boolean" },
          durationMinutes: { type: "integer", minimum: 15, maximum: 120 },
          earliestTime: { type: "string" },
          latestTime: { type: "string" },
          preference: { type: "string" },
        },
        required: ["type", "required", "durationMinutes", "earliestTime", "latestTime", "preference"],
      },
    },
    moods: { type: "array", maxItems: 8, items: { type: "string", enum: MOODS } },
    exclusions: { type: "array", maxItems: 12, items: { type: "string" } },
    mustInclude: { type: "array", maxItems: 8, items: { type: "string" } },
    outdoorMode: { type: "string", enum: ["ONLY", "PREFER", "ANY"] },
    museumScale: { type: "string", enum: ["SMALL_ONLY", "ANY"] },
    crowdPreference: { type: "string", enum: ["LOW", "ANY"] },
    touristPreference: { type: "string", enum: ["NON_TOURISTIC", "ANY"] },
    season: { type: "string", enum: ["spring", "summer", "autumn", "winter", "unspecified"] },
    preferredWeekdays: { type: "array", maxItems: 7, items: { type: "string", enum: WEEKDAYS } },
    preferredMonths: { type: "array", maxItems: 12, items: { type: "string", enum: MONTHS } },
    openEnded: { type: "boolean" },
    assumptions: { type: "array", maxItems: 6, items: { type: "string" } },
    insights: { type: "array", maxItems: 12, items: { type: "string" } },
    clarifications: {
      type: "array",
      maxItems: 3,
      items: {
        type: "object",
        additionalProperties: false,
        properties: {
          id: { type: "string" },
          question: { type: "string" },
          reason: { type: "string" },
          options: {
            type: "array",
            minItems: 2,
            maxItems: 4,
            items: {
              type: "object",
              additionalProperties: false,
              properties: { value: { type: "string" }, label: { type: "string" } },
              required: ["value", "label"],
            },
          },
        },
        required: ["id", "question", "reason", "options"],
      },
    },
    confidence: { type: "number", minimum: 0, maximum: 1 },
  },
  required: ["days", "visitDate", "timeOfDay", "startTime", "endTime", "pace", "transport", "familiarity", "scopeMode", "geography",
    "categoryPreferences", "experience", "routePolicy", "breaks", "moods", "exclusions", "mustInclude", "outdoorMode", "museumScale",
    "crowdPreference", "touristPreference", "season", "preferredWeekdays", "preferredMonths", "openEnded", "assumptions",
    "insights", "clarifications", "confidence"],
});

const SYSTEM_PROMPT = `You are the intent interpreter for London Advanced, a curated guide to London beyond the obvious.
Your only task is to translate a visitor's request into the supplied JSON schema. Do not invent an itinerary, venues, opening hours or coordinates.

Interpretation rules:
- This planner always creates exactly one day and days must be 1. If a request assigns different areas or themes to different days, ask which single-day option to plan; do not silently combine incompatible day briefs.
- Geography is a hard constraint whenever the user names an area, direction, start or end. Never replace it with a better-known part of London.
- SCOPE constraints normally combine with scopeMode=ALL. When the visitor explicitly offers alternative areas with "or" or "either", use scopeMode=ANY: they are alternatives, never an intersection. If those alternatives are broad enough to produce materially different days, ask one concise clarification before planning. Ask which area should anchor one coherent day, with concrete compact-area choices and "Use your best judgement"; do not silently discard one alternative. Before that answer, geography may be empty rather than inventing a false precise boundary. After the answer, choose one specific, geocodable district that fits the themes rather than returning the broad region phrase itself.
- Familiarity is explicit visitor context. "First time", "first visit", "first trip" or never having visited means familiarity=first. Repeat visits, already having seen the main sights or living in London means familiarity=returning. Never leave familiarity unspecified when the visitor states it.
- For a first visit with no narrower overriding theme, the itinerary should be led by London's defining, widely recognised landmarks across appropriate categories. Requests for the essentials, highlights, classics, iconic or famous London reinforce that interpretation. Do not translate a generic request for London essentials into AREA or BUILDING category requirements: familiarity carries the landmark intent and allows a balanced mix of buildings, public spaces, sacred sites, views and major cultural places.
- "Without feeling like a tick-box tour", "not a checklist" and similar wording asks for selectivity and coherence, not obscure places. Preserve first-visit landmark priority, normally use pace=balanced, and choose a COMPACT or SCENIC route rather than cramming in disconnected stops.
- Resolve the intended London place name in query. Use full canonical feature names (for example "River Thames", not "Thames"). In a London travel context, "the City" means "City of London"; an ordinary city-wide request does not.
- Use role SCOPE for an area in which to choose catalogue stops, EXCLUDE for an area to avoid, START or END for explicit route endpoints, and VIA for an explicit intermediate destination that the route must reach before continuing. Every explicit start, intermediate destination and end is mandatory in geography. A place can appear once as VIA and once as SCOPE when the visitor both wants to reach it and explore stops around it. For example, "start at Millbank Pier, visit Greenwich parks, then finish at Battersea Power Station" requires START Millbank Pier, VIA Greenwich, SCOPE Greenwich with an approximately 3 km radius, and END Battersea Power Station. A start or end is otherwise optional. "No specific destination" is openEnded and requires no clarification.
- Do not invent a SCOPE such as "the area between A and B" for an endpoint-to-endpoint journey. The route corridor is calculated from START, any explicit VIA points and END. Add SCOPE only when the visitor independently names an area to explore or a boundary to obey.
- Use IN for "in/across/within", NEAR for "around/near", and the directional relations for "west/east/north/south of". For a directional constraint, query and label must contain only the geocodable reference place: "west of Hyde Park" is relation WEST_OF with query "Hyde Park", never an IN query containing "west of".
- Treat broad London regions as compound geographic concepts, not named venues. Use directional boundaries that match normal London usage rather than a generic city-centre split. For example, "East London" should be EAST_OF a boundary around Aldgate or Tower Bridge, not Trafalgar Square, and normally NORTH_OF the Thames; label both scopes "East London" and use an 8-12 km radius unless the visitor asks for outer London. Apply equivalent geographic reasoning to West, North and South London instead of asking a geocoder to search the region phrase itself.
- Set day=0 for every geography item because all constraints apply to the single planned day.
- Distinguish the main purpose from incidental possibilities. When the whole day is organised around one narrow place type, make its category PRIMARY, strictCategory true and strictConcept true; this applies equally to markets, churches and any future narrow concept. A merely possible stop is OPTIONAL.
- When two or more place types are equally important, use REQUIRED or PREFERRED for each and do not invent a PRIMARY category. Walking, wandering, local character and atmosphere describe movement or mood; they do not by themselves make AREA the primary category.
- A multi-theme request such as churches, gardens and secondhand bookshops is not one globally narrow concept. Give each named place type its own category preference, keep strictCategory=false and strictConcept=false, and use semanticTerms only to improve ranking for the narrower subtype (for example secondhand, used or antiquarian bookshops). Never use one theme's terms to exclude the other requested categories.
- When the visitor explicitly names the only desired place types, mark each at least REQUIRED with minStops 1. Use PREFERRED when the wording is merely suggestive (for example "possibly" or "maybe").
- A plural or collective request for stops of one place type (for example oddities, churches, markets, gardens or viewpoints) requires minStops at least 2. Use minStops 1 only for singular wording, "one", "a stop", "possibly" or another clearly optional mention.
- CATEGORY meanings: AREA=neighbourhoods/streets; BUILDING=architecture/heritage buildings; MUSEUM=small museums/galleries; ODDITY=quirky objects or unusual sites; PARK=parks/gardens/green space; RELIGIOUS=churches/chapels/temples/cemeteries; SHOPPING=markets/independent shops; VIEWPOINT=views.
- Put experiential adjectives such as quiet, unexpected, beautiful, weird, local, green and atmospheric in moods. Never put mood adjectives in semanticTerms.
- semanticTerms are generic physical place-type nouns, not named venues or moods. Supply them only when the user's concept is narrower than the category, such as market, church, cemetery or brutalist building. Include sensible close synonyms. Set strictConcept only when every stop should match that narrow concept.
- PRIMARY means the whole itinerary is led by that category. REQUIRED means at least minStops. PREFERRED is important but not mandatory. OPTIONAL is a possible addition. EXCLUDED is forbidden. minStops and maxStops count itinerary stops, never days.
- maxStops is a visitor-imposed ceiling only when the visitor explicitly says "only", "exactly", "at most" or gives another clear numeric cap. In that case set maxStopsExplicit=true. Otherwise set maxStopsExplicit=false and maxStops=6 so the route engine can fill the available day; never copy minStops into maxStops by default.
- Negation always wins: a negated known category must be a categoryPreference with strength EXCLUDED, not only a free-text exclusion. A request for no big/major museums keeps MUSEUM available but sets museumScale SMALL_ONLY.
- "Mainly outdoors" is PREFER; "nothing indoor" is ONLY. Green implies PARK. Artistic can imply MUSEUM or BUILDING depending context.
- "Non-touristic", "not touristy" and requests to avoid tourist-heavy places set touristPreference=NON_TOURISTIC. Requests to avoid crowds set crowdPreference=LOW.
- A compact/long walk controls experience.compact and transport. "Walk from A to B" means transport=walking; never upgrade it to mixed merely because the route crosses central London. A willingness to use the Tube alongside walking is mixed. Explicit requests for Uber Boat, Thames Clippers or travel by river use river. When a journey explicitly starts at a Thames pier and visits another well-known riverside destination or pier before continuing along the Thames, infer river unless the user requests another mode; mention that inference in assumptions or ask a transport clarification only when it would materially change the day.
- Interpret the shape of an endpoint-to-endpoint journey in routePolicy. DIRECT means progress towards the destination with only small diversions; COMPACT allows a coherent cluster of nearby stops; SCENIC permits a purposeful scenic deviation; EXPLORATORY permits a deliberately meandering route. A request to walk from A to B and stop at matching places normally means DIRECT unless the visitor explicitly asks to wander, meander, detour or take a scenic route. Never treat a destination as permission to continue materially beyond it. When START and END are the same place, they define a return deadline and an anchored loop, not a zero-length route corridor; do not add a local SCOPE unless the visitor asks to remain nearby.
- maxWalkingKm is a user constraint, not an invented route calculation. Set it only when the visitor gives a numeric distance or an unmistakable limit such as a very short walk; otherwise use 0 and let the route engine calculate a feasible allowance from the resolved endpoints.
- Capture every explicit meal, coffee or rest request in breaks. A lunch request normally means a required LUNCH break of 45-60 minutes between 12:00 and 14:30; "long lunch" means 75-90 minutes. Preserve stated timing, duration and qualities such as eating alone in preference, but do not invent a restaurant. Do not ask about cuisine unless it is essential to the visitor's request.
- When visitors ask to stop along a route for a named place type, that place type is a genuine itinerary requirement. Use its category as PRIMARY or REQUIRED and select a sensible minStops from the wording; do not dilute it with unrelated categories merely to fill the day.
- General endpoint pattern: "walk from A to B, stopping for [place type], with lunch" means START A, END B, no invented SCOPE or VIA, transport=walking, routePolicy=DIRECT, the matching category PRIMARY or REQUIRED, and one required LUNCH break. Apply this pattern semantically to any London endpoints, place type and break wording; it is not a phrase match.
- Ask up to three short clarifications when an answer would materially improve the result: resolve ambiguous or alternative broad geography, choose between genuinely different interpretations, confirm a date-dependent request, or settle a conflict such as outdoors versus an indoor category. When a visitor offers two broad areas as alternatives for a multi-theme day, one area-selection question is material because it determines route coherence and catalogue coverage. Do not ask for information already present. Prefer two or three concrete options and include a sensible "Use your best judgement" option when no answer is essential.
- Do not put questions in assumptions or insights. Keep insights short and user-facing.
- If clarification answers are supplied, treat them as authoritative and return no further clarification unless an answer introduces a new material ambiguity.
- Radius is geometric scope, not travel distance: about 2-3 km for a compact neighbourhood, 5-8 km around a broad district and up to 15-20 km for a directional part of London.
- preferredWeekdays uses lowercase English weekday names. "During the week" means monday through friday. preferredMonths uses lowercase English month names.
- Convert an explicit calendar date or unambiguous relative date into visitDate YYYY-MM-DD using the supplied current London date. Otherwise leave visitDate blank. Capture named weekdays in preferredWeekdays and named months in preferredMonths (1=January through 12=December).
- timeOfDay is morning, afternoon, evening, full_day or flexible. Infer practical startTime and endTime when the user names a time of day; use 08:30–13:00 for morning, 13:00–18:00 for afternoon, 17:00–22:00 for evening and 09:00–19:00 for a full day unless the user gives exact times.
- Default unspecified values: days=1, blank visitDate and times, timeOfDay=flexible, pace=unspecified, transport=unspecified, familiarity=unspecified, season=unspecified, routePolicy style=UNSPECIFIED with maxWalkingKm=0, breaks=[], outdoorMode=ANY, museumScale=ANY, crowd/tourist preference=ANY.
- confidence reflects the interpretation, not itinerary quality or database coverage.`;

export async function interpretPlannerIntent(prompt, env, answers = {}) {
  if (!env?.AI?.run) throw new PlannerInterpreterError("AI_INTERPRETER_UNAVAILABLE", "The AI interpreter is not configured in this sandbox.", 503);
  const answerText = Object.entries(answers || {}).filter(([, value]) => String(value || "").trim())
    .map(([key, value]) => `${key}: ${String(value).trim()}`).join("\n");
  const londonDate = new Intl.DateTimeFormat("en-CA", { timeZone: "Europe/London", year: "numeric", month: "2-digit", day: "2-digit" }).format(new Date());
  const requestContext = `CURRENT LONDON DATE: ${londonDate}\nTRAVEL REQUEST:\n${prompt}`;
  const userContent = answerText ? `${requestContext}\n\nCLARIFICATION ANSWERS:\n${answerText}` : requestContext;
  let output;
  try {
    output = await env.AI.run(env.PLANNER_AI_MODEL || MODEL, {
      messages: [{ role: "system", content: SYSTEM_PROMPT }, { role: "user", content: userContent }],
      response_format: { type: "json_schema", json_schema: PLANNER_INTENT_SCHEMA },
      max_tokens: 2300,
      temperature: 0,
    });
  } catch (error) {
    throw new PlannerInterpreterError("AI_INTERPRETER_FAILED", `The AI interpreter could not process this request: ${error instanceof Error ? error.message : "unknown error"}`, 502);
  }
  const raw = parseModelOutput(output);
  return normalizePlannerIntent(raw);
}

export function normalizePlannerIntent(raw) {
  if (!raw || typeof raw !== "object" || Array.isArray(raw)) {
    throw new PlannerInterpreterError("INVALID_AI_RESPONSE", "The AI interpreter returned an invalid response.", 502);
  }
  const days = 1;
  const interpretedGeography = array(raw.geography).flatMap((item) => {
    const role = enumValue(item?.role, ROLES, "");
    const relation = enumValue(item?.relation, RELATIONS, "");
    const query = clean(item?.query, 120);
    if (!role || !relation || !query) return [];
    return [{ day: clampInt(item.day, 0, days, 0), role, relation, query,
      label: clean(item.label, 120) || query, radiusKm: clampNumber(item.radiusKm, .5, 25, role === "SCOPE" ? 3 : 1.5) }];
  });
  // START + VIA + END already define a route corridor. Models sometimes add a
  // conversational pseudo-place such as "the area between Baker Street and
  // Lower Marsh" as a SCOPE. It is neither a real geocodable place nor an
  // additional user boundary, so discard any scope composed from both route
  // endpoints. This is place-agnostic and preserves independently named areas.
  const geography = discardCompositeEndpointScopes(interpretedGeography);
  const categoryPreferences = dedupeBy(array(raw.categoryPreferences).flatMap((item) => {
    const category = enumValue(item?.category, CATEGORIES, "");
    const strength = enumValue(item?.strength, STRENGTHS, "");
    if (!category || !strength) return [];
    const minStops = clampInt(item.minStops, 0, 6, strength === "PRIMARY" || strength === "REQUIRED" ? 1 : 0);
    const maxStopsExplicit = Boolean(item.maxStopsExplicit);
    return [{ category, strength, minStops, maxStops: maxStopsExplicit ? Math.max(minStops, clampInt(item.maxStops, 0, 6, 6)) : 6,
      maxStopsExplicit }];
  }), (item) => item.category);
  const experience = raw.experience && typeof raw.experience === "object" ? raw.experience : {};
  const clarifications = array(raw.clarifications).slice(0, 3).flatMap((item, index) => {
    const question = clean(item?.question, 240);
    const options = array(item?.options).slice(0, 4).flatMap((option) => {
      const value = clean(option?.value, 80); const label = clean(option?.label, 160);
      return value && label ? [{ value, label }] : [];
    });
    return question && options.length >= 2 ? [{ id: clean(item.id, 60) || `clarification-${index + 1}`,
      question, reason: clean(item.reason, 240), options }] : [];
  });
  const exclusionTerms = unique(array(raw.exclusions).map((item) => clean(item, 120)).filter(Boolean));
  for (const term of exclusionTerms) {
    const category = CATEGORIES.find((candidate) => candidate === term.toUpperCase());
    if (category && !categoryPreferences.some((item) => item.category === category)) {
      categoryPreferences.push({ category, strength: "EXCLUDED", minStops: 0, maxStops: 0 });
    }
  }
  const focusedCategories = categoryPreferences.filter((item) => item.strength !== "EXCLUDED");
  const primary = categoryPreferences.find((item) => item.strength === "PRIMARY")
    || (experience.strictCategory && experience.strictConcept && focusedCategories.length === 1 ? focusedCategories[0] : undefined);
  const preferred = categoryPreferences.filter((item) => item.strength !== "EXCLUDED").map((item) => item.category);
  const excluded = categoryPreferences.filter((item) => item.strength === "EXCLUDED").map((item) => item.category);
  const semanticTerms = unique(array(experience.semanticTerms).map((term) => clean(term, 60)).filter(Boolean)).slice(0, 10);
  const rawRoutePolicy = raw.routePolicy && typeof raw.routePolicy === "object" ? raw.routePolicy : {};
  const routePolicy = {
    style: enumValue(rawRoutePolicy.style, ROUTE_STYLES, "UNSPECIFIED"),
    maxWalkingKm: clampNumber(rawRoutePolicy.maxWalkingKm, 0, 30, 0),
  };
  const breaks = array(raw.breaks).slice(0, 3).flatMap((item) => {
    const type = enumValue(item?.type, BREAK_TYPES, "");
    if (!type) return [];
    const defaults = type === "LUNCH" ? ["12:00", "14:30", 60] : ["10:00", "17:00", 30];
    return [{
      type,
      required: Boolean(item.required),
      durationMinutes: clampInt(item.durationMinutes, 15, 120, defaults[2]),
      earliestTime: validTime(item.earliestTime) || defaults[0],
      latestTime: validTime(item.latestTime) || defaults[1],
      preference: clean(item.preference, 160),
    }];
  });
  const preferredWeekdays = unique(array(raw.preferredWeekdays).map((value) => namedOrdinal(value, WEEKDAYS, 0)).filter((value) => value >= 0));
  const preferredMonths = unique(array(raw.preferredMonths).map((value) => namedOrdinal(value, MONTHS, 1)).filter((value) => value >= 1));
  return {
    schemaVersion: PLANNER_INTENT_SCHEMA_VERSION,
    provider: "workers-ai",
    days,
    visitDate: validDate(raw.visitDate),
    timeOfDay: enumValue(raw.timeOfDay, ["morning", "afternoon", "evening", "full_day", "flexible"], "flexible"),
    startTime: validTime(raw.startTime), endTime: validTime(raw.endTime),
    pace: enumValue(raw.pace, ["relaxed", "balanced", "full"], undefined),
    transport: enumValue(raw.transport, ["walking", "mixed", "transit", "river"], undefined),
    familiarity: enumValue(raw.familiarity, ["first", "returning"], undefined),
    scopeMode: enumValue(raw.scopeMode, ["ALL", "ANY"], "ALL"),
    geography,
    categoryPreferences,
    categories: unique(preferred), excludedCategories: unique(excluded), primaryCategory: primary?.category,
    experience: {
      label: clean(experience.label, 160), semanticTerms,
      strictCategory: Boolean(experience.strictCategory),
      strictConcept: Boolean(experience.strictConcept), compact: Boolean(experience.compact),
    },
    routePolicy,
    breaks,
    moods: unique(array(raw.moods).filter((mood) => MOODS.includes(mood))),
    avoidTerms: exclusionTerms.filter((term) => !CATEGORIES.includes(term.toUpperCase())),
    mustHaves: unique(array(raw.mustInclude).map((item) => clean(item, 120)).filter(Boolean)),
    outdoorOnly: raw.outdoorMode === "ONLY", outdoorPreference: raw.outdoorMode === "PREFER",
    noBigMuseums: raw.museumScale === "SMALL_ONLY",
    crowdSensitive: raw.crowdPreference === "LOW" || raw.touristPreference === "NON_TOURISTIC",
    nonTouristic: raw.touristPreference === "NON_TOURISTIC",
    marketFocus: primary?.category === "SHOPPING" && semanticTerms.some((term) => /market/i.test(term)),
    weekendFlexible: preferredWeekdays.includes(0) && preferredWeekdays.includes(6),
    season: enumValue(raw.season, ["spring", "summer", "autumn", "winter"], undefined),
    preferredWeekdays,
    preferredMonths,
    openEnded: Boolean(raw.openEnded), assumptions: unique(array(raw.assumptions).map((item) => clean(item, 180)).filter(Boolean)),
    insights: unique(array(raw.insights).map((item) => clean(item, 120)).filter(Boolean)), clarifications,
    confidence: clampNumber(raw.confidence, 0, 1, .5),
  };
}

function parseModelOutput(output) {
  let value = output?.response ?? output?.result ?? output;
  if (typeof value === "string") {
    const stripped = value.trim().replace(/^```(?:json)?\s*/i, "").replace(/\s*```$/, "");
    try { value = JSON.parse(stripped); } catch { throw new PlannerInterpreterError("INVALID_AI_RESPONSE", "The AI interpreter returned malformed JSON.", 502); }
  }
  return value;
}

function array(value) { return Array.isArray(value) ? value : []; }
function clean(value, max) { return String(value ?? "").trim().replace(/\s+/g, " ").slice(0, max); }
function enumValue(value, values, fallback) { const normal = String(value || "").trim(); return values.includes(normal) ? normal : fallback; }
function validTime(value) { const time = String(value || "").trim(); return /^([01]\d|2[0-3]):[0-5]\d$/.test(time) ? time : undefined; }
function validDate(value) { const date = String(value || "").trim(); return /^\d{4}-\d{2}-\d{2}$/.test(date) && !Number.isNaN(Date.parse(`${date}T12:00:00Z`)) ? date : undefined; }
function namedOrdinal(value, names, offset) {
  if (typeof value === "number" && Number.isInteger(value)) return value;
  const index = names.indexOf(String(value || "").trim().toLowerCase());
  return index < 0 ? -1 : index + offset;
}
function clampInt(value, min, max, fallback) { const number = Number.parseInt(value, 10); return Number.isFinite(number) ? Math.min(max, Math.max(min, number)) : fallback; }
function clampNumber(value, min, max, fallback) { const number = Number(value); return Number.isFinite(number) ? Math.min(max, Math.max(min, number)) : fallback; }
function unique(items) { return [...new Set(items)]; }
function dedupeBy(items, key) { const seen = new Set(); return items.filter((item) => { const value = key(item); if (seen.has(value)) return false; seen.add(value); return true; }); }
function discardCompositeEndpointScopes(items) {
  const start = items.find((item) => item.role === "START");
  const end = items.find((item) => item.role === "END");
  if (!start || !end) return items;
  const startNames = endpointNames(start);
  const endNames = endpointNames(end);
  return items.filter((item) => item.role !== "SCOPE" || ![item.query, item.label].some((value) => {
    const phrase = normalGeographyPhrase(value);
    return phrase && startNames.some((name) => phrase.includes(name)) && endNames.some((name) => phrase.includes(name));
  }));
}
function endpointNames(item) {
  return unique([item.query, item.label].map(normalGeographyPhrase).filter((value) => value.length >= 3));
}
function normalGeographyPhrase(value) {
  return clean(value, 160).toLocaleLowerCase("en-GB").replace(/[^a-z0-9]+/g, " ").trim();
}

export class PlannerInterpreterError extends Error {
  constructor(code, message, status = 400) { super(message); this.name = "PlannerInterpreterError"; this.code = code; this.status = status; }
}
