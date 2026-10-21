# 122. The identity, database and backup keys are independent

Proposed.

## Context

An instance holds keys for different jobs. The identity key proves who the instance is to its peers
([record 34](0034-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)), the database key protects
the database ([record 103](0103-the-database-is-encrypted-at-rest.md)), and the backup key protects a backup. Losing a
key should leave an instance weaker, not finished.

## Decision

No key is derived from another, and losing one does not expose or destroy what the others protect.

## Consequences

- An owner who loses their identity key keeps all their data, and rebuilds who they can reach.
- An owner who loses the database key keeps their connections, though not everything those connections produced.
