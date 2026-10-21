# 36. Self-contained builds for Linux, Windows and macOS

Proposed.

## Context

Owners run instances across many editions and distributions of Linux, Windows and macOS, and many owners are not
technical. Installation must not depend on an owner installing and patching a .NET runtime correctly, and an
installation must be hard to modify by accident or on purpose. The backend can be published with its own runtime
([record 25](0025-the-backend-is-built-on-dotnet.md)), on a runtime with long-term support
([record 18](0018-develop-on-dotnet-11-and-release-on-dotnet-12-long-term-support.md)).

## Decision

The backend is published as self-contained builds, each carrying its own .NET runtime, for Linux, Windows and macOS on
64-bit x86 and 64-bit Arm processors. It reaches owners through installers and packages rather than files copied into
place by hand, except on shared hosting, where uploading files is the only option a host gives.

## Consequences

- No separate .NET runtime has to be installed, and each instance runs the runtime it was tested with.
- Security fixes to the runtime reach owners only through Astrana releases, so the project releases when the runtime is
  patched.
- Builds are larger than ones that rely on an installed runtime.
- Every combination of operating system and processor has to be built and tested.
- Every runtime identifier has to be listed in the projects before their lock files are generated
  ([record 21](0021-every-dependency-version-is-pinned-in-a-committed-lock-file.md)), or a locked restore for one of
  them fails.
- Running in process under Internet Information Services still needs the ASP.NET Core Module, which the server's owner
  or host installs and patches, and an application pool that runs 64-bit processes.
- 32-bit processors are not supported.
- Builds that rely on an installed runtime were rejected because they make correct installation and patching the owner's
  problem.
