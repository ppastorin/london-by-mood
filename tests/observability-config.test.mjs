import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

const root = new URL("../", import.meta.url);

test("production logs sample ten percent of Worker invocations", async () => {
  const config = JSON.parse(await readFile(new URL("wrangler.jsonc", root), "utf8"));
  assert.equal(config.observability?.enabled, true);
  assert.equal(config.observability?.logs?.head_sampling_rate, 0.1);
});

test("only dynamic routes and HTML entry points run the Worker first", async () => {
  const config = JSON.parse(await readFile(new URL("wrangler.jsonc", root), "utf8"));
  assert.deepEqual(config.assets?.run_worker_first, [
    "/",
    "/index.html",
    "/admin",
    "/admin/",
    "/admin/index.html",
    "/smart-navigation",
    "/smart-navigation/",
    "/smart-navigation/index.html",
    "/health",
    "/api/*",
    "/admin/api/*",
  ]);
});
