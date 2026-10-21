# 105. Astrana builds and signs every email module it ships

Proposed.

## Context

An email module is code that runs inside someone's instance with access to the internet
([record 71](0071-email-is-sent-through-small-replaceable-modules.md)). Nothing can confine code whose job is to send
data out, so the only control is checking it before it ships.

## Decision

A third-party module must be open source and publicly hosted. Astrana copies its source, builds it from that copy,
reviews it, signs it, and ships it with the installer, to be installed only on request. Updates to a module are offered
to a few instances first.

## Consequences

- If the original project is compromised, instances are not affected until Astrana refreshes its copy.
- Review cannot tell a module that sends a message from one that sends a message and a copy elsewhere. Only a module's
  small size makes that visible at all.
- A security fix in the original project reaches owners only when Astrana refreshes its copy, and a module waiting for
  one is marked as such.
- This is curation, and the alternative was the single default module. An owner can still build and load a module
  Astrana declined, without its signature.
