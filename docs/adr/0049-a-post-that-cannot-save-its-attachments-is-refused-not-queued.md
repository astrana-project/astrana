# 49. A post that cannot save its attachments is refused, not queued

Proposed.

## Context

A post holds its attachments
([record 8](0008-a-post-is-a-container-and-what-it-holds-shares-its-audience-and-its-life.md)), and saving one can fail,
for example when a storage provider cannot be reached.

## Decision

If a post's attachments cannot be saved, the post is refused. It is never saved without them, and never queued to finish
later.

## Consequences

- A post never exists without the pictures it was written with.
- The person learns at once that it failed, and can try again.
