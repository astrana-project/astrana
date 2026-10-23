# 62. Two people confirm a short code before their instances connect

Proposed.

## Context

Remembering a key on first connection
([record 35](0035-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)) trusts whichever key
arrives first. Someone sitting between two instances at that moment could put their own key in its place.

## Decision

Before a connection is accepted, both people are shown a short code worked out from the two keys. They compare it over a
channel they already trust, such as a phone call or in person, and only then is the connection accepted.

## Consequences

- The code, not the decision to accept, is what stops someone slipping in between them.
- When a peer's key changes, the owner sees the old and new codes side by side, and the same check is needed before the
  new key is trusted.
- Two people need some other way to reach each other, which people who already know each other usually have.
- The protection holds only if both people actually compare the code, and nothing can check that they did.
