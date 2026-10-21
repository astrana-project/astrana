# 162. The domain is a project of its own in the backend

Proposed.

## Context

The backend's .NET solution lives in `backend/`, with production projects in `backend/src/` and their tests in
`backend/test/` ([record 149](0149-one-repository-with-a-frontend-and-a-backend.md),
[record 150](0150-tests-live-apart-from-the-code-they-test.md)). Code is organised by feature
([record 161](0161-code-is-organised-by-feature-for-locality-of-behaviour.md)), which keeps use cases in the same
project as the adapters they serve. The domain is the part that most needs to be kept free of infrastructure
([record 156](0156-depend-in-the-direction-of-stability.md)), and it rarely changes shape.

## Decision

The domain is a project of its own, `Astrana.Domain`, with a folder for each bounded context. It references no other
project and no package for the web, persistence, serialisation, logging or configuration. Use cases, adapters and
startup code live in the projects for the processes that run them, which reference the domain.

Further projects are added when there is code for them, not before.

## Consequences

- The compiler keeps the domain free of infrastructure, including Entity Framework Core
  ([record 38](0038-all-data-access-goes-through-entity-framework-core.md)).
- The rest of the dependency rule, inside each process's project, has to be checked by tests rather than by the
  compiler.
- The solution has few projects, so a contributor finds their way around it quickly.
- A project for each layer was rejected because it separates code that changes together. Keeping the domain inside a
  process's project was rejected because the domain gains most from the compiler's protection.
