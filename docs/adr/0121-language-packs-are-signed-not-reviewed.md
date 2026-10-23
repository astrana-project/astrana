# 121. Language packs are signed, not reviewed

Proposed.

## Context

Translations are data the application reads
([record 67](0067-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)), and the project cannot review
translations in languages its maintainers do not read.

## Decision

A language pack is data, verified by its signature, so an owner knows what they installed. Its quality is not reviewed.

## Consequences

- A poor translation is a visible annoyance that can be corrected.
- A malicious translation can mislead, such as by swapping the meaning of buttons in a security prompt or asking for
  recovery codes. The signature says where a pack came from, not that what it says is true.
- Astrana does not claim a review it could not carry out.
