# 123. The server checks everything the app checks

Proposed.

## Context

The app on a person's screen checks what they type, and that app can be changed by anyone curious enough, a curious
teenager included. Input also reaches an instance from peers, outside sites, files and imports, backups being restored,
configuration and tools such as the installer. Content from a peer has passed through their app, on their machine, where
Astrana has no say at all ([record 103](0103-content-is-cleaned-when-it-comes-in-and-encoded-when-it-is-shown.md)). A
check made in one part of Astrana cannot be relied on by another.

## Decision

No check exists only in the app. Every input is validated wherever the server receives it, against what is allowed for
that kind of input, including every check the app makes, such as lengths, allowed characters and required fields. Where
the two disagree the server is right. Input that can be written in more than one form is first decoded and normalised to
one standard form, so that a check cannot be avoided by writing the same input another way.

## Consequences

- Checks in the app are there for the person, to give quick feedback, and carry no weight for security. A disagreement
  between the app and the server is a fault in the app, not a difference of policy.
- Each check denies by default, describing what is allowed rather than listing what is forbidden.
- Input that is unknown but well formed, such as a field from a peer that supports more than this instance does, is
  ignored rather than rejected, so instances of different versions keep working together
  ([record 122](0122-peers-check-what-each-other-can-do-not-which-version-they-run.md)).
- Input that cannot be checked, such as content a parser cannot read, is rejected, and input is limited in size and in
  the processing it can cause.
- Addresses that came from content are validated before the server fetches anything from them, so that content cannot
  direct the server to places it should not reach.
- A backup being restored is checked like any other input.
- Each check is tested with malformed and hostile input, not only with what it should accept.
