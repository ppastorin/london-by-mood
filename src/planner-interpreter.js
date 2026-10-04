const MODEL = "@cf/meta/llama-3.3-70b-instruct-fp8-fast";
const CATEGORIES = ["AREA", "BUILDING", "MUSEUM", "ODDITY", "PARK", "RELIGIOUS", "SHOPPING", "VIEWPOINT"];
const STRENGTHS = ["PRIMARY", "REQUIRED", "PREFERRED", "OPTIONAL", "EXCLUDED"];
const RELATIONS = ["IN", "NEAR", "NORTH_OF", "SOUTH_OF", "EAST_OF", "WEST_OF"];
const ROLES = ["SCOPE", "START", "END", "EXCLUDE"];
const MOODS = ["quiet", "unexpected", "beautiful", "weird", "local", "green", "atmospheric", "wander"];

export const PLANNER_INTENT_SCHEMA_VERSION = "4";

export const PLANNER_INTENT_SCHEMA = Object.freeze({
  type: "object",
  additionalProperties: false,
  properties: {
    days: { type: "integer", minimum: 1, maximum: 2 },
    startTime: { type: "string" },
    endTime: { type: "string" },
    pace: { type: "string", enum: ["relaxed", "balanced", "full", "unspecified"] },
    transport: { type: "string", enum: ["walking", "mixed", "transit", "unspecified"] },
    familiarity: { type: "string", enum: ["first", "returning", "unspecified"] },
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
        },
        required: ["category", "strength", "minStops", "maxStops"],
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
    moods: { type: "array", maxItems: 8, items: { type: "string", enum: MOODS } },
    exclusions: { type: "array", maxItems: 12, items: { type: "string" } },
    mustInclude: { type: "array", maxItems: 8, items: { type: "string" } },
    outdoorMode: { type: "string", enum: ["ONLY", "PREFER", "ANY"] },
    museumScale: { type: "string", enum: ["SMALL_ONLY", "ANY"] },
    crowdPreference: { type: "string", enum: ["LOW", "ANY"] },
    touristPreference: { type: "string", enum: ["NON_TOURISTIC", "ANY"] },
    season: { type: "string", enum: ["spring", "summer", "autumn", "winter", "unspecified"] },
    preferredWeekdays: { type: "array", maxItems: 7, items: { type: "integer", minimum: 0, maximum: 6 } },
    openEnded: { type: "boolean" },
    assumptions: { type: "array", maxItems: 6, items: { type: "string" } },
    insights: { type: "array", maxItems: 12, items: { type: "string" } },
    clarifications: {
      type: "array",
      maxItems: 1,
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
            maxItems: 3,
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
  required: ["days", "startTime", "endTime", "pace", "transport", "familiarity", "geography",
    "categoryPreferences", "experience", "moods", "exclusions", "mustInclude", "outdoorMode", "museumScale",
    "crowdPreference", "touristPreference", "season", "preferredWeekdays", "openEnded", "assumptions",
    "insights", "clarifications", "confidence"],
});

const SYSTEM_PROMPT = `You are the intent interpreter for London Advanced, a curated guide to London beyond the obvious.
Your only task is to translate a visitor's request into the supplied JSON schema. Do not invent an itinerary, venues, opening hours or coordinates.

Interpretation rules:
- Geography is a hard constraint whenever the user names an area, direction, start or end. Never replace it with a better-known part of London.
- Resolve the intended London place name in query. Use full canonical feature names (for example "River Thames", not "Thames"). In a London travel context, "the City" means "City of London"; an ordinary city-wide request does not.
- Use role SCOPE for an area to visit, EXCLUDE for an area to avoid, and START or END only for explicit route anchors. Every explicit starting and ending point is mandatory in geography, even when the request also contains a broad scope. A start or end is otherwise optional. "No specific destination" is openEnded and requires no clarification.
- Use IN for "in/across/within", NEAR for "around/near", and the directional relations for "west/east/north/south of". For a directional constraint, query and label must contain only the geocodable reference place: "west of Hyde Park" is relation WEST_OF with query "Hyde Park", never an IN query containing "west of".
- For a request with different areas on different days, number them from 1 through days in the order stated. Day 0 is reserved only for a constraint that applies to every day; it is not the first day of a multi-day request.
- Distinguish the main purpose from incidental possibilities. When the whole day is organised around one narrow place type, make its category PRIMARY, strictCategory true and strictConcept true; this applies equally to markets, churches and any future narrow concept. A merely possible stop is OPTIONAL.
- CATEGORY meanings: AREA=neighbourhoods/streets; BUILDING=architecture/heritage buildings; MUSEUM=small museums/galleries; ODDITY=quirky objects or unusual sites; PARK=parks/gardens/green space; RELIGIOUS=churches/chapels/temples/cemeteries; SHOPPING=markets/independent shops; VIEWPOINT=views.
- semanticTerms are generic place-type words, not named venues. Supply them only when the user's concept is narrower than the category. Include sensible close synonyms. Set strictConcept only when every stop should match that narrow concept.
- PRIMARY means the whole itinerary is led by that category. REQUIRED means at least minStops. PREFERRED is important but not mandatory. OPTIONAL is a possible addition. EXCLUDED is forbidden. minStops and maxStops count itinerary stops, never days.
- Negation always wins: a negated known category must be a categoryPreference with strength EXCLUDED, not only a free-text exclusion. A request for no big/major museums keeps MUSEUM available but sets museumScale SMALL_ONLY.
- "Mainly outdoors" is PREFER; "nothing indoor" is ONLY. Green implies PARK. Artistic can imply MUSEUM or BUILDING depending context.
- A compact/long walk controls experience.compact and transport. A willingness to use the Tube alongside walking is mixed.
- Ask at most one clarification, and only when ambiguity could materially change geography or violate a hard constraint. Do not ask merely because details are omitted.
- Do not put questions in assumptions or insights. Keep insights short and user-facing.
- If clarification answers are supplied, treat them as authoritative and normally return no further clarification.
- Radius is geometric scope, not travel distance: about 2-3 km for a compact neighbourhood, 5-8 km around a broad district and up to 15-20 km for a directional part of London.
- preferredWeekdays uses 0=Sunday, 1=Monday, ... 6=Saturday. "During the week" means 1 through 5.
- Default unspecified values: days=1, blank times, pace=unspecified, transport=unspecified, familiarity=unspecified, season=unspecified, outdoorMode=ANY, museumScale=ANY, crowd/tourist preference=ANY.
- confidence reflects the interpretation, not itinerary quality or database coverage.`;

export async function interpretPlannerIntent(prompt, env, answers = {}) {
  if (!env?.AI?.run) throw new PlannerInterpreterError("AI_INTERPRETER_UNAVAILABLE", "The AI interpreter is not configured in this sandbox.", 503);
  const answerText = Object.entries(answers || {}).filter(([, value]) => String(value || "").trim())
    .map(([key, value]) => `${key}: ${String(value).trim()}`).join("\n");
  const userContent = answerText ? `TRAVEL REQUEST:\n${prompt}\n\nCLARIFICATION ANSWERS:\n${answerText}` : `TRAVEL REQUEST:\n${prompt}`;
  let output;
  try {
    output = await env.AI.run(env.PLANNER_AI_MODEL || MODEL, {
      messages: [{ role: "system", content: SYSTEM_PROMPT }, { role: "user", content: userContent }],
      response_format: { type: "json_schema", json_schema: PLANNER_INTENT_SCHEMA },
      max_tokens: 1600,
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
  const days = clampInt(raw.days, 1, 2, 1);
  const geography = array(raw.geography).flatMap((item) => {
    const role = enumValue(item?.role, ROLES, "");
    const relation = enumValue(item?.relation, RELATIONS, "");
    const query = clean(item?.query, 120);
    if (!role || !relation || !query) return [];
    return [{ day: clampInt(item.day, 0, days, 0), role, relation, query,
      label: clean(item.label, 120) || query, radiusKm: clampNumber(item.radiusKm, .5, 25, role === "SCOPE" ? 3 : 1.5) }];
  });
  const categoryPreferences = dedupeBy(array(raw.categoryPreferences).flatMap((item) => {
    const category = enumValue(item?.category, CATEGORIES, "");
    const strength = enumValue(item?.strength, STRENGTHS, "");
    if (!category || !strength) return [];
    const minStops = clampInt(item.minStops, 0, 6, strength === "PRIMARY" || strength === "REQUIRED" ? 1 : 0);
    return [{ category, strength, minStops, maxStops: Math.max(minStops, clampInt(item.maxStops, 0, 6, 6)) }];
  }), (item) => item.category);
  const experience = raw.experience && typeof raw.experience === "object" ? raw.experience : {};
  const clarifications = array(raw.clarifications).slice(0, 1).flatMap((item, index) => {
    const question = clean(item?.question, 240);
    const options = array(item?.options).slice(0, 3).flatMap((option) => {
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
  const primary = categoryPreferences.find((item) => item.strength === "PRIMARY");
  const preferred = categoryPreferences.filter((item) => item.strength !== "EXCLUDED").map((item) => item.category);
  const excluded = categoryPreferences.filter((item) => item.strength === "EXCLUDED").map((item) => item.category);
  const semanticTerms = unique(array(experience.semanticTerms).map((term) => clean(term, 60)).filter(Boolean)).slice(0, 10);
  return {
    schemaVersion: PLANNER_INTENT_SCHEMA_VERSION,
    provider: "workers-ai",
    days,
    startTime: validTime(raw.startTime), endTime: validTime(raw.endTime),
    pace: enumValue(raw.pace, ["relaxed", "balanced", "full"], undefined),
    transport: enumValue(raw.transport, ["walking", "mixed", "transit"], undefined),
    familiarity: enumValue(raw.familiarity, ["first", "returning"], undefined),
    geography,
    categoryPreferences,
    categories: unique(preferred), excludedCategories: unique(excluded), primaryCategory: primary?.category,
    experience: {
      label: clean(experience.label, 160), semanticTerms,
      strictCategory: Boolean(experience.strictCategory || primary),
      strictConcept: Boolean(experience.strictConcept || (primary && semanticTerms.length)), compact: Boolean(experience.compact),
    },
    moods: unique(array(raw.moods).filter((mood) => MOODS.includes(mood))),
    avoidTerms: exclusionTerms.filter((term) => !CATEGORIES.includes(term.toUpperCase())),
    mustHaves: unique(array(raw.mustInclude).map((item) => clean(item, 120)).filter(Boolean)),
    outdoorOnly: raw.outdoorMode === "ONLY", outdoorPreference: raw.outdoorMode === "PREFER",
    noBigMuseums: raw.museumScale === "SMALL_ONLY",
    crowdSensitive: raw.crowdPreference === "LOW", nonTouristic: raw.touristPreference === "NON_TOURISTIC",
    season: enumValue(raw.season, ["spring", "summer", "autumn", "winter"], undefined),
    preferredWeekdays: unique(array(raw.preferredWeekdays).map((value) => clampInt(value, 0, 6, -1)).filter((value) => value >= 0)),
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
function clampInt(value, min, max, fallback) { const number = Number.parseInt(value, 10); return Number.isFinite(number) ? Math.min(max, Math.max(min, number)) : fallback; }
function clampNumber(value, min, max, fallback) { const number = Number(value); return Number.isFinite(number) ? Math.min(max, Math.max(min, number)) : fallback; }
function unique(items) { return [...new Set(items)]; }
function dedupeBy(items, key) { const seen = new Set(); return items.filter((item) => { const value = key(item); if (seen.has(value)) return false; seen.add(value); return true; }); }

export class PlannerInterpreterError extends Error {
  constructor(code, message, status = 400) { super(message); this.name = "PlannerInterpreterError"; this.code = code; this.status = status; }
}
