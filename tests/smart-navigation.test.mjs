import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const htmlPath = new URL("../public/smart-navigation/index.html", import.meta.url);
const appPath = new URL("../public/smart-navigation/app.js", import.meta.url);
const i18nPath = new URL("../public/smart-navigation/i18n.js", import.meta.url);
const stylesPath = new URL("../public/smart-navigation/styles.css", import.meta.url);

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
  assert.match(i18n, /Distanza dal percorso/);
  assert.match(i18n, /Santander Cycles nelle vicinanze/);
  assert.match(i18n, /Deviazioni che meritano/);
  assert.match(app, /Luoghi religiosi/);
  assert.match(app, /aria-label","Ingrandisci/);
  assert.match(app, /localizeError\(error\.message\)/);
});

test("Smart Navigation provides a mobile-first nine-stop Google Maps itinerary", async () => {
  const html = await readFile(htmlPath, "utf8");
  const app = await readFile(appPath, "utf8");
  const i18n = await readFile(i18nPath, "utf8");

  assert.match(html, /id="use-location"/);
  assert.match(html, /id="itinerary-list"/);
  assert.match(html, /id="navigate"[^>]*target="_blank"/);
  assert.match(html, /id="mobile-itinerary-bar"/);
  assert.match(app, /MAX_STOPS/);
  assert.match(app, /buildGoogleMapsUrl/);
  assert.match(app, /navigator\.geolocation\.getCurrentPosition/);
  assert.match(app, /localStorage\.setItem/);
  assert.match(app, /via,end:state\.end/);
  assert.match(i18n, /Aggiungi fino a nove luoghi/);
  assert.match(i18n, /Naviga con Google Maps/);
});

test("Clear route returns Smart Navigation to a blank state without reloading", async () => {
  const html = await readFile(htmlPath, "utf8");
  const app = await readFile(appPath, "utf8");
  const i18n = await readFile(i18nPath, "utf8");
  const styles = await readFile(stylesPath, "utf8");

  assert.match(html, /id="reset"[^>]*>Clear route<\/button>/);
  assert.match(app, /state\.start=null;state\.end=null;state\.corridor=200/);
  assert.match(app, /state\.map\.setView\(\[51\.5074,-\.1278\],11\)/);
  assert.match(app, /localStorage\.removeItem\(STORAGE_KEY\)/);
  assert.doesNotMatch(app, /location\.reload\(\)/);
  assert.match(i18n, /Cancella percorso/);
  assert.match(i18n, /Percorso cancellato/);
  assert.match(styles, /\.summary\[hidden\]\{display:none!important\}/);
});

test("Smart Navigation removes duplicate branding only when embedded", async () => {
  const html = await readFile(htmlPath, "utf8");
  const styles = await readFile(stylesPath, "utf8");

  assert.match(html, /window\.self !== window\.top/);
  assert.match(html, /document\.documentElement\.classList\.add\("embedded"\)/);
  assert.match(html, /<header class="topbar">/);
  assert.match(styles, /\.embedded \.topbar\{display:none\}/);
  assert.match(styles, /\.embedded \.message\{margin-top:8px\}/);
});
