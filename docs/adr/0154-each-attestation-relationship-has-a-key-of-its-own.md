# 154. Each attestation relationship has a key of its own

Proposed.

## Context

An attestation is an organisation's live answer that the holder of a key stands in one relationship with it
([record 64](0064-attestation-from-an-organisation-is-always-optional.md)). Which key the organisation vouches for
decides what that answer can be linked to.

## Decision

Each relationship has its own Ed25519 attestation key, separate from the identity key, the rotation key, the transport
keys and every other relationship's key. The application creates it and keeps it under the master key
([record 150](0150-one-master-key-sealed-at-installation-protects-every-key-the-application-creates.md)). It is carried
in backups and is not replaced on restore.

## Consequences

- Reusing the identity key was rejected, because every peer knows it, so every relationship would be linked to the
  person everywhere.
- Reusing a transport key cannot work, because transport keys rotate and are replaced on restore, while an attestation
  key is registered with an organisation and has to stay the same
  ([record 152](0152-the-ed25519-identity-key-signs-a-revocable-rotation-key-which-signs-hourly-x25519-transport-keys.md)).
  A transport key also agrees encryption, where an attestation key signs.
- A restore needs no registering again with any organisation.
- An organisation learns only the key for its own relationship, and nothing that ties it to the instance's identity.
