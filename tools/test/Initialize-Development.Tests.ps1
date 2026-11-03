# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')

    # Puts stand-ins for node, npm and dotnet first on the path. Each records how it was called. The dotnet stand-in
    # reports the version in FAKE_DOTNET_VERSION, or fails as dotnet does when no installed SDK satisfies global.json.
    function New-FakeCommands([string] $Directory) {
        $nodeVersion = (Get-Content (Join-Path $PSScriptRoot '../../.nvmrc')).Trim()
        $record = 'Add-Content -LiteralPath $env:FAKE_COMMAND_LOG -Value "{0} $args"'
        Set-Content (Join-Path $Directory 'node.ps1') "$($record -f 'node')`n'v$nodeVersion.1.0'"
        # Like the npm.ps1 that Node.js installs on Windows, this stand-in reads its arguments from the line that called
        # it, so it records what a caller really passes.
        Set-Content (Join-Path $Directory 'npm.ps1') @'
Add-Content -LiteralPath $env:FAKE_COMMAND_LOG -Value "npm called as: $($MyInvocation.Line.Trim())"
exit [int]$env:FAKE_NPM_EXIT_CODE
'@
        Set-Content (Join-Path $Directory 'dotnet.ps1') @"
$($record -f 'dotnet')
if (`$args[0] -eq '--version') {
    if (-not `$env:FAKE_DOTNET_VERSION) {
        [Console]::Error.WriteLine('A compatible .NET SDK was not found.')
        exit 155
    }
    `$env:FAKE_DOTNET_VERSION
}
exit 0
"@
    }
}

Describe 'Initialize-Development' {
    BeforeEach {
        $workspace = New-TestRepository
        $fakes = Join-Path $workspace 'fakes'
        New-Item -ItemType Directory -Path $fakes | Out-Null
        New-FakeCommands $fakes
        $log = Join-Path $workspace 'commands.log'
        Set-Content $log ''
        $requiredSdk = (Get-Content (Join-Path $PSScriptRoot '../../global.json') -Raw | ConvertFrom-Json).sdk.version
        $environment = @{
            PATH             = $fakes + [System.IO.Path]::PathSeparator + $env:PATH
            FAKE_COMMAND_LOG = $log
        }
    }

    AfterEach {
        Remove-Item -Recurse -Force $workspace
    }

    It 'stops before restoring anything, naming the required version, when no installed SDK satisfies global.json' {
        $environment.FAKE_DOTNET_VERSION = ''

        $result = Invoke-Check $workspace 'Initialize-Development' -Environment $environment

        $result.ExitCode | Should -Not -Be 0
        $result.Output | Should -Match ([regex]::Escape($requiredSdk))
        Get-Content $log | Should -Not -Contain 'dotnet tool restore'
    }

    It 'stops when restoring the web app dependencies fails' {
        $environment.FAKE_DOTNET_VERSION = $requiredSdk
        $environment.FAKE_NPM_EXIT_CODE = '1'

        $result = Invoke-Check $workspace 'Initialize-Development' -Environment $environment

        $result.ExitCode | Should -Not -Be 0
        Get-Content $log | Should -Not -Contain 'dotnet restore application/backend/Astrana.slnx'
    }

    It 'carries on with the setup when dotnet finds the SDK that global.json names' {
        $environment.FAKE_DOTNET_VERSION = $requiredSdk

        $result = Invoke-Check $workspace 'Initialize-Development' -Environment $environment

        $result.ExitCode | Should -Be 0
        Get-Content $log | Should -Contain 'dotnet tool restore'
        Get-Content $log | Should -Contain 'npm called as: npm ci --ignore-scripts'
        Get-Content $log | Should -Contain 'npm called as: npm ci --ignore-scripts --prefix application/frontend'
    }
}
