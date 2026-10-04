import assert from "node:assert/strict";
import test from "node:test";

import { assessPlannerReadiness, classifySourceAuthority, descriptionQuality, isOfficialAuthority, proposeAccessType, refreshDays } from "../src/data-quality.js";

test("official and third-party sources are kept distinct", () => {
  assert.equal(classifySourceAuthority("https://www.parliament.uk/visit/"), "PUBLIC_AUTHORITY");
  assert.equal(classifySourceAuthority("https://historicengland.org.uk/listing/the-list/list-entry/1080656"), "PUBLIC_AUTHORITY");
  assert.equal(classifySourceAuthority("https://example-museum.org/visit"), "OWNER_OPERATOR");
  assert.equal(classifySourceAuthority("https://en.wikipedia.org/wiki/Test"), "THIRD_PARTY");
});

test("editorial references never satisfy the official-source gate", () => {
  assert.equal(classifySourceAuthority("https://www.atlasobscura.com/places/example"), "THIRD_PARTY");
  assert.equal(classifySourceAuthority("https://www.ianvisits.co.uk/articles/example"), "TRUSTED_EDITORIAL");
  assert.equal(classifySourceAuthority("https://secretldn.com/example"), "TRUSTED_EDITORIAL");
  assert.equal(isOfficialAuthority("TRUSTED_EDITORIAL"), false);
  assert.equal(isOfficialAuthority("OWNER_OPERATOR"), true);
});

test("generic catalogue copy is not treated as planner-ready editorial content", () => {
  assert.equal(descriptionQuality("A distinctive London building worth noticing."), "GENERIC");
  assert.equal(descriptionQuality(""), "MISSING");
  assert.equal(descriptionQuality("A small riverside garden created from a former industrial wharf, with surviving dock features and a quiet view towards the Thames. It works best as a short stop between nearby walks rather than as a destination for an entire afternoon."), "SPECIFIC");
});

test("medium confidence is planner-ready when the official source, access and hours are usable", () => {
  const result = assessPlannerReadiness({
    officialUrl: "https://example-museum.org/visit",
    description: "A small riverside garden created from a former industrial wharf, with surviving dock features and a quiet view towards the Thames. It works best as a short stop between nearby walks rather than as a destination for an entire afternoon.",
    dataConfidence: "MEDIUM",
    accessClarity: "CLEAR",
    bookingMode: "NONE",
    hoursStatus: "VERIFIED",
  });
  assert.equal(result.plannerReady, true);
  assert.deepEqual(result.issues, []);
});

test("unclear access is surfaced even when all other evidence is strong", () => {
  const result = assessPlannerReadiness({
    officialUrl: "https://example-museum.org/visit",
    description: "A small riverside garden created from a former industrial wharf, with surviving dock features and a quiet view towards the Thames. It works best as a short stop between nearby walks rather than as a destination for an entire afternoon.",
    dataConfidence: "HIGH",
    accessClarity: "NEEDS_REVIEW",
    bookingMode: "NONE",
    hoursStatus: "VERIFIED",
  });
  assert.equal(result.plannerReady, false);
  assert.deepEqual(result.issues, ["ACCESS_UNCLEAR"]);
});

test("private places and unresolved booking cannot enter a generated plan", () => {
  const base = {
    officialUrl: "https://example-museum.org/visit",
    description: "A small riverside garden created from a former industrial wharf, with surviving dock features and a quiet view towards the Thames. It works best as a short stop between nearby walks rather than as a destination for an entire afternoon.",
    dataConfidence: "MEDIUM",
    accessClarity: "CLEAR",
    hoursStatus: "NOT_APPLICABLE",
  };
  assert.equal(assessPlannerReadiness({ ...base, accessType: "EXTERIOR_ONLY", bookingMode: "UNKNOWN" }).plannerReady, false);
  assert.equal(assessPlannerReadiness({ ...base, accessType: "PRIVATE_NO_PUBLIC_ACCESS", bookingMode: "NONE" }).plannerReady, false);
});

test("refresh cadence is tighter for volatile access", () => {
  assert.equal(refreshDays({ accessType: "EVENT_ONLY", category: "BUILDING" }), 7);
  assert.equal(refreshDays({ accessType: "TIMETABLED", category: "MUSEUM" }), 28);
  assert.equal(refreshDays({ accessType: "ALWAYS_ACCESSIBLE", category: "AREA" }), 90);
});

test("access proposals reduce routine ambiguity without guessing complex buildings", () => {
  assert.equal(proposeAccessType({ accessType: "24H", category: "AREA" }), "ALWAYS_ACCESSIBLE");
  assert.equal(proposeAccessType({ accessType: "VARIABLE", category: "MUSEUM" }), "TIMETABLED");
  assert.equal(proposeAccessType({ accessType: "VARIABLE", category: "VIEWPOINT" }), "EXTERIOR_ONLY");
  assert.equal(proposeAccessType({ accessType: "VARIABLE", category: "BUILDING", visitMode: "EXPLORE" }), "UNKNOWN");
});
