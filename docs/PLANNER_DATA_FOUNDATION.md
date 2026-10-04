# Planner data foundation

## Safety and compatibility boundary

This work is prepared for local/development D1 only. The candidate SQL files are
not applied by the application, a deployment, or a migration command. Production
requires a separate, explicit approval and a staged cutover.

Migration `0003_planner_data_foundation.sql` is additive. It does not rename or
remove existing columns, change the values in legacy `access_type`, or alter the
shape of existing top-level `/api/pois` fields. Planner metadata is exposed in a
new `planning` object. Existing London by Mood and Smart Navigation consumers can
therefore continue to ignore it.

## Data model

The planner layer deliberately separates factual readiness from the existing
editorial mood confidence:

- `data_confidence`: factual confidence (`LOW`, `MEDIUM`, `HIGH`).
- `planner_ready`: explicit gate; never inferred by the client.
- `access_type_v2`: practical access mode without modifying legacy access.
- `booking_mode`: independent booking requirement, because a seasonal or
  timetabled place may still allow walk-up admission.
- `admission_type`: free, paid, mixed or not yet established.
- `access_clarity`: whether the access choice is resolved or needs review.
- `description_quality`: whether the copy is specific enough for a plan.
- `hours_status`, check dates: opening-hours lifecycle and refresh scheduling.
- `place_sources`: source authority, role, health, freshness and content hash.
- `place_opening_periods`: recurring weekly periods, including split hours.
- `place_opening_exceptions`: date-specific closures or exceptional hours.
- `place_experiences`: deliberately light variants for exterior/interior,
  grounds, tours and events.
- `place_review_issues`: a durable queue for unresolved evidence and ambiguity.
- `enrichment_batches`: auditable membership and status for each data batch.

An item becomes planner-ready only when it has at least medium factual
confidence, an official/authoritative source, specific copy, clear access and
usable hours. `EXTERIOR_ONLY` and `ALWAYS_ACCESSIBLE` use
`hours_status=NOT_APPLICABLE`; other access types require verified hours.

High factual confidence is only assigned when all of the strong-source checks
pass and a human access decision is also marked `HIGH`. A reviewed decision does
not override a blocked, broken, irrelevant or non-official source; those records
remain medium or low and keep an open review issue.

## Access and experience policy

`access_type_v2` supports:

- `ALWAYS_ACCESSIBLE`
- `EXTERIOR_ONLY`
- `CUSTOMER_ONLY`
- `PRIVATE_NO_PUBLIC_ACCESS`
- `TIMETABLED`
- `SEASONAL`
- `BOOKING_REQUIRED`
- `EVENT_ONLY`
- `APPOINTMENT_ONLY`
- `UNKNOWN`

Automatic proposals are conservative. Museums, shops and religious sites are
treated as timetabled; areas and viewpoints as exterior-only; parks as seasonal;
and short building/oddity stops as exterior-only. Complex or conflicting cases
remain `UNKNOWN` and are exported to the access-review CSVs for human resolution.
Booking and admission are deliberately separate from access type. Private places
are never planner-ready, even when their exterior or official source is known.

Experiences should only be added where a materially different access condition
affects planning. Volatile third-party packages belong in a later integration,
not as detailed records in the core place catalogue.

## Source policy and refresh

Sources are classified as owner/operator, public authority, official partner,
trusted editorial or third-party. A third-party link remains useful evidence but
cannot by itself make a place planner-ready. Google is not required for source or
hours refresh.

Default refresh intervals are intentionally cost-aware:

| Access/content type | Refresh interval |
|---|---:|
| Event-only or seasonal | 7 days |
| Timetabled, booking or appointment | 28 days |
| Unknown/default | 60 days |
| Parks, areas and viewpoints | 90 days |
| Always accessible or exterior-only | 180 days |

The fetcher checks the canonical page, records HTTP/source status and content
hash, and extracts structured hours only when the official page publishes
machine-readable opening-hours data. Blocked, broken or ambiguous pages enter the
review queue instead of being guessed.

## Batch 1 and Batch 2 workflow

Batch 1 contains the 118 places with existing high mood confidence. Batch 2
contains the 330 places with existing medium mood confidence. They total 448 of
881 catalogue entries (50.85%) but are not automatically promoted to high
factual confidence: mood confidence and factual confidence are independent.

The reproducible workflow is:

```sh
npm run data:prepare-batches
npm run data:fetch-batch1
npm run data:build-batch1
npm run data:discover-batch2
npm run data:fetch-batch2
npm run data:build-batch2
npm run test:enrichment-sandbox
```

Generated candidate SQL is written to `data/enrichment/generated/`. Full review
queues and compact access-only queues are written to `data/enrichment/review/`.
The sandbox validator creates an ephemeral D1 database, applies all migrations,
loads all 881 current places, applies both candidate batches, and checks place
count, legacy access values, batch membership and foreign keys.

The 3 October 2026 access workbook resolved all 11 outstanding access-only rows
in Batches 1 and 2. Six decisions are high confidence and five are medium. After
fresh source checks, five of the eleven currently qualify for high factual
confidence, five for medium, and one remains low because its official tour page
blocks automated verification. The access-only CSVs now contain headers only;
remaining review work concerns source health, copy or non-recurring hours rather
than unresolved access classification.

## Production cutover (not performed)

1. Resolve the remaining source, copy and hours issues and approve the factual evidence.
2. Re-run source checks and the complete automated test suite.
3. Back up production D1 and rehearse migration plus candidate SQL on a clone.
4. Compare API snapshots and run London by Mood and Smart Navigation smoke tests.
5. Apply migration `0003` before deploying code that writes planner fields.
6. Import only explicitly approved candidate records, then deploy.
7. Monitor health, API compatibility and planner-readiness counts; retain the
   backup and rollback instructions until the observation window closes.
