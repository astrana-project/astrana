# 189. Moving an instance is a move, not a copy

Proposed.

## Context

An owner may need new hardware, or may change their mind about where to run their instance.

## Decision

Migration moves an instance, with the same identity and the same peers, to another machine or kind of hosting. It uses
backup and restore
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)),
and ends with the original standing down.

## Consequences

- Choosing where to run an instance can be reversed, which is what makes it a real choice.
- For a while the same identity exists in two places, and that window is named, not hidden.
- The original stands down by its owner's act. Neither copy stands down by itself on learning that the other is running,
  because an automatic stand-down could be turned against the honest copy.
- The moved instance connects to no peers until the owner confirms that the original is gone or retired.
- A move opens a backup, so it needs the owner's recovery words, and the moved instance seals a fresh master key to its
  new machine and issues a fresh key for signing its transport keys.
- Where a move changes the instance's address, its peers have to learn the new one.
- An original that has been lost or cannot be reached cannot stand down, but each peer refuses it once that peer has
  seen the moved instance's newer transport keys.
