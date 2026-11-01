# 223. The previous major version keeps security fixes for six months

Proposed.

## Context

Owners decide when to update ([record 129](0129-an-update-is-never-applied-without-the-owner.md)), and a new major
version may ask them to do something on their side ([record 222](0222-version-numbers-say-what-an-update-means.md)). A
non-technical owner needs time and several rounds of notice before such an update. The project has one maintainer, who
cannot support many versions at once.

## Decision

Security fixes are made for the current major version only. A fix ships as a new patch on the latest release of that
major, and owners on an older minor update to it. When a new major version is released, the previous major keeps
security fixes for six months, matching the grace period of its compatibility update, and then stops. Before the first
full release, only the latest release gets fixes.

## Consequences

- Six months gives an owner several rounds of notice across a few release cycles, and bounds the time one maintainer
  supports two majors.
- Each supported major keeps a branch of its own while it receives fixes, so major versions have to be built and
  released independently. Fixes are applied to it by hand, with its own pinned toolchain, and both majors stay in the
  catalogue until the period ends.
- An owner who stays on an older minor of the current major gets no fix until they update to its latest release.
