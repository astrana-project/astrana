# 163. Each hosting environment is an adapter around the application

Proposed.

## Context

Instances run on the owner's own hardware or on hosting they rent
([record 60](0060-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)), on Linux, Windows and
macOS. Each environment starts and stops the backend's processes
([record 162](0162-the-browser-facing-side-and-the-key-holding-side-run-as-separate-processes.md)) differently. On a
server they run as system services whether or not anyone is signed in. On shared hosting the web server starts the
application and may recycle it at any time.

## Decision

Each environment the backend runs in has an adapter around it, called a hosting adapter. Hosting adapters differ only in
how the processes are started, stopped and supervised, which account they run as, and which platform adapters they
connect. They never differ in what the application does.

On Windows the processes run as Windows services, on Linux as systemd services, on macOS as launchd daemons, and in
containers with exactly one replica. On shared hosting the web server starts and manages them. Wherever the environment
allows, they run under an account of their own with the least privilege they need, never as an administrator or root.

## Consequences

- Behaviour is the same in every environment, so it is tested once.
- Differences between environments, such as where data and keys are kept, are ports with one adapter for each platform
  ([record 158](0158-the-inside-defines-ports-and-the-outside-adapts-to-them.md)).
- An instance runs as one copy
  ([record 20](0020-astrana-is-built-on-one-instance-per-person-running-as-one-live-copy.md)), so overlapped recycling
  is switched off under Internet Information Services (IIS), and a container platform never runs a second replica.
- Under IIS on shared hosting the application can be recycled at any moment, so no work depends on the process staying
  alive. Work that must happen later is recorded in the database and done by the scheduler when the application next
  runs ([record 56](0056-after-a-gap-the-scheduler-does-what-still-needs-doing-not-everything-it-missed.md)).
- A hosting adapter that runs only while the owner is signed in would leave the instance unreachable to peers the rest
  of the time, so adding one needs a record of its own.
- A separate executable for each environment was rejected because their behaviour would drift apart.
