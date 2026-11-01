# 245. Hosting that cannot keep the database accounts apart cannot carry an instance

Proposed.

## Context

An instance uses a content account, a schema account and an administrator account in its database, so that the running
application never holds rights over the schema
([record 244](0244-only-astrana-owner-tools-can-change-the-database-schema-and-only-when-the-owner-applies-it.md)). On
shared hosting the hosting provider's control panel decides what database accounts can exist. Some panels offer only one
database user, and some give a user all privileges on a database or none, so the separation cannot be expressed there at
all.

## Decision

The separation between the database accounts is never weakened to suit a hosting provider. Shared hosting is supported
where the hosting provider allows the separation, and Astrana Owner Tools checks that before anything is installed. A
hosting environment that offers one database user, or no control over privileges, is refused. Where a panel can express
the privileges, Astrana Owner Tools creates the database and its accounts through the panel's own interface, with a
revocable token kept on the owner's computer, and guides the owner through the steps where the interface cannot do it.

## Consequences

- An owner on a hosting plan that does not qualify is told plainly why, and pointed to a hosting provider that does or
  to a private virtual server.
- Some of the commonest shared hosting cannot carry an instance at all. One common panel qualifies with MySQL, where
  privileges are granted one at a time, and not with Microsoft SQL Server, where every role that can write can also
  change the schema.
- People who would try shared hosting anyway are the ones turned away when their hosting provider does not qualify, and
  moving to one that does costs them money and effort.
- A hosting provider that wants to offer Astrana can add more database users and control over privileges, though a new
  project gives it little reason to.
- Running on such hosting with the separation absent and the owner warned was rejected, because the separation that
  keeps a compromised application from changing its own schema is not weakened to accommodate any hosting provider.
  Guided manual steps cannot rescue a panel that cannot express the separation, because the owner works through the same
  panel.
