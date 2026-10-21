# 128. Language changes how things are shown, not what counts as sensitive

Proposed.

## Context

What counts as sensitive varies between cultures, and a language pack
([record 119](0119-language-packs-are-signed-not-reviewed.md)) could be made to carry that.

## Decision

A language pack covers interface text and the formats of dates, numbers, times and text direction. It never changes the
criteria for classifying content. Where those should vary by place, they follow the owner's jurisdiction
([record 112](0112-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)).

## Consequences

- Someone reading Astrana in a second language does not silently inherit that language's thresholds.
- Each person on an instance, owner or guest, chooses their own language.
