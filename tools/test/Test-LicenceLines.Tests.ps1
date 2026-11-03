# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')
}

Describe 'Test-LicenceLines' {
    BeforeEach {
        $repository = New-TestRepository
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'passes when every source file starts with the licence identifier' {
        Set-TestFile $repository 'src/App.cs' "// SPDX-License-Identifier: MPL-2.0`n`nclass App { }`n"
        Set-TestFile $repository 'src/main.ts' "// SPDX-License-Identifier: MPL-2.0`n`nexport {};`n"

        (Invoke-Check $repository 'Test-LicenceLines').ExitCode | Should -Be 0
    }

    It 'fails and names a source file without the identifier' {
        Set-TestFile $repository 'src/main.ts' "export {};`n"

        $result = Invoke-Check $repository 'Test-LicenceLines'

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'src/main.ts'
    }

    It 'tells the contributor which script adds the missing lines' {
        Set-TestFile $repository 'src/main.ts' "export {};`n"

        (Invoke-Check $repository 'Test-LicenceLines').Output | Should -Match 'tools/scripts/Add-LicenceLines.ps1'
    }

    It 'fails when the identifier is below the fifth line' {
        Set-TestFile $repository 'src/App.cs' "`n`n`n`n`n// SPDX-License-Identifier: MPL-2.0`n"

        (Invoke-Check $repository 'Test-LicenceLines').ExitCode | Should -Be 1
    }

    It 'ignores files that are not source code' {
        Set-TestFile $repository 'README.md' "# Read me`n"
        Set-TestFile $repository 'data.json' "{}`n"

        (Invoke-Check $repository 'Test-LicenceLines').ExitCode | Should -Be 0
    }

    It 'ignores a tracked file that has been deleted' {
        Set-TestFile $repository 'src/Old.cs' "// SPDX-License-Identifier: MPL-2.0`n"
        Add-TestCommit $repository 'Add a file' | Out-Null
        Remove-Item (Join-Path $repository 'src/Old.cs')

        (Invoke-Check $repository 'Test-LicenceLines').ExitCode | Should -Be 0
    }
}

Describe 'Test-LicenceLines on file names outside ASCII' {
    BeforeEach {
        $repository = New-TestRepository
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'fails for a source file whose name has characters outside ASCII and that lacks the identifier' {
        $name = "Caf$([char]0x00E9)"
        Set-TestFile $repository "src/$name.ts" "export {};`n"
        Add-TestCommit $repository 'Add' | Out-Null

        $result = Invoke-Check $repository 'Test-LicenceLines'

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match $name
    }
}
