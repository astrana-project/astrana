# 112. Until setup is finished, the setup page answers only on the host machine

Proposed.

## Context

The time before an instance is set up is the most exposed in its life, because the setup page is the one page that can
create the owner's account
([record 76](0076-the-installer-does-only-what-must-come-first-and-the-applications-setup-does-the-rest.md)). Every
request arrives through the web server, so where it came from is judged from the forwarded address the web server passes
on ([record 95](0095-the-owner-supplies-the-web-server-in-front-of-the-instance.md)).

## Decision

While an instance is not yet set up, its setup page can be reached only from the machine it runs on. An owner may choose
to open it to the network, with a visible warning. Once setup is complete, the page is switched off for good.

## Consequences

- Nobody elsewhere on the network can create the owner's account before the owner does.
- On a server without a screen, the installer prints the setup address and a command to reach it, rather than opening
  setup to the network by itself.
- On shared hosting the owner cannot open the page from the host machine, so they must open it to the network, and
  someone else could reach it first while it is open.
