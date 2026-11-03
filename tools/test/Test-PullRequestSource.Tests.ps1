# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    function Invoke-SourceCheck(
        [string] $Base, [string] $Head, [string] $HeadRepository = 'astrana-project/astrana'
    ) {
        $script = Join-Path $PSScriptRoot '../scripts/Test-PullRequestSource.ps1'
        $output = & pwsh -NoProfile -File $script -Base $Base -Head $Head -HeadRepository $HeadRepository `
            -BaseRepository 'astrana-project/astrana' 2>&1
        [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = ($output -join "`n") }
    }
}

Describe 'Test-PullRequestSource' {
    It 'passes a pull request from <Head> into master' -ForEach @(
        @{ Head = 'release/0.1' }
        @{ Head = 'release/1.2' }
        @{ Head = 'housekeeping/fix-typo' }
    ) {
        (Invoke-SourceCheck 'master' $Head).ExitCode | Should -Be 0
    }

    It 'fails a pull request from <Head> into master, and says which branches may merge there' -ForEach @(
        @{ Head = 'develop' }
        @{ Head = 'hotfix/broken-sign-in' }
        @{ Head = 'technical/update-ci' }
        @{ Head = 'feature/albums' }
        @{ Head = 'releases/0.1' }
    ) {
        $result = Invoke-SourceCheck 'master' $Head

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'release/'
    }

    It 'fails a pull request into master from a fork, even from a branch named <Head>' -ForEach @(
        @{ Head = 'release/0.1' }
        @{ Head = 'housekeeping/fix-typo' }
    ) {
        $result = Invoke-SourceCheck 'master' $Head 'someone/astrana'

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'fork'
    }

    It 'passes any pull request into <Base>' -ForEach @(
        @{ Base = 'develop' }
        @{ Base = 'release/0.1' }
        @{ Base = 'support/1.x' }
    ) {
        (Invoke-SourceCheck $Base 'feature/albums').ExitCode | Should -Be 0
    }

    It 'passes a pull request from a fork into develop' {
        (Invoke-SourceCheck 'develop' 'master' 'someone/astrana').ExitCode | Should -Be 0
    }
}
