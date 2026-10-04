import assert from "node:assert/strict";

const baseUrl = String(process.env.PLANNER_BASE_URL || "https://london-advanced-d1-prototype.screeching-drizzle.workers.dev").replace(/\/$/, "");

const cases = [
  {
    name: "two different day geographies",
    prompt: "I want to spend two full days during the week, one west of Hyde Park and the second east of Holborn. I like small museums, parks and quirky things. I have already visited all the major destinations as I have been to London 4 times. I like walking, but I am confident to jump on a tube. I usually start very early in the morning and go back to the hotel after dinner.",
    check(intent) {
      assert.equal(intent.days, 2); assert.equal(intent.transport, "mixed");
      assert.ok(intent.geoScopes.some((scope) => scope.day === 1 && scope.relation === "WEST_OF"));
      assert.ok(intent.geoScopes.some((scope) => scope.day === 2 && scope.relation === "EAST_OF"));
      assert.ok(["MUSEUM", "PARK", "ODDITY"].every((category) => intent.categories.includes(category)));
    },
  },
  {
    name: "route with two optional anchors",
    prompt: "I want a one day itinerary south of the Thames, starting from Bermondsey and ending in Putney. Use a mix of walking and public transportation. Look for wow places, whether they are churches, areas, oddities, buildings. I need to be impressed.",
    check(intent) {
      assert.equal(intent.days, 1); assert.equal(intent.transport, "mixed");
      assert.match(intent.routeStart?.label || "", /Bermondsey/i); assert.match(intent.routeEnd?.label || "", /Putney/i);
      assert.ok(intent.geoScopes.some((scope) => scope.relation === "SOUTH_OF"));
    },
  },
  {
    name: "start only and no indoor places",
    prompt: "I need a one-day itinerary starting around Liverpool Street Station, without anything indoor, possibly with viewpoints not crowded and places where I can do some local shopping in a nice market",
    check(intent) {
      assert.match(intent.routeStart?.label || "", /Liverpool Street/i); assert.equal(intent.routeEnd, undefined);
      assert.equal(intent.outdoorOnly, true); assert.ok(intent.categories.includes("VIEWPOINT")); assert.ok(intent.categories.includes("SHOPPING"));
    },
  },
  {
    name: "open-ended mainly outdoor art day",
    prompt: "I want an itinerary for only one day, mainly outdoors, possibly with something green, not too crowded, but possibly with something artistic. It's ok to start anywhere around Victoria, with no specific final destination",
    check(intent) {
      assert.match(intent.routeStart?.label || "", /Victoria/i); assert.equal(intent.routeEnd, undefined); assert.equal(intent.openEnded, true);
      assert.equal(intent.outdoorPreference, true); assert.ok(intent.categories.includes("PARK"));
    },
  },
  {
    name: "weekend market-led day",
    prompt: "I want to spend one day going through the best, non-touristic markets in London. I can do it on a Saturday or a Sunday and I can take the tube between places.",
    check(intent) {
      assert.equal(intent.primaryCategory, "SHOPPING"); assert.equal(intent.experience.strictConcept, true);
      assert.ok(intent.preferredWeekdays.includes(6) && intent.preferredWeekdays.includes(0));
    },
  },
  {
    name: "Saturday markets in East London",
    prompt: "A one day itinerary across the best markets in east london on a Saturday",
    check(intent) {
      assert.equal(intent.primaryCategory, "SHOPPING"); assert.equal(intent.experience.strictConcept, true);
      assert.deepEqual(intent.preferredWeekdays, [6]);
      assert.ok(intent.geoScopes.some((scope) => scope.relation === "EAST_OF" && /East London/i.test(scope.label)));
    },
  },
  {
    name: "Sunday markets in East London",
    prompt: "A one day itinerary across the best markets in east london on a Sunday",
    check(intent) {
      assert.equal(intent.primaryCategory, "SHOPPING"); assert.equal(intent.experience.strictConcept, true);
      assert.deepEqual(intent.preferredWeekdays, [0]);
      assert.ok(intent.geoScopes.some((scope) => scope.relation === "EAST_OF" && /East London/i.test(scope.label)));
    },
  },
  {
    name: "City church walk",
    prompt: "A nice compact one day long walk across the best churches in the City",
    check(intent) {
      assert.equal(intent.primaryCategory, "RELIGIOUS"); assert.equal(intent.experience.strictCategory, true); assert.equal(intent.experience.strictConcept, true);
      assert.ok(intent.geoScopes.some((scope) => /City of London/i.test(`${scope.label} ${scope.resolvedLabel || ""}`)));
    },
  },
  {
    name: "Kensington church walk",
    prompt: "A nice compact one day long walk across the best churches in Kensington area",
    check(intent) {
      assert.equal(intent.primaryCategory, "RELIGIOUS"); assert.equal(intent.experience.strictCategory, true); assert.equal(intent.experience.strictConcept, true);
      assert.ok(intent.geoScopes.some((scope) => /Kensington/i.test(`${scope.label} ${scope.resolvedLabel || ""}`)));
      assert.equal(intent.routeStart, undefined); assert.equal(intent.routeEnd, undefined);
    },
  },
  {
    name: "Wimbledon to St John's Wood exclusions",
    prompt: "I need a one day itinerary starting from Wimbledon and ending around St John's Wood. No museums, just parks, uncommon places, historical locations and something that can be enjoyed more in autumn. I love walking, but the distances may be big, so happy to jump on the tube",
    check(intent) {
      assert.match(intent.routeStart?.label || "", /Wimbledon/i); assert.match(intent.routeEnd?.label || "", /St John'?s Wood/i);
      assert.ok(intent.excludedCategories.includes("MUSEUM")); assert.equal(intent.season, "autumn"); assert.equal(intent.transport, "mixed");
    },
  },
];

const results = [];
for (const item of cases) {
  try {
    const response = await fetch(`${baseUrl}/api/planner/interpret`, {
      method: "POST", headers: { "Content-Type": "application/json", Accept: "application/json" }, body: JSON.stringify({ prompt: item.prompt }),
    });
    const payload = await response.json();
    assert.equal(response.status, 200, `${item.name}: ${JSON.stringify(payload)}`);
    item.check(payload.intent);
    results.push({ name: item.name, passed: true, confidence: payload.intent.confidence,
      geography: payload.intent.geoScopes.map((scope) => `${scope.relation} ${scope.label}`),
      categories: payload.intent.categoryPreferences.map((entry) => `${entry.strength} ${entry.category}`) });
  } catch (error) {
    results.push({ name: item.name, passed: false, error: error instanceof Error ? error.message : String(error) });
  }
}

const passed = results.filter((result) => result.passed).length;
console.log(JSON.stringify({ baseUrl, passed, failed: results.length - passed, cases: results }, null, 2));
assert.equal(passed, results.length, `${results.length - passed} interpreter acceptance case(s) failed`);
