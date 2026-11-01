# 119. Astrana writes its own client for The Update Framework

Proposed.

## Context

The version catalogue follows the model of The Update Framework (TUF)
([record 73](0073-information-about-versions-comes-from-one-central-signed-catalogue.md)), with keys arranged so that a
compromised server can only delay updates
([record 118](0118-the-catalogues-master-and-release-keys-stay-offline-on-hardware-tokens-and-only-its-freshness-keys-are-online.md)).
Every instance needs a client that checks the catalogue's metadata, and that client guards the whole supply chain. The
one TUF client available for .NET is young and maintained by one person, which a mature component must not be
([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)).

## Decision

Astrana writes its own TUF client, and proves it against the framework's official conformance suite.

## Consequences

- The component guarding the supply chain does not rest on one person outside the project.
- The project carries the cost of writing and maintaining security-critical code, which the conformance suite checks
  against the specification.
- How long a freshness statement stays valid is set when the client is built.
- Depending on the available client was rejected because of its youth and its single maintainer.
