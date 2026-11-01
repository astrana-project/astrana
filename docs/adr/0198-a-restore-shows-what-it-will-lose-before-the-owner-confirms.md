# 198. A restore shows what it will lose before the owner confirms

Proposed.

## Context

A restore loses whatever changed after its archive was made, including what peers wrote on the instance, of which no
other copy exists ([record 196](0196-every-restore-stages-inside-the-live-database-and-swaps-in-one-step.md)). It
usually happens at a bad moment, often after a compromise, when the live data may itself have been altered.

## Decision

Before a restore, Astrana Owner Tools shows the archive's date, what comes back, what the owner deleted after that date
and so stays deleted, what has expired and will not return, and what will be lost, as a count with a few examples, such
as three comments and one profile post since a given date. Where the old database is gone, it says plainly that content
deleted after the archive will come back. It checks the integrity of the live data first, and where that fails it says
the current data has been altered and that what will be lost cannot be told reliably, and marks any comparison as
unverified. The owner then confirms. Afterwards a summary gives the counts restored and not restored, anything missing,
and anything flagged, such as audit entries that failed their integrity checks, stated apart from the totals.

## Consequences

- A loss the owner was shown beforehand is a choice, and they can pick a newer backup or not restore at all.
- A count with examples, rather than a full list, keeps the owner from being overwhelmed at a bad moment.
- Anything taken from the live data is shown as text only, because a compromised database can hold hostile content.
- Progress names each step in plain words, and the instance is unchanged until the final swap.
- Refusing the restore when tampering is found, as other failed protections hold back
  ([record 14](0014-when-a-protection-cannot-be-applied-the-instance-holds-back-rather-than-going-ahead.md)), was
  rejected, because a compromised instance is when the owner most needs to restore.
