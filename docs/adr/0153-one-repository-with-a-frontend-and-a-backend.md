# 153. One repository, with the application, Astrana Owner Tools and what they share

Proposed.

## Context

The Astrana application is a React web app served by .NET processes that own the session, serve the built web app,
answer the instance's application programming interface (API) and talk to other instances. The web app and the backend
often change together, so keeping them in separate repositories would make one change land as several. Astrana Owner
Tools, which installs, updates and maintains instances, has to stay compatible with the application, and both depend on
formats neither owns alone, such as the backup archive. Monorepo tools such as Nx, Turborepo and Lerna add dependencies
that [record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md) asks to avoid.

## Decision

Astrana is kept in one repository, with lowercase folder names:

- The application has a folder of its own, holding its frontend, its backend and its changelog. The frontend contains
  the web app, with its own `package.json` and lock file, and is the npm workspace root for its shared packages. The
  backend contains the application's .NET solution and every .NET project of the application, whichever process it runs
  in.
- Astrana Owner Tools has a folder of its own, with its own .NET solution and changelog.
- A shared folder at the root, owned by neither, holds what both use, such as the archive format, keys and version
  contracts.
- A testing folder holds what spans both, such as end-to-end tests, personas and samples. The samples include an archive
  for every format version, media and hostile inputs.
- A documents folder holds the decision records and the vision.

The runtime and software development kit settings both share live once, at the root.

## Consequences

- A change to the web app and the backend, or to the application and Owner Tools together, lands as one pull request.
- Each part is self-contained, with its own toolchain, settings and lock file.
- A format both parts use belongs to neither, so neither can change it without the other noticing.
- The component library gets a package boundary inside the frontend without being published, and can be published later
  if another project needs it.
- Separate repositories for the web app, the backend or Owner Tools were rejected because their changes would drift
  apart. Monorepo tools were rejected under
  [record 4](0004-astrana-depends-on-outside-components-only-where-it-must.md). Publishing the component library to a
  registry from the start was rejected because it has one consumer, and a registry account would be one more
  supply-chain target.
