import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import test from "node:test";
import { additions20261025 } from "../data/additions-20261025.mjs";

const makePayload = () => ({
  ok: true,
  places: additions20261025.map((expected) => ({
    name: expected.name,
    category: expected.category,
    status: "published",
    description: expected.en.padEnd(81, "."),
    descriptionIt: expected.it.padEnd(81, "."),
    hook: expected.en.padEnd(36, "."),
    hookIt: expected.it.padEnd(36, "."),
    reviewed: true,
    lastVerified: "2026-10-25",
    officialUrl: expected.officialUrl,
    openingHours: expected.market ? { sat: { open: "10:00", close: "16:00" } } : {},
    lat: expected.name === "Duck Pond Market Richmond" ? 51.458417 : 51.5,
    lon: expected.name === "Duck Pond Market Richmond" ? -0.3061978 : -0.1,
  })),
});

const verify = (payload) => spawnSync(
  process.execPath,
  ["scripts/verify-additions-20261025.mjs"],
  { cwd: process.cwd(), input: JSON.stringify(payload), encoding: "utf8" },
);

test("addition verification accepts later editorial review dates and canonical URL changes", () => {
  const payload = makePayload();
  for (const place of payload.places) place.lastVerified = "2026-10-28";
  const michaelBond = payload.places.find(({ name }) => name === "Michael Bond Grave");
  michaelBond.officialUrl = "https://www.brent.gov.uk/births-deaths-marriages-nationality/deaths-and-funeral-services/brent-cemeteries/paddington-old-cemetery";
  const result = verify(payload);
  assert.equal(result.status, 0, result.stderr);
});

test("addition verification rejects dates older than the accepted baseline", () => {
  const payload = makePayload();
  payload.places[0].lastVerified = "2026-10-24";
  const result = verify(payload);
  assert.equal(result.status, 1);
  assert.match(result.stderr, /predates accepted baseline 2026-10-25/);
});

test("addition verification rejects invalid dates and insecure official URLs", () => {
  const payload = makePayload();
  payload.places[0].lastVerified = "2026-02-31";
  payload.places[0].officialUrl = "http://example.com/not-authoritative";
  const result = verify(payload);
  assert.equal(result.status, 1);
  assert.match(result.stderr, /verification date is missing or invalid/);
  assert.match(result.stderr, /official URL is missing or is not a secure HTTPS URL/);
});
