# 187. Changes that weaken backup protection need fresh confirmation, an announcement and a delay

Proposed.

## Context

Backups are the way back after a compromise
([record 181](0181-the-instance-makes-scheduled-backups-and-astrana-owner-tools-makes-manual-ones-verifies-and-restores.md)),
so someone who takes over a signed-in session has every reason to switch them off or weaken them quietly before doing
anything else.

## Decision

Backup settings are changed in the instance's web app. Ordinary changes take effect at once. Switching backups off,
shortening retention, removing a destination and turning off media encryption each need a fresh confirmation with a
second factor ([record 126](0126-a-second-factor-is-required.md)), are announced through every channel the owner
receives notices on, are recorded in the audit log
([record 9](0009-every-material-action-is-logged-and-the-log-never-copies-content.md)), and take effect only after a
delay. Changing the key that backups are sealed to needs the recovery secret.

## Consequences

- A stolen session cannot weaken backups quietly, and the owner has the delay in which to notice and undo the change.
- An owner who means to make such a change has to wait for it.
- Sealing backups to a different key would let whoever holds it read every later backup, which is why it needs the
  recovery secret rather than a second factor.
- The length of the delay is open.
