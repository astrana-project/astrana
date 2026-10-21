# 20. Tests live apart from the code they test

Proposed.

## Context

Test code is written to exercise shipped code, not to run in an instance. It can contain fixtures, made-up
credentials, sample personal data and helpers that bypass the checks shipped code relies on. If it reaches an instance
or the browser, it widens the attack surface and can leak what it contains. Keeping each test beside the code it tests,
a common choice in web apps, relies on every build excluding test files correctly, every time.

## Decision

Tests are kept in a `test/` folder beside the `src/` folder they test, in every part of the repository. In
[the backend](0019-one-repository-with-a-frontend-and-a-backend.md) each production project in `backend/src/` has its
test project in `backend/test/`. In the frontend the web app keeps `src/` and `test/` at the root of `frontend/`, and
each shared package keeps its own `src/` and `test/`.

## Consequences

- Builds take their input from `src/`, so test code stays out of what ships without each build having to exclude it.
- Both sides of the repository share one layout, so a reader finds tests in the same place everywhere.
- A test sits further from the code it tests, so a contributor opens two folders to work on both.
- Placing tests beside their code was rejected because it makes excluding them a rule every build must keep, rather
  than a property of the layout.
