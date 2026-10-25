import { readFile } from "node:fs/promises";
import { additions20261025 } from "../data/additions-20261025.mjs";

const input = process.argv[2]
  ? await readFile(process.argv[2], "utf8")
  : await new Promise((resolve, reject) => {
      let value = "";
      process.stdin.setEncoding("utf8");
      process.stdin.on("data", chunk => { value += chunk; });
      process.stdin.on("end", () => resolve(value));
      process.stdin.on("error", reject);
    });

const payload = JSON.parse(input);
if (!payload.ok || !Array.isArray(payload.places)) throw new Error("The places API response is invalid.");

const failures = [];
for (const expected of additions20261025) {
  const matches = payload.places.filter(place => place.name === expected.name && place.status === "published");
  if (matches.length !== 1) {
    failures.push(`${expected.name}: expected one published record, found ${matches.length}`);
    continue;
  }
  const place = matches[0];
  if (place.category !== expected.category) failures.push(`${expected.name}: category ${place.category}, expected ${expected.category}`);
  if ((place.description || "").length < 80) failures.push(`${expected.name}: English description is incomplete`);
  if ((place.descriptionIt || "").length < 80) failures.push(`${expected.name}: Italian description is incomplete`);
  if ((place.hook || "").length < 35) failures.push(`${expected.name}: English hook is incomplete`);
  if ((place.hookIt || "").length < 35) failures.push(`${expected.name}: Italian hook is incomplete`);
  if (!place.reviewed) failures.push(`${expected.name}: mood profile is not reviewed`);
  if (place.lastVerified !== "2026-10-25") failures.push(`${expected.name}: verification date is ${place.lastVerified || "missing"}`);
  if (expected.officialUrl && place.officialUrl !== expected.officialUrl) failures.push(`${expected.name}: official URL was not updated`);
  if (expected.market && Object.keys(place.openingHours || {}).length === 0) failures.push(`${expected.name}: market hours are missing`);
}

if (failures.length) throw new Error(`Addition verification failed:\n- ${failures.join("\n- ")}`);
const richmondMarket = payload.places.find(place => place.name === "Duck Pond Market Richmond" && place.status === "published");
if (!richmondMarket || Math.abs(richmondMarket.lat - 51.458417) > 0.002 || Math.abs(richmondMarket.lon - -0.3061978) > 0.002) {
  throw new Error("Duck Pond Market Richmond does not resolve to Heron Square.");
}
console.log(`Verified ${additions20261025.length} published bilingual additions across all categories.`);
