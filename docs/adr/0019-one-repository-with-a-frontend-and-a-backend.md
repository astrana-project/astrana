# 19. One repository, with a frontend and a backend

Proposed.

## Context

The Astrana application is a React web app served by a .NET server. The server owns the session, serves the built web
app, answers the instance's application programming interface (API) and talks to other instances. The web app and the
server often change together, so keeping them in separate repositories would make one change land as several. The
application is expected to gain a component library of its own, peer transport, an installer and an owner maintenance
tool. Monorepo tools such as Nx, Turborepo and Lerna add dependencies that
[record 5](0005-third-party-components-are-used-only-when-necessary.md) asks to avoid.

## Decision

The application is kept in one repository with two top-level folders for the things that are built. `frontend/`
contains the web app, with its own `package.json` and lock file, and is the npm workspace root for shared packages in
`frontend/packages/`. `backend/` contains the .NET solution, its software development kit pin and its restore settings.
The server is the backend-for-frontend (BFF) and the instance API in one process, so neither has a folder of its own.

## Consequences

- A change to the web app and the server lands as one pull request.
- Each side is self-contained, with its own toolchain, settings and lock file.
- The component library gets a package boundary inside `frontend/` without being published, and can be published later
  if another project needs it.
- `backend/` also contains projects that are not servers, such as the installer and the maintenance tool.
- Separate repositories for the web app and the server were rejected because their changes would drift apart.
  Separate folders for the BFF and the API were rejected because they are one set of endpoints that answer according to
  who is asking, and a folder each would suggest separate services. Monorepo tools were rejected under record 5.
  Publishing the component library to a registry from the start was rejected because it has one consumer, and a
  registry account would be one more supply-chain target.
