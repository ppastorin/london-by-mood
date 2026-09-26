const TABLES = Object.freeze({
  places: "id",
  place_time_affinity: "place_id",
  place_stations: "place_id, position",
});

export default {
  async fetch(request, env) {
    if (new URL(request.url).pathname !== "/migrate" || request.method !== "POST") {
      return json({ ok: false, error: "Not found" }, 404);
    }
    const suppliedToken = request.headers.get("Authorization")?.replace(/^Bearer\s+/i, "");
    if (!env.MIGRATION_TOKEN || suppliedToken !== env.MIGRATION_TOKEN) {
      return json({ ok: false, error: "Migration authentication required" }, 401);
    }
    if (!env.DEV_DB || !env.PROD_DB) return json({ ok: false, error: "D1 bindings are missing" }, 503);

    let body;
    try { body = await request.json(); } catch { return json({ ok: false, error: "Invalid JSON" }, 400); }
    const table = String(body.table || "");
    const orderBy = TABLES[table];
    if (!orderBy) return json({ ok: false, error: "Unsupported table" }, 400);
    const offset = clamp(body.offset, 0, 100000, 0);
    const limit = clamp(body.limit, 1, 100, 50);

    const sourceCount = await count(env.DEV_DB, table);
    const columnsResult = await env.DEV_DB.prepare(`PRAGMA table_info(${table})`).all();
    const columns = (columnsResult.results || []).map((column) => column.name);
    if (!columns.length) return json({ ok: false, error: `Source table ${table} is missing` }, 500);

    const rowsResult = await env.DEV_DB.prepare(
      `SELECT * FROM ${table} ORDER BY ${orderBy} LIMIT ? OFFSET ?`,
    ).bind(limit, offset).all();
    const rows = rowsResult.results || [];
    const sql = `INSERT OR IGNORE INTO ${table} (${columns.join(",")}) VALUES (${columns.map(() => "?").join(",")})`;
    for (let start = 0; start < rows.length; start += 25) {
      const statements = rows.slice(start, start + 25).map((row) =>
        env.PROD_DB.prepare(sql).bind(...columns.map((column) => row[column] ?? null))
      );
      await env.PROD_DB.batch(statements);
    }

    const targetCount = await count(env.PROD_DB, table);
    const nextOffset = offset + rows.length;
    return json({
      ok: true,
      table,
      processed: rows.length,
      nextOffset,
      sourceCount,
      targetCount,
      done: nextOffset >= sourceCount,
    });
  },
};

async function count(db, table) {
  const row = await db.prepare(`SELECT COUNT(*) AS count FROM ${table}`).first();
  return Number(row?.count || 0);
}

function clamp(value, min, max, fallback) {
  const number = Number.parseInt(value, 10);
  return Number.isFinite(number) ? Math.max(min, Math.min(max, number)) : fallback;
}

function json(value, status = 200) {
  return Response.json(value, { status, headers: { "Cache-Control": "no-store", "X-Content-Type-Options": "nosniff" } });
}
