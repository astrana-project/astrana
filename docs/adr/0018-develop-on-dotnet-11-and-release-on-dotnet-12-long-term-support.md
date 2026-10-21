# 18. Develop on .NET 11 and release on .NET 12 long-term support

Proposed.

## Context

The specification requires a long-term-support runtime, because instances are self-hosted and update on their owners'
schedule, so a runtime whose support ends before an owner next updates can leave them without security patches. Peer
transport is expected to use the standard Curve25519 form of the Noise protocol, which needs X25519 key agreement. The
.NET 10 long-term-support release has no X25519, so using it would need a native cryptography library, which
[record 5](0005-third-party-components-are-used-only-when-necessary.md) discourages. .NET 11 adds a built-in
`X25519DiffieHellman`. It is a standard-term release, expected to be supported until November 2028. The first
long-term-support release with X25519 is .NET 12, due in November 2027.

## Decision

The backend is developed on .NET 11, set in `backend/global.json`, and moves to .NET 12 when it is released. Every
release to owners runs on a long-term-support runtime, so the first release requires .NET 12.

## Consequences

- Peer transport can use X25519 from the platform from the start, with no native dependency and no later migration of
  peers' keys.
- The move to .NET 12 is a second runtime upgrade, which has to be made and tested before the first release. It is
  expected to be small, and .NET 11 remains supported for about a year after .NET 12 ships.
- Staying on .NET 10 and taking Curve25519 from a native library was rejected under record 5. Using P-256 on .NET 10
  was rejected because the Noise specification does not define it, so the handshake could not be checked against the
  published test vectors. Waiting for .NET 12 before building peer transport was rejected because it delays the
  connectivity work by about a year.
