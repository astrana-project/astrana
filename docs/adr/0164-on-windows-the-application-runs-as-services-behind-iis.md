# 164. On Windows the application runs as services behind IIS

Proposed.

## Context

Each hosting environment has its own hosting adapter
([record 163](0163-each-hosting-environment-is-an-adapter-around-the-application.md)). On Windows, Internet Information
Services (IIS) can either start and manage an ASP.NET Core application itself, or act only as the web server in front of
an application that runs as a Windows service. Shared hosting on Windows offers only the first.

## Decision

On Windows the application's processes run as Windows services, behind IIS acting only as the web server in front. IIS
starts and manages the application only on shared hosting, where nothing else is available.

## Consequences

- The Windows service manager, not IIS, decides when the processes start, stop and restart, as on every other operating
  system.
- The IIS configuration Astrana supplies covers only passing requests on, so it is the same kind of configuration as for
  NGINX.
- On shared hosting the application can be recycled at any moment, and the ASP.NET Core Module that IIS needs is
  installed and patched by the host.
- Letting IIS host the application on every Windows installation was rejected because IIS would then own the processes'
  lifetime where a Windows service can. Bundling NGINX for Windows was rejected because its own project describes the
  Windows version as beta, and it cannot run as a Windows service.
