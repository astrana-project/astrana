# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')

    function Set-ApplicationVersion([string] $Repository, [string] $Package, [string] $Server, [string] $Changelog) {
        Set-TestFile $Repository 'application/frontend/package.json' "{`n  `"version`": `"$Package`"`n}`n"
        Set-TestFile $Repository 'application/backend/src/Astrana.Server/Astrana.Server.csproj' `
            "<Project>`n  <PropertyGroup>`n    <Version>$Server</Version>`n  </PropertyGroup>`n</Project>`n"
        Set-TestFile $Repository 'application/CHANGELOG.md' `
            "# Changelog`n`n## [Unreleased]`n`n## [$Changelog] - 2026-11-01`n`n### Added`n`n- Something.`n"
    }

    function Set-OwnerToolsVersion([string] $Repository, [string] $Project, [string] $Changelog) {
        Set-TestFile $Repository 'owner-tools/src/Astrana.OwnerTools/Astrana.OwnerTools.csproj' `
            "<Project>`n  <PropertyGroup>`n    <Version>$Project</Version>`n  </PropertyGroup>`n</Project>`n"
        Set-TestFile $Repository 'owner-tools/CHANGELOG.md' `
            "# Changelog`n`n## [Unreleased]`n`n## [$Changelog] - 2026-11-01`n`n### Added`n`n- Something.`n"
    }
}

Describe 'Test-ReleaseVersion' {
    BeforeEach {
        $repository = New-TestRepository
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'passes an application tag that matches its project files and changelog' {
        Set-ApplicationVersion $repository '0.1.0' '0.1.0' '0.1.0'

        (Invoke-Check $repository 'Test-ReleaseVersion' @('-Tag', 'astrana-v0.1.0')).ExitCode | Should -Be 0
    }

    It 'passes a pre-release tag that matches' {
        Set-ApplicationVersion $repository '0.1.0-alpha.1' '0.1.0-alpha.1' '0.1.0-alpha.1'

        (Invoke-Check $repository 'Test-ReleaseVersion' @('-Tag', 'astrana-v0.1.0-alpha.1')).ExitCode | Should -Be 0
    }

    It 'fails and names <File> when it disagrees with the tag' -ForEach @(
        @{ File = 'application/frontend/package.json'; Package = '0.0.1'; Server = '0.1.0'; Changelog = '0.1.0' }
        @{ File = 'Astrana.Server.csproj'; Package = '0.1.0'; Server = '0.0.1'; Changelog = '0.1.0' }
        @{ File = 'application/CHANGELOG.md'; Package = '0.1.0'; Server = '0.1.0'; Changelog = '0.0.1' }
    ) {
        Set-ApplicationVersion $repository $Package $Server $Changelog

        $result = Invoke-Check $repository 'Test-ReleaseVersion' @('-Tag', 'astrana-v0.1.0')

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match ([regex]::Escape($File))
    }

    It 'checks an Astrana Owner Tools tag against Owner Tools only' {
        Set-ApplicationVersion $repository '0.0.1' '0.0.1' '0.0.1'
        Set-OwnerToolsVersion $repository '0.2.0' '0.2.0'

        (Invoke-Check $repository 'Test-ReleaseVersion' @('-Tag', 'astrana-owner-tools-v0.2.0')).ExitCode | Should -Be 0
    }

    It 'fails an Astrana Owner Tools tag whose changelog disagrees' {
        Set-OwnerToolsVersion $repository '0.2.0' '0.1.0'

        $result = Invoke-Check $repository 'Test-ReleaseVersion' @('-Tag', 'astrana-owner-tools-v0.2.0')

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'owner-tools/CHANGELOG.md'
    }

    It 'fails a tag that names neither application' {
        Set-ApplicationVersion $repository '0.1.0' '0.1.0' '0.1.0'

        (Invoke-Check $repository 'Test-ReleaseVersion' @('-Tag', 'v0.1.0')).ExitCode | Should -Be 1
    }
}
