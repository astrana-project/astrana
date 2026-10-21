# 35. Hosts are adapters around one application

Proposed.

## Context

Instances run on desktops, laptops, servers and shared hosting, on Linux, Windows and macOS. Each environment starts and
stops the backend differently. On a server it runs as a system service whether or not anyone is signed in. On shared
hosting the web server starts it and may recycle it at any time. Some ways of distributing software on the desktop
cannot install a system service at all, only run something while the owner is signed in.

## Decision

There is one backend application, and each environment it runs in is an adapter around it, called a host. Hosts differ
only in how the application is started, stopped and supervised, which account it runs as, and which platform adapters
they connect. They never differ in what the application does.

The server project builds one executable that runs without changes in process under Internet Information Services (IIS),
as a Windows service, as a systemd service, as a launchd daemon and in a container. Wherever the environment allows, it
runs under an account of its own with the least privilege it needs, never as an administrator or root.

## Consequences

- Behaviour is the same in every environment, so it is tested once.
- Differences between environments, such as where data and keys are kept, are ports with one adapter for each platform
  ([record 31](0031-the-inside-defines-ports-and-the-outside-adapts-to-them.md)).
- Under IIS and on shared hosting the application can be recycled at any moment, so no work may depend on the process
  staying alive. Work that must happen later is recorded in the database and resumed when the application next runs.
- A host that runs only while the owner is signed in would make the instance unreachable to peers the rest of the time,
  so adding one needs a record of its own.
- A separate executable for each environment was rejected because their behaviour would drift apart.
