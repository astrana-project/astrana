# 147. The frontend is written in TypeScript with strict checking

Proposed.

## Context

The frontend handles data that the backend sends it, much of which started with people and peers. Its code is read and
changed by contributors who did not write it. In plain JavaScript, a value of the wrong shape, such as a missing field
or one that may be empty, is found only when that code runs, often by the person using Astrana. Without types, a reader
has to read a function's body to learn what it expects and what it returns.

## Decision

The frontend and its shared packages are written in TypeScript, with the compiler's strict checks turned on. A change
that fails type checking does not merge.

## Consequences

- Mistakes like these are found when the code is built rather than when it runs.
- A function's types tell a reader what it expects and what it returns.
- Types are removed when the code is compiled, so they describe what the backend sends without checking it. The backend
  checks what it accepts and what it sends (record 121), and the frontend relies on those checks.
- Turning a check off, such as by declaring a value as `any`, is visible in the code and reviewed like any other change.
- The TypeScript compiler and type definitions are development tooling and are not shipped.
- Type checking adds a step to every build.
- Plain JavaScript was rejected, because more of the mistakes that types catch would reach people using Astrana.
- JavaScript with types written in comments and checked by the TypeScript compiler was rejected. It avoids a compile
  step, but the frontend already has a build step, and types written in comments are longer and harder to read.
