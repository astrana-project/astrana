# 14. Only the interface's own code produces markup

Proposed.

## Context

Posts, comments, names and link previews come from the instance owner and the people they invite, from peers, from
outside sites and from imports, and much of it arrives through software the instance does not control. A peer's
software may have been changed, may be out of date or may have been compromised, so hostile content is an ordinary case
rather than an unusual one. Content inserted into a page as markup can run script with the viewer's session.

The backend sanitises content before it is stored and again before it leaves the backend (record 11). A sanitiser that
misses a case lets markup through, so the frontend needs a way of showing content that does not rely on the backend's
sanitiser being complete.

## Decision

The frontend puts content into a page only as text, whoever wrote it and wherever it came from. Where content needs
structure, such as a link or a paragraph, the frontend builds the elements itself from validated values and puts the
content into them as text.

- The frontend's ways of inserting raw markup into a page are not used for content.
- A link is built only from an address that validation accepted, and its destination comes from that address, not from
  markup that came with it.
- Only addresses that start with `https:` or `http:` become links. An address that would run script when followed, such
  as one that starts with `javascript:`, stays text.

## Consequences

- The frontend's rule is a second layer, independent of the backend's sanitising.
- The Content Security Policy (record 13) limits the damage if both layers miss something.
- Following a link to an outside site is the person's own choice, and that site sees the visit.
- Sanitising received markup in the frontend and then inserting it was rejected. A sanitiser is another set of rules
  that has to be complete, and one that misses a case lets script run. Building elements from validated values gives
  received markup no way into the page.
