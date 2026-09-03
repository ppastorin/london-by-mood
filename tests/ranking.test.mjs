import assert from "node:assert/strict";
import test from "node:test";

import { distanceKm, estimateTravelMinutes, pressureLabel, rankPois } from "../public/ranking.js";

const basePoi = {
  category: "AREA",
  touristIntensity: 40,
  visitMinutes: 30,
  stations: [],
  timeAffinity: { mon_thu_10_13: 50 },
  moods: { quiet: 0, unexpected: 0, beautiful: 0, weird: 0, local: 0, green: 0, atmospheric: 0, lively: 0 },
  hook: "Test place",
  bestTime: "ANY",
  weatherFit: "ANY",
  visitMode: "STOP",
  reviewed: true,
  confidence: "HIGH",
};

test("Charing Cross to Barbican has conservative mode-specific estimates", () => {
  const distance = distanceKm(51.5079, -0.1281, 51.520003, -0.0931621);
  assert.ok(distance > 2.7 && distance < 2.9);
  assert.equal(estimateTravelMinutes(distance, "walking"), 43);
  assert.equal(estimateTravelMinutes(distance, "transit"), 23);
});

test("a strong mood match beats a nearby weak match", () => {
  const pois = [
    {
      ...basePoi,
      id: "strong",
      name: "Strong",
      lat: 51.53,
      lon: -0.12,
      moods: { ...basePoi.moods, quiet: 3 },
    },
    {
      ...basePoi,
      id: "weak",
      name: "Weak",
      lat: 51.508,
      lon: -0.128,
      moods: { ...basePoi.moods, quiet: 2 },
    },
  ];

  const results = rankPois(pois, {
    mood: "quiet",
    lat: 51.5079,
    lon: -0.1281,
    horizonHours: 0,
    travelMode: "transit",
    maxTravelMinutes: 45,
    weather: "dry",
    wander: false,
    now: new Date("2026-09-03T10:30:00Z"),
  });

  assert.equal(results[0].id, "strong");
});

test("maximum journey filtering respects the selected travel mode", () => {
  const candidate = {
    ...basePoi,
    id: "candidate",
    name: "Candidate",
    lat: 51.535,
    lon: -0.1281,
    moods: { ...basePoi.moods, quiet: 3 },
  };
  const context = {
    mood: "quiet",
    lat: 51.5079,
    lon: -0.1281,
    horizonHours: 0,
    maxTravelMinutes: 30,
    weather: "dry",
    wander: false,
    now: new Date("2026-09-03T10:30:00Z"),
  };

  assert.equal(rankPois([candidate], { ...context, travelMode: "transit" }).length, 1);
  assert.equal(rankPois([candidate], { ...context, travelMode: "walking" }).length, 0);
});

test("pressure labels cover all published bands", () => {
  assert.equal(pressureLabel(10), "Low pressure");
  assert.equal(pressureLabel(40), "Moderate");
  assert.equal(pressureLabel(60), "Busy");
  assert.equal(pressureLabel(90), "Very busy");
});
