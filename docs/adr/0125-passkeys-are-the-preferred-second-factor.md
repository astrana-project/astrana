# 125. Passkeys are the preferred second factor

Proposed.

## Context

A second factor is required ([record 106](0106-a-second-factor-is-required.md)), and the kinds on offer differ in how
easily they can be stolen and how easy they are to use.

## Decision

A passkey is the preferred second factor, and registering two is recommended. A code from an authenticator app is the
next choice. An emailed code may only ever be an extra, never the only second factor.

## Consequences

- A passkey is the hardest kind to phish.
- A passkey is bound to the instance's domain name, so an instance without a stable domain cannot rely on one, and an
  instance that moves to a new domain loses its passkeys and needs them registered again.
- A passkey synced between devices depends on the large platform account that syncs it.
- Codes sent by text message are not offered, because a phone carrier would then sit in the sign-in path.
