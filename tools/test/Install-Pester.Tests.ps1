# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')
}

Describe 'Install-Pester' {
    BeforeEach {
        $workspace = New-TestRepository
        $destination = Join-Path $workspace 'modules'
    }

    AfterEach {
        Remove-Item -Recurse -Force $workspace
    }

    It 'refuses a package that does not match the pinned checksum, and installs nothing' {
        $package = Join-Path $workspace 'pester.nupkg'
        Set-Content $package 'not the published package'

        $result = Invoke-Check $workspace 'Install-Pester' @('-PackagePath', $package, '-Destination', $destination)

        $result.ExitCode | Should -Not -Be 0
        $result.Output | Should -Match 'checksum'
        Join-Path $destination 'Pester' | Should -Not -Exist
    }
}
