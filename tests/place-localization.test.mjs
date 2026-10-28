import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
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

test("Italian results never fall back to English copy", () => {
  assert.equal(
    placeResultCopy({ hook: "An English hook.", description: "An English description." }, "it"),
    "Un luogo di Londra adatto all’umore selezionato.",
  );
});

test("the reported legacy oddities receive Italian copy in D1", async () => {
  const migration = await readFile("migrations/0017_reported_oddities_italian_copy.sql", "utf8");
  assert.match(migration, /WHERE id='O8'/);
  assert.match(migration, /WHERE id='LA-E000F10B'/);
  assert.equal((migration.match(/description_it=/g) || []).length, 2);
  assert.equal((migration.match(/editorial_hook_it=/g) || []).length, 2);
});
