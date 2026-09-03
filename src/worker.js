const DEFAULT_CACHE_SECONDS = 300;
const STALE_CACHE_SECONDS = 86400;
const EMBED_POLICY = [
  "'self'",
  "https://www.londonadvanced.com",
  "https://londonadvanced.com",
  "https://sites.google.com",
].join(" ");

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
  }

  try {
    if (!inFlightDataRequest) {
      inFlightDataRequest = fetchAndValidatePlaces(env.GOOGLE_SHEET_API_URL, cacheSeconds)
        .finally(() => { inFlightDataRequest = null; });
    }

    const body = await inFlightDataRequest;
    const freshResponse = new Response(body, {
      status: 200,
      headers: dataHeaders(cacheSeconds),
    });

    if (cache) {
      const staleResponse = new Response(body, {
        status: 200,
        headers: dataHeaders(STALE_CACHE_SECONDS),
      });
      ctx.waitUntil(Promise.all([
        cache.put(freshKey, freshResponse.clone()),
        cache.put(staleKey, staleResponse),
      ]));
    }

    return labelledResponse(freshResponse, "MISS");
  } catch (error) {
    if (cache) {
      const stale = await cache.match(staleKey);
      if (stale) return labelledResponse(stale, "STALE");
    }

    return jsonResponse({
      ok: false,
      error: error instanceof Error ? error.message : "Place data could not be loaded",
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
    "Cache-Control": `public, max-age=60, s-maxage=${maxAge}`,
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
    'geolocation=(self "https://www.londonadvanced.com" "https://sites.google.com")',
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
