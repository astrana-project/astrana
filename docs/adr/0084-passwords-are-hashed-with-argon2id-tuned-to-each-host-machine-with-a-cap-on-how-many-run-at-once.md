# 84. Passwords are hashed with Argon2id, tuned to each host machine, with a cap on how many run at once

Proposed.

## Context

Astrana keeps its own accounts
([Astrana writes its own account system](0083-astrana-writes-its-own-account-system-on-the-frameworks-lower-level-parts.md)),
so it stores a hash of every password. A hash strong enough to resist cracking costs memory and time on every sign-in,
and Astrana runs on anything from a small single-board computer to a rented server
([record 80](0080-on-modest-hardware-astrana-runs-slower-and-never-stops.md)).

## Decision

Passwords are hashed with Argon2id, through the BouncyCastle cryptography package. At installation the instance measures
its host machine and picks the strongest setting that keeps a sign-in between about half a second and a second within
the spare memory, and never goes below the published minimum. It confirms the choice by timing several sign-ins at that
setting and steps down if the middle value is over budget. The settings are stored with each hash. The instance caps how
many passwords are hashed at once and queues the rest.

## Consequences

- Settings can be raised later, and an old hash is rehashed with the new settings at the person's next sign-in.
- If even the published minimum is over budget, the owner is told.
- A flood of sign-ins waits in the queue rather than exhausting memory. Without the cap, many simultaneous hashes ran
  out of memory, and raising the memory limit let the operating system kill the whole process instead.
- One fixed setting for every machine was rejected, because it would be too weak on a fast server or too slow on a small
  one.
