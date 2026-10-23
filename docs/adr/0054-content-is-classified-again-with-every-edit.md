# 54. Content is classified again with every edit

Proposed.

## Context

Content classification scores content for things such as sensitive material. An edit creates a new version
([record 7](0007-an-edit-makes-a-new-version-and-earlier-versions-stay-visible.md)).

## Decision

Classification runs again on every new version, and each version keeps its own assessment.

## Consequences

- Posting something harmless and then editing it into something else cannot slip past classification.
- Frequent editing costs more processing on modest hardware, which is accepted.
