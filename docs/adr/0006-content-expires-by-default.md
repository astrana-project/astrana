# 6. Content expires by default

Proposed.

## Context

A passing post should not become a permanent record, and losing a cherished memory is also a harm. Different kinds of
content carry those two risks differently.

## Decision

Content is deleted automatically after a time suited to what it is, unless the owner chooses to keep it. Each kind of
content has its own default, such as posts and links expiring and albums being kept, and the owner can change the
defaults. A picture or a comment lasts as long as the post it belongs to.

## Consequences

- Things can genuinely be forgotten, rather than lasting forever because nobody thought to delete them.
- Expiry happens quietly, because a deletion that demanded acknowledgement would turn forgetting into an event.
- Expiry removes content from the instance, so content nobody thought to keep is gone from it. Backups taken earlier,
  and anything recipients have already received, may still hold it.
