# SPDX-License-Identifier: MPL-2.0

# Fails unless a release tag's version matches every place that application states its version, which are its project
# files and the newest version in its changelog. The release workflow runs it before building, so that no release can
# ship calling itself a different version from its tag.

param(
    [Parameter(Mandatory)] [string] $Tag
)

$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Applications.ps1')

$application = Get-Applications | Where-Object { $Tag.StartsWith($_.TagPrefix) } | Select-Object -First 1
if (-not $application) {
    Write-Output "The tag $Tag names neither application. Use astrana-vX.Y.Z or astrana-owner-tools-vX.Y.Z."
    exit 1
}

$version = $Tag.Substring($application.TagPrefix.Length)
$mismatches = foreach ($file in $application.VersionFiles) {
    $stated = Get-StatedVersion $file (Get-Content -LiteralPath $file -Raw)
    if ($stated -ne $version) { "$file states version $stated, but the tag is $Tag" }
}

if ($mismatches) {
    $mismatches | ForEach-Object { Write-Output $_ }
    exit 1
}
