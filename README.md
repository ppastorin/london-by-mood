# London Advanced Places Platform — development prototype

This branch replaces the Google Sheet/Apps Script runtime with one Cloudflare Worker and one D1 database. It serves both existing visitor experiences and a private, mobile-friendly place editor.

Nothing in this branch is configured for production. `wrangler.jsonc` intentionally contains a placeholder D1 ID.

## What is included

- `/` — London by Mood, now reading `GET /api/pois` from D1.
- `/smart-navigation/` — rebuilt Smart Navigator, with walking-route detours and live TfL cycle availability.
- `/admin/` — private place capture/editor prototype with draft, publish and archive states.
- `migrations/0001_places.sql` — normalized D1 schema.
- `migrations/0002_imports.sql` — durable source identities plus preview/commit batch imports.
- `db/seed.sql` — private, git-ignored one-time import generated locally from the workbook.
- `scripts/build-d1-seed.py` — reproducible spreadsheet-to-D1 converter.
- `scripts/integration-smoke.mjs` — full D1/API create-edit-publish smoke test.
- `scripts/preview-csv-import.mjs` — non-mutating local check of a complete My Maps CSV.
- `docs/D1_MIGRATION_DESIGN.md` — recommendation, alternatives, cutover plan and operating model.

The old `google-apps-script/` folder is retained only as a migration reference. It is no longer on the runtime path.

## Local setup

Requirements: Node.js 20+ and Python 3 with `openpyxl` only if rebuilding the seed (`pip install -r requirements-migration.txt`).

```bash
npm ci
npm run db:migrate:local
npm run dev -- --var ADMIN_TOKEN:choose-a-local-token
```

Before the first run, generate the private `db/seed.sql` as described below, then run `npm run db:seed:local`. The seed is deliberately excluded from this public repository.

Open:

- `http://localhost:8787/`
- `http://localhost:8787/smart-navigation/`
- `http://localhost:8787/admin/`

Use the same temporary token on the admin login screen. Put real secrets in `.dev.vars` or Cloudflare secrets; never commit them.

## Verification

```bash
npm run check
npm test
npm run test:integration
npm run test:csv -- "/path/to/google-mymaps-export.csv"
```

After the private seed has been generated, the integration test creates an ephemeral D1 instance, loads the complete seed, confirms all 881 places and 2,128 station relationships, exercises unauthenticated access, performs a create → publish → read revision cycle, and proves that importing the same CSV twice creates no duplicate records.

## Monthly My Maps import

Export the complete My Maps layer as CSV, open `/admin/`, choose the file and select **Preview import**. The preview classifies every row as already existing, possible duplicate, new or invalid. Existing and uncertain rows cannot be committed automatically. Selected new rows are created as unpublished drafts with a durable source fingerprint; they must be enriched and reviewed before publication.

Re-importing an unchanged export is safe. The importer compares source fingerprints, normalized names and coordinate proximity, and records each preview in `import_batches` and `import_candidates` for audit.

## Rebuild the migration seed

Export the authoritative Google Sheet as `.xlsx`, then run:

```bash
python3 scripts/build-d1-seed.py "/path/to/London Advanced - Mood.xlsx" db/seed.sql
```

The converter refuses to finish unless it finds exactly 881 place records. That assertion should be updated deliberately after D1 becomes the source of truth; routine future changes should happen through `/admin/`, not through spreadsheet re-imports.

## Remote development — intentionally not executed

1. Create a database named `london-advanced-places-dev` in the Cloudflare development account/environment.
2. Replace the placeholder `database_id` in the development configuration only.
3. Generate `db/seed.sql` privately, then apply `migrations/0001_places.sql` and the seed to that development database.
4. Set `ADMIN_TOKEN` as a secret for the first dev review, or put Cloudflare Access in front of both `/admin/*` and `/api/admin/*` and set `TRUST_CF_ACCESS=true` only after those policies are active.
5. Set `HEIGIT_API_KEY` for walking routes. `TFL_API_KEY` is optional for the BikePoint feed.
6. Use a Cloudflare branch preview. Do not bind this branch to the production D1 database and do not change the Google Sites embeds until acceptance is complete.

The production cutover and rollback checklist is in [docs/D1_MIGRATION_DESIGN.md](docs/D1_MIGRATION_DESIGN.md).
