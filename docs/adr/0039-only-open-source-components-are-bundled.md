# 39. Only open-source components are bundled

Proposed.

## Context

Astrana claims that anyone can check what it does, which holds only if everything it ships can be read. An instance
should never have to contact a vendor for a licence key or activation. An owner's authority over their instance
([record 1](0001-each-instance-has-one-owner-who-is-its-sole-administrator.md)) extends to the code it runs, which they
or someone they trust may need to read, change and rebuild, and which someone has to be able to carry on if its
maintainers stop.

## Decision

Only open-source components are bundled into the software Astrana ships. What the owner provides, such as the database,
the web server in front of it, the operating system or a storage provider, is outside that rule.

## Consequences

- A proprietary component is left out even where it is the better tool, and an open-source one is chosen or built
  instead ([record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md)).
- Open source is a matter of licence, not of whether the code can be seen. A component published under terms that
  restrict use, change or redistribution does not qualify.
- Each bundled component's licence has to allow it to ship as part of Astrana under the Mozilla Public License 2.0.
- Every part of a release can be rebuilt from source.
- Costs the project's maintainers bear to distribute Astrana, such as signing releases, are outside the rule, because
  they are not passed on to owners.
- Allowing proprietary components that are free of charge was rejected, because they still cannot be audited, and their
  supplier can withdraw or change them.
