# 15. Empty, unmet and failed are shown as three different states

Proposed.

## Context

Nothing found, a search that failed and a peer that could not be reached can all look like an empty page. Many features
also depend on peers ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)), so a new instance starts
with an empty feed, nothing in its notifications and nobody to share with. An owner who cannot tell these apart may stop
looking for something that exists, wait for posts that will never come, or blame themselves for a fault that is not
theirs.

## Decision

Anyone entitled to an answer is told whether it is complete, and every view that shows data tells three states apart.

- When something the view depends on does not exist yet, the view says what is missing, how to get it and what works in
  the meantime. It never shows a blank, a spinner or an error instead, and it disappears once the need is met.
- When there is nothing to show, the view says so.
- When loading fails or a source cannot be reached, the view says plainly what happened and where the cause lies, and
  offers a retry only where retrying could succeed.

## Consequences

- The owner is never left to guess whether something is missing or simply could not be reached.
- An explanation of what a feature needs never presses the owner to get it, and never treats a small network as a
  failing.
- Someone with no right to the answer is told nothing of the kind, because telling a stranger whether something exists
  is itself a disclosure.
- Expiry is silent on purpose, because it carries out a choice the owner already made, and does not report on whether
  something worked.
- The design and the tests of every data view cover all three states.
- A single generic empty view was rejected, because it hides a difference the person needs to know.
