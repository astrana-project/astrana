# 222. Version numbers say what an update means

Proposed.

## Context

The owner of an instance decides when to update it. The version number is often the first thing they see, and it should
tell them what an update means for them. It should say whether it only fixes things, whether it adds something, and
whether they may have to do something on their side. Two copies with the same version should be the same code. The web
app and the server ship together as one application
([record 216](0216-one-repository-with-the-application-astrana-owner-tools-and-what-they-share.md)), so an owner updates
them as one. Astrana Owner Tools ships and updates on its own.

## Decision

The application has one version, `MAJOR.MINOR.PATCH`, following Semantic Versioning, and each new one tells the owner
one thing:

- A new `PATCH` changes nothing they rely on. It fixes a defect, updates a dependency, or changes the code without
  changing what it does.
- A new `MINOR` adds or changes behaviour, and everything that worked before still works.
- A new `MAJOR` includes a change that is not backwards compatible, so they may have to do something on their side.

Astrana Owner Tools has a version of its own under the same rules, with its own changelog, and the tags of each carry a
prefix that tells them apart. Each format that crosses between programs, such as the backup archive, the peer protocol
and the interface between the web app and the server, has a version of its own that changes only when that format
changes.

A change to what ships is released only under a new version. Documentation, tests, development configuration,
development and test dependencies, the repository's tooling and build files are not shipped, so they change no version.

Every change to what ships is described in a changelog written by hand in the Keep a Changelog format. Changes are
listed under `[Unreleased]` as they merge, and move under a dated version heading when that version is released.

## Consequences

- An owner can judge an update from its number and its changelog entry, without reading the code.
- The web app and the server carry the same version, set in each one's project file, so they stay in step.
- Owner Tools states which versions of the application it supports, so the two can be released apart.
- A format's version says whether two programs can read each other's data, whatever their own versions are.
- The first version is 0.0.1, the repository's scaffolding, and versions stay below 1.0.0 until the first release to
  owners. Under Semantic Versioning a `0.x` version promises no compatibility, and 1.0.0 marks the first version owners
  can rely on.
- Before the first full release, each unit of foundational work that is complete, tested, documented and useful as a
  building block on its own is a new `MINOR`, released as an alpha pre-release, and fixes between units are patches.
- New major versions are avoided and batched, with advance notice and at least one release candidate. A runtime upgrade
  that asks nothing of the owner is not a new major version.
- Peers decide what they can do together by the capabilities each supports, not by comparing versions
  ([record 143](0143-peers-check-what-each-other-can-do-not-which-version-they-run.md)).
- Generating the changelog from commit messages was rejected, because a changelog written by hand describes changes for
  the owner rather than for developers. Calendar-based versions were rejected because a date says when an update was
  made, not what it means for the owner. Separate versions for the web app and the server were rejected because they
  ship and update as one.
