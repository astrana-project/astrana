# 118. The catalogue's master and release keys stay offline on hardware tokens, and only its freshness keys are online

Proposed.

## Context

The version catalogue is trusted only because it is signed
([record 73](0073-information-about-versions-comes-from-one-central-signed-catalogue.md)), so whoever holds the signing
key can tell every instance that any version is safe, a malicious one included. A key used for every release is the one
most exposed to theft. A stolen key can also sign a false revocation as easily as a release, so a key cannot be revoked
through the catalogue it signs, and a lost key would leave nobody able to sign an update again. The project has one
maintainer, so no release can rest on a second person's approval.

## Decision

The catalogue's keys follow the roles of The Update Framework (TUF). A master key, built into every instance, vouches
for the other keys. A release key signs which versions exist and how to verify them. Both stay offline on hardware
tokens and are used only by the maintainer in person. Freshness keys, which sign only statements of which metadata is
current, live online on the project's own server, sealed.

Changing the master key needs two of three hardware tokens. The tokens are generated on the device, with their
attestations recorded in a ceremony log, kept in separate places, used only on an offline machine started from read-only
media, sealed in numbered tamper-evident bags and checked every year. There is a plan for the maintainer's absence.

## Consequences

- A compromised server can only delay updates, never install software, because the keys it holds cannot sign a release.
- Every release, hotfixes included, needs the maintainer present with the token to sign the release metadata.
- A stolen release key can be revoked and replaced by the master key without reinstalling a single instance.
- The loss or theft of one master token is survivable, because two of the three are needed. If two are lost or stolen,
  every instance would need a new master key from somewhere the thief does not control. How an instance checks that, out
  of band, needs a record of its own.
- Who holds each key, and how they are kept, is a matter for the project's governance, and changing who holds them
  changes no instance.
- An online release key was rejected, because anyone who took the server could then sign a release every instance
  trusts. One key for everything was rejected, because a theft could not be undone. Requiring several people to sign
  each entry was rejected while the project has one maintainer, and can be added on top of the master key later.
