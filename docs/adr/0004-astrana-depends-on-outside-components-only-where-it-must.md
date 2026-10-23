# 4. Astrana depends on outside components only where it must

Proposed.

## Context

Every outside component Astrana ships is code its owners run but nobody in the project wrote. It can break, be
abandoned, change its terms or be compromised, and so can everything it brings in behind it. A project can only answer
for what it can understand and keep current.

## Decision

Astrana uses an outside component only when building and maintaining it within the project would cost more than the risk
of depending on someone else. Where it must depend on others, it chooses mature components and runtimes. A mature
component has a long record of maintenance, more than one maintainer, a published way to report vulnerabilities and
supported versions older than the latest.

## Consequences

- What a component brings in behind it counts as part of that component.
- A component with one maintainer rests on one person outside the project, and one whose only supported version is the
  latest leaves nothing stable to stay on.
- Every component, whether built or depended on, is one the project must keep current.
- Adding components for convenience was rejected, because each one is more code to trust, keep current and answer for.
