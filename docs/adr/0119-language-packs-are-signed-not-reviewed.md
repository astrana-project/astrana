# 119. Language packs are signed, not reviewed

Proposed.

## Context

Translations are data the application reads
([record 66](0066-rules-that-may-vary-live-in-data-and-fixed-rules-live-in-code.md)), and the project cannot review
translations in languages its maintainers do not read.

## Decision

Translations can be contributed informally. Each language pack is signed, so an owner knows what they installed, and its
quality is not reviewed.

## Consequences

- A poor translation is a visible annoyance that can be corrected, not a security problem.
- Astrana does not claim a review it could not carry out.
