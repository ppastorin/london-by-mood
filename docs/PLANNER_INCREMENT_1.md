# Planner Increment 1

## Outcome

Increment 1 produces one recommended one- or two-day London itinerary from a
short or detailed prompt plus compact controls. Each day is a geographically
coherent sequence with practical times, visible access confidence, links to the
official sources and a Google Maps directions link.

This is a sandbox feature. Both `/planner/` and `/api/planner/places` return 404
unless `PLANNER_ENABLED=true`. The development configuration enables the flag;
the production configuration does not. The pages are also served with
`noindex`, `nofollow` and `no-store` headers.

## User contract

The prompt can be light, for example:

> Recommend a two full days itinerary, avoiding the core areas around
> Piccadilly/Oxford St, no big museum, nice and uncommon places.

It can also carry more detail, including day areas, interests, visitor
familiarity, preferred transport and an early or full-day pattern. The planner
can infer these values without requiring the user to press the interpretation
button. The button exists to make the interpretation visible and editable.

Explicitly changed controls override inferred prompt values. The controls cover:

- one or two days and the first date;
- start and finish time;
- pace and walking/public-transport preference;
- a geographic focus for each day;
- preferred place categories;
- returning/first-time visitor profile;
- West End and high-traffic museum exclusions;
- must-have and leave-out place names.

## Selection and access guardrails

The planner endpoint is separate from the backward-compatible public POI API.
It admits only published places that have:

- medium or high factual confidence;
- specific place copy;
- a healthy official/authoritative source;
- an access type other than `PRIVATE_NO_PUBLIC_ACCESS`.

`planner_ready` places receive a ranking advantage. Medium/high-confidence
places that still lack complete structured hours can appear provisionally, but
the interface marks them with a check notice and links directly to the official
source. It never presents an unknown opening time as confirmed.

Recurring hours and date exceptions are returned only by the planner endpoint.
A known date closure excludes the place. A date exception takes precedence over
weekly hours. Early-morning sequences prefer exterior or always-accessible stops;
timetabled venues are not scheduled before 10:00 unless their structured hours
say otherwise.

## Itinerary behaviour

The selection is deterministic and does not call an LLM or a paid routing API.
It scores the curated data for prompt/category fit, factual readiness, returning
visitor suitability and the requested area, then applies a geographic-cohesion
penalty and category-diversity penalty. The chosen stops are ordered by a simple
nearest-neighbour pass.

Travel time is a conservative local estimate. Mixed mode uses walking for short
legs and labels longer jumps as Tube/bus. Google Maps links are generated using
the existing shared directions helper. No booking is attempted.

## Verification

```bash
npm run check
npm test
npm run test:integration
```

The integration smoke test creates an ephemeral D1 database, loads all 881
places, applies Batches 1 and 2, checks the feature-flagged page and planner API,
and generates both agreed acceptance prompts against the real curated pool. It
also reruns the existing London by Mood, Smart Navigation, editor and import
cycles to protect backward compatibility.

## Deliberate limits of Increment 1

- one recommended itinerary, not two alternatives;
- one or two days only;
- no restaurant/hotel inventory or third-party packages;
- no live booking or paid route optimization;
- no downloadable document yet;
- opening hours are only treated as confirmed when structured evidence exists.

These limits keep the first increment usable and testable while leaving the data
contract ready for later alternatives, document export and richer availability.
