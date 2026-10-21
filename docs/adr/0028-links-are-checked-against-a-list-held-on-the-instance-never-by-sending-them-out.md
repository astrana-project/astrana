# 28. Links are checked against a list held on the instance, never by sending them out

Proposed.

## Context

Checking whether a link is dangerous usually means asking an outside service, which then learns every link a person
shares or opens.

## Decision

Links are checked against a copy of a bad-link list held on the instance, refreshed regularly and stored in a scrambled
form, not as the links themselves. No outside service is asked about each link. A source is eligible only if it
publishes a list that can be downloaded.

## Consequences

- Nobody outside the instance learns what links its owner shares or views.
- Services that only answer one link at a time are excluded, however good their data.
- The owner chooses the sources, and no single source is treated as enough.
