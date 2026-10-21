# Architecture decision records for the Astrana application

Why the Astrana application is built the way it is, one decision per record. All of them rest on one premise, that the
individual is the basic unit of society, so a person runs their own instance of Astrana and connects it directly to the
instances of people they already know.

Each record addresses one decision that could be reversed on its own. A record starts as `Proposed.` and becomes
`Accepted on YYYY-MM-DD.` when the maintainer accepts it. Records are numbered in the order they are accepted, and a
record's number never changes once it is accepted. Records accepted together are numbered with the most foundational
first. While a record is proposed, its number may change.

A record is never edited into a different decision. Corrections that keep the decision the same are made in place. A
decision that changes gets a new record, and the old record's status becomes `Superseded by record N on YYYY-MM-DD.` The
old record is the history of why things were as they were.

The records below are grouped by topic. The "Derives from" column names the records each record rests on, whether or not
its text cites them.

## The instance

| Record                                                                                                                                                   | Status   | Derives from |
| -------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [1. Each instance has one owner, who is its sole administrator](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)                       | Proposed | the premise  |
| [2. Astrana is built on one instance per person, running as one live copy](0002-astrana-is-built-on-one-instance-per-person-running-as-one-live-copy.md) | Proposed | 1            |
| [3. People use Astrana through a web app served by the instance they use](0003-people-use-astrana-through-a-web-app-served-by-the-instance-they-use.md)  | Proposed | the premise  |

## Data

| Record                                                                                                                                    | Status   | Derives from |
| ----------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [4. Times are recorded and exchanged in UTC](0004-times-are-recorded-and-exchanged-in-utc.md)                                             | Proposed | the premise  |
| [38. Support PostgreSQL, MySQL and SQL Server](0038-support-postgresql-mysql-and-sql-server.md)                                           | Proposed | 34           |
| [39. Migrations run as a separate step, with their own credentials](0039-migrations-run-as-a-separate-step-with-their-own-credentials.md) | Proposed | 38           |

## Dependencies and supply chain

| Record                                                                                                                                                       | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------------ |
| [5. Third-party components are used only when necessary](0005-third-party-components-are-used-only-when-necessary.md)                                        | Proposed | the premise  |
| [6. Only open-source components are bundled](0006-only-open-source-components-are-bundled.md)                                                                | Proposed | 1, 5         |
| [21. Every dependency version is pinned in a committed lock file](0021-every-dependency-version-is-pinned-in-a-committed-lock-file.md)                       | Proposed | 5, 19        |
| [22. Each release lists everything it ships in a software bill of materials](0022-each-release-lists-everything-it-ships-in-a-software-bill-of-materials.md) | Proposed | 6, 21        |

## The interface

| Record                                                                                                                                                                       | Status   | Derives from |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [7. Astrana is localised, and each person chooses their locale](0007-astrana-is-localised-and-each-person-chooses-their-locale.md)                                           | Proposed | 1, 5         |
| [8. The interface meets WCAG 2.1 at level AA](0008-the-interface-meets-wcag-2-1-at-level-aa.md)                                                                              | Proposed | 7            |
| [9. The interface is responsive and designed mobile first](0009-the-interface-is-responsive-and-designed-mobile-first.md)                                                    | Proposed | 3, 7, 8      |
| [10. Colours, spacing and typography come from design tokens](0010-colours-spacing-and-typography-come-from-design-tokens.md)                                                | Proposed | 7            |
| [11. All input is validated and sanitised](0011-all-input-is-validated-and-sanitised.md)                                                                                     | Proposed | the premise  |
| [12. The frontend loads assets and dependencies only from its own instance](0012-the-frontend-loads-assets-and-dependencies-only-from-its-own-instance.md)                   | Proposed | 3, 11        |
| [13. Every page carries a Content Security Policy that allows only its own instance](0013-every-page-carries-a-content-security-policy-that-allows-only-its-own-instance.md) | Proposed | 11, 12       |
| [14. Only the interface's own code produces markup](0014-only-the-interfaces-own-code-produces-markup.md)                                                                    | Proposed | 11, 13       |
| [15. The browser never holds credentials or tokens](0015-the-browser-never-holds-credentials-or-tokens.md)                                                                   | Proposed | 11, 13, 14   |
| [16. Empty, unmet and failed are shown as three different states](0016-empty-unmet-and-failed-are-shown-as-three-different-states.md)                                        | Proposed | 2            |
| [17. The interface stays fast on low-specification hardware](0017-the-interface-stays-fast-on-low-specification-hardware.md)                                                 | Proposed | 5            |

## Architecture

| Record                                                                                                                                      | Status   | Derives from |
| ------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [28. The architecture follows named principles, not one methodology](0028-the-architecture-follows-named-principles-not-one-methodology.md) | Proposed | the premise  |
| [29. Depend in the direction of stability](0029-depend-in-the-direction-of-stability.md)                                                    | Proposed | 28           |
| [30. Internal and external boundaries are treated differently](0030-internal-and-external-boundaries-are-treated-differently.md)            | Proposed | 11, 28, 29   |
| [31. The inside defines ports and the outside adapts to them](0031-the-inside-defines-ports-and-the-outside-adapts-to-them.md)              | Proposed | 28, 29       |
| [32. The domain is modelled with domain-driven design](0032-the-domain-is-modelled-with-domain-driven-design.md)                            | Proposed | 28           |
| [33. Code is organised by feature, for locality of behaviour](0033-code-is-organised-by-feature-for-locality-of-behaviour.md)               | Proposed | 28, 29, 32   |

## How the repository is built

| Record                                                                                                                                     | Status   | Derives from   |
| ------------------------------------------------------------------------------------------------------------------------------------------ | -------- | -------------- |
| [18. Develop on .NET 11 and release on .NET 12 long-term support](0018-develop-on-dotnet-11-and-release-on-dotnet-12-long-term-support.md) | Proposed | 5              |
| [19. One repository, with a frontend and a backend](0019-one-repository-with-a-frontend-and-a-backend.md)                                  | Proposed | 2, 3, 5        |
| [20. Tests live apart from the code they test](0020-tests-live-apart-from-the-code-they-test.md)                                           | Proposed | 19             |
| [25. The backend is built on .NET](0025-the-backend-is-built-on-dotnet.md)                                                                 | Proposed | 5, 6           |
| [26. The frontend is built with React, in functional style](0026-the-frontend-is-built-with-react-in-functional-style.md)                  | Proposed | 3, 5           |
| [27. The frontend is written in TypeScript with strict checking](0027-the-frontend-is-written-in-typescript-with-strict-checking.md)       | Proposed | 11             |
| [34. The domain is a project of its own in the backend](0034-the-domain-is-a-project-of-its-own-in-the-backend.md)                         | Proposed | 19, 20, 29, 33 |
| [42. Architecture rules are checked by tests](0042-architecture-rules-are-checked-by-tests.md)                                             | Proposed | 5, 29, 33, 34  |

## Running

| Record                                                                                                              | Status   | Derives from   |
| ------------------------------------------------------------------------------------------------------------------- | -------- | -------------- |
| [35. Hosts are adapters around one application](0035-hosts-are-adapters-around-one-application.md)                  | Proposed | 25             |
| [36. Self-contained builds for Linux, Windows and macOS](0036-self-contained-builds-for-linux-windows-and-macos.md) | Proposed | 18, 21, 25, 35 |
| [37. Every installation runs behind a front web server](0037-every-installation-runs-behind-a-front-web-server.md)  | Proposed | 35             |

## The API

| Record                                                                                                                                                     | Status   | Derives from |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------ |
| [40. Minimal APIs, with separate route groups for people and peers](0040-minimal-apis-with-separate-route-groups-for-people-and-peers.md)                  | Proposed | 15, 31, 33   |
| [41. The web app's API is described by OpenAPI, and its types are generated](0041-the-web-apps-api-is-described-by-openapi-and-its-types-are-generated.md) | Proposed | 3, 23, 40    |

## Delivery

| Record                                                                                           | Status   | Derives from |
| ------------------------------------------------------------------------------------------------ | -------- | ------------ |
| [23. Version numbers say what an update means](0023-version-numbers-say-what-an-update-means.md) | Proposed | 19           |
| [24. Master is always releasable](0024-master-is-always-releasable.md)                           | Proposed | 23           |
