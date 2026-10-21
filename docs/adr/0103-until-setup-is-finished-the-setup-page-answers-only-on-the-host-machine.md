# 103. Until setup is finished, the setup page answers only on the host machine

Proposed.

## Context

The time before an instance is set up is the most exposed in its life, because the setup page is the one page that can
create the owner's account
([record 69](0069-the-installer-does-only-what-must-come-first-and-the-applications-setup-does-the-rest.md)).

## Decision

While an instance is not yet set up, its setup page can be reached only from the machine it runs on. An owner may choose
to open it to the network, with a visible warning. Once setup is complete, the page is switched off for good.

## Consequences

- Nobody elsewhere on the network can create the owner's account before the owner does.
- On a server without a screen, the installer prints the setup address and a command to reach it, rather than opening
  setup to the network by itself.
