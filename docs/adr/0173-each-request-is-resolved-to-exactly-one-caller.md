# 173. Each request is resolved to exactly one caller

Proposed.

## Context

Every caller uses one set of paths ([record 172](0172-every-caller-uses-one-set-of-paths.md)), so the same endpoint can
receive a session, an access token or a peer's Noise channel. An authentication layer that accepts whichever credential
validates first will eventually let one kind of caller pass a check meant for another, and the flaw stays invisible
until someone presents two.

## Decision

Each request is resolved to exactly one caller before anything else happens, by its session, its access token or its
Noise channel. A request carrying more than one credential is refused. What the caller may see is then decided from that
one identity.

## Consequences

- No combination of credentials gives more than the strongest one alone.
- A new way of calling an instance has to fit one of the existing kinds of caller, or it needs a record of its own.
- Accepting the first credential that validates was rejected for the reason above.
