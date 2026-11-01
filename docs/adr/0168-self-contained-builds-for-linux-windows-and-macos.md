# 168. Self-contained builds for Linux, Windows and macOS

Proposed.

## Context

Owners run instances across many editions and distributions of Linux, Windows and macOS, and many owners are not
technical. Installation must not depend on an owner installing and patching a .NET runtime correctly. The backend runs
on .NET 11 until a long-term-support release carries what it needs
([record 149](0149-develop-on-net-11-and-release-on-net-12-long-term-support.md)).

## Decision

The backend is published as self-contained builds, each carrying its own .NET runtime, for Linux, Windows and macOS. It
reaches owners through installers and packages rather than files copied into place by hand. On shared hosting, where
uploading files is the only option a hosting provider gives, the files are uploaded by Astrana Owner Tools from the
owner's own computer.

## Consequences

- No separate .NET runtime has to be installed, and each instance runs the runtime it was tested with.
- Security fixes to the runtime reach owners only through Astrana releases. The project releases when the runtime is
  patched, and the owner applies a release when they choose
  ([record 113](0113-an-update-is-never-applied-without-the-owner.md)).
- Builds are larger than ones that rely on an installed runtime.
- Every combination of operating system and processor architecture has to be built and tested, and every runtime
  identifier has to be listed in the projects before their lock files are generated
  ([record 155](0155-every-dependency-version-is-pinned-in-a-committed-lock-file.md)).
- Builds that rely on an installed runtime were rejected because they make correct installation and patching the owner's
  problem.
