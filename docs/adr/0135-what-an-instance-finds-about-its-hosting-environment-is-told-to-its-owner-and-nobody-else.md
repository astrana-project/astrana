# 135. What an instance finds about its hosting environment is told to its owner, and nobody else

Proposed.

## Context

An instance can learn things about the machine it runs on, such as whether its data is really encrypted
([record 68](0068-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)). That knowledge could
inform the owner, stop the instance running, or be passed to peers. A few weaknesses are not the owner's alone to
accept, because a compromised instance puts its peers at risk as well as its owner.

## Decision

What an instance finds about its hosting environment is told to its owner, and never reported to peers. It is not used
to refuse to run, except for a stated set of refusals. A hosting environment that cannot keep the database accounts
separate is refused, and so is a database on another machine that cannot be reached over verified encrypted transport.
Both are checked before anything is installed, and a database whose certificate stops matching the one the owner
confirmed is not connected to until the owner acts.

## Consequences

- An owner who chooses a weak hosting environment is told plainly, and the choice stays theirs, except where a stated
  refusal applies.
- Each refusal is explained to the owner with what would let the installation go ahead.
- Peers never learn how well another owner's instance is set up.
