# 212. Build and release on .NET 11, and move to long-term support as soon as a release carries what Astrana needs

Proposed.

## Context

Instances are self-hosted and updated on their owners' schedule
([record 129](0129-an-update-is-never-applied-without-the-owner.md)), so a runtime whose support ends before an owner
next updates can leave them without security patches. Long-term support also gives the project time, when a dependency
falls behind the runtime, to wait for it to be updated or to find and adopt a replacement. Peers use the standard
Curve25519 form of the Noise protocol
([record 70](0070-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)), which needs X25519 key
agreement. The .NET 10 long-term-support release has no X25519, so using it would need a native cryptography library,
which [record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md) discourages. .NET 11 adds a built-in
`X25519DiffieHellman`. It is a standard-term release, expected to be supported until November 2028. The first
long-term-support release with X25519 is expected to be .NET 12, due in November 2027.

## Decision

The backend is built on .NET 11, set once at the root of the repository, and the first release to owners may ship on it.
Astrana moves to a long-term-support runtime as soon as one carries what it needs, and before .NET 11's support ends.

## Consequences

- Peer transport can use X25519 from the platform from the start, with no native dependency and no later change of
  peers' keys.
- The move to long-term support has a deadline rather than an intention, because a standard-term release's support
  closes about two years after it ships.
- If the move asks nothing of the owner, it is not a new major version.
- Staying on .NET 10 and taking Curve25519 from a native library was rejected under
  [record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md). Using P-256 on .NET 10 was rejected
  because the Noise specification does not define it, so the handshake could not be checked against the published test
  vectors. Waiting for .NET 12 before building peer transport or releasing was rejected because it delays the
  connectivity work by about a year.
