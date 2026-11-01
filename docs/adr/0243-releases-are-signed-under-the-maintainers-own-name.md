# 243. Releases are signed under the maintainer's own name

Proposed.

## Context

Operating systems show the publisher named in a code-signing certificate when someone installs software. Astrana has no
legal entity and one maintainer. Release artefacts are code-signed by the maintainer locally, with a hardware token
([record 242](0242-release-artefacts-are-built-twice-must-match-byte-for-byte-and-are-signed-only-locally.md)).

## Decision

Code-signing certificates are bought by the maintainer and issued to them as an individual, so their validated legal
name appears as the publisher. Windows releases are signed with an individual validation certificate from a commercial
certificate authority, with its key on a hardware token. macOS releases are signed and notarised with an Apple Developer
identity. Linux packages and repositories are signed with a separate key on a hardware token. Development uses test
keys, and the real keys are used from the first release candidate.

## Consequences

- A person installing Astrana sees the name of the person who answers for it.
- A signature proves who produced a release and that it has not changed since. It does not prove the code is safe.
- The maintainer's legal name appears on every installation prompt, which exposes them personally, as an instance's
  owner is exposed.
- Certificates cost money every year, and new code-signing certificates last little more than a year, so each is
  re-issued, and probably re-validated, by one person.
- A foundation's free signing service for open-source projects was rejected, because the publisher a person sees would
  not be the name they expect.
