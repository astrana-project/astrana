# 64. Rules that may vary live in data, and fixed rules live in code

Proposed.

## Context

Laws change, threat lists update, translations get corrected and licences get added. Owners update their instances on
their own schedule ([record 31](0031-every-instance-is-managed-by-its-owner-and-nobody-else-operates-it.md)), so a rule
built into the software stays wrong on every instance until that instance updates.

## Decision

Where a rule is likely to change, be disputed or vary from place to place, it lives in data the application reads.
Defaults, the rules for each country, the ages in age brackets, link-safety sources, translations, the list of licences,
content classification settings and Graphics Interchange Format (GIF) packs are all data. Three kinds of rule stay in
code so that nobody can edit them, which are protections that must always hold, such as a child's baseline protections,
security checks, and the core commitments of the design. Where a value has both good reasons to vary and real potential
for abuse, it is data with a minimum fixed in code.

## Consequences

- Rules change without waiting for a new release.
- People can actually check what the rules are, because a list can be read where compiled code cannot.
- A rule held as data has visible edges. If a value is not in a country's rules, the country does not change it.
- A child's instance always starts with its baseline protections, because that rule is in code, not in a settings file.
  A guardian adjusts the protections through the app.
- The test for each rule is whether a reasonable owner would ever want a different value, and whether a hostile one
  would gain by changing it.
