# 124. The identity, database and backup keys are independent

Proposed.

## Context

An instance holds keys for different jobs. The identity key proves who the instance is to its peers
([record 35](0035-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)), the database key protects
the database ([record 104](0104-the-database-is-encrypted-at-rest.md)), and the backup key protects a backup. Losing a
key should leave an instance weaker, not finished.

## Decision

No key is derived from another, and losing one does not expose or destroy what the others protect, except that the
backup key also protects the copies of the other keys and data that a backup holds.

## Consequences

- An owner who loses their identity key keeps all their data, and rebuilds who they can reach.
- An owner who loses the database key keeps their identity, so peers still recognise the instance. What the database
  held, including what the instance knows about its peers, is lost unless a backup restores it.
