import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

import { classifySourceAuthority, urlHost } from "../src/data-quality.js";

const root = path.resolve(import.meta.dirname, "..");
const batchName = String(process.argv[2] || "batch-2").toLowerCase();
const batchPath = path.join(root, "data", "enrichment", `${batchName}.json`);
const outputDirectory = path.join(root, "data", "enrichment", "discovery");
const outputPath = path.join(outputDirectory, `${batchName}-osm-sources.json`);
const batch = JSON.parse(await readFile(batchPath, "utf8"));
let previous = { records: [] };
try { previous = JSON.parse(await readFile(outputPath, "utf8")); } catch {}
const previousById = new Map(previous.records.map((record) => [record.id, record]));
const records = [];
await mkdir(outputDirectory, { recursive: true });

for (const [index, place] of batch.places.entries()) {
  const cached = previousById.get(place.id);
  if (cached?.checkedAt) records.push(cached);
  else records.push(await discover(place));
  if ((index + 1) % 25 === 0 || index === batch.places.length - 1) {
    await writeReport(records, false);
    console.log(`Checked ${index + 1}/${batch.places.length}`);
  }
  if (!cached?.checkedAt && index < batch.places.length - 1) await new Promise((resolve) => setTimeout(resolve, 1050));
}
await writeReport(records, true);

async function writeReport(current, complete) {
  const report = {
    schemaVersion: 1,
    batchCode: batch.code,
    generatedAt: new Date().toISOString(),
    complete,
    checked: current.length,
    officialUrlCandidates: current.filter((record) => record.officialUrl).length,
    openingHoursCandidates: current.filter((record) => record.osmOpeningHours).length,
    records: current,
  };
  await writeFile(outputPath, `${JSON.stringify(report, null, 2)}\n`);
  if (complete) console.log(JSON.stringify({ outputPath, checked: report.checked, officialUrlCandidates: report.officialUrlCandidates, openingHoursCandidates: report.openingHoursCandidates }, null, 2));
}

async function discover(place) {
  const checkedAt = new Date().toISOString();
  const endpoint = new URL("https://nominatim.openstreetmap.org/search");
  endpoint.searchParams.set("format", "jsonv2");
  endpoint.searchParams.set("q", `${place.name}, London, UK`);
  endpoint.searchParams.set("limit", "5");
  endpoint.searchParams.set("countrycodes", "gb");
  endpoint.searchParams.set("extratags", "1");
  endpoint.searchParams.set("namedetails", "1");
  endpoint.searchParams.set("viewbox", `${place.lon - .03},${place.lat + .02},${place.lon + .03},${place.lat - .02}`);
  endpoint.searchParams.set("bounded", "1");
  try {
    const response = await fetch(endpoint, {
      headers: {
        Accept: "application/json",
        "Accept-Language": "en-GB,en;q=0.8",
        "User-Agent": "LondonAdvanced-Research/1.0 (+https://www.londonadvanced.com/)",
      },
      signal: AbortSignal.timeout(15000),
    });
    if (!response.ok) throw new Error(`Nominatim returned ${response.status}`);
    const candidates = (await response.json()).map((candidate) => rankCandidate(place, candidate))
      .filter((candidate) => candidate.distanceM <= 1200 && candidate.nameSimilarity >= .3)
      .sort((left, right) => right.score - left.score);
    const match = candidates[0];
    const tags = match?.raw?.extratags || {};
    const officialUrl = firstHttpUrl(tags.website, tags["contact:website"], tags["operator:website"]);
    return {
      id: place.id,
      name: place.name,
      checkedAt,
      matchedName: match?.raw?.name || "",
      distanceM: match ? Math.round(match.distanceM) : null,
      nameSimilarity: match ? Number(match.nameSimilarity.toFixed(3)) : null,
      osmType: match?.raw?.osm_type || "",
      osmId: match?.raw?.osm_id || null,
      officialUrl,
      officialHost: urlHost(officialUrl),
      sourceAuthority: officialUrl ? classifySourceAuthority(officialUrl) : "THIRD_PARTY",
      osmOpeningHours: String(tags.opening_hours || ""),
      operator: String(tags.operator || ""),
      wikidata: String(tags.wikidata || ""),
      wikipedia: String(tags.wikipedia || ""),
      error: "",
    };
  } catch (error) {
    return { id: place.id, name: place.name, checkedAt, matchedName: "", distanceM: null, nameSimilarity: null,
      osmType: "", osmId: null, officialUrl: "", officialHost: "", sourceAuthority: "THIRD_PARTY",
      osmOpeningHours: "", operator: "", wikidata: "", wikipedia: "", error: String(error?.message || error).slice(0, 300) };
  }
}

function rankCandidate(place, candidate) {
  const distanceM = haversineKm(place.lat, place.lon, Number(candidate.lat), Number(candidate.lon)) * 1000;
  const nameSimilarity = similarity(place.name, candidate.name || candidate.display_name?.split(",")[0]);
  return { raw: candidate, distanceM, nameSimilarity, score: nameSimilarity * 1000 - Math.min(distanceM, 2000) / 4 };
}

function similarity(left, right) {
  const a = normalName(left), b = normalName(right);
  if (!a || !b) return 0;
  if (a === b) return 1;
  if (a.includes(b) || b.includes(a)) return Math.min(a.length, b.length) / Math.max(a.length, b.length);
  const first = new Set(a.split(" ")), second = new Set(b.split(" "));
  const overlap = [...first].filter((token) => second.has(token)).length;
  return overlap / Math.max(first.size, second.size);
}

function normalName(value) { return String(value || "").normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/^the\s+/, "").replace(/[^a-z0-9]+/g, " ").trim(); }
function firstHttpUrl(...values) { for (const value of values) { try { const url = new URL(value); if (["http:", "https:"].includes(url.protocol)) return url.href; } catch {} } return ""; }
function haversineKm(lat1, lon1, lat2, lon2) { const radius = 6371, rad = (value) => value * Math.PI / 180; const dLat = rad(lat2-lat1), dLon = rad(lon2-lon1); const a = Math.sin(dLat/2)**2 + Math.cos(rad(lat1))*Math.cos(rad(lat2))*Math.sin(dLon/2)**2; return 2*radius*Math.atan2(Math.sqrt(a),Math.sqrt(1-a)); }
