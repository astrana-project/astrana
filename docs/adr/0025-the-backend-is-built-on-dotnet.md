# 25. The backend is built on .NET

Proposed.

## Context

The backend is the part of Astrana that runs on the instance. It serves the frontend, owns every session, stores the
instance's data and connects to peers. To do that it needs cryptography, HTTP, data access, real-time messages to the
frontend and background work.

Every third-party component the backend uses is one more to trust (record 5), and every component it bundles has to be
open source (record 6). An instance runs on its owner's hardware, which may be cheap or second-hand, on Linux, Windows
or macOS. It is updated when its owner chooses, so the platform it runs on needs security patches over a long and
predictable period.

## Decision

The backend is written in C# and runs on .NET.

## Consequences

- .NET and Microsoft's own libraries for it cover cryptography, HTTP, data access, real-time messaging and background
  work, so the backend needs fewer third-party components.
- .NET is open source under the MIT licence. Its long-term-support releases are supported for three years, on a
  published schedule.
- The backend runs on Linux, Windows and macOS, on x64 and Arm processors. It can be published as an application that
  carries its own runtime, so an owner does not have to install .NET separately.
- The platform's direction is set mainly by one company. Its licence lets the project or anyone else carry it on if that
  changes.
- A .NET application usually uses more memory than one compiled ahead of time to native code, which counts against cheap
  hardware.
- The frontend and the backend are written in different languages, so a contributor working on both needs to know two.
- Node.js was rejected. It would share a language with the frontend, but its standard library is smaller, so the backend
  would depend on more third-party packages for the same work.
