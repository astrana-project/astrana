# 155. Post-quantum protection is hybrid, never used alone, and comes to backups first

Proposed.

## Context

Encrypted backups and traffic recorded today could be read once a large quantum computer exists, and signatures could
later be forged. Ed25519 and X25519 are not safe against such a machine
([record 152](0152-the-ed25519-identity-key-signs-a-revocable-rotation-key-which-signs-hourly-x25519-transport-keys.md)).
The post-quantum standards are young, and a candidate in the standards process was broken on an ordinary computer
in 2022.

## Decision

Where Astrana controls the cryptography, post-quantum protection is hybrid, combining a classical algorithm with a
post-quantum one, and is never used alone. Backups come first, sealed with a classical algorithm together with the
Module-Lattice-Based Key-Encapsulation Mechanism (ML-KEM), ideally from the first release. Peer traffic comes second,
with a handshake that combines X25519 with ML-KEM, once such a design has published test vectors. Signatures that pair
Ed25519 with the Module-Lattice-Based Digital Signature Algorithm (ML-DSA) stay experimental. Every format and message
names the algorithm it uses. Where Astrana depends on other software, it prefers and configures hybrid and reports what
it got, and where it has no control, the gap is recorded as a known limit.

## Consequences

- Each protection is named for the threat it answers. Hybrid key agreement answers what is recorded today and read
  later, which is a threat today. Hybrid signatures answer forgery, which is a threat only once the machine exists.
- Backups come first because they sit with third parties the longest, so they have the most to lose to recording today
  and reading later. The backup archive names its algorithms, so the change does not break older archives.
- Until the hybrid handshake is in place, traffic between peers is a known limit.
- Symmetric encryption, key wrapping and integrity tags use 256-bit keys throughout, which is a choice of key length and
  not of a new algorithm.
- A post-quantum identity key arrives through a signed rollover
  ([record 153](0153-an-identity-key-is-replaced-by-a-signed-rollover-with-an-overlap.md)).
- The known limits include attestation, passkeys, push encryption, email, connections to a remote database, certificates
  and code signing. The web server's hybrid support is reported in the instance's health, and the list is reviewed at
  each major release.
- The hardware tokens that hold the keys for the version catalogue
  ([record 118](0118-the-catalogues-master-and-release-keys-stay-offline-on-hardware-tokens-and-only-its-freshness-keys-are-online.md))
  cannot make ML-DSA signatures, so the catalogue's own protection is the part that cannot be made post-quantum.
- Post-quantum ciphertexts and signatures run to kilobytes, which costs space and time on small hardware and against
  shared hosting's limits on request size.
- Post-quantum alone was rejected, because the young algorithms protect against a future machine and must not be trusted
  alone against present ones.
