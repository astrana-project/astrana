# SPDX-License-Identifier: MPL-2.0

# Prepares a clone for development. It checks the Node.js and .NET versions, restores the dependencies from the lock
# files and installs the pinned version of Pester, which tests the scripts in this folder.

$ErrorActionPreference = 'Stop'
$root = Resolve-Path (Join-Path $PSScriptRoot '../..')

# Stops the setup when the command before it failed, so that a failed restore is never reported as a finished setup.
# Each command is called directly, because the npm.ps1 that Node.js installs on Windows reads its arguments from the
# line that called it.
function Assert-Succeeded([string] $Step) {
    if ($LASTEXITCODE -ne 0) { throw "$Step failed with exit code $LASTEXITCODE." }
}

$requiredNode = (Get-Content (Join-Path $root '.nvmrc')).Trim()
$node = (node --version).TrimStart('v').Split('.')[0]
if ($node -ne $requiredNode) { throw "Node.js $requiredNode is required, and $node is installed." }

$requiredSdk = (Get-Content (Join-Path $root 'global.json') -Raw | ConvertFrom-Json).sdk.version
Push-Location $root
try {
    # dotnet applies the version rule in global.json itself, and fails when no installed SDK satisfies it.
    dotnet --version | Out-Null
    if ($LASTEXITCODE -ne 0) {
        throw "The .NET software development kit $requiredSdk, the version global.json names, is required."
    }

    if (-not (Get-Module -ListAvailable Pester | Where-Object Version -EQ '6.2.0')) {
        & (Join-Path $PSScriptRoot 'Install-Pester.ps1')
    }
    dotnet tool restore
    Assert-Succeeded 'dotnet tool restore'
    npm ci --ignore-scripts
    Assert-Succeeded 'npm ci'
    npm ci --ignore-scripts --prefix application/frontend
    Assert-Succeeded 'npm ci for the web app'
    foreach ($solution in 'application/backend/Astrana.slnx', 'owner-tools/Astrana.OwnerTools.slnx',
        'shared/Astrana.Shared.slnx') {
        dotnet restore $solution
        Assert-Succeeded "dotnet restore $solution"
    }
}
finally {
    Pop-Location
}
