# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')
}

Describe 'New-TestRepository' {
    BeforeEach {
        $hooks = Join-Path ([System.IO.Path]::GetTempPath()) "astrana-hooks-$([guid]::NewGuid())"
        New-Item -ItemType Directory -Path $hooks | Out-Null
        $hook = Join-Path $hooks 'commit-msg'
        [System.IO.File]::WriteAllText($hook, "#!/bin/sh`necho 'Signed-off-by: Hook <hook@example.test>' >> `"`$1`"`n")
        if (-not $IsWindows) { chmod +x $hook }
        $globalConfig = Join-Path $hooks 'gitconfig'
        [System.IO.File]::WriteAllText($globalConfig, "[core]`n`thooksPath = $($hooks.Replace('\', '/'))`n")
        $previousGlobal = $env:GIT_CONFIG_GLOBAL
        $env:GIT_CONFIG_GLOBAL = $globalConfig
        $repository = $null
    }

    AfterEach {
        $env:GIT_CONFIG_GLOBAL = $previousGlobal
        Remove-Item -Recurse -Force $hooks
        if ($repository) { Remove-Item -Recurse -Force $repository }
    }

    It 'ignores hooks from the contributor''s own Git settings, so commits are made exactly as each test asks' {
        $repository = New-TestRepository
        Add-TestCommit $repository 'Change' | Out-Null

        git -C $repository log -1 --format=%B | Should -Not -Match 'Signed-off-by'
    }
}
