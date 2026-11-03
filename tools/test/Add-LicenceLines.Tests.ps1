# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')
}

Describe 'Add-LicenceLines' {
    BeforeEach {
        $repository = New-TestRepository
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'adds the identifier in the comment style of a <Extension> file' -ForEach @(
        @{ Extension = 'cs'; Line = '// SPDX-License-Identifier: MPL-2.0' }
        @{ Extension = 'ts'; Line = '// SPDX-License-Identifier: MPL-2.0' }
        @{ Extension = 'tsx'; Line = '// SPDX-License-Identifier: MPL-2.0' }
        @{ Extension = 'js'; Line = '// SPDX-License-Identifier: MPL-2.0' }
        @{ Extension = 'jsx'; Line = '// SPDX-License-Identifier: MPL-2.0' }
        @{ Extension = 'mjs'; Line = '// SPDX-License-Identifier: MPL-2.0' }
        @{ Extension = 'css'; Line = '/* SPDX-License-Identifier: MPL-2.0 */' }
        @{ Extension = 'ps1'; Line = '# SPDX-License-Identifier: MPL-2.0' }
    ) {
        Set-TestFile $repository "src/file.$Extension" "first line`n"

        Invoke-Check $repository 'Add-LicenceLines' | Out-Null

        Get-Content -Raw (Join-Path $repository "src/file.$Extension") | Should -Be "$Line`n`nfirst line`n"
    }

    It 'keeps a shebang line first, so that the script still runs' {
        Set-TestFile $repository 'tools/run.mjs' "#!/usr/bin/env node`nconsole.log(1);`n"

        Invoke-Check $repository 'Add-LicenceLines' | Out-Null

        Get-Content -Raw (Join-Path $repository 'tools/run.mjs') |
            Should -Be "#!/usr/bin/env node`n// SPDX-License-Identifier: MPL-2.0`n`nconsole.log(1);`n"
    }

    It 'keeps a shebang line first when it is the whole file' {
        Set-TestFile $repository 'tools/run.mjs' '#!/usr/bin/env node'

        Invoke-Check $repository 'Add-LicenceLines' | Out-Null

        Get-Content -Raw (Join-Path $repository 'tools/run.mjs') |
            Should -Be "#!/usr/bin/env node`n// SPDX-License-Identifier: MPL-2.0`n`n"
    }

    It 'keeps a byte order mark at the start of the file' {
        $file = Join-Path $repository 'src/App.cs'
        New-Item -ItemType Directory -Path (Split-Path $file) | Out-Null
        [System.IO.File]::WriteAllText($file, "class App { }`n", [System.Text.UTF8Encoding]::new($true))

        Invoke-Check $repository 'Add-LicenceLines' | Out-Null

        [System.IO.File]::ReadAllBytes($file)[0..2] | Should -Be @(0xEF, 0xBB, 0xBF)
    }

    It 'adds the identifier with the line endings the file already uses' {
        Set-TestFile $repository 'src/App.cs' "class App { }`r`n"

        Invoke-Check $repository 'Add-LicenceLines' | Out-Null

        Get-Content -Raw (Join-Path $repository 'src/App.cs') |
            Should -Be "// SPDX-License-Identifier: MPL-2.0`r`n`r`nclass App { }`r`n"
    }

    It 'leaves a file that already has the identifier unchanged' {
        $content = "// SPDX-License-Identifier: MPL-2.0`n`nexport {};`n"
        Set-TestFile $repository 'src/main.ts' $content

        Invoke-Check $repository 'Add-LicenceLines' | Out-Null

        Get-Content -Raw (Join-Path $repository 'src/main.ts') | Should -Be $content
    }

    It 'changes nothing when run a second time' {
        Set-TestFile $repository 'src/main.ts' "export {};`n"
        Invoke-Check $repository 'Add-LicenceLines' | Out-Null
        $afterFirstRun = Get-Content -Raw (Join-Path $repository 'src/main.ts')

        Invoke-Check $repository 'Add-LicenceLines' | Out-Null

        Get-Content -Raw (Join-Path $repository 'src/main.ts') | Should -Be $afterFirstRun
    }

    It 'leaves files that are not source code alone' {
        Set-TestFile $repository 'README.md' "# Read me`n"

        Invoke-Check $repository 'Add-LicenceLines' | Out-Null

        Get-Content -Raw (Join-Path $repository 'README.md') | Should -Be "# Read me`n"
    }

    It 'names each file it changed' {
        Set-TestFile $repository 'src/main.ts' "export {};`n"

        (Invoke-Check $repository 'Add-LicenceLines').Output | Should -Match 'src/main.ts'
    }

    It 'leaves the repository passing the licence check' {
        Set-TestFile $repository 'src/App.cs' "class App { }`n"
        Set-TestFile $repository 'src/App.css' "body { }`n"

        Invoke-Check $repository 'Add-LicenceLines' | Out-Null

        (Invoke-Check $repository 'Test-LicenceLines').ExitCode | Should -Be 0
    }
}
