# 152. The Ed25519 identity key signs a revocable rotation key, which signs hourly X25519 transport keys

Proposed.

## Context

Peers pin an instance's identity key when they first connect
([record 38](0038-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)) and check it through the
Noise handshake ([record 70](0070-peers-authenticate-each-other-with-a-noise-handshake-inside-https.md)). If the
handshake used the pinned key itself, the key could never be rotated, and anyone who copied it from the machine would be
indistinguishable from the owner to every peer it talked to. A copy restored from an old backup also has to be told
apart from the current instance, without peers learning that a restore happened.

## Decision

The identity key is Ed25519, from BouncyCastle
([record 41](0041-cryptography-the-runtime-does-not-provide-comes-from-bouncycastle.md)), and is sealed under the
owner's recovery words
([record 151](0151-one-recovery-secret-serves-account-recovery-and-backups-through-a-key-derived-for-each-job.md)). It
signs a rotation key, which the instance holds under its master key
([record 150](0150-one-master-key-sealed-at-installation-protects-every-key-the-application-creates.md)), which lasts a
year unless the owner shortens it, and which can be revoked. The rotation key signs the X25519 transport keys the
handshake uses. A new transport key is made every hour and on every start, and carries a label for the hour it was made,
which the rotation key signs with it. A peer refuses any transport key older than the newest it has seen for that
identity, and where it holds a newer one than it is shown, it sends it back.

## Consequences

- A stolen machine holds only the rotation key, and the owner cuts it off by revoking it. A revocation is a small signed
  record naming the key and a time after which anything it signed is refused. Peers keep it and pass it on with what
  they send back, so a peer that only the stolen machine talked to still learns of it.
- Signing a new rotation key or a revocation needs the recovery words. Setup shows the owner their words, so they are
  present to sign the first rotation key.
- Every restore issues a fresh rotation key and revokes the one in the backup, so a stolen backup's rotation key is
  useless once the owner restores.
- A copy restored from an old backup presents a transport key older than its peers have seen and is refused, and one
  with a slow clock corrects itself from what peers send back. A restore can leave an instance unreachable for up to
  half an hour.
- A peer checking twice an hour cannot tell a restore from an outage of the same length, and hourly labels reveal less
  than exact times, which would show the second of every restart. A counter raised on every restore was rejected because
  peers would see every restore. A plain count of rotations was rejected because it refused a backup a month old for
  weeks, and a forged huge count could lock an owner out for good.
- An owner who has lost the words keeps running on the rotation key they have, but cannot revoke it or replace it.
- Ed25519 was chosen over P-256 for the same strength with less to go wrong. Its signatures need no fresh random number
  each time, where a repeated or partly leaked one exposes a P-256 private key, and it keeps Astrana in one family of
  curves with X25519.
- An X25519 key cannot be held in a hardware security module, so transport keys rely on the master key and on frequent
  rotation instead.
- Neither Ed25519 nor X25519 is safe against a large quantum computer.
