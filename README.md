# Astrana

Astrana is self-hosted, peer to peer, social networking software. Each person runs their own instance, and instances
connect directly to the instances of people they already know.

This repository contains the Astrana application: the web app people use in their browser and the .NET server that
hosts it, owns the session and talks to other instances.

## Layout

```
frontend/           the web app
  package.json      its dependencies, and the npm workspace root for packages/
  src/              the app
  test/             its tests
  packages/         shared JavaScript packages, such as the component library
backend/            the .NET server, which is also the backend-for-frontend, and its tools
  Astrana.slnx      the .NET solution
  global.json       the pinned .NET software development kit
  src/              production projects
  test/             test projects
docs/adr/           decision records for this repository
tools/snippets/     editor snippets for Mozilla Public License 2.0 headers
```

## Prerequisites

- Git
- Node.js 24 (`.nvmrc`)
- The .NET 11 software development kit (`backend/global.json`)

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) and the [code of conduct](CODE_OF_CONDUCT.md) before contributing. The reasons
behind how this repository is built are in its [decision records](docs/adr/README.md).

Report security vulnerabilities privately, as [SECURITY.md](SECURITY.md) describes. Never open a public issue for one.

## Licence

Astrana is licensed under the [Mozilla Public License 2.0](LICENSE). The name Astrana and its logos are trademarks, and
[TRADEMARKS.md](TRADEMARKS.md) says how they may be used.
