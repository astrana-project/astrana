# 169. Only 64-bit processors are supported

Proposed.

## Context

Astrana aims to run on modest hardware ([record 73](0073-on-modest-hardware-astrana-runs-slower-and-never-stops.md)).
Some modest hardware, such as older Raspberry Pi models and some network storage devices, runs 32-bit operating systems.
Every processor architecture supported adds a self-contained build to produce and test
([record 168](0168-self-contained-builds-for-linux-windows-and-macos.md)).

## Decision

Astrana supports 64-bit x86 and 64-bit Arm processors only.

## Consequences

- Each release has fewer builds to produce and test.
- Devices that can run only a 32-bit operating system cannot run an instance. This is an exception to
  [record 73](0073-on-modest-hardware-astrana-runs-slower-and-never-stops.md), accepted to keep the number of builds
  down.
- Supporting 32-bit Arm Linux, and also 32-bit Windows, was rejected for the builds and testing each would add.
