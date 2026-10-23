# 165. Self-contained builds for Linux, Windows and macOS

Proposed.

## Context

Owners run instances across many editions and distributions of Linux, Windows and macOS, and many owners are not
technical. Installation must not depend on an owner installing and patching a .NET runtime correctly. The backend runs
on a .NET runtime with long-term support
([record 145](0145-develop-on-net-11-and-release-on-net-12-long-term-support.md)).

## Decision

The backend is published as self-contained builds, each carrying its own .NET runtime, for Linux, Windows and macOS. It
reaches owners through installers and packages rather than files copied into place by hand, except on shared hosting,
where uploading files is the only option a hosting provider gives.

## Consequences

- No separate .NET runtime has to be installed, and each instance runs the runtime it was tested with.
- Security fixes to the runtime reach owners only through Astrana releases. The project releases when the runtime is
  patched, and the owner applies a release when they choose
  ([record 109](0109-an-update-is-never-applied-without-the-owner.md)).
- Builds are larger than ones that rely on an installed runtime.
- Every combination of operating system and processor architecture has to be built and tested, and every runtime
  identifier has to be listed in the projects before their lock files are generated
  ([record 151](0151-every-dependency-version-is-pinned-in-a-committed-lock-file.md)).
- Builds that rely on an installed runtime were rejected because they make correct installation and patching the owner's
  problem.
