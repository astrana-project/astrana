# SPDX-License-Identifier: MPL-2.0

# Fails a pull request from a housekeeping branch that changes anything other than documentation in Markdown files.
# Housekeeping corrects documentation and wording without changing meaning, and may merge straight into master, so it
# must never carry code. Pull requests from other branches pass.

param(
    [Parameter(Mandatory)] [string] $Branch,
    [Parameter(Mandatory)] [string] $Base,
    [Parameter(Mandatory)] [string] $Head
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Git.ps1')

if (-not $Branch.StartsWith('housekeeping/')) { exit 0 }

$notDocumentation = Invoke-Git diff --name-only --no-renames "$Base...$Head" | Where-Object { $_ -notmatch '\.md$' }

if ($notDocumentation) {
    $notDocumentation | ForEach-Object {
        Write-Output "A housekeeping branch may change only Markdown files, and this one changes $_"
    }
    Write-Output 'Move the change to a technical/, fix/ or feature/ branch.'
    exit 1
}
