# 128. Until setup is finished, the setup page answers only on the host machine

Proposed.

## Context

The time before an instance is set up is the most exposed in its life, because the setup page is the one page that can
create the owner's account
([record 85](0085-astrana-owner-tools-does-what-needs-the-host-machine-and-the-applications-setup-does-the-rest.md)).
Every request arrives through the web server, so where it came from is judged from the forwarded address the web server
passes on ([record 105](0105-every-installation-runs-behind-a-web-server.md)).

## Decision

While an instance is not yet set up, its setup page can be reached only from the machine it runs on. An owner may choose
to open it to the network, with a visible warning. On shared hosting, where nobody can reach the host machine, the page
instead accepts only a one-time code that Astrana Owner Tools generates on the owner's computer and places in the
hosting account. Once setup is complete, the page is switched off for good.

## Consequences

- Nobody elsewhere on the network can create the owner's account before the owner does.
- On a server without a screen, the installer prints the setup address and a command to reach it, rather than opening
  setup to the network by itself.
- On shared hosting, controlling the hosting account stands in for being on the host machine, so setup is never open to
  whoever reaches the page first.
