# SPDX-License-Identifier: MPL-2.0

# Fails when a source file that Git tracks or would add does not carry the licence identifier in its first five lines.

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Git.ps1')

$identifier = 'SPDX-License-Identifier: MPL-2.0'
$sourcePattern = '\.(cs|ts|tsx|js|jsx|mjs|css|ps1)$'

$missing = Invoke-Git ls-files --cached --others --exclude-standard |
    Where-Object { $_ -match $sourcePattern -and (Test-Path -LiteralPath $_) } |
    Where-Object { -not ((Get-Content -LiteralPath $_ -TotalCount 5) -join "`n").Contains($identifier) }

if ($missing) {
    $missing | ForEach-Object { Write-Output "Missing licence line: $_" }
    Write-Output 'Run tools/scripts/Add-LicenceLines.ps1 to add them.'
    exit 1
}
