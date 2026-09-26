import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const htmlPath = new URL("../public/smart-navigation/index.html", import.meta.url);
const appPath = new URL("../public/smart-navigation/app.js", import.meta.url);
const i18nPath = new URL("../public/smart-navigation/i18n.js", import.meta.url);

test("Smart Navigation offers map selection for both route endpoints", async () => {
  const html = await readFile(htmlPath, "utf8");
  const app = await readFile(appPath, "utf8");

  assert.match(html, /id="pick-start"[^>]*>Choose on map<\/button>/);
  assert.match(html, /id="pick-end"[^>]*>Choose on map<\/button>/);
  assert.match(app, /state\.map\.on\("click"/);
  assert.match(app, /startMapPicking\("start"\)/);
  assert.match(app, /startMapPicking\("end"\)/);
  assert.match(app, /event\.latlng\.lat/);
  assert.match(app, /event\.latlng\.lng/);
});

test("Smart Navigation serves a complete Italian interface when lang=it", async () => {
  const html = await readFile(htmlPath, "utf8");
  const app = await readFile(appPath, "utf8");
  const i18n = await readFile(i18nPath, "utf8");

  assert.match(html, /smart-navigation\/i18n\.js/);
  assert.match(i18n, /get\("lang"\) === "it"/);
  assert.match(i18n, /Navigazione intelligente/);
  assert.match(i18n, /Calcola il percorso a piedi/);
  assert.match(i18n, /Santander Cycles nelle vicinanze/);
  assert.match(i18n, /Deviazioni che meritano/);
  assert.match(app, /Luoghi religiosi/);
  assert.match(app, /localizeError\(error\.message\)/);
});
