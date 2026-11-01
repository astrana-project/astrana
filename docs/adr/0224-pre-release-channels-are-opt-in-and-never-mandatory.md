# 224. Pre-release channels are opt-in and never mandatory

Proposed.

## Context

The version catalogue tells an instance which versions exist on its release channel
([record 73](0073-information-about-versions-comes-from-one-central-signed-catalogue.md)). Work on Astrana is released
in small increments as alpha pre-releases ([record 222](0222-version-numbers-say-what-an-update-means.md)), and a
pre-release is less tested than a general release. Owners rely on their instance to stay in touch with people, and
decide for themselves what it runs ([record 131](0131-nothing-can-change-an-instances-behaviour-remotely.md)).

## Decision

Astrana has alpha, beta, release candidate and general release channels. An instance follows the general release channel
unless its owner chooses a pre-release channel, and no pre-release is ever mandatory.

## Consequences

- An owner who never opts in only ever sees general releases.
- Alpha and beta are cut from the integration branch, release candidates from a stabilising branch, and general releases
  from the main branch. A build becomes beta once every feature planned for that minor version is present with its
  documentation.
- General releases come every six to eight weeks when there is meaningful content, and security fixes and critical bugs
  go out as patches straight away.
- A release is ready only with its release notes, guides and announcement, which are part of releasing rather than
  things that follow it.
