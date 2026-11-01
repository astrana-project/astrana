# 238. Every installation is performed by Astrana Owner Tools

Proposed.

## Context

An instance has to be installed on the owner's own computer, on a server with no desktop, through automation, or on a
remote machine or shared hosting the owner reaches from their own computer
([record 68](0068-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)). The owner manages the
instance themselves ([record 35](0035-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)), and the
work that must come before the application can run has to be done by something other than the application
([record 85](0085-astrana-owner-tools-does-what-needs-the-host-machine-and-the-applications-setup-does-the-rest.md)).
Separate installers for each of these cases would behave differently and drift apart.

## Decision

Every installation is performed by Astrana Owner Tools, on the owner's own computer or on a remote one. There is no
separate installer. Owner Tools has a graphical interface and parts with no interface, and all of them carry the one
name. The graphical interface is never required, so servers with no desktop and automated installations use the parts
with no interface.

## Consequences

- The owner downloads Owner Tools and installs an instance through it, so the same checks run however an instance is
  installed.
- Stores and package managers deliver Owner Tools and never an instance, so no silent path reaches an instance, and the
  questions an instance needs answered before it exists are always asked.
- Once the application is installed, Owner Tools is not required but is strongly recommended for most people. Each tool
  can be acquired on its own and need not be present until a task needs it.
- An installation detects whether the host machine will sleep or hibernate and tells the owner, because an instance has
  to stay awake to answer its peers
  ([record 135](0135-what-an-instance-finds-about-its-hosting-environment-is-told-to-its-owner-and-nobody-else.md)).
- Steps that would otherwise fall to an installer, such as setting up the web server, sealing the first key and
  confirming a remote database's certificate, are done by Owner Tools.
- Separate product names for the parts of Owner Tools were rejected, so that one thing an owner has to find and learn
  carries one name.
