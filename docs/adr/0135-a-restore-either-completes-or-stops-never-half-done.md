# 135. A restore either completes or stops, never half done

Proposed.

## Context

An instance restores from its backups ([record 132](0132-an-instance-backs-itself-up-into-an-encrypted-archive.md)), and
a restore can fail part way.

## Decision

If a restore fails or is interrupted, the instance rolls back where it can, and otherwise stops and says so. It never
starts with only part of its data.

## Consequences

- An owner never has to guess what survived.
- An instance that refuses to start can be recovered, where one silently missing data may not be.
- Rolling back needs room to keep the state from before the restore until the restore completes.
- An instance that stops stays offline until its owner acts.
- Restoring what can be restored and reporting the rest was rejected, because an owner cannot tell from a report what is
  missing from their data.
