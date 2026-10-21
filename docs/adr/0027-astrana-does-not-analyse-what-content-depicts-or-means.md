# 27. Astrana does not analyse what content depicts or means

Proposed.

## Context

Software can now describe what a picture shows or identify who is speaking in a recording.

## Decision

Astrana declines capabilities that understand what content means, such as models that describe pictures or identify
speakers. It extracts only what is already present, such as text in an image.

## Consequences

- A capability that can tell what a picture shows can be asked which of an owner's pictures show something, and it does
  not stay pointed where it was aimed.
