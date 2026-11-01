# 146. Text may not hold the null character or other characters that have no place in writing

Proposed.

## Context

Text reaches an instance from the people using it, from peers, from imports and restores, and from configuration files,
and the server checks all of it ([record 144](0144-the-server-checks-everything-the-app-checks.md)). Some characters
have no use in writing and a known use in attacks, and one of the supported databases cannot store the null character at
all
([record 75](0075-the-owner-chooses-postgresql-mysql-or-microsoft-sql-server-and-mariadb-follows-the-first-release.md)).
A character allowed on one route and refused on another would leave a gap, so what text Astrana accepts has to be one
rule for every route.

## Decision

Text from any route may not contain the null character, control characters other than tab, line feed and carriage
return, Unicode's noncharacters, unpaired surrogates, a byte-order mark inside the text, tag characters outside a valid
emoji tag sequence, or directional overrides and embeddings. Line endings are normalised to one form. Posts and comments
may contain the zero-width joiner and non-joiner, variation selectors, and the direction marks and isolates. A value
holding a refused character is refused whole with the Hypertext Transfer Protocol (HTTP) status
`HTTP 400 - Bad Request`, and the refusal is written to the security log. The rule is checked on the web application, on
content from peers, on imports and restores, and on configuration files, including the installer's answer file.

## Consequences

- The rule concerns the null character, not empty values. A database's own empty value stays allowed wherever the data
  model needs one, to save space or to show that something is undecided.
- Refusing the null character keeps text identical on every supported database and restorable into any of them, so an
  archive is not tied to the engine that wrote it. Binary data belongs in binary columns, which hold every byte value.
- Refusing directional overrides and embeddings goes against Unicode's own advice, which is written for source code. In
  what people write to each other they are what the Trojan Source attack and disguised file names rely on, and the marks
  and isolates cover legitimate mixed-direction writing, so nobody loses a sentence they wanted to write.
- The joiners are necessary in the spelling of some major languages, variation selectors choose how a character such as
  an emoji is drawn, and tag sequences build the flags of England, Scotland and Wales.
- Because direction marks and isolates are allowed, each post is shown inside a direction boundary of its own, so
  nothing in one post can reorder the text around it.
- A restore checks the whole archive and refuses an offending row before anything is loaded.
- A test in the build sends every refused character to every endpoint that accepts text and fails if any is stored, so
  an endpoint added without the check is noticed.
