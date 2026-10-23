# 22. Media is stored as files, not in the database

Proposed.

## Context

Pictures, video and audio are large, and an instance's database holds everything else.

## Decision

Pictures, video and audio are stored as files, not in the database.

## Consequences

- Protection that applies to the database, such as its encryption, does not cover media, which needs protection of its
  own.
- Media and the database are two stores, which must be kept consistent with each other and backed up together.
- Storing media in the database was rejected, because large files would make the database large and slow to back up.
