# 179. Architecture rules are checked by tests

Proposed.

## Context

The backend's structure rests on rules that drift unless something checks them. The domain and use cases never name
anything outside them ([record 159](0159-depend-in-the-direction-of-stability.md)). The compiler enforces this for the
domain project ([record 165](0165-the-domain-is-a-project-of-its-own-in-the-backend.md)), but not for use cases, which
share a project with adapters and are told apart from them only by name
([record 164](0164-code-is-organised-by-feature-for-locality-of-behaviour.md)).

## Decision

Architecture tests in `backend/test/` check that no type in the domain or among the use cases references an adapter, the
web framework, the persistence framework or any other infrastructure, and that adapter types follow their naming rules.
They run with every build, like any other test, from the first commit that adds backend code.

## Consequences

- The architecture cannot drift unnoticed, even inside one project.
- A contributor learns about a broken rule from a failing test with a clear message, rather than in review.
- The tests need a library that inspects compiled code, which is judged as a test dependency under
  [record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md), or code of the project's own that does
  the same.
- Relying on review alone was rejected because a rule checked only by people is eventually missed.
