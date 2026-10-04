import { createHash } from "node:crypto";
import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

import { classifySourceAuthority, isOfficialAuthority } from "../src/data-quality.js";

const root = path.resolve(import.meta.dirname, "..");
const batchCode = String(process.argv[2] || "batch-1").toLowerCase();
const inputPath = path.join(root, "data", "enrichment", `${batchCode}.json`);
const outputDirectory = path.join(root, "data", "enrichment", "evidence");
const outputPath = path.join(outputDirectory, `${batchCode}-source-evidence.json`);
const batch = JSON.parse(await readFile(inputPath, "utf8"));
let discovery = { records: [] };
try { discovery = JSON.parse(await readFile(path.join(root, "data", "enrichment", "discovery", `${batchCode}-osm-sources.json`), "utf8")); } catch {}
const discoveryById = new Map(discovery.records.map((record) => [record.id, record]));
let decisions = { records: [] };
try { decisions = JSON.parse(await readFile(path.join(root, "data", "enrichment", "access-decisions.json"), "utf8")); } catch {}
const decisionsById = new Map(decisions.records.map((record) => [record.id, record]));
const candidates = batch.places.map((place) => {
  const found = discoveryById.get(place.id);
  const sourceUrl = decisionsById.get(place.id)?.sourceUrl || place.officialUrl || found?.officialUrl || "";
  return { ...place, officialUrl: sourceUrl, sourceAuthority: classifySourceAuthority(sourceUrl) };
}).filter((place) => place.officialUrl && isOfficialAuthority(place.sourceAuthority));
const results = new Array(candidates.length);
let previous = { records: [] };
try { previous = JSON.parse(await readFile(outputPath, "utf8")); } catch {}
const refreshAll = process.argv.includes("--refresh-all");
const previousAgeMs = Date.now() - new Date(previous.generatedAt || 0).getTime();
const reusePrevious = !refreshAll && (previous.complete === false || previousAgeMs < 24 * 60 * 60 * 1000);
const resumableById = new Map((reusePrevious ? previous.records : []).map((record) => [record.id, record]));
const pendingIndexes = [];
for (const [index, candidate] of candidates.entries()) {
  const cached = resumableById.get(candidate.id);
  if (cached?.requestedUrl === candidate.officialUrl) results[index] = cached;
  else pendingIndexes.push(index);
}
let cursor = 0;
let completed = results.filter(Boolean).length;
let checkpointPromise = Promise.resolve();

await mkdir(outputDirectory, { recursive: true });
await Promise.all(Array.from({ length: Math.min(3, pendingIndexes.length) }, async () => {
  while (cursor < pendingIndexes.length) {
    const index = pendingIndexes[cursor++];
    results[index] = await fetchEvidence(candidates[index]);
    completed += 1;
    if (completed % 10 === 0) {
      const snapshot = results.filter(Boolean);
      checkpointPromise = checkpointPromise.then(() => writeReport(snapshot, false));
      console.log(`Checked ${completed}/${candidates.length}`);
    }
  }
}));
await checkpointPromise;

const report = await writeReport(results, true);
console.log(JSON.stringify({ outputPath, ...Object.fromEntries(Object.entries(report).filter(([key]) => key !== "records")) }, null, 2));

async function writeReport(records, complete) {
  const report = {
    schemaVersion: 1,
    batchCode: batch.code,
    generatedAt: new Date().toISOString(),
    complete,
    attempted: candidates.length,
    checked: records.length,
    ok: records.filter((result) => result.sourceStatus === "OK" || result.sourceStatus === "REDIRECTED").length,
    blocked: records.filter((result) => result.sourceStatus === "BLOCKED").length,
    broken: records.filter((result) => result.sourceStatus === "BROKEN").length,
    structuredHoursFound: records.filter((result) => result.openingHours.length).length,
    records,
  };
  await writeFile(outputPath, `${JSON.stringify(report, null, 2)}\n`);
  return report;
}

async function fetchEvidence(place) {
  const checkedAt = new Date().toISOString();
  try {
    const response = await fetch(place.officialUrl, {
      redirect: "follow",
      headers: {
        Accept: "text/html,application/xhtml+xml",
        "Accept-Language": "en-GB,en;q=0.8",
        "User-Agent": "LondonAdvanced-Research/1.0 (+https://www.londonadvanced.com/)",
      },
      signal: AbortSignal.timeout(15000),
    });
    const finalUrl = response.url || place.officialUrl;
    const redirected = normalUrl(finalUrl) !== normalUrl(place.officialUrl);
    const html = await readText(response, 2_000_000);
    const blocked = response.status === 401 || response.status === 403 || response.status === 429 || /captcha|access denied|just a moment/i.test(html.slice(0, 5000));
    const sourceStatus = blocked ? "BLOCKED" : response.ok ? (redirected ? "REDIRECTED" : "OK") : "BROKEN";
    return {
      id: place.id,
      name: place.name,
      requestedUrl: place.officialUrl,
      finalUrl,
      sourceAuthority: place.sourceAuthority,
      sourceStatus,
      httpStatus: response.status,
      checkedAt,
      contentHash: createHash("sha256").update(html).digest("hex"),
      title: decodeEntities(firstMatch(html, /<title[^>]*>([\s\S]*?)<\/title>/i)).replace(/\s+/g, " ").trim().slice(0, 240),
      metaDescription: decodeEntities(firstMatch(html, /<meta[^>]+name=["']description["'][^>]+content=["']([^"']*)/i) || firstMatch(html, /<meta[^>]+content=["']([^"']*)["'][^>]+name=["']description["']/i)).trim().slice(0, 600),
      openingHours: extractStructuredHours(html, place.name),
      openingTextCandidates: extractOpeningText(html),
      error: "",
    };
  } catch (error) {
    return {
      id: place.id,
      name: place.name,
      requestedUrl: place.officialUrl,
      finalUrl: place.officialUrl,
      sourceAuthority: place.sourceAuthority,
      sourceStatus: "BROKEN",
      httpStatus: null,
      checkedAt,
      contentHash: "",
      title: "",
      metaDescription: "",
      openingHours: [],
      openingTextCandidates: [],
      error: String(error?.message || error).slice(0, 300),
    };
  }
}

function extractStructuredHours(html, placeName) {
  const scripts = [...html.matchAll(/<script[^>]+type=["']application\/ld\+json["'][^>]*>([\s\S]*?)<\/script>/gi)];
  const candidates = [];
  for (const match of scripts) {
    try {
      const parsed = JSON.parse(decodeEntities(match[1]).replace(/^\s*<!--|-->\s*$/g, ""));
      walk(parsed, (object) => {
        const specification = object.openingHoursSpecification;
        if (specification) candidates.push({ name: String(object.name || ""), values: normaliseSpecifications(specification) });
        if (object.openingHours && !specification) {
          const values = Array.isArray(object.openingHours) ? object.openingHours : [object.openingHours];
          candidates.push({ name: String(object.name || ""), values: values.map((value) => ({ raw: String(value) })) });
        }
      });
    } catch {}
  }
  if (!candidates.length) return [];
  const ranked = candidates.map((candidate) => ({ ...candidate, score: nameSimilarity(placeName, candidate.name) }))
    .sort((left, right) => right.score - left.score);
  const selected = ranked[0].score >= .3 ? ranked[0] : ranked.length === 1 ? ranked[0] : null;
  return selected ? uniqueObjects(selected.values).slice(0, 40) : [];
}

function normaliseSpecifications(value) {
  return (Array.isArray(value) ? value : [value]).flatMap((item) => {
    if (!item || typeof item !== "object") return [];
    const days = Array.isArray(item.dayOfWeek) ? item.dayOfWeek : [item.dayOfWeek].filter(Boolean);
    return (days.length ? days : [""]).map((day) => ({
      day: String(day).split("/").pop(),
      opens: item.opens || "",
      closes: item.closes || "",
      validFrom: item.validFrom || "",
      validThrough: item.validThrough || "",
    }));
  });
}

function extractOpeningText(html) {
  const text = decodeEntities(html
    .replace(/<script[\s\S]*?<\/script>/gi, " ")
    .replace(/<style[\s\S]*?<\/style>/gi, " ")
    .replace(/<[^>]+>/g, " ")
    .replace(/\s+/g, " "));
  const matches = [];
  for (const pattern of [/opening hours?/ig, /opening times?/ig, /visitor hours?/ig, /open daily/ig]) {
    let match;
    while ((match = pattern.exec(text)) && matches.length < 8) {
      matches.push(text.slice(Math.max(0, match.index - 80), match.index + 360).trim());
    }
  }
  return [...new Set(matches)].slice(0, 8);
}

function walk(value, callback) {
  if (Array.isArray(value)) return value.forEach((item) => walk(item, callback));
  if (!value || typeof value !== "object") return;
  callback(value);
  Object.values(value).forEach((item) => walk(item, callback));
}

function uniqueObjects(values) {
  const seen = new Set();
  return values.filter((value) => {
    const key = JSON.stringify(value);
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  });
}

function nameSimilarity(left, right) {
  const a = normalName(left), b = normalName(right);
  if (!a || !b) return 0;
  if (a === b) return 1;
  if (a.includes(b) || b.includes(a)) return Math.min(a.length, b.length) / Math.max(a.length, b.length);
  const first = new Set(a.split(" ")), second = new Set(b.split(" "));
  return [...first].filter((token) => second.has(token)).length / Math.max(first.size, second.size);
}

function normalName(value) { return String(value || "").normalize("NFKD").replace(/[\u0300-\u036f]/g, "").toLowerCase().replace(/^the\s+/, "").replace(/[^a-z0-9]+/g, " ").trim(); }

function firstMatch(value, pattern) { return value.match(pattern)?.[1] || ""; }
function normalUrl(value) { try { const url = new URL(value); return `${url.hostname.replace(/^www\./, "")}${url.pathname.replace(/\/$/, "")}`; } catch { return value; } }
function decodeEntities(value) { return String(value || "").replace(/&amp;/g, "&").replace(/&quot;/g, '"').replace(/&#39;|&apos;/g, "'").replace(/&lt;/g, "<").replace(/&gt;/g, ">").replace(/&nbsp;/g, " "); }

async function readText(response, maximumBytes) {
  if (!response.body?.getReader) return (await response.text()).slice(0, maximumBytes);
  const reader = response.body.getReader();
  const chunks = [];
  let total = 0;
  while (total < maximumBytes) {
    const { done, value } = await reader.read();
    if (done) break;
    const remaining = maximumBytes - total;
    chunks.push(value.length <= remaining ? value : value.slice(0, remaining));
    total += Math.min(value.length, remaining);
  }
  if (total >= maximumBytes) await reader.cancel();
  const bytes = new Uint8Array(total);
  let offset = 0;
  for (const chunk of chunks) { bytes.set(chunk, offset); offset += chunk.length; }
  return new TextDecoder().decode(bytes);
}
