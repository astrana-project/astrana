# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')
}

Describe 'Test-SignOff' {
    BeforeEach {
        $repository = New-TestRepository
        $base = Add-TestCommit $repository 'Start'
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'passes when every commit is signed off by its author' {
        $head = Add-TestCommit $repository "Change`n`nSigned-off-by: Test Author <author@example.test>"

        (Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head)).ExitCode | Should -Be 0
    }

    It 'fails and names a commit without a sign-off' {
        $head = Add-TestCommit $repository 'Change'

        $result = Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head)

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match $head
    }

    It 'fails when the sign-off names someone other than the author' {
        $head = Add-TestCommit $repository "Change`n`nSigned-off-by: Someone Else <else@example.test>"

        (Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head)).ExitCode | Should -Be 1
    }

    Context 'on a pull request Dependabot opened' {
        BeforeAll {
            $dependabot = 'dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>'
        }

        It "passes Dependabot's own commits, which it signs off with a different address" {
            $message = "Bump a package`n`nSigned-off-by: dependabot[bot] <support@github.com>"
            $head = Add-TestCommit $repository $message $dependabot
            $environment = @{ PULL_REQUEST_AUTHOR = 'dependabot[bot]' }

            $result = Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head) $environment

            $result.ExitCode | Should -Be 0
        }

        It "still fails anyone else's commit without a sign-off" {
            Add-TestCommit $repository 'Bump a package' $dependabot | Out-Null
            $head = Add-TestCommit $repository 'Fix the build'
            $environment = @{ PULL_REQUEST_AUTHOR = 'dependabot[bot]' }

            $result = Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head) $environment

            $result.ExitCode | Should -Be 1
            $result.Output | Should -Match ([regex]::Escape($head))
        }
    }

    It "fails a commit using Dependabot's identity on a pull request someone else opened" {
        $dependabot = 'dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>'
        $head = Add-TestCommit $repository 'Bump a package' $dependabot
        $environment = @{ PULL_REQUEST_AUTHOR = 'someone' }

        $result = Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head) $environment

        $result.ExitCode | Should -Be 1
    }

    It 'skips a pull request from <Branch>, whose commits were checked on their way in' -ForEach @(
        @{ Branch = 'release/0.1' }
        @{ Branch = 'master' }
    ) {
        $dependabot = 'dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>'
        $head = Add-TestCommit $repository 'Bump a package' $dependabot
        $environment = @{
            PULL_REQUEST_AUTHOR = 'someone'; PULL_REQUEST_HEAD = $Branch
            PULL_REQUEST_HEAD_REPOSITORY = 'astrana-project/astrana'; GITHUB_REPOSITORY = 'astrana-project/astrana'
        }

        $result = Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head) $environment

        $result.ExitCode | Should -Be 0
    }

    It 'still checks a pull request from a fork, even from a branch named <Branch>' -ForEach @(
        @{ Branch = 'release/0.1' }
        @{ Branch = 'master' }
    ) {
        $head = Add-TestCommit $repository 'Change'
        $environment = @{
            PULL_REQUEST_AUTHOR = 'someone'; PULL_REQUEST_HEAD = $Branch
            PULL_REQUEST_HEAD_REPOSITORY = 'someone/astrana'; GITHUB_REPOSITORY = 'astrana-project/astrana'
        }

        $result = Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head) $environment

        $result.ExitCode | Should -Be 1
    }

    It 'still checks a pull request from a work branch' {
        $head = Add-TestCommit $repository 'Change'
        $environment = @{
            PULL_REQUEST_AUTHOR = 'someone'; PULL_REQUEST_HEAD = 'feature/albums'
            PULL_REQUEST_HEAD_REPOSITORY = 'astrana-project/astrana'; GITHUB_REPOSITORY = 'astrana-project/astrana'
        }

        (Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head) $environment).ExitCode | Should -Be 1
    }

    It 'fails when only one of several commits lacks a sign-off' {
        Add-TestCommit $repository "First`n`nSigned-off-by: Test Author <author@example.test>" | Out-Null
        $head = Add-TestCommit $repository 'Second'

        (Invoke-Check $repository 'Test-SignOff' @('-Base', $base, '-Head', $head)).ExitCode | Should -Be 1
    }
}

Describe 'Test-SignOff when git fails' {
    BeforeEach {
        $repository = New-TestRepository
        Add-TestCommit $repository 'Start' | Out-Null
        $head = Add-TestCommit $repository 'Change'
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'fails rather than passes when the base commit is unknown' {
        $unknown = '0000000000000000000000000000000000000001'

        (Invoke-Check $repository 'Test-SignOff' @('-Base', $unknown, '-Head', $head)).ExitCode | Should -Not -Be 0
    }
}
