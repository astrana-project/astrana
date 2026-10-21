# 22. Media is stored as files, not in the database

Proposed.

## Context

Pictures, video and audio are large, and an instance's database holds everything else.

## Decision

Pictures, video and audio are stored as files, on the instance's own machine or with a storage provider, not in the
database.

## Consequences

- Protection that applies to the database, such as its encryption, does not cover media, which needs protection of its
  own.
