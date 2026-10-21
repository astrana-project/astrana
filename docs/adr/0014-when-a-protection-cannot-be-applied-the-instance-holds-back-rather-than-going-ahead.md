# 14. When a protection cannot be applied, the instance holds back rather than going ahead

Proposed.

## Context

Sometimes a protection cannot be applied, such as an audience that cannot be checked or a file whose hidden details
cannot be removed. Going ahead without it is silent and cannot be undone. Holding back is visible and loses nothing.

## Decision

Where a protection cannot be applied, the instance withholds the content, refuses to serve or declines the action,
rather than going ahead unprotected.

## Consequences

- An audience that cannot be checked serves nothing, and a file whose hidden details cannot be removed is not served.
- A failure is visible and can be recovered from, where going ahead would have been a disclosure nobody noticed.
- Every future protective feature follows the same rule.
