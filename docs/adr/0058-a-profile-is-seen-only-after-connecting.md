# 58. A profile is seen only after connecting

Proposed.

## Context

Connections need both people's approval ([record 2](0002-connections-are-mutual-and-nobody-follows-anyone.md)). A
preview of a profile before connecting would be the one piece of profile content exchanged before that approval.

## Decision

Viewing someone's profile requires an established connection. There is no preview before connecting.

## Consequences

- No profile content is exchanged before both people approve. Only what the connection itself needs passes before then,
  such as the instances' keys
  ([record 38](0038-peers-recognise-each-other-by-keys-remembered-when-they-first-connect.md)).
- Two people deciding whether to connect have nothing in the app to judge each other by, which makes that moment harder.
