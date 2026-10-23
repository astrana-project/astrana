# 14. When a protection cannot be applied, the instance holds back rather than going ahead

Proposed.

## Context

Sometimes a protection cannot be applied, such as an audience that cannot be checked or a file whose hidden details
cannot be removed. Going ahead without it may disclose something to the wrong people, silently and beyond undoing.
Holding back discloses nothing, but leaves content unavailable or an action undone that may have been safe all along.

## Decision

Where a protection cannot be applied, the instance withholds the content, refuses to serve or declines the action,
rather than going ahead unprotected.

## Consequences

- An audience that cannot be checked serves nothing, and a file whose hidden details cannot be removed is not served.
- A failure is visible and can be recovered from, where going ahead would have been a disclosure nobody noticed.
- Every future protective feature follows the same rule.
- Content and actions are unavailable whenever a check fails, including when the check fails wrongly and nothing was at
  risk.
