# 8. A post is a container, and what it holds shares its audience and its life

Proposed.

## Context

A post can carry pictures, videos, audio and links. Each attachment could have its own audience and its own expiry, or
follow the post it belongs to.

## Decision

A post is a container. Everything attached to it has the post's audience and lasts as long as the post.

## Consequences

- Nobody has to set an audience picture by picture.
- A picture in a post never outlives the post.
- One picture in a post cannot be shared with a narrower audience than the rest of the post.
- Documents and other files cannot be attached, because a post is not a place to store files. That limit is a choice of
  its own, separate from the post being a container.
