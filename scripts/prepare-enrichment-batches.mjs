import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

import { classifySourceAuthority, descriptionQuality, isOfficialAuthority, proposeAccessType, urlHost } from "../src/data-quality.js";

const root = path.resolve(import.meta.dirname, "..");
const outputDirectory = path.join(root, "data", "enrichment");
const snapshot = JSON.parse(await readFile(path.join(root, "public", "pois-snapshot.json"), "utf8"));
const places = snapshot.places || [];

await mkdir(outputDirectory, { recursive: true });

const batches = [
  buildBatch("BATCH-1", "Editorial core", places.filter((place) => place.confidence === "HIGH"),
    "Guide/editorial core and current high mood-confidence records."),
  buildBatch("BATCH-2", "Coverage expansion", places.filter((place) => place.confidence === "MEDIUM"),
    "All current medium mood-confidence records; combined with Batch 1 this exceeds half of the active catalogue."),
];

for (const batch of batches) {
  await writeFile(path.join(outputDirectory, `${batch.code.toLowerCase()}.json`), `${JSON.stringify(batch, null, 2)}\n`);
}

const summary = {
  snapshotGeneratedAt: snapshot.generatedAt,
  totalPlaces: places.length,
  batches: batches.map((batch) => ({ code: batch.code, count: batch.places.length, summary: batch.summary })),
  combinedUniquePlaces: new Set(batches.flatMap((batch) => batch.places.map((place) => place.id))).size,
};
await writeFile(path.join(outputDirectory, "summary.json"), `${JSON.stringify(summary, null, 2)}\n`);
console.log(JSON.stringify(summary, null, 2));

function buildBatch(code, name, selected, purpose) {
  const records = selected.map((place) => {
    const authority = classifySourceAuthority(place.officialUrl);
    const copyQuality = descriptionQuality(place.description, place.hook);
    const access = proposeAccessType(place);
    const issues = [];
    if (!place.officialUrl) issues.push("SOURCE_MISSING");
    else if (!isOfficialAuthority(authority)) issues.push("SOURCE_NOT_OFFICIAL");
    if (copyQuality !== "SPECIFIC") issues.push("DESCRIPTION_GENERIC");
    if (access === "UNKNOWN") issues.push("ACCESS_UNCLEAR");
    issues.push("HOURS_UNCHECKED");
    return {
      id: place.id,
      name: place.name,
      category: place.category,
      lat: place.lat,
      lon: place.lon,
      description: place.description || "",
      hook: place.hook || "",
      accessNotes: place.accessNotes || "",
      visitMode: place.visitMode || "STOP",
      officialUrl: place.officialUrl || "",
      officialHost: urlHost(place.officialUrl),
      sourceAuthority: authority,
      legacyAccessType: place.accessType || "VARIABLE",
      proposedAccessType: access,
      descriptionQuality: copyQuality,
      currentMoodConfidence: place.confidence,
      proposedDataConfidence: place.officialUrl && isOfficialAuthority(authority) && copyQuality === "SPECIFIC" ? "MEDIUM" : "LOW",
      plannerReady: false,
      issues,
    };
  });
  const summary = {
    officialCandidate: records.filter((place) => place.officialUrl && isOfficialAuthority(place.sourceAuthority)).length,
    missingSource: records.filter((place) => !place.officialUrl).length,
    nonOfficialSource: records.filter((place) => place.officialUrl && !isOfficialAuthority(place.sourceAuthority)).length,
    specificDescription: records.filter((place) => place.descriptionQuality === "SPECIFIC").length,
    unclearAccess: records.filter((place) => place.proposedAccessType === "UNKNOWN").length,
  };
  return { schemaVersion: 1, code, name, purpose, generatedAt: new Date().toISOString(), summary, places: records };
}
