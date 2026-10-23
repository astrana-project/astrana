# 105. Astrana builds and signs every email module it ships

Proposed.

## Context

An email module is code that runs inside someone's instance with access to the internet
([record 71](0071-email-is-sent-through-small-replaceable-modules.md)). Confining it cannot stop a module copying data
to a destination it is allowed to reach, so the main control is checking it before it ships.

## Decision

A third-party module must be open source and publicly hosted. Astrana copies its source, builds it from that copy,
reviews it, signs it, and ships it with the installer, to be installed only on request.

## Consequences

- If the original project is compromised, instances are not affected until Astrana refreshes its copy.
- Review cannot tell a module that sends a message from one that sends a message and a copy elsewhere. Only a module's
  small size makes that visible at all.
- A security fix in the original project reaches owners only when Astrana refreshes its copy, and a module waiting for
  one is marked as such.
- Updates to a module are offered to a few instances first, like any other update.
- Astrana writes and maintains only the module for the Simple Mail Transfer Protocol (SMTP). Copying, rebuilding,
  reviewing and signing each third-party module, and refreshing it when its original project changes, is ongoing work on
  top of that.
- This is curation. Shipping only the SMTP module was rejected, because owners could then use only providers that accept
  SMTP, not the many with an interface of their own. An owner can still build and load a module Astrana declined,
  without its signature.
