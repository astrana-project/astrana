# 249. Records have a sequential internal key and a random public identifier

Proposed.

## Context

Every table needs a key, and a record that anything outside the instance refers to needs an identifier that can be given
out. A sequential key keeps a table packed, and gives away how many records exist and in what order they were made. A
random identifier gives nothing away, and used as the key it fragments the table so that its indexes need rebuilding
from time to time. An instance has no database administrator to do that, and on one engine a rebuild is offline except
in its most expensive edition and needs the schema account, which on shared hosting is kept on the owner's computer
([record 244](0244-only-astrana-owner-tools-can-change-the-database-schema-and-only-when-the-owner-applies-it.md)).

## Decision

Every table that anything outside the instance refers to has two identifiers. The primary key is a sequential 64-bit
integer. The public identifier is a random 16-byte value with a unique index, stored in its compact binary form rather
than as text. The internal key never leaves the instance, in responses, in paging cursors or in logs. Join tables and
tables that nothing outside refers to have the internal key alone. Time-ordered identifiers are not used.

## Consequences

- Tables stay packed, so an instance stays healthy without any scheduled index maintenance.
- Nothing outside the instance can learn how many records it holds, or when or in what order they were made.
- The extra unique index costs about a third more storage than the smallest possible design, and a lookup by public
  identifier is slightly slower than by the internal key.
- Every boundary that gives out an identifier has to translate between the two.
- A random identifier as the primary key was rejected because it fragments the table and roughly doubles its size on
  some engines. A time-ordered identifier was rejected because the runtime's ordered form is not ordered under one
  engine's comparison, and because it would reveal to peers when each record was made.
