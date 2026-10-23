# 156. Each release lists everything it ships in a software bill of materials

Proposed.

## Context

Astrana bundles only open-source components so that they can be audited and a release can be checked against what it
claims to contain ([record 39](0039-only-open-source-components-are-bundled.md)). Checking a release needs a list of
every component it ships. An owner or a reviewer who hears of a vulnerability in a component needs to find out quickly
whether a given release contains it, and at which version. The
[lock files](0155-every-dependency-version-is-pinned-in-a-committed-lock-file.md) already pin every version, but they
also list development tooling that never ships, and their format is specific to each ecosystem.

## Decision

Each release publishes a software bill of materials for what it ships, in the CycloneDX format, generated from the lock
files and published alongside the release it describes. It lists the components that run in an instance and the
components the frontend runs in the browser, and leaves out development and test tooling.

## Consequences

- Anyone can check whether a release contains a given component, at which version and under which licence, without
  building it.
- Vulnerability scanners can read the bill of materials directly.
- Generating it is a release step, and the generator is build tooling that is not shipped.
- Listing every installed package, development tooling included, was rejected because it would report components no
  instance runs. Leaving the list to be read out of the lock files was rejected because their format is specific to each
  ecosystem and mixes in tooling that does not ship.
