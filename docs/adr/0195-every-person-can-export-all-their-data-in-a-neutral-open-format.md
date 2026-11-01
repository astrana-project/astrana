# 195. Every person can export all their data in a neutral, open format

Proposed.

## Context

Content belongs to whoever created it ([record 5](0005-content-belongs-to-the-person-who-created-it.md)), and a person's
data lives on one instance. A backup is an encrypted archive made for restoring that instance
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)),
which is no help to someone who wants their data in a form other software can read, to keep, to move elsewhere or to
hand to someone.

## Decision

Every person with an account on an instance can export all of their data in a neutral format. It is written as activity
objects in an open, published standard, inside a standard container that carries a checksum for every file. Other
people's words, such as comments on the person's posts, go in a separate and clearly marked part. An export never
contains private keys.

## Consequences

- An export can be read without Astrana, and its checksums show whether any file in it was damaged or altered.
- No existing format keeps a person's own words apart from other people's, so Astrana marks that part itself. Whoever
  receives an export can keep it ([record 176](0176-what-leaves-an-instance-can-be-kept-by-those-who-receive-it.md)),
  and the marking shows them whose words are whose.
- Comparable projects put keys in their exports. Astrana does not, because an export is meant to be handed around, and
  identity keys travel only in encrypted backups. An export therefore cannot be used to act as the instance it came
  from.
