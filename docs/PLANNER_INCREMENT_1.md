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
familiarity, preferred transport and an early or full-day pattern. The sandbox
sends free text to a server-side AI interpreter, which returns a versioned,
validated intent rather than an itinerary. The interpretation remains visible
and editable through the controls.

Explicitly changed controls override inferred prompt values. The controls cover:

- one or two days and the first date;
- start and finish time;
- pace and walking/public-transport preference;
- a geographic focus for each day;
- preferred place categories;
- returning/first-time visitor profile;
- West End and high-traffic museum exclusions;
- must-have and leave-out place names.

## Selection and evidence policy

The planner endpoint is separate from the backward-compatible public POI API.
Planner V1 exposes every published place in that API rather than silently
discarding entries whose research is incomplete. This prevents a thin verified
subset from creating false "no results" responses. Selection still ranks the
strongest evidence first:

- verified records with specific copy, usable access data and an official or
  authoritative source receive the strongest preference;
- lower-confidence or incomplete records remain eligible as `CHECK` leads;
- every `CHECK` lead carries explicit caveats and a validation link;
- private, appointment-only, event-only and customer-only places are presented
  only with the corresponding access warning, never as ordinary walk-in visits.

The validation link prefers the approved source or official website and falls
back to the existing map link when no such source has been researched yet. The
fallback is disclosed; it is not labelled as an official source. The planner
never presents an unknown opening time as confirmed.

Recurring hours and date exceptions are returned only by the planner endpoint.
A known date closure excludes the place. A date exception takes precedence over
weekly hours. Early-morning sequences prefer exterior or always-accessible stops;
timetabled venues are not scheduled before 10:00 unless their structured hours
say otherwise.

## AI interpretation boundary

The interpreter uses the Cloudflare Workers AI binding and JSON-schema output.
It extracts arbitrary London geography, route anchors, category priorities,
semantic place-type terms, exclusions, transport, pace and at most one material
clarification. It has no neighbourhood alias table and does not select venues.

The Worker geocodes the model's location text through the existing bounded
OpenStreetMap/Nominatim integration. Geographic scopes are represented as a
resolved boundary, radius or direction. If a scope cannot be resolved, planning
stops visibly rather than discarding the location.

The browser never receives an AI credential. Successful interpretations are
cached by prompt, answer set, schema version and model so repeated requests do
not consume inference again. Menu choices remain authoritative.

## Itinerary behaviour

After interpretation, selection is deterministic and does not ask the model to
invent or rank venues. It scores the catalogue for prompt/category fit, factual readiness, returning
visitor suitability and the requested area, then applies a geographic-cohesion
penalty and category-diversity penalty. The chosen stops are ordered by a simple
nearest-neighbour pass.

Broad areas such as East, West, North and South London are interpreted by the
AI as directional geographic constraints around a stable central reference,
not passed verbatim to the geocoder where they can be confused with a business
or venue name. A narrow primary concept such as markets remains a hard concept
filter, while singular/plural variants are matched generically.

Travel time is a conservative local estimate. Mixed mode uses walking for short
legs and labels longer jumps as Tube/bus. Google Maps links are generated using
the existing shared directions helper. No booking is attempted.

## Verification

```bash
npm run check
npm test
npm run test:integration
npm run test:interpreter:sandbox
npm run audit:planner:sandbox
```

The integration smoke test creates an ephemeral D1 database, loads all 881
places, applies Batches 1 and 2, checks the feature-flagged page and planner API,
and generates the agreed acceptance prompts against the real catalogue. It
also reruns the existing London by Mood, Smart Navigation, editor and import
cycles to protect backward compatibility.

The deployed audit scans all published entries, reports evidence and access
gaps, confirms that every place has a map/validation link, and checks raw East
London Saturday and Sunday market coverage. These audit gaps are a research
backlog, not a reason to hide the record from V1.

## Deliberate limits of Increment 1

- one recommended itinerary, not two alternatives;
- one or two days only;
- no restaurant/hotel inventory or third-party packages;
- no live booking or paid route optimization;
- no downloadable document yet;
- opening hours are only treated as confirmed when structured evidence exists.

These limits keep the first increment usable and testable while leaving the data
contract ready for later alternatives, document export and richer availability.
