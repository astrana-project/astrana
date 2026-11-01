# 108. The database is encrypted at rest by the disk and the database engine, never by the application

Proposed.

## Context

The database holds what an owner has written and what their instance knows about their peers
([record 71](0071-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server.md)). On modern storage, deleting data does
not reliably destroy it. Encryption at rest can be done by the disk, by the database engine, or by the application
before data reaches the database, and the supported databases differ in what they offer.

## Decision

The database is encrypted at rest. The encryption is the disk's, with the database engine's own encryption added where
the engine has it. The application does not encrypt data before storing it.

## Consequences

- The database's own search keeps working, which encrypting before storage would break.
- The application cannot lose a key and with it the owner's data.
- PostgreSQL and Microsoft SQL Server Express have no built-in encryption at rest, so for most installations disk
  encryption is the only protection at rest, and checking for it matters most.
- An instance never presents its database as encrypted when it cannot verify that it is, and tells its owner. Disk
  encryption that cannot be verified is a warning, not a reason to refuse the installation.
- Destroying a key destroys the content only where the owner uses the engine's own encryption and holds that key, and
  Astrana promises it only there. Elsewhere the key belongs to the operating system and the owner, and what an owner can
  do is destroy the volume's key or the disk itself, which takes everything on the volume and not Astrana's data alone.
- The requirement earns its place by protecting data at rest whatever happens at an ending, so only the promise about
  disposal depends on the mechanism.
- Media is not in the database, so files on the instance's own disk and in external storage are not covered by the
  engine's encryption.
- Encrypting in the application was rejected because it breaks search and risks the key being lost. An open-source
  encryption extension for PostgreSQL is not offered in the first release, because it needs its vendor's own build of
  PostgreSQL, appears to run only on Linux, and leaves temporary files and statistics unencrypted.
