# 153. Version numbers say what an update means

Proposed.

## Context

The owner of an instance decides when to update it. The version number is often the first thing they see, and it should
tell them what an update means for them. It should say whether it only fixes things, whether it adds something, and
whether they may have to do something on their side. Two copies with the same version should be the same code. The web
app and the server ship together as one application
([record 149](0149-one-repository-with-a-frontend-and-a-backend.md)), so an owner updates them as one.

## Decision

The application has one version, `MAJOR.MINOR.PATCH`, following Semantic Versioning, and each new one tells the owner
one thing:

- A new `PATCH` changes nothing they rely on. It fixes a defect, updates a dependency, or changes the code without
  changing what it does.
- A new `MINOR` adds or changes behaviour, and everything that worked before still works.
- A new `MAJOR` includes a change that is not backwards compatible, so they may have to do something on their side.

A change to what the application ships is released only under a new version. What ships is the web app, the server and
the packages they run with. Documentation, tests, development configuration, development and test dependencies, the
repository's tooling and build files are not shipped, so they change no version.

Every change to what ships is described in `CHANGELOG.md`, written by hand in the Keep a Changelog format. Changes are
listed under `[Unreleased]` as they merge, and move under a dated version heading when that version is released.

Peers decide what they can do together by the capabilities each supports, not by comparing versions.

## Consequences

- An owner can judge an update from its number and its changelog entry, without reading the code.
- The web app and the server carry the same version, set in each one's project file, so they stay in step. There is one
  changelog, at the root of the repository, and a release is tagged `vMAJOR.MINOR.PATCH`.
- The first version is 0.0.1, the repository's scaffolding, and versions stay below 1.0.0 until the first release to
  owners. Under Semantic Versioning a `0.x` version promises no compatibility, and 1.0.0 marks the first version owners
  can rely on.
- Generating the changelog from commit messages was rejected, because pull requests are squash-merged and a changelog
  written by hand describes changes for the owner rather than for developers. Calendar-based versions were rejected
  because a date says when an update was made, not what it means for the owner. Separate versions for the web app and
  the server were rejected because they ship and update as one.
