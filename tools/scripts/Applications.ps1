# SPDX-License-Identifier: MPL-2.0

# The two applications this repository releases, for the check scripts that dot-source this file. For each, it lists
# where it states its version, its changelog, the prefix of its release tags and the paths whose changes ship in it.
# What ships includes the code, the dependencies, the web app's start page, static files and vite.config.ts, and the
# build settings every .NET project shares. Code in shared/ and the shared build settings ship in both applications.
# Tests, documentation and tooling ship in neither.

function Get-Applications {
    $sharedByBoth = 'shared/src/', 'global\.json$', 'Directory\.Build\.props$'
    @(
        [pscustomobject]@{
            Name         = 'the Astrana application'
            TagPrefix    = 'astrana-v'
            Changelog    = 'application/CHANGELOG.md'
            VersionFiles = @(
                'application/frontend/package.json'
                'application/backend/src/Astrana.Server/Astrana.Server.csproj'
                'application/CHANGELOG.md'
            )
            Ships        = @(
                'application/backend/src/'
                'application/frontend/src/'
                'application/frontend/packages/[^/]+/src/'
                'application/frontend/public/'
                'application/frontend/index\.html$'
                'application/frontend/package(-lock)?\.json$'
                'application/frontend/vite\.config\.ts$'
            ) + $sharedByBoth
        }
        [pscustomobject]@{
            Name         = 'Astrana Owner Tools'
            TagPrefix    = 'astrana-owner-tools-v'
            Changelog    = 'owner-tools/CHANGELOG.md'
            VersionFiles = @(
                'owner-tools/src/Astrana.OwnerTools/Astrana.OwnerTools.csproj'
                'owner-tools/CHANGELOG.md'
            )
            Ships        = @('owner-tools/src/') + $sharedByBoth
        }
    )
}

# Returns the version a file states, given its text. That is the version field of a package.json, the Version property
# of a project file, or the newest version heading of a changelog.
function Get-StatedVersion([string] $File, [string] $Text) {
    switch ([System.IO.Path]::GetExtension($File)) {
        '.json' { ($Text | ConvertFrom-Json).version }
        '.csproj' { ([xml]$Text).Project.PropertyGroup.Version | Where-Object { $_ } | Select-Object -First 1 }
        '.md' {
            $heading = $Text -split "`n" | Where-Object { $_ -match '^## \[(?!Unreleased\])([^\]]+)\]' } |
                Select-Object -First 1
            if ($heading -match '^## \[([^\]]+)\]') { $Matches[1] }
        }
    }
}
