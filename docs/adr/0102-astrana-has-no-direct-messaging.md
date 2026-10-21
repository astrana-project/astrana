# 102. Astrana has no direct messaging

Proposed.

## Context

A conversation people rely on has to reach someone who is offline, which means holding it somewhere until they return.
Holding it would need a central service, in real tension with a design whose one deliberate exception is the catalogue
of versions ([record 66](0066-information-about-versions-comes-from-one-central-signed-catalogue.md)).

## Decision

Astrana has no private or direct messaging. Reports and takedown requests are not messaging, because each is attached to
content that already exists, limited in what it can say and how often, and delivered as an ordinary request with no
central service. Anything added later that could carry a sentence unrelated to the content it is attached to is
messaging under another name.

## Consequences

- Messaging is already done well by apps built for it, such as Signal, and Astrana is not trying to replace them.
- Astrana is not a messaging platform and is not drifting toward becoming one.
- Messaging through a second central service was rejected, because it would add a second exception to decentralisation.
  Messaging that worked only when both people were online at once was rejected as clearly worse than what dedicated apps
  already offer.
