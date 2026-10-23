# 38. Peers recognise each other by keys remembered when they first connect

Proposed.

## Context

Every time two instances talk, each has to be sure the other is the instance its owner approved
([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)). That assurance can come from a central authority
that vouches for identities, from a secret the two instances share, or from keys each instance holds for itself.

## Decision

Each instance has a key of its own. When two people connect, each instance remembers a fingerprint of the other's key,
and from then on a connection is accepted only from an instance that proves it holds that same key. No certificate
authority is involved.

## Consequences

- No central party holds a peer's identity or can take it away.
- Peers can recognise each other without a domain name or a certificate from a certificate authority, so an instance on
  home hardware can connect safely.
- If a peer later presents a different key, the connection is refused outright, with no way to carry on unverified.
- An instance that loses or replaces its key cannot be recognised until each of its peers confirms the new key.
- A central certificate authority for peers was rejected, because it would hold every peer's identity. Checking which
  software versions are safe does rely on one central, signed source, because that is a different problem.
- A shared secret, such as an access token issued when a connection is accepted, was rejected. Both instances hold it,
  so a leak from either side lets anyone impersonate the other, where a private key never leaves the instance that owns
  it.
