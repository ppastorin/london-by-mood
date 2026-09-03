# London by Mood

London by Mood is a Cloudflare Worker application for London Advanced. The public interface and ranking code live in this repository. The location data remains in the private Google Sheet tab `POI_MASTER` and is exposed through the attached Apps Script web app.

## Architecture

1. `POI_MASTER` in Google Sheets is the only editable data source.
2. `google-apps-script/Code.gs` publishes active rows as structured JSON.
3. `src/worker.js` fetches, validates and caches that JSON.
4. Files in `public/` provide the responsive user interface.
5. The published `workers.dev` URL can be embedded in Google Sites.

Spreadsheet changes do not require a GitHub commit or Cloudflare deployment. They normally appear after the five-minute data cache expires.

## Files

- `src/worker.js` — Cloudflare API proxy, validation, caching and iframe policy.
- `public/index.html` — application structure.
- `public/styles.css` — desktop and mobile presentation.
- `public/app.js` — user interaction and result rendering.
- `public/ranking.js` — mood, travel, crowd and context ranking.
- `public/london-map.jpg` — supplied London Advanced map.
- `google-apps-script/Code.gs` — Google Sheet endpoint.
- `wrangler.jsonc` — Cloudflare Worker configuration.
- `tests/` — ranking, API and embedding checks.

## A. Create the GitHub repository

1. Extract the supplied ZIP file.
2. Sign in to GitHub and create a new repository named `london-by-mood`.
3. A private repository is fine. Do not add a README, `.gitignore` or licence because they are already supplied.
4. Upload the **contents** of the extracted `london-by-mood-cloudflare` folder to the repository root. The repository root must contain `package.json`, `wrangler.jsonc`, `src`, `public`, `tests` and `google-apps-script`.
5. Commit the upload to the `main` branch.

If GitHub's browser uploader does not preserve the folders, use GitHub Desktop: clone the empty repository, copy the extracted contents into its local folder, then commit and push.

## B. Connect GitHub to Cloudflare

1. Sign in to Cloudflare.
2. Open **Workers & Pages**.
3. Select **Create application**.
4. Select **Import a repository**.
5. Connect GitHub if required and choose the `london-by-mood` repository.
6. Confirm that the Worker name is exactly `london-by-mood`. It must match `name` in `wrangler.jsonc`.
7. Use `/` as the root directory if the files are at the repository root.
8. Set the build command to:

   ```text
   npm run check && npm test
   ```

9. Set the deploy command to:

   ```text
   npx wrangler deploy
   ```

10. Save and deploy.

Cloudflare will install Wrangler from `package.json`, validate the code, run the tests and deploy the Worker with its static assets.

## C. Test the deployment

Cloudflare will provide a URL similar to:

```text
https://london-by-mood.YOUR-SUBDOMAIN.workers.dev
```

Test these addresses in order:

1. `/health` should return `{"ok":true,"service":"london-by-mood"}`.
2. `/api/pois` should return `"ok":true`, `"count":881` and the `places` array.
3. The root URL should display the application.

The first `/api/pois` request after a cold start may take longer because Google generates the source data. Later requests should use Cloudflare caching. The response header `X-London-Data-Cache` reports `MISS`, `HIT` or `STALE`.

## D. Embed it in London Advanced

1. Open the relevant page in Google Sites.
2. Select **Insert → Embed**.
3. Choose **By URL**.
4. Paste the root `workers.dev` URL, without `/api/pois` or `/health`.
5. Select **Insert**.
6. Stretch the embed to the full content width.
7. Give it sufficient height to show the interface and results; start around 1,200–1,400 pixels and adjust after previewing.
8. Preview the Google Site on desktop and mobile.
9. Publish the Google Site.

The Worker removes `X-Frame-Options` and permits framing by `londonadvanced.com` and `sites.google.com` through its Content Security Policy.

## E. Maintain the location data

### Change mood scoring

Edit these columns in `POI_MASTER`:

- `mood_quiet`
- `mood_unexpected`
- `mood_beautiful`
- `mood_weird`
- `mood_local`
- `mood_green`
- `mood_atmospheric`
- `mood_lively`

Use only whole numbers from 0 to 3. Also update `editorial_hook`, `best_time`, `weather_fit`, `visit_mode`, `mood_reviewed` and `mood_confidence` when appropriate.

### Add a location

1. Duplicate a similar row in `POI_MASTER`.
2. Give it a unique `poi_id`.
3. Set `active` to `TRUE`.
4. Replace its name, category, coordinates, visitor intensity, access details and URLs.
5. Set all eight mood scores and write its editorial hook.
6. Adjust time-affinity values if its expected crowd pattern differs from the copied place.
7. Set `mood_reviewed` to `TRUE` only after checking the result.

Never reuse a `poi_id`. The Apps Script refuses to publish duplicate active IDs.

## F. Maintain the application

- Edit `POI_MASTER`: data change only; no deployment required.
- Edit files in GitHub: Cloudflare automatically tests and deploys the new commit.
- Replace the Apps Script deployment: update `GOOGLE_SHEET_API_URL` in `wrangler.jsonc`, then commit the change.
- Change cache delay: edit `DATA_CACHE_SECONDS` in `wrangler.jsonc`.

## Troubleshooting

### `/api/pois` returns an error

Open the Apps Script `/exec` URL directly. It must return `"ok":true`. If code was changed in Apps Script, create a new deployment version under **Deploy → Manage deployments**.

### The interface loads but never shows places

Open `/api/pois`. If it works, force-refresh the application. If it fails, check the Cloudflare Worker logs and the Apps Script execution history.

### Google Sites refuses to embed the URL

Confirm that you embedded the Cloudflare root URL, not the Apps Script URL. The Apps Script is a data endpoint and is not the application.

### A spreadsheet change is not visible immediately

Wait five minutes and reload. Browser and Cloudflare data caches deliberately prevent every visitor from triggering a slow Google Sheet read.

## Local testing (optional)

With Node.js installed:

```text
npm install
npm run check
npm test
npm run dev
```

Wrangler prints a local address for the application.
