# 32. The domain is modelled with domain-driven design

Proposed.

## Context

Astrana's rules are where its value and its risks lie. Who can see, contact or comment on whose content, what a guardian
may oversee and what a peer may read are rules about people's safety, not details of presentation. They need a model
that holds them in one place, in the language the specification uses, and protects them from changes elsewhere.

## Decision

The domain is modelled with domain-driven design. Bounded contexts divide it into parts, each with its own model and
language. Aggregates are its consistency boundaries, each enforcing its own rules, changed as one unit and referring to
other aggregates only by identifier. Rules live in the aggregates and value objects that own the data, rather than in
services around them. The domain uses the specification's vocabulary. Its tactical patterns are used where the domain is
complex, and simple areas, such as preferences, stay plain.

## Consequences

- Rules about safety and privacy are enforced by the domain in one place, whichever adapter a request arrives through.
- Aggregates give a natural unit for access checks, persistence and snapshots.
- Domain events give a natural way to start work outside an aggregate, such as delivering a comment to the instance that
  owns the content.
- The first code starts in one provisional bounded context. The first set of contexts is drawn once a first part of the
  application has been built, and recorded then.
- Understanding the domain before writing it down slows the first features.
- Keeping rules in services around plain data objects was rejected, because the rules scatter, and a safety rule
  enforced in one service can be bypassed through another.
