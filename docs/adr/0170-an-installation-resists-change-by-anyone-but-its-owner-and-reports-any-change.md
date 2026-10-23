# 170. An installation resists change by anyone but its owner, and reports any change

Proposed.

## Context

An installation can be changed by accident, by someone without authority over it, or by its owner. The owner holds final
authority over their instance and what it runs
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)), and on hardware they control an
administrator can always override a protection in the end. What an instance learns about its hosting environment is told
to its owner
([record 118](0118-what-an-instance-finds-about-its-hosting-environment-is-told-to-its-owner-and-nobody-else.md)).

## Decision

An installation resists accidental and unprivileged change to its software and configuration. Its files are owned by an
administrator and cannot be written by the account the application runs as, and its configuration is changed through the
application rather than by editing files. The owner can override this as the machine's administrator, and the instance
detects any change to its installation and tells the owner.

## Consequences

- A mistake, or a person or program without administrator rights, cannot quietly change what the instance runs.
- An owner who changes their own installation, such as to load a module Astrana declined, can do so, and is told what
  changed.
- The account the application runs as cannot write its own files, so applying an update needs a step run with
  administrator rights.
- On shared hosting, where everything runs under one account, the protection is absent.
- Detection cannot stop an attacker who has administrator rights on the machine, and the instance does not claim it can.
- Resisting even the owner's changes was rejected because nobody holds authority above the owner. Only detecting and
  reporting changes, without resisting any, was rejected because accidents and unprivileged changes are worth stopping
  before they happen.
