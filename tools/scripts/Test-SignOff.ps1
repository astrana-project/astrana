# SPDX-License-Identifier: MPL-2.0

# Fails when a commit in the pull request lacks a Signed-off-by line matching its author, as the Developer Certificate
# of Origin requires. Dependabot signs off its commits with an address that differs from their author, so on a pull
# request Dependabot opened, named in the PULL_REQUEST_AUTHOR environment variable, its own commits are skipped. Anyone
# else's commit on such a pull request still needs a sign-off, and no other pull request can use Dependabot's identity
# to skip the check. A pull request from a release branch or from master in this repository, named in PULL_REQUEST_HEAD
# and PULL_REQUEST_HEAD_REPOSITORY, is skipped, because every commit in it was checked when it entered develop or the
# release branch. A fork's branch of the same name is checked, because a fork can name its branches anything.

param(
    [Parameter(Mandatory)] [string] $Base,
    [Parameter(Mandatory)] [string] $Head
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Git.ps1')

$pullRequestHead = [string]$env:PULL_REQUEST_HEAD
$headRepository = [string]$env:PULL_REQUEST_HEAD_REPOSITORY
$fromThisRepository = $headRepository -and ($headRepository -eq $env:GITHUB_REPOSITORY)
if ($fromThisRepository -and ($pullRequestHead -eq 'master' -or $pullRequestHead.StartsWith('release/'))) { exit 0 }

$botAuthors = @{
    'dependabot[bot]' = 'dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>'
}
$skippedAuthor = $botAuthors[[string]$env:PULL_REQUEST_AUTHOR]

$unsigned = foreach ($commit in Invoke-Git rev-list --no-merges "$Base..$Head") {
    $author = Invoke-Git show --no-patch --format='%an <%ae>' $commit
    if ($skippedAuthor -and $author -eq $skippedAuthor) { continue }
    $message = Invoke-Git show --no-patch --format='%B' $commit
    if (-not ($message -split "`n" | Where-Object { $_.Trim() -eq "Signed-off-by: $author" })) {
        "Commit $commit has no sign-off by its author, $author"
    }
}

if ($unsigned) {
    $unsigned | ForEach-Object { Write-Output $_ }
    exit 1
}
