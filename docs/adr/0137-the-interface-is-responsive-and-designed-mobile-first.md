# 137. The interface is responsive and designed mobile first

Proposed.

## Context

Astrana aims to accommodate as many people as it reasonably can (record 135). People use it through a web app
(record 19) on the devices they have, and for many that is a phone, sometimes their only way online. A layout made for
one size of screen is cramped on a smaller one and stretched on a larger one, and reworking a desktop layout for a phone
later usually means designing it again.

## Decision

The interface is designed for small screens first, and its layout fits the screen it is on, with nothing for the person
to set. It aims to work fully on as many devices as it reasonably can.

## Consequences

- If something does not fit on a small screen, it is moved rather than dropped. If it cannot reasonably work there, the
  interface says it needs a bigger screen.
- Everything works by touch as well as with a mouse, and buttons are big enough for a finger.
- Zooming in with the browser, or turning the device, changes the layout as a smaller or turned screen would (record
  132).
- Pages do not scroll sideways, except for things that need to, such as a wide table.
- Compact mode is a setting people choose for themselves, separate from fitting the screen.
- Designing for big screens first and squeezing the layout onto phones afterwards was rejected, because such layouts
  often break when narrowed.
- A separate phone site was rejected, because it would be a second interface to build, test and keep accessible.
