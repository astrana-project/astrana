# 166. Each hosting environment is an adapter around the application

Proposed.

## Context

Instances run on the owner's own hardware or on hosting they rent
([record 64](0064-an-instance-may-run-on-the-owners-own-hardware-or-on-hosting-they-rent.md)), on Linux, Windows and
macOS. Each environment starts and stops the backend's processes
([record 152](0152-the-browser-facing-side-and-the-key-holding-side-run-as-separate-processes.md)) differently. On a
server they run as system services whether or not anyone is signed in. On shared hosting the web server starts the
application and may recycle it at any time.

## Decision

Each environment the backend runs in has an adapter around it, called a hosting adapter. Hosting adapters differ only in
how the processes are started, stopped and supervised, which account they run as, and which platform adapters they
connect. They never differ in what the application does.

On Windows the processes run as Windows services, on Linux as systemd services, and on macOS as launchd daemons. How the
two processes run on shared hosting is decided separately. Wherever the environment allows, they run under an account of
their own with the least privilege they need, never as an administrator or root.

Containers are a later hosting environment, not part of the first release. From the start the application stays
independent of them. It takes its configuration from a path, reads secrets through one interface with several
providers, has its data locations configured, offers a health check and stops cleanly when asked.

## Consequences

- The application's behaviour is the same in every environment, so it is tested once, and each hosting adapter is tested
  for how it starts, stops and supervises the processes.
- Differences between environments, such as where data and keys are kept, are ports with one adapter for each platform
  ([record 162](0162-the-inside-defines-ports-and-the-outside-adapts-to-them.md)).
- A container image can be added later without changing the application, and moving between a container and a native
  installation keeps the same data, configuration and keys.
- Supporting containers well needs work of its own, such as an update notice that gives instructions because nothing
  inside a container may control its runtime, fixed version tags only, a single running copy, secrets with no operating
  system key store, and storage encryption that cannot be verified from inside a container.
- An instance runs as one copy ([record 21](0021-an-instance-runs-as-one-copy-of-the-application-with-one-database.md)),
  so overlapped recycling is switched off under Internet Information Services (IIS), and a container platform will never
  run a second replica.
- Under IIS on shared hosting the application can be recycled at any moment, so no work depends on the process staying
  alive. Work that must happen later is recorded in the database and done by the scheduler when the application next
  runs ([record 60](0060-after-a-gap-the-scheduler-does-what-still-needs-doing-not-everything-it-missed.md)).
- A hosting adapter that runs only while the owner is signed in would leave the instance unreachable to peers the rest
  of the time, so adding one needs a record of its own.
- A separate executable for each environment was rejected because their behaviour would drift apart.
