# Vision

What Astrana is for, the commitments it makes, and the principles that settle hard choices. The
[decision records](adr/README.md) record how Astrana keeps these commitments, and the [glossary](glossary.md) defines
the words used here.

## Mission

To build social networking software that is materially healthier than what people have now, by shaping the technology to
the whole of human nature rather than to the parts of it that can be exploited.

Materially means in substance rather than in presentation, so a change that leaves an incentive in place and only
describes it differently does not count.

The mission is about a person's closest relationships, which are served by continuity, quiet and a record built up
together over years. Astrana will never help anybody find anyone.

Astrana is for social media, not against it, and a person can use it heavily without the design working against them.
The mission rules out engagement as a measure of success, any revenue model in which someone benefits from people
spending longer, and paternalism, which would protect people from everything and so override their own judgement. Where
a technically elegant approach and the mission point in different directions, the mission wins.

## Vision

A place of your own, for the people already well known to you, where relationships are tended and deepened over years
rather than kept up with. Yours to own, seen only by the people each thing is for, and keeping only what matters.

A place is meant in the sense that a home is one, somewhere that belongs to a person, that others enter on their terms,
and where things are put rather than sent. Astrana asks as little of anybody as it can, because every extra channel or
format lands on whoever already carries a relationship.

## Four commitments, and what each costs

| Commitment                                | What it means                                                                                                     | What it costs                                                                              |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| For the people already well known to you  | There is no discovery, no directory and no strangers. Two people connect only when both approve.                  | Nobody can find you, and a new instance starts empty.                                      |
| Yours to own                              | It runs on hardware you control or hosting you rent, there is no operator above you, and nobody can suspend you.  | Nobody is coming to help either.                                                           |
| Seen only by the people each thing is for | Every post is for one or more audiences, each a named group of peers and guests, and nobody outside them sees it. | The default audience is every connected peer, so narrowing it is something the owner does. |
| Keeping only what matters                 | Content goes away by default, and keeping it is a choice.                                                         | Content you did not think to keep is gone.                                                 |

## What follows from them

Each of these is a decision with its own record, and each rules something out.

- An instance belongs to one person, and what someone writes lives on the instance where it was written, or, for a
  comment, on the instance that holds what it responds to. An instance never stores what it reads from a peer, and
  checks with the sharer every time before showing it.
- Connections are mutual and first degree only. There is no following, no groups, no direct messaging and no search
  across instances.
- The feed is chronological, is never ranked and has an end. Counts are shown as a record of how people responded, never
  as an achievement.
- An instance shows nothing to anyone it has no relationship with.
- Telemetry exists only to help fix faults, is not part of a default installation and is off until the owner opts in.
- Apart from announcing that it has ended, or that one of its keys should no longer be trusted, an instance tells its
  peers nothing about what it does. Peers ask for what they need, and each instance chooses what to answer.
- People use Astrana only through the web app their own instance serves. There are no native apps, because the stores
  that distribute them can control what people are allowed to run.
- Shared photos and videos cannot be saved unless the sharer allows it. This adds friction against misuse and is never
  presented as prevention.
- Deleting something removes it, with no hidden copy kept. Backups hold what was deleted until they age out, and whoever
  deletes something is told so at the time.
- An owner can take everything with them. Their data exports to an open standard, and the backup format is published,
  with a reader that opens a backup without Astrana installed.
- Nothing about an instance can be switched remotely, and an update is never applied without its owner. An instance that
  declines a mandatory update past its grace period limits itself, taking on no new commitments and reading no peer
  content, and the owner's own data is never held back.
- Releases are reproducible and signed, and updates are checked so that a compromised server can delay an update but
  never install one.
- Where Astrana controls the cryptography, it guards against attacks expected from future computers as well as today's,
  always pairing new methods with proven ones and starting with backups.
- The one central service is a signed catalogue of versions, which instances read without saying anything about
  themselves.

## Principles that settle hard choices

- User wellbeing wins. When principles conflict, the person's wellbeing is the tiebreaker.
- The relationship is what is being cultivated. A feature is judged by whether it treats the relationship as something
  two people build over time or as a surface for delivering content, and by whether it lightens or adds to the work of
  the person who already carries most of it.
- Mistakes can be corrected. Astrana is designed so that a mistake can be put right, a social one such as something said
  in anger as well as a practical one, for the person who made it and for the person it affected. Astrana can correct
  its own record, but it cannot un-share, un-see or reach beyond itself, and it says so plainly.
- Safety Third. Safety is never a substitute authority that people defer to instead of exercising their own judgement.
  As a rule about claims, Astrana never describes a protection as stronger than it is, because false comfort leaves
  people worse off than an honest gap.
- Nothing essential rests on one thing. Losing or breaking one sign-in factor never locks a person out for good, and an
  owner always has a way back that depends on nobody else.
- Harm reduction. People will do some things whatever they are advised, such as running an instance on cheap hosting, so
  a safe way to do it is better than leaving them to an unsafe one.
- Embeddedness. Social mechanisms work when the person acting is present among, known by and reachable by the people
  they act upon. Reach should never exceed the relationship carrying it.
- No scoreboards. A count belongs to the item it is attached to, and nothing adds counts up into a standing.
- The smallest attack surface. Prefer the design with fewer things in it, and prefer absence to configuration, because a
  capability that is not present cannot fail open or be misused.
- Host and guest. A place belongs to someone, and being in it means accepting how they keep it. The host says what the
  rules are, and does not arrange the appearance of the house.

## The software

The Astrana Application is the core of a small set of open-source software. It can exist on its own, and the others add
to its value, security and experience.

- The Astrana Application, in this repository, is what an instance runs.
- Astrana Owner Tools, also in this repository, installs, backs up, restores, repairs and removes an instance, from the
  machine it runs on or from the owner's own computer, and works when the instance itself does not.
- The Astrana Trusted Attestation Server lets an organisation vouch for its relationship with a person, which a peer may
  weigh when deciding whether to connect.
- Browser extensions let an owner share what they find while browsing with their own instance.
