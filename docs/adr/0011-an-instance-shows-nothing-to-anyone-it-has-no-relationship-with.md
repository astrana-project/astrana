# 11. An instance shows nothing to anyone it has no relationship with

Proposed.

## Context

An instance is a web server at an address, so search engines and strangers will reach it.

## Decision

An instance serves nothing to someone who has not signed in, except the sign-in page and what is needed to install the
app. There is no public profile, no preview of a shared link and no content of any kind. Instances ask search engines
not to index them wherever that is possible.

## Consequences

- Nothing but the sign-in page and the files needed to install the app can be indexed.
- Someone can still learn that an Astrana instance exists at an address, because the sign-in page has to be there.
- Asking search engines not to index is a request, which well-behaved crawlers follow and others may ignore.
