# 241. The application is released only inside an installer

Proposed.

## Context

An installation applies checks and security controls that a bare copy of the application would skip, such as the web
server in front of it and protection of its own folder. Every installation is performed by Astrana Owner Tools
([record 238](0238-every-installation-is-performed-by-astrana-owner-tools.md)). Installing an instance registers a
system service, needs administrator rights, writes to protected locations, configures the web server and the firewall,
must be possible without anyone present, and must carry a signature the operating system trusts.

## Decision

Release artefacts provide the application only inside an installer, never as a bare download of the application. Each
platform gets its own signed native format. Windows gets a Windows Installer package built with WiX inside a Burn
bundle. Linux gets signed `.deb` and `.rpm` packages in signed repositories, and a `.tar.gz` archive that carries the
install engine and is installed through Owner Tools. macOS gets a `.pkg`.

## Consequences

- The normal path is the obvious one, so bypassing the installation's checks takes deliberate effort. This is friction
  rather than a barrier, because anyone can build Astrana from source and unpack an installer package.
- Each platform's own format keeps a record of what it installed, which makes upgrades and removal possible.
- Managed deployment by organisations works as a side effect, and is not a reason for the choice.
- Linux store formats such as Snap, Flatpak and AppImage are never used for the instance, because they are built for
  sandboxed desktop programs and the privileged work is the work. A disk image was rejected for macOS because it cannot
  run privileged steps.
- Container images are not part of the first release.
