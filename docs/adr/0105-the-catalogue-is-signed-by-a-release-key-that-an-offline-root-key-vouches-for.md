# 105. The catalogue is signed by a release key that an offline root key vouches for

Proposed.

## Context

The version catalogue is trusted only because it is signed
([record 69](0069-information-about-versions-comes-from-one-central-signed-catalogue.md)), so whoever holds the signing
key can tell every instance that any version is safe, a malicious one included. A key used for every release is the one
most exposed to theft. A stolen key can also sign a false revocation as easily as a release, so a key cannot be revoked
through the catalogue it signs, and a lost key would leave nobody able to sign an update again.

## Decision

The catalogue is signed with two keys. A root key, kept offline and never on a machine connected to a network, is built
into every instance, and does one thing, which is to vouch for a release key. The release key signs the catalogue's
entries. A compromised or lost release key is revoked and replaced by an entry the root key signs. The root key is
replaced only by a new root key that the outgoing one signs.

## Consequences

- A stolen release key can be revoked and replaced without reinstalling a single instance.
- The root key is used rarely and never online, so it is far harder to steal than a key used for every release.
- A stolen or lost root key cannot be dealt with this way, and every instance would then need a new root key from
  somewhere the thief does not control. How an instance checks that, out of band, needs a record of its own.
- Who holds each key, and how they are kept, is a matter for the project's governance, and changing who holds them
  changes no instance.
- One key for everything was rejected, because a theft could not be undone. Requiring several people to sign each entry
  was rejected while the project has one maintainer, and can be added on top of the root key later.
