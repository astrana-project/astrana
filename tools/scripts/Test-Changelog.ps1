# SPDX-License-Identifier: MPL-2.0

# Fails when a pull request changes what an application ships without the changelog entry it needs. Applications.ps1
# lists what ships in each application. Into most branches, the entry goes under [Unreleased]. Into a release or support
# branch, named in BaseBranch, it goes under the version the application states, and that version must be newer than the
# application's latest release tag. A fix joins a version that has not been released yet, and after a release the next
# fix bumps the version.

param(
    [Parameter(Mandatory)] [string] $Base,
    [Parameter(Mandatory)] [string] $Head,
    [string] $BaseBranch = ''
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Applications.ps1')
. (Join-Path $PSScriptRoot 'Git.ps1')

# Returns each entry line with the heading of the section it sits in.
function Get-ChangelogEntries([string] $Commit, [string] $Changelog) {
    $text = git show "${Commit}:$Changelog" 2>$null
    if ($LASTEXITCODE -ne 0) { return }
    $section = ''
    foreach ($line in $text) {
        if ($line -match '^## (\[[^\]]+\])') { $section = $Matches[1]; continue }
        if ($section -and $line.Trim() -and $line -notmatch '^###') {
            [pscustomobject]@{ Section = $section; Text = $line.Trim() }
        }
    }
}

# An entry counts when it sits in one of the given sections, or under a version heading the changelog did not have
# before, which is where a release moves its entries, and that section did not already contain it. An entry may repeat
# the wording of an entry for an earlier version. Rewording an entry for an earlier version does not count.
function Test-EntryAdded([string] $From, [string] $To, [string] $Changelog, [string[]] $Sections) {
    $before = @(Get-ChangelogEntries $From $Changelog)
    $sectionsBefore = (git show "${From}:$Changelog" 2>$null) |
        ForEach-Object { if ($_ -match '^## (\[[^\]]+\])') { $Matches[1] } }
    $entriesBefore = $before | ForEach-Object { "$($_.Section) $($_.Text)" }
    $added = Get-ChangelogEntries $To $Changelog | Where-Object {
        $inNewPlace = $Sections -contains $_.Section -or $sectionsBefore -notcontains $_.Section
        $inNewPlace -and $entriesBefore -notcontains "$($_.Section) $($_.Text)"
    }
    [bool]$added
}

function Get-TaggedVersions($Application) {
    Invoke-Git tag --list "$($Application.TagPrefix)*" |
        ForEach-Object { [System.Management.Automation.SemanticVersion]$_.Substring($Application.TagPrefix.Length) }
}

# Returns what stops a pull request into a release branch, for an application whose shipped files it changes.
function Get-ReleaseBranchProblems($Application, [string] $MergeBase) {
    $stated = foreach ($file in $Application.VersionFiles) {
        $text = (Invoke-Git show "${Head}:$file") -join "`n"
        [pscustomobject]@{ File = $file; Version = Get-StatedVersion $file $text }
    }
    $versions = @($stated.Version | Select-Object -Unique)
    if ($versions.Count -ne 1 -or ($stated | Where-Object { -not $_.Version })) {
        foreach ($entry in $stated) {
            $statement = if ($entry.Version) { "version $($entry.Version)" } else { 'no version' }
            "$($entry.File) states $statement"
        }
        "Every file must state the same version of $($Application.Name)."
        return
    }

    $version = $versions[0]
    # A pre-release of a later version, such as an alpha tagged on develop, is not a release of this one. A support/N.x
    # branch patches major version N, so only releases of that major count.
    $tagged = @(Get-TaggedVersions $Application)
    if ($BaseBranch -match '^support/(\d+)\.x$') {
        $major = [int]$Matches[1]
        $tagged = @($tagged | Where-Object { $_.Major -eq $major })
    }
    $latest = $tagged | Where-Object { -not $_.PreReleaseLabel } | Sort-Object -Descending | Select-Object -First 1
    $stated = [System.Management.Automation.SemanticVersion]$version
    if ($tagged -contains $stated -or ($latest -and $stated -le $latest)) {
        if ($tagged -contains $stated) { "Version $version of $($Application.Name) has already been released." }
        else { "Version $version of $($Application.Name) has already been released, as its latest release is $latest." }
        "Bump the version in $($Application.VersionFiles -join ', ')."
        return
    }

    if (-not (Test-EntryAdded $MergeBase $Head $Application.Changelog @("[$version]"))) {
        "This changes what $($Application.Name) ships, so add an entry under [$version] in $($Application.Changelog)"
    }
}

$changed = Invoke-Git diff --name-only --no-renames "$Base...$Head"
$mergeBase = Invoke-Git merge-base $Base $Head
$intoReleaseBranch = $BaseBranch.StartsWith('release/') -or $BaseBranch.StartsWith('support/')

$problems = foreach ($application in Get-Applications) {
    $pattern = '^(' + ($application.Ships -join '|') + ')'
    if (-not ($changed | Where-Object { $_ -match $pattern })) { continue }

    if ($intoReleaseBranch) {
        Get-ReleaseBranchProblems $application $mergeBase
    }
    elseif (-not (Test-EntryAdded $mergeBase $Head $application.Changelog @('[Unreleased]'))) {
        "This changes what $($application.Name) ships, so add an entry under [Unreleased] in $($application.Changelog)"
    }
}

if ($problems) {
    $problems | ForEach-Object { Write-Output $_ }
    exit 1
}
