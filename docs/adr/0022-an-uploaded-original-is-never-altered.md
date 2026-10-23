# 22. An uploaded original is never altered

Proposed.

## Context

Images are optimised before they are shown, and a person may upload a precious image they have no other copy of. Hidden
details are stripped from what is served or shared ([record 13](0013-hidden-details-are-stripped-from-uploads.md)).

## Decision

An uploaded original is never altered. Optimisation and stripping work on copies made from it.

## Consequences

- An image the owner has no other copy of survives untouched.
- An instance stores both the original and the copies made from it, which takes more space.
- The original keeps its hidden details, so it has to be protected on the instance and is never served or shared as it
  is.
- There is no option to never optimise, because storage and performance depend on the copies existing.
