# 56. A location is chosen, never read from the device

Proposed.

## Context

A device knows where it is, and the hidden details of an upload are already stripped
([record 13](0013-hidden-details-are-stripped-from-uploads.md)). A location could still be read and attached
automatically.

## Decision

A location is attached only by typing it or choosing it on a map. Astrana never reads a device's location automatically.

## Consequences

- A location is always something the owner chose to share, never something collected.
- A location attached to a post has the post's audience
  ([record 8](0008-a-post-is-a-container-and-what-it-holds-shares-its-audience-and-its-life.md)).
- On a child's instance, adding a location becomes available only at a late stage, and is off by default.
- Reading the device's location with the person's permission each time was rejected, because a precise position attached
  in one tap is easily shared by mistake, and choosing the place leaves how precise it is to the person.
