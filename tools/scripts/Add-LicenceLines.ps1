# SPDX-License-Identifier: MPL-2.0

# Adds the licence identifier, in the file's own comment style, to the top of every source file that lacks it, and
# names each file it changed. A shebang line stays first, because the system reads it to choose what runs the script.
# The file keeps its line endings and any byte order mark. Files that already have the identifier are left alone, so it
# is safe to run at any time.

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Git.ps1')

$identifier = 'SPDX-License-Identifier: MPL-2.0'
$lineFor = @{
    '.cs'  = "// $identifier"
    '.ts'  = "// $identifier"
    '.tsx' = "// $identifier"
    '.js'  = "// $identifier"
    '.jsx' = "// $identifier"
    '.mjs' = "// $identifier"
    '.css' = "/* $identifier */"
    '.ps1' = "# $identifier"
}

$files = Invoke-Git ls-files --cached --others --exclude-standard |
    Where-Object { $lineFor.ContainsKey([System.IO.Path]::GetExtension($_)) -and (Test-Path -LiteralPath $_) }

foreach ($file in $files) {
    if (((Get-Content -LiteralPath $file -TotalCount 5) -join "`n").Contains($identifier)) { continue }

    $path = (Resolve-Path -LiteralPath $file).Path
    $bytes = [System.IO.File]::ReadAllBytes($path)
    $byteOrderMark = $bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF
    $content = [System.IO.File]::ReadAllText($path)
    $newline = if ($content.Contains("`r`n")) { "`r`n" } else { "`n" }
    $shebang = [regex]::Match($content, '^#![^\n]*(\n|$)').Value
    $prefix = if ($shebang -and -not $shebang.EndsWith("`n")) { $shebang + $newline } else { $shebang }
    $line = $lineFor[[System.IO.Path]::GetExtension($file)]
    $updated = $prefix + $line + $newline + $newline + $content.Substring($shebang.Length)
    [System.IO.File]::WriteAllText($path, $updated, [System.Text.UTF8Encoding]::new($byteOrderMark))
    Write-Output "Added the licence line to $file"
}
