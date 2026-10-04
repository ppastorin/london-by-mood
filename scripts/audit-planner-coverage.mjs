import assert from "node:assert/strict";

const baseUrl = String(process.env.PLANNER_BASE_URL || "https://london-advanced-d1-prototype.screeching-drizzle.workers.dev").replace(/\/$/, "");
const [catalogueResponse, plannerResponse] = await Promise.all([
  fetch(`${baseUrl}/api/pois?limit=2000`, { headers: { Accept: "application/json" } }),
  fetch(`${baseUrl}/api/planner/places?limit=1200`, { headers: { Accept: "application/json" } }),
]);
const catalogue = await catalogueResponse.json();
const planner = await plannerResponse.json();
assert.equal(catalogueResponse.status, 200, JSON.stringify(catalogue));
assert.equal(plannerResponse.status, 200, JSON.stringify(planner));

const by = (places, key) => Object.fromEntries([...groupBy(places, (place) => key(place)).entries()]
  .map(([value, rows]) => [value || "MISSING", rows.length]).sort(([a], [b]) => a.localeCompare(b)));
const duplicateGroups = [...groupBy(catalogue.places, (place) => `${normal(place.name)}|${Number(place.lat).toFixed(3)}|${Number(place.lon).toFixed(3)}`).values()]
  .filter((rows) => rows.length > 1).map((rows) => ({ name: rows[0].name, ids: rows.map((place) => place.id) }));
const weekendMarkets = (day) => planner.places.filter((place) => place.category === "SHOPPING" && /\bmarket\b/i.test(`${place.name} ${place.description} ${place.hook}`)
  && Number(place.lon) > -0.1285 && Number(place.lat) > 51.5078 && (place.planning.openingPeriods.some((period) => Number(period.dayOfWeek) === day)
    || !["VERIFIED", "NOT_APPLICABLE"].includes(place.planning.hoursStatus)));

const report = {
  baseUrl,
  catalogueCount: catalogue.count,
  plannerCount: planner.count,
  plannerCoveragePercent: Number((planner.count / catalogue.count * 100).toFixed(1)),
  categoryCounts: by(catalogue.places, (place) => place.category),
  confidenceCounts: by(catalogue.places, (place) => place.planning.dataConfidence),
  descriptionCounts: by(catalogue.places, (place) => place.planning.descriptionQuality),
  accessCounts: by(catalogue.places, (place) => place.planning.accessType),
  plannerTiers: by(planner.places, (place) => place.planning.recommendationTier),
  categoryCoverage: Object.fromEntries([...groupBy(planner.places, (place) => place.category).entries()].sort(([a], [b]) => a.localeCompare(b))
    .map(([category, rows]) => [category, {
      total: rows.length,
      verified: rows.filter((place) => place.planning.recommendationTier === "VERIFIED").length,
      checkBeforeTravel: rows.filter((place) => place.planning.recommendationTier === "CHECK").length,
    }])),
  evidenceGaps: {
    lowConfidence: planner.places.filter((place) => place.planning.dataConfidence === "LOW").length,
    nonSpecificDescription: planner.places.filter((place) => place.planning.descriptionQuality !== "SPECIFIC").length,
    missingApprovedOrOfficialSource: planner.places.filter((place) => !place.officialUrl && !place.planning.sourceUrl).length,
    hoursNeedCheck: planner.places.filter((place) => ["UNKNOWN", "STALE", "CANDIDATE"].includes(place.planning.hoursStatus)).length,
    bookingUnknown: planner.places.filter((place) => place.planning.bookingMode === "UNKNOWN").length,
    restrictedAccess: planner.places.filter((place) => ["PRIVATE_NO_PUBLIC_ACCESS", "APPOINTMENT_ONLY", "EVENT_ONLY", "CUSTOMER_ONLY"].includes(place.planning.accessType)).length,
  },
  invalidCoordinates: planner.places.filter((place) => !Number.isFinite(Number(place.lat)) || !Number.isFinite(Number(place.lon))).map((place) => place.id),
  missingNames: planner.places.filter((place) => !String(place.name || "").trim()).map((place) => place.id),
  missingUsableCopy: planner.places.filter((place) => !String(place.description || place.hook || "").trim()).map((place) => place.id),
  missingMapLinks: planner.places.filter((place) => !place.mapUrl).map((place) => place.id),
  missingValidationLinks: planner.places.filter((place) => !place.planning.validationUrl).map((place) => place.id),
  duplicateGroups,
  eastLondonSaturdayMarkets: weekendMarkets(6).map(summary),
  eastLondonSundayMarkets: weekendMarkets(0).map(summary),
};
console.log(JSON.stringify(report, null, 2));

assert.equal(planner.count, catalogue.count, "Every published catalogue place must be exposed to Planner V1");
assert.equal(report.invalidCoordinates.length, 0, "Every Planner V1 place needs valid coordinates");
assert.equal(report.missingNames.length, 0, "Every Planner V1 place needs a name");
assert.equal(report.missingUsableCopy.length, 0, "Every Planner V1 place needs a description or editorial hook");
assert.equal(report.missingMapLinks.length, 0, "Every Planner V1 place needs a map link");
assert.equal(report.missingValidationLinks.length, 0, "Every Planner V1 place needs a validation link");
assert.ok(report.eastLondonSaturdayMarkets.length >= 5, "East London needs at least five Saturday market candidates");
assert.ok(report.eastLondonSundayMarkets.length >= 5, "East London needs at least five Sunday market candidates");

function summary(place) {
  return { id: place.id, name: place.name, tier: place.planning.recommendationTier,
    days: [...new Set(place.planning.openingPeriods.map((period) => Number(period.dayOfWeek)))].sort() };
}
function groupBy(items, key) {
  const groups = new Map();
  for (const item of items) {
    const value = key(item);
    const rows = groups.get(value) || [];
    rows.push(item);
    groups.set(value, rows);
  }
  return groups;
}
function normal(value) { return String(value || "").normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase().trim(); }
