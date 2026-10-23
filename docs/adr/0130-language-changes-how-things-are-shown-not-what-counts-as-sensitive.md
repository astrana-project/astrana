# 130. Language changes how things are shown, not what counts as sensitive

Proposed.

## Context

What counts as sensitive varies between cultures, and a language pack
([record 121](0121-language-packs-are-signed-not-reviewed.md)) could be made to carry that.

## Decision

A language pack covers interface text, and dates, times and numbers are formatted as
[record 120](0120-astrana-is-localised-and-each-person-chooses-their-locale.md) decides. A language pack never changes
the criteria for classifying content. Where those should vary by place, they follow the owner's jurisdiction
([record 113](0113-a-jurisdiction-selects-a-small-set-of-values-not-special-behaviour.md)).

## Consequences

- Someone reading Astrana in a second language does not silently inherit that language's thresholds.
