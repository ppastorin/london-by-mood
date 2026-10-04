import { createHash } from "node:crypto";
import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

import { classifySourceAuthority, isOfficialAuthority, refreshDays } from "../src/data-quality.js";

const root = path.resolve(import.meta.dirname, "..");
const batchName = String(process.argv[2] || "batch-1").toLowerCase();
const batch = JSON.parse(await readFile(path.join(root, "data", "enrichment", `${batchName}.json`), "utf8"));
let discovery = { records: [] };
try { discovery = JSON.parse(await readFile(path.join(root, "data", "enrichment", "discovery", `${batchName}-osm-sources.json`), "utf8")); } catch {}
const discoveryById = new Map(discovery.records.map((record) => [record.id, record]));
let decisions = { records: [] };
try { decisions = JSON.parse(await readFile(path.join(root, "data", "enrichment", "access-decisions.json"), "utf8")); } catch {}
const decisionsById = new Map(decisions.records.map((record) => [record.id, record]));
const evidencePath = path.join(root, "data", "enrichment", "evidence", `${batchName}-source-evidence.json`);
let evidence = { records: [] };
try { evidence = JSON.parse(await readFile(evidencePath, "utf8")); } catch {}
const evidenceById = new Map(evidence.records.map((record) => [record.id, record]));
const generatedDirectory = path.join(root, "data", "enrichment", "generated");
const reviewDirectory = path.join(root, "data", "enrichment", "review");
await Promise.all([mkdir(generatedDirectory, { recursive: true }), mkdir(reviewDirectory, { recursive: true })]);

const sql = [
  "-- GENERATED FILE: apply only after migrations/0003_planner_data_foundation.sql.",
  "-- This candidate set is designed for a local/development D1 database and does not touch production.",
  "PRAGMA foreign_keys = ON;",
  `INSERT OR REPLACE INTO enrichment_batches(batch_code,name,purpose,status) VALUES (${q(batch.code)},${q(batch.name)},${q(batch.purpose)},'REVIEW');`,
];
const reviewRows = [["place_id", "name", "category", "proposed_access", "booking_mode", "admission_type", "issues", "official_url", "source_status", "notes"]];
const accessReviewRows = [["place_id", "name", "category", "legacy_access", "proposed_access", "visit_mode", "access_notes", "official_url"]];
const metrics = { total: 0, high: 0, medium: 0, plannerReady: 0, structuredHours: 0, review: 0 };

for (const originalPlace of batch.places) {
  const discovered = discoveryById.get(originalPlace.id);
  const decision = decisionsById.get(originalPlace.id);
  const place = {
    ...originalPlace,
    officialUrl: decision?.sourceUrl || originalPlace.officialUrl || discovered?.officialUrl || "",
    sourceAuthority: classifySourceAuthority(decision?.sourceUrl || originalPlace.officialUrl || discovered?.officialUrl || ""),
    proposedAccessType: decision?.accessType || originalPlace.proposedAccessType,
  };
  metrics.total += 1;
  const evidence = evidenceById.get(place.id);
  const source = evidence?.requestedUrl === place.officialUrl ? evidence : null;
  const sourceHealthy = source && ["OK", "REDIRECTED"].includes(source.sourceStatus);
  const sourceUrl = source?.finalUrl || place.officialUrl;
  const sourceAuthority = classifySourceAuthority(sourceUrl);
  const sourceRelevant = sourceEvidenceLooksRelevant(place, source);
  const completeHours = validStructuredHours(source?.openingHours || []);
  const accessClarity = place.proposedAccessType === "UNKNOWN" ? "NEEDS_REVIEW" : "CLEAR";
  const bookingMode = decision?.bookingMode || defaultBookingMode(place.proposedAccessType);
  const admissionType = decision?.admissionType || "UNKNOWN";
  const hoursStatus = ["ALWAYS_ACCESSIBLE", "EXTERIOR_ONLY", "PRIVATE_NO_PUBLIC_ACCESS"].includes(place.proposedAccessType)
    ? "NOT_APPLICABLE"
    : completeHours.length ? "VERIFIED" : "UNKNOWN";
  const strongSourceEvidence = sourceHealthy && sourceRelevant && isOfficialAuthority(sourceAuthority) && place.descriptionQuality === "SPECIFIC";
  const dataConfidence = strongSourceEvidence
    ? (decision?.decisionConfidence === "HIGH" ? "HIGH" : "MEDIUM")
    : "LOW";
  const plannerReady = dataConfidence !== "LOW" && accessClarity === "CLEAR" && bookingMode !== "UNKNOWN" &&
    place.proposedAccessType !== "PRIVATE_NO_PUBLIC_ACCESS" && ["VERIFIED", "NOT_APPLICABLE"].includes(hoursStatus);
  if (dataConfidence === "HIGH") metrics.high += 1;
  if (dataConfidence === "MEDIUM") metrics.medium += 1;
  if (plannerReady) metrics.plannerReady += 1;
  if (completeHours.length) metrics.structuredHours += 1;
  const issues = reviewIssues(place, source, sourceAuthority, sourceRelevant, accessClarity, bookingMode, hoursStatus);
  if (issues.length) metrics.review += 1;
  if (issues.some((issue) => issue.type === "ACCESS_UNCLEAR")) {
    accessReviewRows.push([place.id, place.name, place.category, place.legacyAccessType, place.proposedAccessType,
      place.visitMode, place.accessNotes, place.officialUrl]);
  }
  const checkedAt = source?.checkedAt || null;
  const nextCheck = checkedAt ? addDays(checkedAt, refreshDays({ accessType: place.proposedAccessType, category: place.category })) : null;
  const qualityNote = `Prepared by ${batch.code}; factual confidence is separate from mood confidence.${decision ? ` Access reviewed ${decision.checkedAt} (${decision.decisionConfidence}): ${decision.rationale}` : ""}`;

  sql.push(`INSERT OR REPLACE INTO enrichment_batch_places(batch_code,place_id,priority,reason,status) VALUES (${q(batch.code)},${q(place.id)},100,${q(batch.purpose)},${q(issues.length ? "NEEDS_REVIEW" : "READY")});`);
  sql.push(`UPDATE places SET data_confidence=${q(dataConfidence)}, planner_ready=${plannerReady ? 1 : 0}, access_type_v2=${q(place.proposedAccessType)}, booking_mode=${q(bookingMode)}, admission_type=${q(admissionType)}, access_clarity=${q(accessClarity)}, description_quality=${q(place.descriptionQuality)}, hours_status=${q(hoursStatus)}, hours_last_checked_at=${q(checkedAt)}, hours_next_check_at=${q(nextCheck)}, quality_reviewed_at=${q(decision?.checkedAt || checkedAt)}, quality_notes=${q(qualityNote)} WHERE id=${q(place.id)};`);

  if (place.officialUrl) {
    const fingerprint = createHash("sha256").update(`official-web|${place.id}|GENERAL`).digest("hex");
    sql.push(`INSERT INTO place_sources(place_id,provider,source_url,source_name,fingerprint,source_role,authority,is_primary,source_status,http_status,content_hash,last_checked_at,next_check_at,extraction_notes)
      VALUES (${q(place.id)},'official-web',${q(sourceUrl)},${q(place.name)},${q(fingerprint)},'GENERAL',${q(sourceAuthority)},1,${q(source?.sourceStatus || "UNCHECKED")},${numberOrNull(source?.httpStatus)},${q(source?.contentHash || "")},${q(checkedAt)},${q(nextCheck)},${q(source?.error || "")})
      ON CONFLICT(provider,fingerprint) DO UPDATE SET source_url=excluded.source_url, source_status=excluded.source_status,
        http_status=excluded.http_status, content_hash=excluded.content_hash, last_checked_at=excluded.last_checked_at,
        next_check_at=excluded.next_check_at, extraction_notes=excluded.extraction_notes;`);
  }

  if (completeHours.length) {
    sql.push(`DELETE FROM place_opening_periods WHERE place_id=${q(place.id)} AND experience_id IS NULL;`);
    const sequences = new Map();
    for (const period of completeHours) {
      const day = dayNumber(period.day);
      const sequence = (sequences.get(day) || 0) + 1;
      sequences.set(day, sequence);
      sql.push(`INSERT INTO place_opening_periods(place_id,day_of_week,sequence,opens_at,closes_at,valid_from,valid_to,source_id,last_verified_at)
        VALUES (${q(place.id)},${day},${sequence},${q(period.opens)},${q(period.closes)},${q(period.validFrom || null)},${q(period.validThrough || null)},
          (SELECT source_id FROM place_sources WHERE place_id=${q(place.id)} AND provider='official-web' ORDER BY is_primary DESC, source_id LIMIT 1),${q(checkedAt)});`);
    }
  }

  for (const issue of issues) {
    sql.push(`INSERT INTO place_review_issues(place_id,issue_type,severity,summary,evidence_json)
      SELECT ${q(place.id)},${q(issue.type)},${q(issue.severity)},${q(issue.summary)},${q(JSON.stringify(issue.evidence))}
      WHERE NOT EXISTS (SELECT 1 FROM place_review_issues WHERE place_id=${q(place.id)} AND issue_type=${q(issue.type)} AND status='OPEN');`);
  }
  reviewRows.push([place.id, place.name, place.category, place.proposedAccessType, bookingMode, admissionType,
    issues.map((issue) => issue.type).join("|"), place.officialUrl, source?.sourceStatus || "UNCHECKED", issues.map((issue) => issue.summary).join(" ")]);
}

sql.push("UPDATE app_meta SET value = CAST(value AS INTEGER) + 1, updated_at=CURRENT_TIMESTAMP WHERE key='data_version';");
const sqlPath = path.join(generatedDirectory, `${batchName}-candidates.sql`);
const reviewPath = path.join(reviewDirectory, `${batchName}-review.csv`);
const accessReviewPath = path.join(reviewDirectory, `${batchName}-access-review.csv`);
await Promise.all([
  writeFile(sqlPath, `${sql.join("\n")}\n`),
  writeFile(reviewPath, `${reviewRows.map((row) => row.map(csv).join(",")).join("\n")}\n`),
  writeFile(accessReviewPath, `${accessReviewRows.map((row) => row.map(csv).join(",")).join("\n")}\n`),
]);
console.log(JSON.stringify({ batch: batch.code, sqlPath, reviewPath, accessReviewPath, metrics }, null, 2));

function reviewIssues(place, source, sourceAuthority, sourceRelevant, accessClarity, bookingMode, hoursStatus) {
  const issues = [];
  if (!place.officialUrl) issues.push(issue("SOURCE_MISSING", "HIGH", "Find an official or authoritative source URL."));
  else if (!isOfficialAuthority(sourceAuthority)) issues.push(issue("SOURCE_CONFLICT", "HIGH", "The current or redirected link is editorial or third-party evidence, not an official source.", { url: source?.finalUrl || place.officialUrl }));
  else if (!sourceRelevant) issues.push(issue("SOURCE_CONFLICT", "HIGH", "The source appears to describe a different organisation or place and needs human review.", { url: source?.finalUrl || place.officialUrl, title: source?.title || "" }));
  else if (!source) issues.push(issue("SOURCE_MISSING", "MEDIUM", "The official-source candidate has not yet been fetched.", { url: place.officialUrl }));
  else if (source.sourceStatus === "BLOCKED") issues.push(issue("OTHER", "MEDIUM", "The source blocks automated checks; verify it manually.", { url: source.finalUrl, httpStatus: source.httpStatus }));
  else if (source.sourceStatus === "BROKEN") issues.push(issue("LINK_BROKEN", "HIGH", "The source timed out or failed and needs checking.", { url: source.finalUrl, httpStatus: source.httpStatus, error: source.error }));
  if (place.descriptionQuality !== "SPECIFIC") issues.push(issue("DESCRIPTION_GENERIC", "MEDIUM", "Replace generic copy with a concise place-specific description."));
  if (accessClarity !== "CLEAR") issues.push(issue("ACCESS_UNCLEAR", "MEDIUM", "Choose the practical access type for planning."));
  if (bookingMode === "UNKNOWN" && !["UNKNOWN", "PRIVATE_NO_PUBLIC_ACCESS"].includes(place.proposedAccessType)) {
    issues.push(issue("BOOKING_UNCLEAR", "MEDIUM", "Confirm whether advance booking is optional, recommended or required."));
  }
  if (hoursStatus === "UNKNOWN" && accessClarity === "CLEAR") issues.push(issue("HOURS_UNCLEAR", "MEDIUM", "Confirm opening days and hours from the official source."));
  return issues;
}

function defaultBookingMode(accessType) {
  if (["ALWAYS_ACCESSIBLE", "EXTERIOR_ONLY", "PRIVATE_NO_PUBLIC_ACCESS"].includes(accessType)) return "NONE";
  if (["BOOKING_REQUIRED", "APPOINTMENT_ONLY", "EVENT_ONLY"].includes(accessType)) return "REQUIRED";
  return "UNKNOWN";
}

function sourceEvidenceLooksRelevant(place, source) {
  if (!source) return true;
  const text = `${source.title || ""} ${source.metaDescription || ""}`.toLowerCase();
  if (place.category === "MUSEUM" && /\b(accountants?|bookkeeping|tax planning|payroll services?)\b/.test(text)) return false;
  return true;
}

function issue(type, severity, summary, evidence = {}) { return { type, severity, summary, evidence }; }
function validStructuredHours(values) {
  const valid = values.filter((value) => value.day && /^\d{2}:\d{2}$/.test(value.opens || "") && /^\d{2}:\d{2}$/.test(value.closes || "") && dayNumber(value.day) !== null);
  return valid.length <= 21 ? valid : [];
}
function dayNumber(value) { return ({ Sunday: 0, Monday: 1, Tuesday: 2, Wednesday: 3, Thursday: 4, Friday: 5, Saturday: 6 })[String(value).split("/").pop()] ?? null; }
function addDays(value, days) { const date = new Date(value); date.setUTCDate(date.getUTCDate() + days); return date.toISOString(); }
function numberOrNull(value) { return Number.isFinite(Number(value)) ? String(Number(value)) : "NULL"; }
function q(value) { return value === null || value === undefined ? "NULL" : `'${String(value).replaceAll("'", "''")}'`; }
function csv(value) { const text = String(value ?? ""); return /[",\n]/.test(text) ? `"${text.replaceAll('"', '""')}"` : text; }
