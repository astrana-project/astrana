# 109. Astrana builds and signs every email module it ships

Proposed.

## Context

An email module is code that runs inside someone's instance with access to the internet
([record 74](0074-email-is-sent-through-small-replaceable-modules.md)). Confining it cannot stop a module copying data
to a destination it is allowed to reach, so the main control is checking it before it ships.

## Decision

A third-party module must be open source and publicly hosted. Astrana copies its source, builds it from that copy,
reviews it and signs it. Modules are listed in the same signed catalogue as releases
([record 105](0105-the-catalogue-is-signed-by-a-release-key-that-an-offline-root-key-vouches-for.md)), signed with the
same release key, and installed only on request.

Each module declares in a manifest the destinations it may contact, and the instance's own Hypertext Transfer Protocol (HTTP)
client refuses any other. A module can only send a message and read its own settings. The provider's key stays
encrypted under the instance's master key, is passed to the module for each call, and is never written by the module.

## Consequences

- If the original project is compromised, instances are not affected until Astrana refreshes its copy.
- The list of destinations is a policy enforced by the instance's own client, not a sandbox. Modules run in the instance's own
  process, so it limits a well-behaved module's mistakes and does not isolate a hostile one.
- A module receives no inbound calls, such as webhooks from its provider.
- Review cannot tell a module that sends a message from one that sends a message and a copy elsewhere. Only a module's
  small size makes that visible at all.
- A security fix in the original project reaches owners only when Astrana refreshes its copy, and a module waiting for
  one is marked as such.
- Updates to a module are offered to a few instances first, like any other update.
- Astrana writes and maintains the module for the Simple Mail Transfer Protocol (SMTP). Copying, rebuilding, reviewing
  and signing each third-party module, and refreshing it when its original project changes, is ongoing work on top of
  that.
- Modules and releases share one signing path, so a separate key for signing modules was rejected.
- This is curation. Shipping only the SMTP module was rejected, because owners could then use only providers that accept
  SMTP, not the many with an interface of their own. An owner can still build and load a module Astrana declined,
  without its signature.
