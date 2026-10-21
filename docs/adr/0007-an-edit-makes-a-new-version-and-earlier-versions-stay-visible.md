# 7. An edit makes a new version, and earlier versions stay visible

Proposed.

## Context

Text can be changed after people have read it and responded to it. If an edit simply replaced the original, someone
could quietly rewrite what they said and deny it.

## Decision

Posts, links, comments, albums and the profile details others can see are versioned. Settings and preferences are not.
An edit creates a new version. The newest version is what is shown and searched, and anyone who can see the content can
also see its earlier versions, which keep the same audience.

## Consequences

- Nobody can silently rewrite what they said.
- Editing is still useful, because the newest version is what people see from then on.
- Editing cannot extend how long something lasts, because expiry counts from the first version.
- Deleting content deletes all its versions, including when it expires. Versioning keeps the history of a change, not of
  something removed.
- Community notes are the one exception. They cannot be edited at all, because people rated a particular text.
