# Glossary

The words this repository uses, and what each one means in Astrana. Where a word has an everyday meaning and a narrower
one here, the narrower one applies.

## People, accounts and instances

| Term                | Meaning                                                                                                                                                                                                                              |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Astrana Application | The core of the Astrana software. An instance is an installation of it.                                                                                                                                                              |
| Instance            | One installation of the Astrana Application, belonging to one person. It is the unit of ownership, administration and data residency.                                                                                                |
| Owner               | The person an instance belongs to, its sole administrator, and the only account that is an instance rather than holding access to one.                                                                                               |
| Account             | A way for one person to sign in to an instance. There are four kinds, the owner's, a parent or guardian's, a custodian's and a guest's, and no others.                                                                               |
| Parent or guardian  | An account holding bounded authority over a child's instance, scoped to its parental controls. It is trusteeship, not ownership, and it ends automatically at Coming of Age. It may be held by a trusted person who is not a parent. |
| Custodian           | An account holding limited authority to preserve and recover an instance whose owner can no longer act. Custodianship, not inheritance.                                                                                              |
| Guest               | An account on someone else's instance for a person who will not run their own. A guest sees the owner's own content shared with them, and may comment and react, but posts and uploads nothing.                                      |
| Coming of Age       | The automatic transition at which guardian authority ends and the owner gains full control, at the age of majority where the owner lives.                                                                                            |
| Host and guest      | The principle that a place belongs to someone. The owner, as host, sets the terms of their own instance, and a guest is anyone visiting it, whether a peer or a guest account. Astrana always qualifies the word host, as below.     |

## Peers and content

| Term              | Meaning                                                                                                                                                                                  |
| ----------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Peer              | Another instance the owner has connected to, by mutual approval. A peer is neither a follower nor a contact, and both sides are equals.                                                  |
| Peer connection   | The two-sided relationship between two instances, made by a connection request, confirmed by comparing a verification code, and ended by disconnecting. Astrana has no following.        |
| Audience          | A named grouping of peers and guests that decides who can see a particular post.                                                                                                         |
| Content           | What people write and share, owned by whoever created it. It is stored on the instance where it was written, except that a comment lives on the instance that holds what it responds to. |
| Data sovereignty  | The rule that an instance never keeps a copy of a peer's content, and loads it fresh from the instance that holds it whenever it is shown.                                               |
| Ephemerality      | Content going away automatically after a period that suits it, unless its owner keeps it.                                                                                                |
| Material action   | An act with real consequences for access, content or trust, which the audit log records. Reading, viewing and searching are not material actions.                                        |
| Attestation       | An organisation's live answer that the holder of a key stands in one relationship with it. Evidence of a relationship, never of identity or character, and never required.               |
| Version catalogue | The signed catalogue of versions the project maintains, and the one deliberate exception to decentralisation. Instances read it without saying anything about themselves.                |
| Migration         | Moving an instance, with the same identity and peers, to another machine or kind of hosting. Changes to a database schema are called schema migrations.                                  |

## Architecture

| Term                | Meaning                                                                                                                                                                                  |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Inside              | The domain and the use cases, the code that holds Astrana's rules. It names nothing outside itself.                                                                                      |
| Outside             | Everything else, such as the browser, peers, the database, the operating system, the clock and frameworks.                                                                               |
| Internal boundary   | A boundary between parts of one instance's code, such as between the domain and a use case. Both sides are released together and checked by the compiler.                                |
| External boundary   | A boundary between the instance and something outside it. The other side may run a different version, so anything crossing it is a contract, untrusted until validated.                  |
| Port                | An interface the inside defines, in its own terms, for talking to the outside. A use case is a port the outside calls. Storage, the clock and key operations are ports the inside calls. |
| Adapter             | Code that translates between a port and one particular technology, such as an endpoint, a database or a peer client.                                                                     |
| Hosting adapter     | The adapter that runs the application in a particular environment, such as a Windows service, a systemd service or shared hosting.                                                       |
| Host machine        | The machine an instance runs on.                                                                                                                                                         |
| Hosting environment | Everything an instance runs on, including the host machine, its operating system and any hosting provider's platform.                                                                    |
| Hosting provider    | A company that rents out the hosting environment an instance runs on, such as a shared hosting or cloud provider.                                                                        |
| Web app             | The progressive web app that people use in a browser, served by their instance.                                                                                                          |
| Backend             | The .NET processes that make up an instance, serving the web app and answering its peers.                                                                                                |
| Web server          | The web server, Internet Information Services, NGINX or Caddy, that every installation runs behind.                                                                                      |
| Bounded context     | A part of the domain with its own model and language, kept independent of other parts.                                                                                                   |
| Aggregate           | A cluster of domain objects changed together as one unit, which enforces its own rules.                                                                                                  |
| Use case            | One named operation the application offers.                                                                                                                                              |
| Inbound type        | A type shaped by an external contract that carries data into the instance.                                                                                                               |
| Outbound type       | A type shaped by an external contract that carries data out of the instance.                                                                                                             |
| Snapshot            | A domain type holding an aggregate's state at a point in time. It crosses internal boundaries only.                                                                                      |

## Distinctions that are easy to miss

| Distinction                  | Why it matters                                                                                                                          |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| Peer, friend and connection  | Friend is untrue of most people someone knows. Connection suggests networking for its own sake. Peer says that both parties are equals. |
| Following and connecting     | Following is one-way and free to accumulate. Connecting is mutual, approved by both, and costs each person their own feed.              |
| Privacy, security and safety | Privacy is who knows what. Security is whether the system does what it says. Safety is whether a person comes to harm.                  |
| Moderation and owner control | Astrana does not moderate. An owner hiding, muting or disconnecting governs their own space, and does not decide what anyone may say.   |
| Fail closed and fail silent  | Withholding when a protection cannot be applied is right. Doing so without telling the person entitled to know is not.                  |
| Declared and enforced        | Rights, licences and ages are declarations. Astrana records and shows them, and cannot enforce them.                                    |
