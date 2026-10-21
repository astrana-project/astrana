# 16. Empty, unmet and failed are shown as three different states

Proposed.

## Context

A new instance starts with no peers (record 2), and peers are often offline, so empty views are routine. An empty view
can mean that something it depends on does not exist yet, that there is nothing to show, or that loading failed. Shown
the same way, each can mislead. Someone with peers can be told to go and connect, and someone with none can be told
that nobody has posted.

## Decision

Every view that shows data tells three states apart for the instance owner and the people they invite.

- When something the view depends on is not yet in place, the view says what is needed and how to get it. This
  cannot be dismissed, because it describes the state of the instance, and it disappears once the dependency is met.
- When there is nothing to show, the view says so.
- When loading fails, the view says what went wrong and offers a retry only where retrying could succeed. It does not
  blame the person for a failure they did not cause.
- A party with no right to the answer, such as a stranger, gets the same response whether or not anything exists.

## Consequences

- The design and the tests of every data view cover all three states.
- A single generic empty view was rejected, because it hides a difference the person needs to know.
