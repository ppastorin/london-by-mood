import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const root = new URL("../", import.meta.url);

test("production logs sample ten percent of dynamic Worker invocations", async () => {
  const config = JSON.parse(await readFile(new URL("wrangler.jsonc", root), "utf8"));
  assert.equal(config.observability?.enabled, true);
  assert.equal(config.observability?.logs?.head_sampling_rate, 0.1);
  assert.deepEqual(config.assets?.run_worker_first, [
    "/health",
    "/api/*",
    "/admin/api/*",
  ]);
});

test("static assets retain the security headers previously added by the Worker", async () => {
  const headers = await readFile(new URL("public/_headers", root), "utf8");
  assert.match(headers, /\/\*\s+Content-Security-Policy: frame-ancestors \*/);
  assert.match(headers, /Referrer-Policy: strict-origin-when-cross-origin/);
  assert.match(headers, /X-Content-Type-Options: nosniff/);
  assert.match(headers, /\/admin\/\*/);
  assert.match(headers, /Content-Security-Policy: frame-ancestors 'none'/);
  assert.match(headers, /X-Frame-Options: DENY/);
  assert.match(headers, /Cache-Control: no-store/);
  assert.match(headers, /X-Robots-Tag: noindex, nofollow/);
});
