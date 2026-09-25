import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const htmlPath = new URL("../public/smart-navigation/index.html", import.meta.url);
const appPath = new URL("../public/smart-navigation/app.js", import.meta.url);

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
