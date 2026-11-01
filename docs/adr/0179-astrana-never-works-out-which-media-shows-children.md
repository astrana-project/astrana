# 179. Astrana never works out which media shows children

Proposed.

## Context

Protecting children from having images and videos of them saved or misused could seem to call for knowing which media
shows a child. That could be found by analysing what the media depicts, which Astrana declines
([record 29](0029-astrana-does-not-analyse-what-content-depicts-or-means.md)), or by asking the person who posts it.

## Decision

Astrana never works out which images or videos show children. It does not detect children in media, and does not ask a
poster whether media shows children.

## Consequences

- No record exists that a given image shows a child, so an instance builds no knowledge that could create a legal duty
  to report what it holds, for its owner or for the project.
- An attacker who compromises an instance, or a guardian who is a source of harm, cannot search the archive for media of
  children.
- Protections against misuse of media cannot be aimed at media that shows children, so they apply to all media, and
  protections for a child viewer rest on the child's own instance knowing the child's age.
