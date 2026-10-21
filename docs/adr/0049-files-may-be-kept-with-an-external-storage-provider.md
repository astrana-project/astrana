# 49. Files may be kept with an external storage provider

Proposed.

## Context

Files are stored outside the database ([record 22](0022-media-is-stored-as-files-not-in-the-database.md)), local disk
space is limited, and many people already keep their photos with a storage provider.

## Decision

Files live on the instance's own machine by default. An owner may instead keep them with a trusted external provider,
through a connector that Astrana maintains. Files kept that way are served through the same controlled route as local
ones.

## Consequences

- An owner can share an existing library through Astrana without moving it.
- Astrana chooses which providers it supports, and does not accept any address an owner types in.
- Several providers can be used at once, so changing provider is a migration, not a cliff edge.
- The provider is responsible for backing up what it holds.
