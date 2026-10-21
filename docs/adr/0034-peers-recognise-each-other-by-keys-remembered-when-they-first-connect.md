# 34. Peers recognise each other by keys remembered when they first connect

Proposed.

## Context

Every time two instances talk, each has to be sure the other is the instance its owner approved
([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)). That assurance can come from a central authority
that vouches for identities, or from the two parties themselves. The 2022 implementation used an access token, issued
when a connection was accepted, refreshed on request, and stored with the peer.

## Decision

Each instance has a key of its own. When two people connect, each instance remembers a fingerprint of the other's key,
and from then on a connection is accepted only from an instance that proves it holds that same key. No certificate
authority is involved.

## Consequences

- No central party holds a peer's identity or can take it away.
- If a peer later presents a different key, the connection is refused outright, with no way to carry on unverified.
- A central certificate authority for peers was rejected. Checking which software versions are safe does rely on one
  central, signed source, because that is a different problem.
- The access token of the 2022 implementation was rejected for three reasons. Self-hosting on home hardware should not
  need a domain name. Peers should be able to connect safely without a certificate from a certificate authority. And
  connections made by hole punching over private networks should be supported, though whether Astrana uses hole punching
  is not yet decided.
