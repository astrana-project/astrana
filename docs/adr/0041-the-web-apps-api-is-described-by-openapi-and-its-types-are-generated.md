# 41. The web app's API is described by OpenAPI, and its types are generated

Proposed.

## Context

The web app calls the backend's application programming interface (API) for people. TypeScript types written by hand to
match it drift from it without anyone noticing, and the mismatch shows only at runtime. The web app is served by the
instance ([record 3](0003-people-use-astrana-through-a-web-app-served-by-the-instance-they-use.md)) and ships with the
backend as one version ([record 23](0023-version-numbers-say-what-an-update-means.md)). People's endpoints are in a
route group of their own ([record 40](0040-minimal-apis-with-separate-route-groups-for-people-and-peers.md)).

## Decision

The people's API is described by an OpenAPI document generated from its endpoints when the backend is built, using the
OpenAPI support built into ASP.NET Core. The web app's TypeScript types for that API are generated from the document
when the web app is built, by a generator that produces types only and adds no code to what ships, and the web app's
build checks its types with the TypeScript compiler. Generated files are never edited by hand.

A web app left open in a browser while its instance is updated would call the new API with old code, so the backend
reports its version with every response, and the web app reloads itself when that version changes.

## Consequences

- A change to an endpoint that breaks the web app fails the build rather than the browser.
- The backend's code is the source of truth for this API, which suits an API that ships with its only client.
- The generator adds nothing to what the browser downloads.
- Building the web app depends on building the backend first.
- Generating the document at build time runs the backend's startup, so startup has to recognise it and skip listening,
  checking where it listens and migrating.
- The peer API is outside this decision, because instances on other versions use it, so its contract is decided with the
  peer protocol.
- Writing the OpenAPI document by hand first was rejected for this API, because both sides ship together and the extra
  step adds nothing.
