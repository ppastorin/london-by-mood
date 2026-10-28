import assert from "node:assert/strict";
import test from "node:test";

import { placeResultCopy } from "../public/place-localization.js";

test("Italian results prefer the translated short copy stored in D1", () => {
  assert.equal(placeResultCopy({
    hook: "An English hook.",
    hookIt: "Un testo breve in italiano.",
    description: "An English description.",
    descriptionIt: "Una descrizione in italiano.",
  }, "it"), "Un testo breve in italiano.");
});

test("Italian results use the translated description when the short copy is missing", () => {
  assert.equal(placeResultCopy({
    hook: "An English hook.",
    descriptionIt: "Una descrizione in italiano.",
  }, "it"), "Una descrizione in italiano.");
});

test("legacy records fall back to English instead of showing an empty result", () => {
  assert.equal(placeResultCopy({ hook: "An English hook." }, "it"), "An English hook.");
});
