# SPDX-License-Identifier: MPL-2.0

# Fails when Markdown that Git tracks or would add uses what CONTRIBUTING's documentation rules forbid, which are em
# dashes, semicolons, "e.g.", "i.e." and "etc.". Code blocks, inline code, link addresses, HTML entities and a quoted
# rule term are left out, because the rules are about prose. Each line is checked where it stands, so a failure names
# its real line number.

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Git.ps1')

$exempt = @('CODE_OF_CONDUCT.md', 'DCO', 'LICENSE')
$forbidden = [ordered]@{
    'an em dash'  = [char]0x2014
    'a semicolon' = ';'
    '"e.g."'      = 'e.g.'
    '"i.e."'      = 'i.e.'
    '"etc."'      = 'etc.'
}

function Get-ProseOfLine([string] $line) {
    $line = [regex]::Replace($line, '`[^`]*`', '')
    $line = [regex]::Replace($line, '\]\([^)]*\)', ']')
    $line = [regex]::Replace($line, '&#?[A-Za-z0-9]+;', '')
    $line = [regex]::Replace($line, '"(e\.g\.|i\.e\.|etc\.)"', '')
    [regex]::Replace($line, 'https?://\S+', '')
}

function Get-ProseLines([string[]] $lines) {
    $fence = $null
    $previousBlank = $true
    for ($index = 0; $index -lt $lines.Count; $index++) {
        $line = $lines[$index].TrimEnd("`r")
        $fenceMatch = [regex]::Match($line, '^\s{0,3}(```+|~~~+)')
        if ($fence) {
            if ($fenceMatch.Success -and $fenceMatch.Groups[1].Value.StartsWith($fence)) { $fence = $null }
        }
        elseif ($fenceMatch.Success) {
            $fence = $fenceMatch.Groups[1].Value
        }
        elseif ($previousBlank -and $line -match '^( {4}|\t)(?!\s*([-*+]|\d+\.)\s)') {
            continue
        }
        else {
            [pscustomobject]@{ Number = $index + 1; Text = Get-ProseOfLine $line }
        }
        $previousBlank = $line.Trim() -eq ''
    }
}

$failures = foreach ($file in Invoke-Git ls-files --cached --others --exclude-standard '*.md') {
    if ($exempt -contains (Split-Path $file -Leaf) -or -not (Test-Path -LiteralPath $file)) { continue }
    foreach ($line in Get-ProseLines (Get-Content -LiteralPath $file)) {
        foreach ($name in $forbidden.Keys) {
            if ($line.Text.Contains($forbidden[$name])) {
                "${file}:$($line.Number): prose contains ${name}: $($line.Text.Trim())"
            }
        }
    }
}

if ($failures) {
    $failures | ForEach-Object { Write-Output $_ }
    exit 1
}
