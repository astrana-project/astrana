# 248. Database data is isolated from every process that could bypass Astrana

Proposed.

## Context

The database is encrypted at rest by the disk and the database engine
([record 124](0124-the-database-is-encrypted-at-rest-by-the-disk-and-the-database-engine-never-by-the-application.md)),
and disk encryption does nothing while the machine is running. Any other process that can read the database's files, or
connect to it, can read or change the owner's data without passing through anything Astrana checks.

## Decision

Database data is isolated from processes that might read or change it without going through Astrana's controls. Astrana,
the database and the web server run under separate service accounts. The database's data folder is readable only by the
database's own account, mandatory access control confines the services on Linux, and the database listens only locally.
Every database account holds only the rights its job needs, backups are encrypted, and logs never record data values.
The instance checks that swap space, temporary files and dumps land on the encrypted volume, and that the data folder is
not inside a folder synchronised to a cloud service.

## Consequences

- Another program on the machine, or a user without administrator rights, cannot read the database behind Astrana's
  back.
- An administrator account, and the database's own system account, can still read and change anything on the machine,
  and the instance does not claim otherwise.
- Something that takes over Astrana's own identity can read what Astrana can read, limited only by the rights each
  database account holds.
- On shared hosting most of the isolation is the hosting provider's rather than Astrana's, and the instance reports what
  it cannot check
  ([record 135](0135-what-an-instance-finds-about-its-hosting-environment-is-told-to-its-owner-and-nobody-else.md)).
