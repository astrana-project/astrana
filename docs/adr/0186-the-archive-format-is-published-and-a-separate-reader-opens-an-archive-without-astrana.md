# 186. The archive format is published, and a separate reader opens an archive without Astrana

Proposed.

## Context

An owner should keep control of their data even if Astrana stops being developed, will not install, or they decide to
leave it. An archive only Astrana can open would make the project the one way to reach an owner's backups
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)),
and an archive kept for years outlives the owner's memory of what made it.

## Decision

The archive format specification is published. A core archive is a sealed container in chunks of one mebibyte, holding
in a familiar archive layout one line-delimited structured text file per table, each compressed on its own, the
configuration and the keys, and a manifest listing every file's hash, each table's row count and column types, the media
the archive needs and the heads of the chains that protect critical records against tampering. The file has its own
extension and begins with its own signature. A small, separate open-source reader decrypts and unpacks an archive with
the owner's recovery secret ([record 182](0182-the-instance-writes-backups-it-cannot-read.md)). It is signed, ships
inside Astrana Owner Tools and is also published as a download of its own.

## Consequences

- An owner can get their data out of any archive without installing Astrana.
- The reader handles the recovery secret, so it is kept minimal and is verified before use.
- The signature lets an archive be recognised even when renamed, and Astrana Owner Tools registers the extension so that
  opening a backup opens the right tool.
- Tampering is caught from the manifest before any database is connected to, and the chunks let one table be read
  without decrypting the whole archive.
- A published format is a commitment, so changing it needs a new format version that Astrana and the reader both keep
  reading.
- The compression level is open, to be settled by measurement.
- Keeping the format to Astrana alone was rejected, because it would hold an owner's data captive to the project.
