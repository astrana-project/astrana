# 141. The interface meets WCAG 2.1 at level AA

Proposed.

## Context

Astrana aims to accommodate as many people as it reasonably can
([record 124](0124-astrana-is-localised-and-each-person-chooses-their-locale.md)), including people who use a screen
reader, a keyboard alone, enlarged text or reduced motion. Adding accessibility to a finished component library often
means reworking many of its components.

## Decision

Every part of the interface conforms to the Web Content Accessibility Guidelines (WCAG) 2.1 at level AA.

## Consequences

- Work on the interface aims to meet level AA of WCAG 2.2 as well. An interface that meets WCAG 2.2 also meets 2.1, the
  version Europe's harmonised accessibility standard uses.
- Each theme gets its own contrast check, because colours that pass in a light theme often fail in a dark one.
- Preferences such as a dark theme or compact mode are offered in addition to conformance, never instead of it.
- The interface asks people for text alternatives and captions on what they post, and does not require them. A post
  without them does not conform, and Astrana cannot make it conform.
- Checking conformance adds testing to every change to the interface, much of it by hand, because automated tools find
  only some failures.
- Treating accessibility as a later phase was rejected, because its cost grows with every component written without it.
