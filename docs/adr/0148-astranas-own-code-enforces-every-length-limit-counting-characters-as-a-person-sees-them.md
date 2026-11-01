# 148. Astrana's own code enforces every length limit, counting characters as a person sees them

Proposed.

## Context

Every field that takes text needs a limit, and the server checks lengths
([record 144](0144-the-server-checks-everything-the-app-checks.md)). The supported databases
([record 75](0075-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server-and-mariadb-follows-the-first-release.md))
disagree about what a column's declared size counts. PostgreSQL and MySQL count characters, and Microsoft SQL Server
counts pairs of bytes, so a title of 200 emoji fits two of them and not the third. Astrana has to serve Latin, Chinese,
Arabic, Hebrew, Hindi, Persian and Zulu writing among others, and emoji alongside all of them.

## Decision

Astrana's own code defines and enforces every length limit, and the databases only store. A limit counts extended
grapheme clusters, which are the characters a person sees, and the server's count is the one that decides. The browser
shows a live count using the same definition. A hidden limit on underlying size sits alongside every visible limit.

## Consequences

- The count a person watches while typing is the count that is applied, and it is the same on every database.
- One visible character can carry hundreds of combining marks, so without the hidden limit a generous visible limit
  would also be a generous storage limit.
- Columns are sized from the hidden limit, so every supported database holds the same maximum and an archive restores
  into any of them. A column is wider than the visible limit suggests.
- Each database has to be created with a character set and collation that hold the whole of Unicode, and the installer
  establishes them. On MySQL that is the four-byte character set, because the three-byte one cannot hold characters
  beyond the basic plane, such as most emoji.
- Letting each database count was rejected, because the same text would then fit on one instance and not on another.
