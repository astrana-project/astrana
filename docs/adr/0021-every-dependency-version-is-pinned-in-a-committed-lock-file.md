# 21. Every dependency version is pinned in a committed lock file

Proposed.

## Context

A dependency declared by a version range resolves to whatever release matches when it is installed. A new release,
whether it is a fix, a breaking change or a compromised publish, can then reach a build without anyone choosing it, and
two builds of the same commit can contain different code. Each dependency also brings in others behind it, which can
change in the same way. Both sides of [the repository](0019-one-repository-with-a-frontend-and-a-backend.md) have a
built-in way to record exact versions, npm's `package-lock.json` and NuGet's `packages.lock.json`.

## Decision

Every dependency, direct and indirect, is pinned to an exact version in a lock file that is committed with the code:
`package-lock.json` in `frontend/` and `packages.lock.json` in each .NET project. Continuous integration and release
builds restore in locked mode, which fails rather than resolving anything the lock files do not pin. A dependency
changes version only through a commit that changes its lock file.

## Consequences

- The same commit builds from the same dependency versions every time, on every machine.
- Each lock file also records a hash of every package, so a package that was changed after it was locked fails the
  restore.
- A dependency update is a visible change to a lock file that can be reviewed like any other change.
- A compromised or broken release does not arrive until someone updates the lock file to it.
- Updating dependencies is a deliberate task, and security fixes in dependencies arrive only when someone takes them.
- Relying on version ranges alone was rejected because releases nobody chose could then reach a build. Copying every
  dependency's source into the repository was rejected because it makes it harder to see where the code came from,
  and makes updates harder to review.
