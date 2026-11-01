# 196. Every restore stages inside the live database and swaps in one step

Proposed.

## Context

A restore must leave an instance either completely restored or as it was
([record 191](0191-a-restore-either-completes-or-stops-never-half-done.md)). An instance runs with one database
([record 21](0021-an-instance-runs-as-one-copy-of-the-application-with-one-database.md)), many hosting plans allow only
one, and the account there cannot create another. Staging a restore in a second database means copying everything back
into the live one afterwards, and on one engine tables cannot be moved between databases at all.

## Decision

Every restore, on every hosting environment, is a staged swap restore. Astrana Owner Tools loads the backup into staging
tables inside the live database, checks them
([record 194](0194-a-restore-reads-only-values-and-takes-structure-from-astranas-own-migrations.md)), holds the
instance's writes, and swaps the staging tables in for the live ones in a single step. Where there is room, the previous
tables stay in the same database for thirty days as the way back, and the owner may remove them sooner.

## Consequences

- A restore works on a single-database hosting plan.
- Stopping a restore at any point leaves either the old tables or the new ones, never a mix, and the running application
  never reads half-swapped data.
- Writes made during a restore would otherwise be lost, so holding them before the swap makes the instance briefly
  unavailable in exchange for losing nothing.
- A restore needs about twice the space of the data at its peak, and reaching a quota stops it with the live tables
  intact.
- On some engines the grant the swap needs also lets the application's own database credentials read and write the
  staging tables, which widens what those credentials can touch, so the grants each engine needs are stated rather than
  described in general.
- Where the previous tables cannot be kept, the owner is told there is no way back to them and that the backup is still
  available. After a compromise or ransomware the previous tables are the damaged ones, so the owner is told so and
  offered their secure disposal at once rather than keeping them by default.
- A temporary second database for each restore was rejected, because single-database plans cannot have one, and copying
  back is slower and harder to make all or nothing. A standing spare database was rejected, because it would be one more
  database to manage and maintain.
