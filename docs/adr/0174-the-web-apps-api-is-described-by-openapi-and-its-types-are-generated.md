# 174. The web app's API is described by OpenAPI, and its types are generated

Proposed.

## Context

The web app calls the instance's application programming interface (API). TypeScript types written by hand to match it
drift from it without anyone noticing, and the mismatch shows only at runtime. The web app is served by the instance
([record 19](0019-the-app-is-a-progressive-web-app-served-by-each-instance.md)) and ships with the backend as one
version ([record 153](0153-version-numbers-say-what-an-update-means.md)), and every caller uses the same paths
([record 172](0172-every-caller-uses-one-set-of-paths.md)).

## Decision

The API is described by an OpenAPI document generated from its endpoints when the backend is built, using the OpenAPI
support built into ASP.NET Core. The document is used to build the web app and is never served by an instance. The web
app's TypeScript types are generated from it when the web app is built, by a generator that produces types only and adds
no code to what ships, and the web app's build checks its types with the TypeScript compiler. Generated files are never
edited by hand.

## Consequences

- A change to an endpoint that breaks the web app fails the build rather than the browser.
- The backend's code is the source of truth for the API, which suits an API that ships with its web app.
- The generator adds nothing to what the browser downloads.
- An instance never serves a description of its API, so nobody can read one from it.
- Building the web app depends on building the backend first.
- Generating the document at build time runs the backend's startup, so startup has to recognise it and skip listening,
  checking where it listens and schema migrations.
- Writing the OpenAPI document by hand first was rejected, because the API and its web app ship together and the extra
  step adds nothing.
