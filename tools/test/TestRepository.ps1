# SPDX-License-Identifier: MPL-2.0

# Helpers that give each test its own throwaway Git repository, so that no test can affect another.

function New-TestRepository {
    $path = Join-Path ([System.IO.Path]::GetTempPath()) "astrana-check-$([guid]::NewGuid())"
    New-Item -ItemType Directory -Path $path | Out-Null
    git -C $path init --quiet --initial-branch=develop
    git -C $path config user.name 'Test Author'
    git -C $path config user.email 'author@example.test'
    git -C $path config commit.gpgsign false
    git -C $path config core.autocrlf false
    git -C $path config core.hooksPath (Join-Path $path '.git/no-hooks')
    $path
}

function Set-TestFile([string] $Repository, [string] $Path, [string] $Content) {
    $file = Join-Path $Repository $Path
    New-Item -ItemType Directory -Path (Split-Path $file) -Force | Out-Null
    [System.IO.File]::WriteAllText($file, $Content)
}

function Add-TestCommit([string] $Repository, [string] $Message, [string] $Author = '') {
    git -C $Repository add --all
    if ($Author) {
        git -C $Repository commit --quiet --allow-empty -m $Message --author $Author
    }
    else {
        git -C $Repository commit --quiet --allow-empty -m $Message
    }
    git -C $Repository rev-parse HEAD
}

function Invoke-Check(
    [string] $Repository, [string] $Script, [string[]] $Arguments = @(), [hashtable] $Environment = @{}
) {
    $scriptPath = Join-Path $PSScriptRoot "../scripts/$Script.ps1"
    $previous = @{}
    foreach ($name in $Environment.Keys) {
        $previous[$name] = [Environment]::GetEnvironmentVariable($name)
        [Environment]::SetEnvironmentVariable($name, $Environment[$name])
    }
    $previousEncoding = [Console]::OutputEncoding
    [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()
    Push-Location $Repository
    try {
        $output = & pwsh -NoProfile -File $scriptPath @Arguments 2>&1
        [pscustomobject]@{ ExitCode = $LASTEXITCODE; Output = ($output -join "`n") }
    }
    finally {
        Pop-Location
        [Console]::OutputEncoding = $previousEncoding
        foreach ($name in $previous.Keys) {
            [Environment]::SetEnvironmentVariable($name, $previous[$name])
        }
    }
}
