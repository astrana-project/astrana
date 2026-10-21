# 133. A restore either completes or stops, never half done

Proposed.

## Context

An instance restores from its backups ([record 130](0130-an-instance-backs-itself-up-into-an-encrypted-archive.md)), and
a restore can fail part way.

## Decision

If a restore fails or is interrupted, the instance rolls back where it can, and otherwise stops and says so. It never
starts with only part of its data.

## Consequences

- An owner never has to guess what survived.
- An instance that refuses to start can be recovered, where one silently missing data may not be.
