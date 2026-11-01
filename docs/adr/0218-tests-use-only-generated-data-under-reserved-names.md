# 218. Tests use only generated data under reserved names

Proposed.

## Context

Tests and measurements need realistic amounts of data, including peers, posts, media and the accounts of children and
guardians. Real data, even anonymised, comes from real people, and test code is kept apart from what ships
([record 217](0217-tests-live-apart-from-the-code-they-test.md)).

## Decision

Tests use only data made by a generator, which produces realistic sizes on demand. Generated data always uses reserved
names, such as test domains and obviously fake people. Anonymised real data is never used.

## Consequences

- Generated data can never be mistaken for real data, leak into a real instance or reach a real peer, because its names
  cannot belong to anyone.
- Measurements on modest hardware use the same generator, so they test realistic sizes without anyone's data.
- Data that only real use produces, such as the odd shapes people's content takes, has to be imagined and generated.
- Testing with anonymised real data was rejected as neither practical nor wanted.
