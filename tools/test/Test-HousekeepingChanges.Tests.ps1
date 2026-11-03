# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')
}

Describe 'Test-HousekeepingChanges' {
    BeforeEach {
        $repository = New-TestRepository
        Set-TestFile $repository 'README.md' "# Read me`n"
        Set-TestFile $repository 'docs/guide.md' "# Guide`n"
        Set-TestFile $repository 'src/App.cs' "class App { }`n"
        $base = Add-TestCommit $repository 'Start'
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'passes a housekeeping pull request that changes only documentation' {
        Set-TestFile $repository 'README.md' "# Read me, reworded`n"
        Set-TestFile $repository 'docs/guide.md' "# Guide, corrected`n"
        $head = Add-TestCommit $repository 'Fix wording'

        $result = Invoke-Check $repository 'Test-HousekeepingChanges' @(
            '-Branch', 'housekeeping/fix-wording', '-Base', $base, '-Head', $head)

        $result.ExitCode | Should -Be 0
    }

    It 'fails a housekeeping pull request that changes <Path>, and names it' -ForEach @(
        @{ Path = 'src/App.cs' }
        @{ Path = '.github/workflows/ci.yml' }
        @{ Path = 'application/frontend/package.json' }
    ) {
        Set-TestFile $repository 'README.md' "# Read me, reworded`n"
        Set-TestFile $repository $Path "changed`n"
        $head = Add-TestCommit $repository 'Fix wording and more'

        $result = Invoke-Check $repository 'Test-HousekeepingChanges' @(
            '-Branch', 'housekeeping/fix-wording', '-Base', $base, '-Head', $head)

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match ([regex]::Escape($Path))
    }

    It 'fails a housekeeping pull request that renames code into a Markdown file, and names the code' {
        git -C $repository mv src/App.cs src/App.md
        $head = Add-TestCommit $repository 'Rename code'

        $result = Invoke-Check $repository 'Test-HousekeepingChanges' @(
            '-Branch', 'housekeeping/fix-wording', '-Base', $base, '-Head', $head)

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match ([regex]::Escape('src/App.cs'))
    }

    It 'ignores pull requests from branches other than housekeeping' {
        Set-TestFile $repository 'src/App.cs' "class App { int x; }`n"
        $head = Add-TestCommit $repository 'Change code'

        $result = Invoke-Check $repository 'Test-HousekeepingChanges' @(
            '-Branch', 'feature/albums', '-Base', $base, '-Head', $head)

        $result.ExitCode | Should -Be 0
    }
}

Describe 'Test-HousekeepingChanges when git fails' {
    BeforeEach {
        $repository = New-TestRepository
        Set-TestFile $repository 'src/App.cs' "class App { }`n"
        $head = Add-TestCommit $repository 'Start'
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'fails rather than passes when the base commit is unknown' {
        $result = Invoke-Check $repository 'Test-HousekeepingChanges' @(
            '-Branch', 'housekeeping/fix-wording', '-Base', '0000000000000000000000000000000000000001', '-Head', $head)

        $result.ExitCode | Should -Not -Be 0
    }
}
