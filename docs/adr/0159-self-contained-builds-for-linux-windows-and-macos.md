# 159. Self-contained builds for Linux, Windows and macOS

Proposed.

## Context

Owners run instances across many editions and distributions of Linux, Windows and macOS, and many owners are not
technical. Installation must not depend on an owner installing and patching a .NET runtime correctly. The owner holds
final authority over their instance and what it runs
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)), but an installation should not be
changed by accident, or by anyone without that authority. The backend runs on a .NET runtime with long-term support
([record 141](0141-develop-on-net-11-and-release-on-net-12-long-term-support.md)).

## Decision

The backend is published as self-contained builds, each carrying its own .NET runtime, for Linux, Windows and macOS on
64-bit x86 and 64-bit Arm processors. It reaches owners through installers and packages rather than files copied into
place by hand, except on shared hosting, where uploading files is the only option a host gives. An installation resists
accidental and unprivileged change to its software and configuration. The owner can override that as the machine's
administrator, and the instance detects any change and tells the owner.

## Consequences

- No separate .NET runtime has to be installed, and each instance runs the runtime it was tested with.
- Security fixes to the runtime reach owners only through Astrana releases, which the owner applies when they choose
  ([record 104](0104-an-update-is-never-applied-without-the-owner.md)).
- Builds are larger than ones that rely on an installed runtime.
- Every combination of operating system and processor has to be built and tested, and every runtime identifier has to be
  listed in the projects before their lock files are generated
  ([record 146](0146-every-dependency-version-is-pinned-in-a-committed-lock-file.md)).
- 32-bit processors are not supported, which is a deliberate limit on running on modest hardware
  ([record 66](0066-on-modest-hardware-astrana-runs-slower-and-never-stops.md)), accepted to keep the number of builds
  down.
- Running under Internet Information Services on shared hosting needs the ASP.NET Core Module, which the host installs
  and patches, and an application pool that runs 64-bit processes.
- Builds that rely on an installed runtime were rejected because they make correct installation and patching the owner's
  problem. Resisting even the owner's changes was rejected because nobody holds authority above the owner.
