# 192. A restored instance starts held until the owner confirms the original is gone

Proposed.

## Context

A restore makes a copy of an identity, and the original may still be running
([record 189](0189-moving-an-instance-is-a-move-not-a-copy.md)). A copy that connected to peers at once would leave two
instances answering as one person ([record 20](0020-each-person-is-represented-by-one-instance.md)), and a copy cannot
tell that it is one unless it can tell its own machine from another.

## Decision

Before restoring, Astrana Owner Tools stops the local instance or takes it offline, and tries to reach the original by
sending its address a fresh signed challenge. Each installation has an installation identifier, created for its machine
and never included in a backup, and a running instance ignores a reply to its own challenge that carries its own
installation identifier and transport key. The restored instance starts held, connecting to no peers until the owner
confirms that the original is gone or retired. The restore is logged as taking over the identity, and the owner,
guardians and custodians are told.

## Consequences

- On shared hosting, where Astrana Owner Tools runs on the owner's own computer, the instance is taken offline by an
  offline marker file where the hosting provider honours one, or by a guided stop through its control panel.
- A copy restored onto another machine has a different installation identifier, so it cannot mistake itself for the
  original.
- Nothing about the hold is sent to peers, so they do not learn that a restore happened.
- A restore cannot finish connecting without the owner, which costs time when the owner knows the original is gone.
