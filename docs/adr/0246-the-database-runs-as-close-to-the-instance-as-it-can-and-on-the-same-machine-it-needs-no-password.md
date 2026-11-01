# 246. The database runs as close to the instance as it can, and on the same machine it needs no password

Proposed.

## Context

The application connects to its database with the content account, and Astrana Owner Tools with the schema account
([record 244](0244-only-astrana-owner-tools-can-change-the-database-schema-and-only-when-the-owner-applies-it.md)). A
password for either can be stolen from configuration, from a backup or from a log. A database on the host machine can
instead trust the operating system's identity of the account that connects, which is possible only on the same machine.
Every step further away adds network exposure, credentials that can be stolen, latency, and a dependence on another
machine and the network between.

## Decision

The database runs as close to the instance as it can, preferring the host machine itself, then a server on the same
private network, then a remote server. On the host machine the database trusts the operating system's identity, with no
password, listens only locally, and its administrator account is reachable only through the database's own operating
system account. Where that is unavailable, the connection uses a long random password kept encrypted in configuration,
or a client certificate for a remote server. A connection without any authentication is never used. Shared hosting,
where the hosting provider runs the database server, is the exception to the order of preference.

## Consequences

- In the recommended installation no database secret exists to be stolen, and only the right operating system account
  can connect.
- The preference is a preference rather than a requirement, because the protection it gives is lost at the first step
  away and nothing further down the order recovers it.
- MySQL on Windows, Microsoft SQL Server on Linux without a directory domain, a database on another machine and shared
  hosting all fall back to a password or a certificate.
- A password kept encrypted on the same machine as its key is obfuscation rather than protection, and the instance does
  not present it as more.
