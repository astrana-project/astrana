# 42. Certified FIPS 140 cryptography is not a requirement

Proposed.

## Context

Some organisations require that software use cryptography certified under Federal Information Processing Standard (FIPS)
140, a United States government standard for the cryptographic modules used in its own systems and by its suppliers.
Anyone weighing software that encrypts what it holds is likely to ask whether it meets that standard.

## Decision

FIPS 140 certified cryptography does not apply to Astrana, because Astrana is for people hosting their own instance
([record 35](0035-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)).

## Consequences

- Algorithms and libraries are chosen for the people who run Astrana, so Ed25519 can come from a library that is not
  certified ([record 41](0041-cryptography-the-runtime-does-not-provide-comes-from-bouncycastle.md)).
- The answer rests on who Astrana is for, and makes no judgement of the standard itself.
- An organisation that must use certified cryptography cannot meet that obligation with Astrana.
