# 237. An installation resists change by anyone but its owner, and reports any change

Proposed.

## Context

An installation can be changed by accident, by someone without authority over it, or by its owner. A flaw that let
someone write into the application's folder could change its code, or take the instance offline by planting a file there
again and again. The owner holds final authority over their instance and what it runs
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)), and on hardware they control an
administrator can always override a protection in the end. What an instance learns about its hosting environment is told
to its owner
([record 135](0135-what-an-instance-finds-about-its-hosting-environment-is-told-to-its-owner-and-nobody-else.md)).

## Decision

An installation resists accidental and unprivileged change to its software and configuration. The instance cannot write
to its own application folder, and uploads and data always live outside it. Its configuration is changed through the
application rather than by editing files. Every time it starts, the instance checks its files against a signed manifest,
so a modified or added file is detected. The owner can override this as the machine's administrator, and the instance
tells the owner of any change it detects.

## Consequences

- A mistake, or a person or program without administrator rights, cannot quietly change what the instance runs.
- Each platform enforces the folder rule in its own way. On Windows it uses access control lists and a service identity
  that can only read. On Linux the folder is owned by root, with the service manager's strict protection and named
  writable paths. On macOS the folder is owned by root.
- An owner who changes their own installation, such as to load a module Astrana declined, can do so, and is told what
  changed.
- The account the application runs as cannot write its own files, so applying an update needs a step run with
  administrator rights.
- On shared hosting, where the site runs as the owner of its own files, the folder rule cannot be enforced. It is
  detected and reported to the owner as a limit of the hosting environment.
- Detection cannot stop an attacker who has administrator rights on the machine, and the instance does not claim it can.
- Resisting even the owner's changes was rejected because nobody holds authority above the owner. Only detecting and
  reporting changes, without resisting any, was rejected because accidents and unprivileged changes are worth stopping
  before they happen.
