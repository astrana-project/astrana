# SPDX-License-Identifier: MPL-2.0

# Fails a pull request into master unless it comes from a release branch or a housekeeping branch in this repository.
# A fix that master needs urgently goes through a release branch cut from master, as a patch release. A housekeeping
# branch may change documentation only, which Test-HousekeepingChanges checks. A fork can name its branches anything,
# so a pull request into master from a fork fails whatever its branch is called. Pull requests into every other branch
# pass.

param(
    [Parameter(Mandatory)] [string] $Base,
    [Parameter(Mandatory)] [string] $Head,
    [Parameter(Mandatory)] [string] $HeadRepository,
    [Parameter(Mandatory)] [string] $BaseRepository
)

$ErrorActionPreference = 'Stop'

if ($Base -ne 'master') { exit 0 }

if ($HeadRepository -ne $BaseRepository) {
    Write-Output "Pull requests into master come only from branches in $BaseRepository, and this one comes from a fork."
    exit 1
}

if (-not ($Head.StartsWith('release/') -or $Head.StartsWith('housekeeping/'))) {
    Write-Output 'Only release/ and housekeeping/ branches may merge into master.'
    Write-Output "This pull request comes from $Head."
    Write-Output 'Merge it into develop instead, or, for an urgent fix, into a release branch cut from master.'
    exit 1
}
