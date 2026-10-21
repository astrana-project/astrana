# 21. Originals are kept untouched, and copies made from them are what is served

Proposed.

## Context

Images are optimised before they are shown, and a person may upload a precious image they have no other copy of.

## Decision

An uploaded original is never altered. Optimisation works on a copy, and media is always served through Astrana itself,
never as direct access to a file.

## Consequences

- An image the owner has no other copy of survives untouched.
- There is no option to never optimise, because storage and performance depend on the copies existing.
