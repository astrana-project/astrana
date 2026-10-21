# 149. Master is always releasable

Proposed.

## Context

A release has to be possible whenever one is needed, most urgently when a security fix must reach owners quickly. If
`master` can contain work that is unfinished, every release first needs someone to work out what on it is safe to ship,
and an urgent fix waits behind it. [Versions](0148-version-numbers-say-what-an-update-means.md) are cut from `master`,
so whatever is on `master` is what a release contains.

A large feature built entirely on one branch risks merge conflicts and is harder to test as it grows. Merging it in
pieces avoids that, but a piece that works without being useful to an owner is still partial work, and code that is
merged but unreachable ships to every instance without serving anyone. A finished feature may also need to wait for its
announcement before owners receive it.

## Decision

Nothing unfinished or partial is merged to `master`, and any commit on `master` can be released as it stands.

- A change an owner can see or use merges only when it is useful to an owner as it stands, not merely when it works.
- A building block with nothing an owner or anyone else can reach, such as a library a later feature will use, may merge
  on its own once it is complete, tested and documented.
- A feature that is finished but kept back for its announcement stays on its branch until it is to be released.
- A pull request that changes what the application ships adds a changelog entry describing the change.

## Consequences

- A release can be cut from `master` at any moment, and a security fix reaches a release as fast as it can be written
  and reviewed.
- A large owner-facing feature can live on its branch for some time. Merging `master` into it often keeps conflicts
  small. Its work can be reviewed and tested as a chain of smaller pull requests into the feature's branch, which merges
  into `master` when the feature is useful.
- Every change to what ships, including the building blocks behind a feature, can be read in the changelog.
- Astrana is developed in public, so keeping a feature on its branch controls when owners receive it, not who knows
  about it.
- Merging unfinished work hidden behind feature flags was rejected, because it ships code nobody can use to every
  instance and widens the attack surface for no benefit. Merging thin slices that work without being useful was
  rejected, because owners would receive features that do nothing worthwhile. Merging a finished feature and delaying
  the release until its announcement was rejected, because `master` would then contain something that must not ship, and
  an urgent fix would have to wait or ship it early.
