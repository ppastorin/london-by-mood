export const MOODS = [
  { key: "quiet", label: "Quiet", detail: "Space to slow down", symbol: "☾", colour: "#496778" },
  { key: "unexpected", label: "Unexpected", detail: "Something you did not know was here", symbol: "✦", colour: "#b05c36" },
  { key: "beautiful", label: "Beautiful", detail: "Worth stopping to look at", symbol: "◇", colour: "#9b4965" },
  { key: "weird", label: "A little weird", detail: "London at its most peculiar", symbol: "◉", colour: "#695287" },
  { key: "local", label: "Local", detail: "Neighbourhood life, not landmarks", symbol: "⌂", colour: "#a1642e" },
  { key: "green", label: "Green", detail: "Trees, gardens and open ground", symbol: "♧", colour: "#347153" },
  { key: "atmospheric", label: "Atmospheric", detail: "Places with a strong sense of time", symbol: "◐", colour: "#53607c" },
  { key: "lively", label: "Lively", detail: "Energy, people and movement", symbol: "≈", colour: "#b23f3f" },
];

const MOOD_FIT = [0, 25, 65, 100];
const CROWD_PENALTY = {
  quiet: 1,
  local: 0.8,
  green: 0.8,
  atmospheric: 0.7,
  beautiful: 0.6,
  unexpected: 0.6,
  weird: 0.6,
  lively: 0.4,
};

function clamp(value, min = 0, max = 100) {
  return Math.min(max, Math.max(min, value));
}

export function distanceKm(lat1, lon1, lat2, lon2) {
  const radius = 6371;
  const toRadians = (value) => (value * Math.PI) / 180;
  const dLat = toRadians(lat2 - lat1);
  const dLon = toRadians(lon2 - lon1);
  const a = Math.sin(dLat / 2) ** 2
    + Math.cos(toRadians(lat1)) * Math.cos(toRadians(lat2)) * Math.sin(dLon / 2) ** 2;
  return radius * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}

export function estimateTravelMinutes(distance) {
  return Math.max(8, Math.round(7 + distance * 3.4));
}

function londonParts(date) {
  const parts = new Intl.DateTimeFormat("en-GB", {
    timeZone: "Europe/London",
    weekday: "short",
    hour: "2-digit",
    hourCycle: "h23",
  }).formatToParts(date);
  return {
    weekday: parts.find((part) => part.type === "weekday")?.value ?? "Mon",
    hour: Number(parts.find((part) => part.type === "hour")?.value ?? 12),
  };
}

function timeKey(date) {
  const { weekday, hour } = londonParts(date);
  const day = weekday === "Fri" ? "friday" : ["Sat", "Sun"].includes(weekday) ? "weekend" : "mon_thu";
  const band = hour < 6 ? "00_05" : hour < 10 ? "06_10" : hour < 13 ? "10_13"
    : hour < 17 ? "13_17" : hour < 20 ? "17_20" : "20_24";
  return `${day}_${band}`;
}

function currentDayPart(date) {
  const { hour } = londonParts(date);
  if (hour < 12) return "MORNING";
  if (hour < 17) return "DAY";
  if (hour < 20) return "DUSK";
  return "EVENING";
}

function timeFit(bestTime, date) {
  const desired = (bestTime || "ANY").toUpperCase();
  if (desired === "ANY") return 100;
  const actual = currentDayPart(date);
  if (desired === actual) return 100;
  const order = ["MORNING", "DAY", "DUSK", "EVENING"];
  return Math.abs(order.indexOf(desired) - order.indexOf(actual)) === 1 ? 70 : 40;
}

function weatherFit(preference, weather) {
  const desired = (preference || "ANY").toUpperCase();
  if (desired === "ANY") return 100;
  if (desired === "RAIN_FRIENDLY") return weather === "rain" ? 100 : 85;
  if (desired === "DRY") return weather === "dry" ? 100 : 20;
  return 70;
}

function addDiversified(output, candidates, mood, limit) {
  for (const candidate of candidates) {
    if (output.length >= limit || output.some((item) => item.id === candidate.id)) continue;
    const categoryCount = output.filter((item) => item.category === candidate.category).length;
    const categoryLimit = mood === "green" ? Number.POSITIVE_INFINITY : 2;
    if (output.length < 5 && categoryCount >= categoryLimit) continue;
    const nearDuplicate = output.some((item) =>
      distanceKm(item.lat, item.lon, candidate.lat, candidate.lon) < 0.35
      && item.category === candidate.category);
    if (nearDuplicate) continue;
    output.push(candidate);
  }
}

export function rankPois(pois, context, limit = 6) {
  const targetDate = new Date((context.now ?? new Date()).getTime() + context.horizonHours * 3600000);
  const key = timeKey(targetDate);
  const scoreCandidates = (minimumMoodScore) => pois
    .filter((poi) => (poi.moods?.[context.mood] ?? 0) >= minimumMoodScore)
    .map((poi) => {
      const distance = distanceKm(context.lat, context.lon, poi.lat, poi.lon);
      const travelMinutes = estimateTravelMinutes(distance);
      const moodScore = clamp(Math.round(poi.moods?.[context.mood] ?? 0), 0, 3);
      const affinity = poi.timeAffinity?.[key] ?? 50;
      const pressure = clamp(Math.round((poi.touristIntensity * affinity) / 100));
      const m = MOOD_FIT[moodScore];
      const t = clamp(100 - 1.5 * Math.max(0, travelMinutes - 10));
      const c = clamp(100 - CROWD_PENALTY[context.mood] * pressure);
      const x = 0.6 * timeFit(poi.bestTime, targetDate)
        + 0.4 * weatherFit(poi.weatherFit, context.weather);
      const wanderBonus = context.wander
        ? poi.visitMode === "WALK" ? 6 : poi.visitMode === "EXPLORE" ? 3 : 0
        : 0;
      return {
        ...poi,
        moodScore,
        distanceKm: distance,
        travelMinutes,
        crowdPressure: pressure,
        score: 0.55 * m + 0.2 * t + 0.15 * c + 0.1 * x + wanderBonus,
      };
    })
    .filter((poi) => poi.travelMinutes <= context.maxTravelMinutes)
    .sort((a, b) => b.score - a.score
      || b.moodScore - a.moodScore
      || Number(b.reviewed) - Number(a.reviewed)
      || a.crowdPressure - b.crowdPressure
      || a.travelMinutes - b.travelMinutes);

  let candidates = scoreCandidates(2);
  if (candidates.length < limit) candidates = scoreCandidates(1);
  const preferred = candidates.filter((poi) => poi.reviewed || poi.confidence === "HIGH");
  const safer = candidates.filter((poi) => poi.reviewed || poi.confidence !== "LOW");
  const selected = [];
  addDiversified(selected, preferred, context.mood, Math.min(3, limit));
  addDiversified(selected, safer, context.mood, Math.min(3, limit));
  addDiversified(selected, candidates, context.mood, limit);
  return selected.slice(0, limit);
}

export function pressureLabel(pressure) {
  if (pressure <= 25) return "Low pressure";
  if (pressure <= 50) return "Moderate";
  if (pressure <= 70) return "Busy";
  return "Very busy";
}
