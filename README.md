<picture>
  <source media="(prefers-color-scheme: dark)" srcset=".github/banner-dark.png">
  <img src=".github/banner.png" alt="Astrana. Healthier social networking for real human connection." width="100%">
</picture>

[![Mozilla Public License 2.0](https://img.shields.io/badge/licence-MPL--2.0-blue.svg)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/astrana-project/astrana/badge)](https://scorecard.dev/viewer/?uri=github.com/astrana-project/astrana)
[![CI on develop](https://github.com/astrana-project/astrana/actions/workflows/ci.yml/badge.svg?branch=develop)](https://github.com/astrana-project/astrana/actions/workflows/ci.yml)
[![CodeQL code scanning on develop](https://github.com/astrana-project/astrana/actions/workflows/codeql.yml/badge.svg?branch=develop)](https://github.com/astrana-project/astrana/actions/workflows/codeql.yml)
[![SonarQube Cloud quality gate](https://sonarcloud.io/api/project_badges/measure?project=astrana-project_astrana&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=astrana-project_astrana)

**Astrana** is free and open source social networking software for staying close to the people you already know well.
Each person has their own copy of Astrana, called an instance, on a computer they own or a hosting service they choose,
and is its owner. Instances connect directly to each other, with no platform in between.

It is being built for relationships that are tended and deepened over a lifetime. It is designed so that what you share
is seen only by the people you choose, and disappears after a set time unless you deliberately keep it. A child's parent
or guardian can see what the child shares and what is shared with the child. The feed will have an end, nothing will be
ranked to hold your attention, and nothing in Astrana will make money from your time or attention.

The main trade-off is that you look after your instance yourself, keeping it running, updated and backed up, or have
someone you trust do it for you. The [mission and vision](docs/adr/vision.md) explain what Astrana is for, what it
commits to, and what each commitment costs.

## Status

Astrana is in early development and cannot be used yet. This repository contains the scaffolding for its two
applications. The Astrana application is what people will use, and Astrana Owner Tools is what owners will use to
install, back up, restore, repair, move and uninstall an instance. The scaffolding is the project structure, the build,
the tests and the checks every change goes through. Version 0.0.1 is the scaffolding only, and running the Astrana
application today shows only a placeholder page. No version is ready for anyone to install.

## Quick start

The [quick start guide](docs/quickstart.md) explains what you need, and how to set up, run and test Astrana on your own
computer.

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md) and the [code of conduct](CODE_OF_CONDUCT.md) before contributing. Decision
records about how Astrana is designed and built go in [docs/adr](docs/adr), beside the mission and vision.

## Security

Report a security vulnerability privately, as described in [SECURITY.md](SECURITY.md). Never open a public issue for
one.

## Licence

Except where a file states otherwise, the source code and documentation in this repository are licensed under the
[Mozilla Public License 2.0](LICENSE). The [Developer Certificate of Origin](DCO) is not.

The Astrana name, logos and other branding are trademarks of Darin Morris and are not covered by the Mozilla Public
License 2.0. [TRADEMARKS.md](TRADEMARKS.md) explains how they may be used.

## Learn more and get help

- [RELEASING.md](RELEASING.md) explains how releases are built, checked and signed.
- The changelogs of [the Astrana application](application/CHANGELOG.md) and
  [Astrana Owner Tools](owner-tools/CHANGELOG.md) list what changed in each version.
- [astrana.org](https://astrana.org) has news about the project and how to follow it.
- To report a bug or suggest a feature, open an issue with the bug report or feature request form.
- For general enquiries, write to hello@astrana.org.
- For anything about the code of conduct, write to conduct@astrana.org, as the [code of conduct](CODE_OF_CONDUCT.md)
  explains.

## Layout

The Astrana application and Astrana Owner Tools both live in this repository, so that a change to one is made and tested
together with the other.

```
.
├── application/                the Astrana application, with its changelog
│   ├── frontend/               the web app's source and tests, and a folder for shared packages
│   └── backend/                the .NET server and its tests
├── owner-tools/                Astrana Owner Tools, with its changelog, its source and its tests
├── shared/                     for code both applications share, such as the backup format, and for its tests
├── testing/
│   ├── end-to-end/             for tests that run a whole instance or Astrana Owner Tools from start to finish
│   ├── personas/               for the fake people that test data is built from
│   └── samples/                for a sample backup of each backup format version, and for sample media
├── docs/
│   ├── quickstart.md           setting up, running and testing Astrana on your own computer
│   └── adr/                    the mission and vision, and the architecture decision records that rest on them
├── tools/
│   ├── scripts/                the pull request checks, the licence line tool and the development setup
│   ├── test/                   Pester tests of those scripts
│   └── snippets/               editor snippets that add the licence line
├── .github/                    workflows, Dependabot settings, issue forms, the pull request template, and the
│                               banner and social preview images
├── package.json, biome.json    the formatting and linting tools for the whole repository, and their settings
└── global.json,                the pinned .NET software development kit and the build settings every .NET project
    Directory.Build.props       shares
```

Code that both applications must agree on, such as the backup format, goes in `shared/`. Both applications reference it
directly instead of keeping copies of their own, so a change to it reaches both at once.
