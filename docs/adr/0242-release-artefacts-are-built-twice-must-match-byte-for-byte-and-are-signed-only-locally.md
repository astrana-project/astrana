# 242. Release artefacts are built twice, must match byte for byte, and are signed only locally

Proposed.

## Context

With no central server to attack, an attacker's best route to every instance is to compromise a release, so that one
malicious update reaches them all. The project has one maintainer, so no release can wait on a second person's approval.
A signing key kept in continuous integration (CI) or on a server becomes the weakest point of the whole chain. The
catalogue's release key stays offline on a hardware token
([record 118](0118-the-catalogues-master-and-release-keys-stay-offline-on-hardware-tokens-and-only-its-freshness-keys-are-online.md)).

## Decision

CI builds the unsigned artefacts, their checksums and the software bill of materials
([record 220](0220-each-release-lists-everything-it-ships-in-a-software-bill-of-materials.md)) twice, in different
directories, with the build time taken from the commit, and stops unless the two builds match byte for byte. It never
signs and never publishes.

The maintainer downloads the artefacts, verifies their checksums, code-signs them with a hardware token, signs the
release metadata with the offline key in the same session, and uploads them. The project's server only refreshes the
freshness statements.

## Consequences

- Anyone can check that the published artefacts came from the tagged source, by building it and comparing.
- Whoever takes over CI holds no signing key, so they cannot sign a release.
- GitHub Actions builds the artefacts and GitHub Releases publishes them with their release notes. An instance trusts
  only what the signed catalogue says about them.
- The repository and its automation are locked down tightly from the start.
- Every release, hotfixes included, waits for the maintainer to be present with the token.
- Signing in CI was rejected because the key would then be the weakest point. A two-person approval was rejected because
  there is one maintainer, and the protection rests instead on signing, reproducibility, a locked-down build and the
  update check.
