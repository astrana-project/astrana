# 6. Only open-source components are bundled

Proposed.

## Context

Astrana is an open-source project, and in that spirit it is built from components that are open source themselves.
Open-source components keep licensing simple, because their terms are written to allow them to ship inside other
software. They cost nothing to licence, so neither the project nor owners pay for them. They can be audited, as Astrana
itself can. Others can review the same code too, although being open does not mean anyone has.

Open code also protects the privacy of the people using an instance. The project can check whether a component reports
anything about them, and remove any reporting it finds. Being open does not guarantee a component sends nothing, but
closed code cannot be checked at all. An open-source licence does not require a licence key or an activation server, so
an instance does not have to contact a vendor, which would tell the vendor the instance exists and make it depend on the
vendor's server staying up.

Open-source components also leave the owner, and the project, in control of the software. An owner's authority over
their instance (record 1) extends to the code it runs. They, or someone they trust, may read, change and rebuild every
part of it, and no vendor's licence decides what they may do with it. If a component has a defect or a vulnerability,
the project can fix it rather than wait for its maintainers. If the maintainers stop, the project or anyone else can
carry the component on. Anyone can rebuild and redistribute the whole of Astrana, which a fork relies on. The licence on
versions already released cannot be taken back.

Because every part can be built from source, a release can be checked against what it claims to contain. Fixes the
project makes can also be sent back to a component's maintainers. When they accept them, the component improves for
everyone and the project has fewer changes of its own to carry.

## Decision

Only open-source components are bundled into the software Astrana ships. What an owner chooses to run Astrana with, such
as the database, the web server in front of it, the operating system or a storage provider, is outside that rule.

## Consequences

- A proprietary component is left out even where it is the better tool, and an open-source one is chosen or built
  instead (record 5).
- Open source is a matter of licence, not of whether the code can be seen. A component whose code is published under
  terms that restrict use, change or redistribution does not qualify.
- Each bundled component's licence has to allow it to ship as part of Astrana under the Mozilla Public License 2.0.
- Costs the project's maintainers bear to distribute Astrana, such as signing releases, are outside the rule, because
  they are not passed on to owners.
- Allowing proprietary components that are free of charge was rejected, because they still cannot be audited, and their
  supplier can withdraw or change them.
