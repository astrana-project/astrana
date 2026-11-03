# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')

    function Get-ChangelogText([string] $Unreleased = '', [string] $Released = '- An earlier change.') {
        "# Changelog`n`n## [Unreleased]`n`n$Unreleased`n`n## [0.0.1] - 2026-11-01`n`n### Added`n`n$Released`n"
    }
}

Describe 'Test-Changelog' {
    BeforeEach {
        $repository = New-TestRepository
        Set-TestFile $repository 'application/CHANGELOG.md' (Get-ChangelogText)
        Set-TestFile $repository 'owner-tools/CHANGELOG.md' (Get-ChangelogText)
        $base = Add-TestCommit $repository 'Start'
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'fails when <Path> changes without an entry in <Changelog>' -ForEach @(
        @{ Path = 'application/backend/src/Server.cs'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'application/frontend/src/App.tsx'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'application/frontend/packages/ui/src/Button.tsx'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'owner-tools/src/Tools.cs'; Changelog = 'owner-tools/CHANGELOG.md' }
        @{ Path = 'application/frontend/index.html'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'application/frontend/public/robots.txt'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'application/frontend/package.json'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'application/frontend/package-lock.json'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'application/frontend/vite.config.ts'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'global.json'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'global.json'; Changelog = 'owner-tools/CHANGELOG.md' }
        @{ Path = 'Directory.Build.props'; Changelog = 'application/CHANGELOG.md' }
        @{ Path = 'Directory.Build.props'; Changelog = 'owner-tools/CHANGELOG.md' }
    ) {
        Set-TestFile $repository $Path "changed`n"
        $head = Add-TestCommit $repository 'Change'

        $result = Invoke-Check $repository 'Test-Changelog' @('-Base', $base, '-Head', $head)

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match ([regex]::Escape($Changelog))
    }

    It 'passes when shipped code changes with an entry under Unreleased in its changelog' {
        Set-TestFile $repository 'application/frontend/src/App.tsx' "changed`n"
        Set-TestFile $repository 'application/CHANGELOG.md' (Get-ChangelogText -Unreleased "### Fixed`n`n- A fix.")
        $head = Add-TestCommit $repository 'Change'

        (Invoke-Check $repository 'Test-Changelog' @('-Base', $base, '-Head', $head)).ExitCode | Should -Be 0
    }

    It 'passes a release, whose entries move from Unreleased to a new version heading' {
        Set-TestFile $repository 'application/frontend/src/App.tsx' "changed`n"
        $released = "# Changelog`n`n## [Unreleased]`n`n## [0.1.0] - 2026-12-01`n`n### Fixed`n`n- A fix.`n`n" +
            "## [0.0.1] - 2026-11-01`n`n### Added`n`n- An earlier change.`n"
        Set-TestFile $repository 'application/CHANGELOG.md' $released
        $head = Add-TestCommit $repository 'Release 0.1.0'

        (Invoke-Check $repository 'Test-Changelog' @('-Base', $base, '-Head', $head)).ExitCode | Should -Be 0
    }

    It 'passes the preparation of a release, which moves existing entries to a new version heading' {
        Set-TestFile $repository 'application/CHANGELOG.md' (Get-ChangelogText -Unreleased "### Fixed`n`n- A fix.")
        $unreleased = Add-TestCommit $repository 'Fix'
        Set-TestFile $repository 'application/frontend/package.json' "{ `"version`": `"0.1.0`" }`n"
        $released = "# Changelog`n`n## [Unreleased]`n`n## [0.1.0] - 2026-12-01`n`n### Fixed`n`n- A fix.`n`n" +
            "## [0.0.1] - 2026-11-01`n`n### Added`n`n- An earlier change.`n"
        Set-TestFile $repository 'application/CHANGELOG.md' $released
        $head = Add-TestCommit $repository 'Prepare 0.1.0'

        (Invoke-Check $repository 'Test-Changelog' @('-Base', $unreleased, '-Head', $head)).ExitCode | Should -Be 0
    }

    It 'passes an entry under Unreleased worded like an entry for an earlier version' {
        Set-TestFile $repository 'application/frontend/src/App.tsx' "changed`n"
        $repeated = Get-ChangelogText -Unreleased "### Added`n`n- An earlier change."
        Set-TestFile $repository 'application/CHANGELOG.md' $repeated
        $head = Add-TestCommit $repository 'Change'

        (Invoke-Check $repository 'Test-Changelog' @('-Base', $base, '-Head', $head)).ExitCode | Should -Be 0
    }

    It 'fails when shipped code changes and Unreleased contains only entries it had before' {
        Set-TestFile $repository 'application/CHANGELOG.md' (Get-ChangelogText -Unreleased "### Fixed`n`n- A fix.")
        $unreleased = Add-TestCommit $repository 'Fix'
        Set-TestFile $repository 'application/frontend/src/App.tsx' "changed`n"
        $head = Add-TestCommit $repository 'Change'

        $result = Invoke-Check $repository 'Test-Changelog' @('-Base', $unreleased, '-Head', $head)

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'Unreleased'
    }

    It 'fails when only an entry for an earlier version changes' {
        Set-TestFile $repository 'application/frontend/src/App.tsx' "changed`n"
        $reworded = Get-ChangelogText -Released '- An earlier change, reworded.'
        Set-TestFile $repository 'application/CHANGELOG.md' $reworded
        $head = Add-TestCommit $repository 'Change'

        $result = Invoke-Check $repository 'Test-Changelog' @('-Base', $base, '-Head', $head)

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'Unreleased'
    }

    It 'asks for both changelogs when shared code changes' {
        Set-TestFile $repository 'shared/src/Format.cs' "changed`n"
        Set-TestFile $repository 'application/CHANGELOG.md' (Get-ChangelogText -Unreleased "### Fixed`n`n- A fix.")
        $head = Add-TestCommit $repository 'Change'

        $result = Invoke-Check $repository 'Test-Changelog' @('-Base', $base, '-Head', $head)

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'owner-tools/CHANGELOG.md'
    }

    It 'passes changes to <Path>, which ships in neither application' -ForEach @(
        @{ Path = 'application/backend/test/ServerTests.cs' }
        @{ Path = 'application/frontend/test/App.test.tsx' }
        @{ Path = 'docs/guide.md' }
        @{ Path = 'tools/scripts/Check.ps1' }
    ) {
        Set-TestFile $repository $Path "changed`n"
        $head = Add-TestCommit $repository 'Change'

        (Invoke-Check $repository 'Test-Changelog' @('-Base', $base, '-Head', $head)).ExitCode | Should -Be 0
    }
}

Describe 'Test-Changelog on a pull request into a release branch' {
    BeforeAll {
        # Sets the application's stated version in both project files and gives its changelog a heading for each version
        # listed, newest first, each with the entries given for it.
        function Set-Release([string] $Repository, [string] $Package, [string] $Server, [hashtable[]] $Versions) {
            Set-TestFile $Repository 'application/frontend/package.json' "{`n  `"version`": `"$Package`"`n}`n"
            Set-TestFile $Repository 'application/backend/src/Astrana.Server/Astrana.Server.csproj' `
                "<Project>`n  <PropertyGroup>`n    <Version>$Server</Version>`n  </PropertyGroup>`n</Project>`n"
            $sections = foreach ($version in $Versions) {
                $entries = ($version.Entries | ForEach-Object { "- $_" }) -join "`n"
                "## [$($version.Version)] - 2026-12-01`n`n### Fixed`n`n$entries"
            }
            Set-TestFile $Repository 'application/CHANGELOG.md' (
                "# Changelog`n`n## [Unreleased]`n`n" + ($sections -join "`n`n") + "`n")
        }

        function Invoke-ReleaseCheck(
            [string] $Repository, [string] $Base, [string] $Head, [string] $Into = 'release/1.2'
        ) {
            Invoke-Check $Repository 'Test-Changelog' @('-Base', $Base, '-Head', $Head, '-BaseBranch', $Into)
        }
    }

    BeforeEach {
        $repository = New-TestRepository
        Set-TestFile $repository 'owner-tools/CHANGELOG.md' "# Changelog`n`n## [Unreleased]`n"
        Set-Release $repository '1.2.0' '1.2.0' @(@{ Version = '1.2.0'; Entries = @('A first fix.') })
        $base = Add-TestCommit $repository 'Prepare 1.2.0'
        git -C $repository tag astrana-v1.1.0 $base
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'passes a fix that joins a version not yet released, under its heading and with no further bump' {
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        Set-Release $repository '1.2.0' '1.2.0' @(@{ Version = '1.2.0'; Entries = @('A first fix.', 'A second fix.') })
        $head = Add-TestCommit $repository 'Fix'

        (Invoke-ReleaseCheck $repository $base $head).ExitCode | Should -Be 0
    }

    It 'fails a fix under a version that has already been released, and asks for a bump' {
        git -C $repository tag astrana-v1.2.0 $base
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        Set-Release $repository '1.2.0' '1.2.0' @(@{ Version = '1.2.0'; Entries = @('A first fix.', 'A second fix.') })
        $head = Add-TestCommit $repository 'Fix'

        $result = Invoke-ReleaseCheck $repository $base $head

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'already been released'
    }

    It 'passes a fix that bumps to a new version after the last one was released' {
        git -C $repository tag astrana-v1.2.0 $base
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        Set-Release $repository '1.2.1' '1.2.1' @(
            @{ Version = '1.2.1'; Entries = @('A second fix.') }
            @{ Version = '1.2.0'; Entries = @('A first fix.') }
        )
        $head = Add-TestCommit $repository 'Fix and bump to 1.2.1'

        (Invoke-ReleaseCheck $repository $base $head).ExitCode | Should -Be 0
    }

    It 'passes a fix to a version not yet released while an alpha of the next minor version is tagged' {
        git -C $repository tag astrana-v1.3.0-alpha.1 $base
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        Set-Release $repository '1.2.0' '1.2.0' @(@{ Version = '1.2.0'; Entries = @('A first fix.', 'A second fix.') })
        $head = Add-TestCommit $repository 'Fix'

        (Invoke-ReleaseCheck $repository $base $head).ExitCode | Should -Be 0
    }

    It 'fails a fix under a pre-release version that already has its own tag' {
        git -C $repository tag astrana-v1.2.0-rc.1 $base
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        Set-Release $repository '1.2.0-rc.1' '1.2.0-rc.1' @(@{ Version = '1.2.0-rc.1'; Entries = @('A first fix.') })
        $head = Add-TestCommit $repository 'Fix'

        $result = Invoke-ReleaseCheck $repository $base $head

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'already been released'
    }

    It 'fails a fix into a support branch under a version of that major already released' {
        git -C $repository tag astrana-v1.2.0 $base
        git -C $repository tag astrana-v2.0.0 $base
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        Set-Release $repository '1.2.0' '1.2.0' @(@{ Version = '1.2.0'; Entries = @('A first fix.', 'A second fix.') })
        $head = Add-TestCommit $repository 'Fix'

        $result = Invoke-ReleaseCheck $repository $base $head 'support/1.x'

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'already been released'
    }

    It 'passes a fix into a support branch that bumps its major version, although a later major is released' {
        git -C $repository tag astrana-v1.2.0 $base
        git -C $repository tag astrana-v2.0.0 $base
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        Set-Release $repository '1.2.1' '1.2.1' @(
            @{ Version = '1.2.1'; Entries = @('A second fix.') }
            @{ Version = '1.2.0'; Entries = @('A first fix.') }
        )
        $head = Add-TestCommit $repository 'Fix and bump to 1.2.1'

        (Invoke-ReleaseCheck $repository $base $head 'support/1.x').ExitCode | Should -Be 0
    }

    It 'fails a fix whose entry is under Unreleased rather than its version' {
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        $changelog = "# Changelog`n`n## [Unreleased]`n`n### Fixed`n`n- A second fix.`n`n" +
            "## [1.2.0] - 2026-12-01`n`n### Fixed`n`n- A first fix.`n"
        Set-TestFile $repository 'application/CHANGELOG.md' $changelog
        $head = Add-TestCommit $repository 'Fix'

        $result = Invoke-ReleaseCheck $repository $base $head

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match ([regex]::Escape('[1.2.0]'))
    }

    It 'fails, naming the file, when a project file states a different version from the changelog' {
        git -C $repository tag astrana-v1.2.0 $base
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        Set-Release $repository '1.2.1' '1.2.0' @(
            @{ Version = '1.2.1'; Entries = @('A second fix.') }
            @{ Version = '1.2.0'; Entries = @('A first fix.') }
        )
        $head = Add-TestCommit $repository 'Fix and half a bump'

        $result = Invoke-ReleaseCheck $repository $base $head

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'Astrana.Server.csproj'
    }

    It 'fails, naming the file, when a version file states no version' {
        Set-TestFile $repository 'application/frontend/src/App.tsx' "fixed`n"
        Set-Release $repository '1.2.0' '1.2.0' @(@{ Version = '1.2.0'; Entries = @('A first fix.', 'A second fix.') })
        Set-TestFile $repository 'application/frontend/package.json' "{`n  `"name`": `"web`"`n}`n"
        $head = Add-TestCommit $repository 'Fix'

        $result = Invoke-ReleaseCheck $repository $base $head

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'package.json'
    }

    It 'passes a pull request into a release branch that changes nothing an application ships' {
        git -C $repository tag astrana-v1.2.0 $base
        Set-TestFile $repository 'docs/guide.md' "# Guide`n"
        $head = Add-TestCommit $repository 'Document'

        (Invoke-ReleaseCheck $repository $base $head).ExitCode | Should -Be 0
    }
}

Describe 'Test-Changelog on unusual changes' {
    BeforeEach {
        $repository = New-TestRepository
        Set-TestFile $repository 'application/CHANGELOG.md' "# Changelog`n`n## [Unreleased]`n"
        Set-TestFile $repository 'owner-tools/CHANGELOG.md' "# Changelog`n`n## [Unreleased]`n"
        Set-TestFile $repository 'application/frontend/src/Feature.tsx' "feature`n"
        $base = Add-TestCommit $repository 'Start'
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'fails rather than passes when the base commit is unknown' {
        Set-TestFile $repository 'application/frontend/src/App.tsx' "changed`n"
        $head = Add-TestCommit $repository 'Change'

        $unknown = '0000000000000000000000000000000000000001'

        (Invoke-Check $repository 'Test-Changelog' @('-Base', $unknown, '-Head', $head)).ExitCode | Should -Not -Be 0
    }

    It 'fails when a shipped file moves out of a shipped folder without an entry' {
        New-Item -ItemType Directory -Path (Join-Path $repository 'application/frontend/test') | Out-Null
        git -C $repository mv application/frontend/src/Feature.tsx application/frontend/test/Feature.tsx
        $head = Add-TestCommit $repository 'Move'

        (Invoke-Check $repository 'Test-Changelog' @('-Base', $base, '-Head', $head)).ExitCode | Should -Be 1
    }

    It 'fails for a shipped file whose name has characters outside ASCII' {
        Set-TestFile $repository "application/frontend/src/Caf$([char]0x00E9).tsx" "new`n"
        $head = Add-TestCommit $repository 'Add'

        (Invoke-Check $repository 'Test-Changelog' @('-Base', $base, '-Head', $head)).ExitCode | Should -Be 1
    }
}
