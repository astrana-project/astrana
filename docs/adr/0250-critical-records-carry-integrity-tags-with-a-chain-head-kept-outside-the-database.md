# 250. Critical records carry integrity tags, with a chain head kept outside the database

Proposed.

## Context

Some records decide who can do what on an instance, such as accounts, roles, guardian links and the keys of peers, and
the audit log records what was done
([record 9](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)). Someone who can write to the
database directly, without going through the application, could change one of them, put an old version back, or delete
it, and the application would read the result as genuine.

## Decision

Each critical or sensitive record carries a tag computed over its content, its table, its key, the account it belongs to
and its version. This covers accounts, roles, guardian links, peer keys and the audit log. A chain head for each account
is kept outside the database, so that a record rolled back or deleted is caught as well as one changed. Tags are checked
in the query layer whenever such a record is read, in a daily sweep and during a restore. The tag key is encrypted under
the instance's master key and kept outside the database, beyond the reach of every database account.

## Consequences

- A change made directly in the database is detected, including one made with the schema account.
- A tag that does not match, a key that is not known and a scheme that is not known are reported as three different
  failures. A failed tag on an account record forces that account's password to be reset.
- The cost is a few microseconds a record and a little more storage, and a dump and restore, a change of collation or an
  index rebuild raise no false alarms.
- Changing the tag key means tagging every covered record again.
- Tags detect tampering and do not prevent it. Someone who holds the tag key as well as the database can forge them.
- Tags alone were rejected because they miss a record rolled back or deleted. Checking tags as Entity Framework Core
  builds each object was rejected because it cost many times more than checking in the query layer.
