# 53. Files may be kept with an external storage provider

Proposed.

## Context

Files are stored outside the database ([record 24](0024-media-is-stored-as-files-not-in-the-database.md)), local disk
space is limited, and many people already keep their photos with a storage provider.

## Decision

Files live on the instance's own machine by default. An owner may instead keep them with an external provider for which
Astrana maintains a connector. Astrana chooses which providers it supports, and does not accept any address an owner
types in. Several providers can be used at once. Files kept that way are served through the same controlled route as
local ones.

## Consequences

- An owner can share an existing library through Astrana without moving it.
- Because several providers can be used at once, changing provider is a gradual move, not a cliff edge.
- The provider is responsible for backing up what it holds.
