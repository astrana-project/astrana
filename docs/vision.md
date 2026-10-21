# Vision

What Astrana is for, the commitments it makes, and the principles that settle hard choices. The
[decision records](adr/README.md) record how the application keeps these commitments, and the [glossary](glossary.md)
defines the words used here.

## Mission

To align social media technology with how people naturally are, as far as is practical, so that its benefits can be
realised without working against the people using it.

Mainstream platforms are aligned too, with advertisers' interests, and human behaviour is what gets bent to fit. Astrana
shapes the technology to the person instead. It is for social media, not against it. A person can use it heavily, deeply
engaged with the people around them, without the design working against that engagement.

## Vision

The part of social life that was never digitised: a personal space of your own, yours to own, built for connecting with
people you already know, and designed to forget.

Astrana is a personal space in the way a home is one. Most social services are clubs, with membership, rules and an
administrator, or squares, open to anyone passing through. The first wave of social media digitised almost everything
except the home.

## Three commitments, and what each costs

| Commitment                        | What it means                                                                                                    | What it costs                                         |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| Yours to own                      | It runs on hardware you control or hosting you rent, there is no operator above you, and nobody can suspend you. | Nobody is coming to help either.                      |
| Built for people you already know | There is no discovery, no directory and no strangers. Two people connect only when both approve.                 | Nobody can find you, and a new instance starts empty. |
| Designed to forget                | Content goes away by default, rather than by a request made to a reluctant company.                              | Content you did not think to keep is gone.            |

## What follows from them

Each of these is a decision with its own record, and each rules something out.

- An instance belongs to one person, and what someone writes lives on the instance where it was written, or, for a
  comment, on the instance that holds what it responds to. An instance never keeps a copy of what it reads from a peer.
- Connections are mutual and first degree only. There is no following, no groups, no direct messaging and no search
  across instances.
- The feed is chronological, is never ranked and has an end. Counts are shown as a record of how people responded, never
  as an achievement.
- An instance shows nothing to anyone it has no relationship with.
- Telemetry exists only to help fix faults, is not part of a default installation and is off until the owner opts in.
- Nothing about an instance can be switched remotely, and an update is never applied without its owner.
- The one central service is a signed catalogue of versions, which instances read without saying anything about
  themselves.

## Principles that settle hard choices

- User wellbeing wins. When principles conflict, the person's wellbeing is the tiebreaker.
- Safety Third. Safety is never a substitute authority that people defer to instead of exercising their own judgement.
  As a rule about claims, Astrana never describes a protection as stronger than it is, because false comfort leaves
  people worse off than an honest gap.
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
- The Astrana Trusted Attestation Server lets an organisation vouch for its relationship with a person, which a peer may
  weigh when deciding whether to connect.
- Browser extensions let an owner share what they find while browsing with their own instance.
