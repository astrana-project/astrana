# 41. Cryptography the runtime does not provide comes from BouncyCastle

Proposed.

## Context

Astrana needs Ed25519 signatures for its identity keys and for attestation, and post-quantum algorithms for the
protection it adds against a future quantum computer. The .NET runtime provides X25519 key agreement but no Ed25519
type, and its interface for one is planned for no particular release. Its post-quantum algorithms work only with some
operating system libraries and not on every platform Astrana supports. A cryptographic algorithm is the clearest case of
something a project should not build for itself
([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)).

## Decision

Where the .NET runtime ([record 40](0040-the-backend-is-built-on-net.md)) does not provide a cryptographic algorithm on
every platform Astrana supports, Astrana uses the BouncyCastle cryptography package. Astrana never implements a
cryptographic algorithm itself.

## Consequences

- The dependency rule is met rather than waived. BouncyCastle is mature, widely trusted and maintained, open source
  under a permissive licence ([record 39](0039-only-open-source-components-are-bundled.md)), and provides what no
  runtime Astrana uses provides.
- BouncyCastle is written in managed code, so Ed25519 and the post-quantum algorithms behave the same on every platform,
  including those where the runtime's own versions are missing.
- BouncyCastle makes no claim that its code resists timing attacks, which is a known limit and is stated as one.
- When the runtime gains an Ed25519 interface, Astrana can move to it without changing any format, because the algorithm
  stays the same.
- Writing the algorithms within the project was rejected, because a flaw in hand-written cryptography is easy to make
  and hard to find.
