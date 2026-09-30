export const MAX_STOPS = 9;

export function buildGoogleMapsUrl({ start, end, stops = [] }) {
  if (!validPoint(start) || !validPoint(end)) throw new Error("A valid start and destination are required");
  if (!Array.isArray(stops) || stops.length > MAX_STOPS || stops.some((point) => !validPoint(point))) {
    throw new Error(`An itinerary can include up to ${MAX_STOPS} valid stops`);
  }

  const url = new URL("https://www.google.com/maps/dir/");
  url.searchParams.set("api", "1");
  url.searchParams.set("origin", coordinate(start));
  url.searchParams.set("destination", coordinate(end));
  url.searchParams.set("travelmode", "walking");
  if (stops.length) url.searchParams.set("waypoints", stops.map(coordinate).join("|"));
  url.searchParams.set("dir_action", "navigate");
  return url.href;
}

export function insertByRoutePosition(selectedIds, place, placesById) {
  if (selectedIds.includes(place.id)) return [...selectedIds];
  const next = [...selectedIds, place.id];
  return next.sort((leftId, rightId) => {
    const left = placesById.get(leftId);
    const right = placesById.get(rightId);
    return Number(left?.routePosition ?? Number.MAX_SAFE_INTEGER) - Number(right?.routePosition ?? Number.MAX_SAFE_INTEGER);
  });
}

export function moveItem(values, index, offset) {
  const target = index + offset;
  if (index < 0 || index >= values.length || target < 0 || target >= values.length) return [...values];
  const next = [...values];
  [next[index], next[target]] = [next[target], next[index]];
  return next;
}

function validPoint(point) {
  return point && Number.isFinite(Number(point.lat)) && Number.isFinite(Number(point.lon));
}

function coordinate(point) {
  return `${Number(point.lat)},${Number(point.lon)}`;
}
