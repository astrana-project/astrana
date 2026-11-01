# 240. Astrana Owner Tools is an application of its own, written in .NET and kept beside the application

Proposed.

## Context

Every installation is performed by Astrana Owner Tools
([record 238](0238-every-installation-is-performed-by-astrana-owner-tools.md)), which also updates, backs up, restores,
repairs and uninstalls instances. It works on the host machine, often while the instance is stopped or broken, so it
cannot be part of the web application. It has to stay compatible with the installation, backup and restore formats of
the application it manages. Its tools could be scripts or programs, and on Windows a script is subject to the machine's
script execution policy.

## Decision

Owner Tools is an application of its own, with a close dependency on the Astrana application. It lives beside the
application in the same repository
([record 216](0216-one-repository-with-the-application-astrana-owner-tools-and-what-they-share.md)), with its own
version and changelog ([record 222](0222-version-numbers-say-what-an-update-means.md)), and shares the application's
release channels and branches. Its tools are small .NET programs ([record 40](0040-the-backend-is-built-on-net.md)).

## Consequences

- Owner Tools declares which versions of the application it supports, and refuses or warns outside that range.
- It is signed in the same way as the application, and has the same security support window
  ([record 223](0223-the-previous-major-version-keeps-security-fixes-for-six-months.md)). It never drops support for an
  application major version that still receives security fixes.
- A .NET program is a small download and starts in about half a second, and Windows script policy does not apply to it.
- Its decision records share one numbered set with the application's, because many decisions cover both and a record
  cites only lower-numbered records.
- Linux store formats are considered for Owner Tools only, because it is a desktop program rather than a system service.
- Writing the tools as scripts was rejected, because the scripting runtime is many times larger, starts several times
  more slowly, is missing from Linux by default and is refused unsigned under common Windows policies. A repository of
  its own was rejected because the two have to be kept compatible.
