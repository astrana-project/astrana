# 149. Each key does one job, under either the master key or the owner's recovery words

Proposed.

## Context

An instance holds keys for different jobs. The identity key proves who the instance is to its peers
([record 38](0038-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)), and the backup key
protects a backup. The database is encrypted by the disk and the database engine, whose keys Astrana does not hold
([record 124](0124-the-database-is-encrypted-at-rest-by-the-disk-and-the-database-engine-never-by-the-application.md)).
Some keys must be usable by the running instance at any hour, and others protect what only the owner should be able to
do, such as speaking for the instance's identity. Losing a key, or having one stolen, should leave an instance weaker,
not finished.

## Decision

Every key does one job. The keys the running instance needs are kept encrypted under one master key, sealed to the host
machine. The keys that only the owner should be able to use, above all the identity key, are kept under the owner's
recovery words, which the instance never holds. Where the recovery words serve several jobs, a separate key is derived
from them for each job, so no derived key can do another's work.

## Consequences

- Someone who takes the host machine, or the running instance, gets the keys under the master key and never the identity
  key.
- Using the identity key, such as to authorise a new key for routine signing, to end the identity or to replace the
  identity key, needs the owner and their recovery words.
- An owner who loses the host machine, and with it the master key, keeps their identity, because the identity key is
  under the recovery words, and restores everything else from a backup.
- An owner who loses the recovery words keeps a running instance and their data, but cannot read any backup or use the
  identity key again.
- Each key derived from the recovery words can be changed on its own, and one can be released without the others, such
  as a backup key released to a custodian without the means to take over the live instance.
- Keys under the master key are not derived from one another, so losing one leaves the others, and the identity,
  untouched.
