# 5. Third-party components are used only when necessary

Proposed.

## Context

Every third-party component Astrana ships is code that every instance runs and nobody in the project wrote. It can
break, be abandoned, change its licence or be compromised, and so can each of its own dependencies. The project can
answer only for code it understands and can keep up to date.

## Decision

Astrana uses a third-party component only when the project could not build and maintain something as good itself, or
when the component is mature and well supported enough to be the safer choice.

## Consequences

- A component's own dependencies count as part of it.
- Signs that a component is mature include a long record of maintenance, more than one maintainer, a published way to
  report vulnerabilities and supported versions older than the latest. A component with one maintainer rests on one
  person outside the project, and one whose only supported version is the latest leaves nothing stable to stay on.
- What the project builds instead becomes its own to maintain, so building is chosen only where that cost is smaller
  than the risk of depending on someone else.
- Adding components for convenience was rejected, because each one is more code to trust, keep up to date and answer
  for.
