# 100. The project's primary maintainer holds the key that signs the version catalogue

Proposed.

## Context

The catalogue of versions is trusted only because it is signed
([record 65](0065-information-about-versions-comes-from-one-central-signed-catalogue.md)), so whoever holds the signing
key decides what every instance is told about versions.

## Decision

The project's primary maintainer decides what the catalogue says and holds the key that signs it.

## Consequences

- The signing key is a single point of failure.
