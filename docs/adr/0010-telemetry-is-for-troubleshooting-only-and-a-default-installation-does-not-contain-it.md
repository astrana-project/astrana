# 10. Telemetry is for troubleshooting only, and a default installation does not contain it

Proposed.

## Context

Maintainers need to know when the software breaks. Information gathered for that purpose can easily grow into tracking
how people use the product.

## Decision

Telemetry exists only to help maintainers fix faults. It ships as a separate module that a default installation does not
contain, and it is off until the owner opts in. It sends only what is about the software, such as what broke, where, and
on which version and platform, and the owner can see exactly what would be sent before it is.

## Consequences

- Nothing about how a person uses Astrana is collected, including which features they use, how long they stay or what
  they post.
- What is not installed cannot misbehave, which a setting that is merely switched off cannot promise.
- The data comes only from owners who chose to send it, so it can never stand for everyone.
- Having no telemetry at all was rejected, because maintainers would then learn of a fault only when an owner reports it
  by hand, and many faults are never reported.
