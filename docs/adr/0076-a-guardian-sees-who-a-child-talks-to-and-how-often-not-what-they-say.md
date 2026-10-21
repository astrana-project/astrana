# 76. A guardian sees who a child talks to and how often, not what they say

Proposed.

## Context

A guardian needs enough to keep a child safe
([record 30](0030-when-a-child-owns-an-instance-a-parent-or-guardian-holds-authority-over-its-parental-controls.md)),
and reading a child's conversations would go far beyond that.

## Decision

A guardian sees an outline of the child's activity, such as who they interact with and how often. By default they cannot
read what the child writes or receives.

## Consequences

- Reports about the child's content are the one exception, and a guardian always sees them, because they concern a
  situation the guardian is responsible for.
