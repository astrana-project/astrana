# Releasing

Only the maintainer releases. The Astrana application and Astrana Owner Tools are released separately, each with its own
version, changelog and tag.

**The Astrana application** is tagged `astrana-vX.Y.Z`. Its version is stated in `application/frontend/package.json`, in
`application/backend/src/Astrana.Server/Astrana.Server.csproj` and in the newest version heading of
`application/CHANGELOG.md`.

**Astrana Owner Tools** is tagged `astrana-owner-tools-vX.Y.Z`. Its version is stated in
`owner-tools/src/Astrana.OwnerTools/Astrana.OwnerTools.csproj` and in the newest version heading of
`owner-tools/CHANGELOG.md`.

Each application's version must be the same in every place listed for it, and its tag must match that version. The
release workflow stops otherwise, and so does CI on a pull request into a release or support branch.

## Versions

Versions follow [Semantic Versioning](https://semver.org/).

- A fix or a dependency update raises the patch number, as in 1.2.0 to 1.2.1.
- New or changed behaviour that stays compatible raises the minor number, as in 1.2.1 to 1.3.0.
- A change that breaks compatibility raises the major number, as in 1.3.0 to 2.0.0.

A pre-release adds a label to the version it leads up to, such as `1.2.0-alpha.1`, `1.2.0-beta.1` or `1.2.0-rc.1`, with
the matching changelog heading and tag, such as `astrana-v1.2.0-rc.1`.

## Stages of a release

Every minor or major version moves through four stages.

| Stage                | What it means                                          | Prepared and tagged on                    |
| -------------------- | ------------------------------------------------------ | ----------------------------------------- |
| Alpha                | Features are still going in.                           | `develop`                                 |
| Beta                 | The planned features and documentation are in.         | `develop`                                 |
| Release candidate    | Believed ready to release. Only fixes go in from here. | `release/X.Y`, created from `develop`     |
| General availability | The release itself.                                    | `master`, after the release branch merges |

An urgent fix, and a patch to the previous major version, go straight to general availability once every required check
passes. An urgent fix is prepared on `release/X.Y.Z`, created from `master`, and tagged on `master`. A patch to the
previous major version is prepared and tagged on `support/N.x`.

## Prepare the release

### An alpha or a beta

1. On a branch from `develop`, set the version in each project file of the application you are releasing, such as
   `1.2.0-alpha.1`.
2. In that application's changelog, move the entries under `[Unreleased]` to a new heading for that version, such as
   `## [1.2.0-alpha.1] - 2026-12-01`, and leave `[Unreleased]` empty above it.
3. Merge the change into `develop` through a pull request, then tag the commit it creates on `develop`.

### A release candidate and the release

1. Create `release/X.Y` from `develop` when the last beta is ready.
2. On a branch from it, set the version to the first release candidate, such as `1.2.0-rc.1`, and move the changelog
   entries to a heading for it, as for an alpha. Merge it into the release branch through a pull request, then tag the
   commit it creates there.
3. Make each fix the candidate needs in its own pull request into the release branch. The first fix after a candidate is
   tagged bumps the version to the next one, such as `1.2.0-rc.2`. Tag each new candidate the same way.
4. When a candidate is ready, set the version to the release, such as `1.2.0`, and move the candidates' changelog
   entries under a heading for it, through one more pull request into the release branch.
5. Merge the release branch into `master` through a pull request, with a merge commit, then tag that commit.

Before a new major version of either application ships, check that a supported release of Astrana Owner Tools works with
every major version of the Astrana application that still gets security fixes, as [SECURITY.md](SECURITY.md) promises.

### An urgent fix

An urgent fix is a patch release that cannot wait for the next minor version.

1. Create `release/X.Y.Z` from `master`, named for the patch, such as `release/1.2.1`.
2. Make the fix in one pull request into it, with its changelog entry under `[1.2.1]` and the version bumped to 1.2.1.
3. Merge the release branch into `master` through a pull request, with a merge commit, then tag that commit.

## Fixes on release and support branches

A pull request into a release or support branch that changes what an application ships puts its changelog entry under
the version the application states. That version must be newer than the application's latest release.

A fix to a version that has no tag yet joins that version. Once a version is tagged, as a release candidate or a
release, the next fix also bumps the version, in the same pull request.

On a support branch, only the releases of its own major version count. CI checks all of this.

## Tag and build

Tag only a commit made by a pull request whose required checks all passed, because the release workflow does not run the
tests. Only the maintainer can create release tags. Pushing a tag starts the release workflow, which:

1. checks that the tag matches the application's stated versions
2. waits for the maintainer's approval in the `release` environment
3. builds the release twice, in different folders, and stops unless the two builds match byte for byte
4. writes software bills of materials in CycloneDX 1.5

The workflow never signs or publishes anything.

If the workflow fails for a reason outside the code, such as a runner fault or a network error, run it again on the same
tag. If the code has to change, leave the failed tag in place, fix the cause through a pull request and release the next
version, such as 1.2.2 in place of 1.2.1. A version number always means one build, so a tag is never moved.

## Sign and publish

1. Download the unsigned artefacts, their checksums and the bills of materials from the workflow run.
2. Check each artefact against its checksum.
3. Sign the artefacts locally. For a 0.x release, skip the Windows and macOS code signing, but still sign the Linux
   packages.
4. List the checksums of the signed artefacts in a new checksums file, because signing changes the files.
5. Publish the signed artefacts on GitHub Releases, together with that checksums file and the bills of materials, with
   release notes as described below. Mark an alpha, a beta or a release candidate as a pre-release.

### Release notes

Each release is described for three audiences, and each description is built from the one before it.

1. The changelog section is the record. It states what changed and what each change requires of the person running the
   application.
2. The GitHub release notes are for packagers, security researchers and technical owners. They contain the changelog
   section as written, how to check a download against the checksums file, the bills of materials and GitHub's
   attestation, any security advisories the release fixes, which versions of the other application it works with, and
   anything an upgrade needs beyond the changelog. An alpha, a beta or a release candidate also states that it is not
   for real use.
3. A short summary in plain words tells everyday owners what is new for them, whether they need to do anything and any
   deadline, wherever they hear about updates, such as [astrana.org](https://astrana.org).

## Security releases

When a release fixes a security vulnerability:

1. Put the changelog entry under Security, name the advisory, and credit the reporter unless they prefer not to be
   named.
2. Publish the repository's security advisory when the release is published, with the same credit, and request a Common
   Vulnerabilities and Exposures (CVE) identifier when the issue needs one.

## After the release

Every change that reaches `master` or a release branch must reach `develop` too. After each push to one of them, the
sync workflow opens a pull request into `develop` and merges it once the checks pass. The workflow needs its GitHub App.
Until the App is set up, open that pull request by hand, from the branch into `develop`, and merge it with a merge
commit.

## Support branches

When a new major version ships, create `support/N.x` from the last release of major version N. It takes security fixes
for that version for six months.

1. When a fix affects both major versions, release it for the current major version first, as an urgent fix.
2. Make the fix on the support branch in one pull request, with its changelog entry and the patch version bumped.
3. Tag the commit the pull request creates on the support branch, as a patch release of major version N.

A fix that only the previous major version needs starts at step 2. Nothing moves from a support branch into `develop`,
which is for the current major version.

Six months after the new major version ships, the support branch takes no more fixes. The new major version's release
notes state the date that support ends, and the last release from the support branch says in its notes that it is the
final one for that major version.
