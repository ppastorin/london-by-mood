const DEFAULT_CACHE_SECONDS = 300;
const STALE_CACHE_SECONDS = 86400;
const DEFAULT_GEOCODING_CACHE_SECONDS = 86400;
const LONDON_BOUNDS = Object.freeze({
  west: -0.5103,
  south: 51.2868,
  east: 0.334,
  north: 51.6919,
});
// Google Sites validates and renders URL embeds through changing Google-owned
// origins. A fixed allowlist can therefore reject a valid Site before it is
// published. The app is public, so allow it to be framed by any HTTPS host.
const EMBED_POLICY = "*";

let inFlightDataRequest = null;

export default {
  async fetch(request, env, ctx) {
    const url = new URL(request.url);

    if (url.pathname === "/health") {
      return jsonResponse({ ok: true, service: "london-by-mood" }, 200, {
        "Cache-Control": "no-store",
      });
    }

    if (url.pathname === "/api/pois") {
      if (request.method !== "GET") {
        return jsonResponse({ ok: false, error: "Method not allowed" }, 405, {
          Allow: "GET",
          "Cache-Control": "no-store",
        });
      }
      return getPlaces(request, env, ctx);
    }

    if (url.pathname === "/api/geocode") {
      if (request.method !== "GET") {
        return jsonResponse({ ok: false, error: "Method not allowed" }, 405, {
          Allow: "GET",
          "Cache-Control": "no-store",
        });
      }
      return geocodeAddress(request, env, ctx);
    }

    const assetResponse = await env.ASSETS.fetch(request);
    return addSiteHeaders(assetResponse);
  },
};

async function getPlaces(request, env, ctx) {
  if (!env.GOOGLE_SHEET_API_URL) {
    return jsonResponse({ ok: false, error: "Google Sheet endpoint is not configured" }, 500, {
      "Cache-Control": "no-store",
    });
  }

  const cacheSeconds = positiveInteger(env.DATA_CACHE_SECONDS, DEFAULT_CACHE_SECONDS);
  const cache = globalThis.caches?.default;
  const origin = new URL(request.url).origin;
  const freshKey = new Request(`${origin}/__data-cache/pois/fresh`, { method: "GET" });
  const staleKey = new Request(`${origin}/__data-cache/pois/stale`, { method: "GET" });

  if (cache) {
    const cached = await cache.match(freshKey);
    if (cached) return labelledResponse(cached, "HIT");

    const stale = await cache.match(staleKey);
    if (stale) {
      ctx.waitUntil(
        refreshPlacesCache(env.GOOGLE_SHEET_API_URL, cacheSeconds, cache, freshKey, staleKey)
          .catch(() => undefined),
      );
      const immediate = new Response(stale.body, {
        status: 200,
        headers: dataHeaders(cacheSeconds),
      });
      return labelledResponse(immediate, "STALE-REFRESHING");
    }
  }

  try {
    const body = await refreshPlacesCache(
      env.GOOGLE_SHEET_API_URL,
      cacheSeconds,
      cache,
      freshKey,
      staleKey,
    );
    return labelledResponse(new Response(body, {
      status: 200,
      headers: dataHeaders(cacheSeconds),
    }), "MISS");
  } catch (error) {
    return jsonResponse({
      ok: false,
      error: error instanceof Error ? error.message : "Place data could not be loaded",
    }, 502, { "Cache-Control": "no-store" });
  }
}

async function refreshPlacesCache(sourceUrl, cacheSeconds, cache, freshKey, staleKey) {
  if (!inFlightDataRequest) {
    inFlightDataRequest = fetchAndValidatePlaces(sourceUrl, cacheSeconds)
      .finally(() => { inFlightDataRequest = null; });
  }

  const body = await inFlightDataRequest;
  if (cache) {
    await Promise.all([
      cache.put(freshKey, new Response(body, {
        status: 200,
        headers: dataHeaders(cacheSeconds),
      })),
      cache.put(staleKey, new Response(body, {
        status: 200,
        headers: dataHeaders(STALE_CACHE_SECONDS),
      })),
    ]);
  }
  return body;
}

async function geocodeAddress(request, env, ctx) {
  const requestUrl = new URL(request.url);
  const query = normaliseAddressQuery(requestUrl.searchParams.get("q"));
  if (!query) {
    return jsonResponse({ ok: false, error: "Enter a London address or postcode" }, 400, {
      "Cache-Control": "no-store",
    });
  }

  const providerUrl = env.GEOCODING_API_URL || "https://nominatim.openstreetmap.org/search";
  const cacheSeconds = positiveInteger(env.GEOCODING_CACHE_SECONDS, DEFAULT_GEOCODING_CACHE_SECONDS);
  const cache = globalThis.caches?.default;
  const cacheKey = new Request(
    `${requestUrl.origin}/__geocode-cache?q=${encodeURIComponent(query.toLowerCase())}`,
    { method: "GET" },
  );

  if (cache) {
    const cached = await cache.match(cacheKey);
    if (cached) return labelledResponse(cached, "HIT");
  }

  try {
    const target = new URL(providerUrl);
    target.searchParams.set("q", londonQuery(query));
    target.searchParams.set("format", "jsonv2");
    target.searchParams.set("limit", "1");
    target.searchParams.set("countrycodes", "gb");
    target.searchParams.set(
      "viewbox",
      `${LONDON_BOUNDS.west},${LONDON_BOUNDS.north},${LONDON_BOUNDS.east},${LONDON_BOUNDS.south}`,
    );
    target.searchParams.set("bounded", "1");
    target.searchParams.set("addressdetails", "0");

    const upstream = await fetch(target, {
      headers: {
        Accept: "application/json",
        "Accept-Language": "en-GB,en;q=0.8",
        Referer: "https://www.londonadvanced.com/",
        "User-Agent": "LondonAdvanced-LondonByMood/1.1 (https://www.londonadvanced.com/)",
      },
      cf: { cacheEverything: true, cacheTtl: cacheSeconds },
    });
    if (!upstream.ok) throw new Error(`Address search returned ${upstream.status}`);

    const matches = await upstream.json();
    if (!Array.isArray(matches) || !matches.length) {
      return jsonResponse({ ok: false, error: "We could not find that address or postcode in London" }, 404, {
        "Cache-Control": "no-store",
      });
    }

    const match = matches[0];
    const lat = Number(match.lat);
    const lon = Number(match.lon);
    if (!insideLondonBounds(lat, lon)) {
      return jsonResponse({ ok: false, error: "That location appears to be outside London" }, 404, {
        "Cache-Control": "no-store",
      });
    }

    const body = JSON.stringify({
      ok: true,
      result: {
        label: String(match.display_name || query),
        lat,
        lon,
      },
      attribution: "Search data © OpenStreetMap contributors",
    });
    const response = new Response(body, {
      status: 200,
      headers: dataHeaders(cacheSeconds),
    });
    if (cache) ctx.waitUntil(cache.put(cacheKey, response.clone()));
    return labelledResponse(response, "MISS");
  } catch (error) {
    return jsonResponse({
      ok: false,
      error: error instanceof Error ? error.message : "The address search is temporarily unavailable",
    }, 502, { "Cache-Control": "no-store" });
  }
}

async function fetchAndValidatePlaces(sourceUrl, cacheSeconds) {
  const upstream = await fetch(sourceUrl, {
    redirect: "follow",
    headers: { Accept: "application/json" },
    cf: {
      cacheEverything: true,
      cacheTtl: cacheSeconds,
    },
  });

  if (!upstream.ok) {
    throw new Error(`Google Sheet endpoint returned ${upstream.status}`);
  }

  const payload = await upstream.json();
  if (!payload?.ok || !Array.isArray(payload.places)) {
    throw new Error(payload?.error || "Google Sheet endpoint returned invalid data");
  }
  if (payload.count !== payload.places.length) {
    throw new Error("Google Sheet endpoint returned an inconsistent place count");
  }

  const invalid = payload.places.find((place) =>
    !place?.id || !place?.name || !Number.isFinite(place?.lat) || !Number.isFinite(place?.lon));
  if (invalid) {
    throw new Error("Google Sheet endpoint contains a place with an invalid ID, name or coordinate");
  }

  return JSON.stringify({
    ok: true,
    schemaVersion: payload.schemaVersion ?? 1,
    generatedAt: payload.generatedAt ?? null,
    count: payload.places.length,
    places: payload.places,
  });
}

function dataHeaders(maxAge) {
  return {
    "Content-Type": "application/json; charset=utf-8",
    "Cache-Control": `public, max-age=60, s-maxage=${maxAge}, stale-while-revalidate=${STALE_CACHE_SECONDS}, stale-if-error=${STALE_CACHE_SECONDS}`,
    "Access-Control-Allow-Origin": "*",
    "X-Content-Type-Options": "nosniff",
  };
}

function labelledResponse(response, status) {
  const headers = new Headers(response.headers);
  headers.set("X-London-Data-Cache", status);
  return new Response(response.body, {
    status: response.status,
    statusText: response.statusText,
    headers,
  });
}

function jsonResponse(value, status, extraHeaders = {}) {
  return new Response(JSON.stringify(value), {
    status,
    headers: {
      "Content-Type": "application/json; charset=utf-8",
      "X-Content-Type-Options": "nosniff",
      ...extraHeaders,
    },
  });
}

function addSiteHeaders(response) {
  const headers = new Headers(response.headers);
  headers.delete("X-Frame-Options");
  headers.set("Content-Security-Policy", `frame-ancestors ${EMBED_POLICY}`);
  headers.set("Referrer-Policy", "strict-origin-when-cross-origin");
  headers.set("X-Content-Type-Options", "nosniff");
  headers.set(
    "Permissions-Policy",
    "geolocation=()",
  );

  return new Response(response.body, {
    status: response.status,
    statusText: response.statusText,
    headers,
  });
}

function positiveInteger(value, fallback) {
  const parsed = Number.parseInt(value, 10);
  return Number.isFinite(parsed) && parsed > 0 ? parsed : fallback;
}

function normaliseAddressQuery(value) {
  const query = String(value || "").trim().replace(/\s+/g, " ");
  return query.length >= 3 && query.length <= 160 ? query : "";
}

function londonQuery(query) {
  return /\blondon\b/i.test(query) ? query : `${query}, London, UK`;
}

function insideLondonBounds(lat, lon) {
  return Number.isFinite(lat) && Number.isFinite(lon)
    && lat >= LONDON_BOUNDS.south && lat <= LONDON_BOUNDS.north
    && lon >= LONDON_BOUNDS.west && lon <= LONDON_BOUNDS.east;
}
