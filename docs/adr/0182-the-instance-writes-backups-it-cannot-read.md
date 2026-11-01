# 182. The instance writes backups it cannot read

Proposed.

## Context

The instance makes scheduled backups
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)),
and something has to hold a key to write one. A backup holds the instance's keys as well as its data, so a key on the
instance that could read backups would give every backup to anyone who took over the instance, and would be lost with
the instance's machine.

## Decision

Each archive is encrypted with a fresh key, which is sealed to the owner's backup public key with Hybrid Public Key
Encryption (HPKE) as Request for Comments (RFC) 9180 specifies, in its base mode, with key agreement over X25519, a key
derivation based on the 256-bit Secure Hash Algorithm (SHA-256) and the 256-bit Advanced Encryption Standard in
Galois/Counter Mode (AES-256-GCM). Neither the instance nor Astrana Owner Tools stores the private half. It comes from
the owner's recovery secret, entered when needed and forgotten once that operation ends, or is released to a custodian
once their access activates. Each archive's header records its encryption version and the suite identifiers.

## Consequences

- Someone who takes over the instance can make backups and cannot read any it has made.
- Every restore and every check of an archive needs the owner's recovery secret, or a custodian's released key.
- Keys sealed to a machine or its hardware are copied into the archive under the archive's own key and sealed again to
  the new machine on restore, so a restore onto different hardware can open what it restores.
- Because the header says how an archive was sealed, the algorithms can change without making older archives unreadable,
  and every later version has to keep reading every earlier suite.
- A published standard brings test vectors, independent implementations to check against and outside review that a
  construction of Astrana's own would not have.
- Keeping a key that reads backups on the instance was rejected, because an intruder could read every backup with it and
  it would be lost with the machine.
