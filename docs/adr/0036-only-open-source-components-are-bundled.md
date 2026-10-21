# 36. Only open-source components are bundled

Proposed.

## Context

Astrana claims that anyone can check what it does, and the claim holds only if everything it ships can be read. Open
code also protects the people using an instance. The project can check whether a component reports anything about them
and remove any reporting it finds, which closed code does not allow. An open-source licence needs no licence key or
activation server, so an instance never has to contact a vendor. And open code leaves the owner in control. An owner's
authority over their instance ([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)) extends to
the code it runs, which they or someone they trust may read, change and rebuild, and which the project or anyone else
can carry on if its maintainers stop.

## Decision

Only open-source components are bundled into the software Astrana ships. What the owner provides, such as the database,
the web server in front of it, the operating system or a storage provider, is outside that rule.

## Consequences

- A proprietary component is left out even where it is the better tool, and an open-source one is chosen or built
  instead ([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)).
- Open source is a matter of licence, not of whether the code can be seen. A component published under terms that
  restrict use, change or redistribution does not qualify.
- Each bundled component's licence has to allow it to ship as part of Astrana under the Mozilla Public License 2.0.
- Because every part can be built from source, a release can be checked against what it claims to contain.
- Astrana tests its own use of each component, and does not test the components themselves.
- Costs the project's maintainers bear to distribute Astrana, such as signing releases, are outside the rule, because
  they are not passed on to owners.
- Allowing proprietary components that are free of charge was rejected, because they still cannot be audited, and their
  supplier can withdraw or change them.
