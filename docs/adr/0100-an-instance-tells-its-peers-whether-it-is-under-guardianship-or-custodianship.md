# 100. An instance tells its peers whether it is under guardianship or custodianship

Proposed.

## Context

Someone other than the owner may see part of what reaches an instance
([record 48](0048-there-are-four-kinds-of-account-and-no-others.md)). A guardian sees who a child interacts with and how
often, and any report about the child's content, but not what the child writes or receives
([record 92](0092-a-guardian-sees-the-peer-side-of-a-childs-instance-not-what-the-child-says.md)). A custodian, who
preserves an instance for an owner who can no longer act, can see but not take part
([record 87](0087-an-account-gets-only-what-its-role-needs-settled-in-advance.md)).

## Decision

Each instance tells its peers whether it is under guardianship or custodianship, and tells them again whenever that
changes.

## Consequences

- A peer learns that someone other than the owner may see something of what they send.
- The status is shown to the people on the peer's side, and is for them to weigh. An instance sharing content never acts
  on it, and never changes what it sends because of it.
- It is a declaration, and a hostile instance can leave it out.
