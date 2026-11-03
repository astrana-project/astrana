# SPDX-License-Identifier: MPL-2.0

# Installs the pinned version of Pester, which tests the scripts in this folder, only if the downloaded package matches
# its pinned SHA-256 checksum. The checksum was taken from the package whose SHA-512 hash matches the one the PowerShell
# Gallery publishes for this version.

param(
    [string] $PackagePath,
    [string] $Destination = $env:PSModulePath.Split([System.IO.Path]::PathSeparator)[0]
)

$ErrorActionPreference = 'Stop'

$version = '6.2.0'
$pinnedSha256 = 'E6AC7418D4F12500269AACA58AE56CF1CAAFBBF1AFA2CEC334E289D1CF50A239'

$package = if ($PackagePath) {
    [System.IO.File]::ReadAllBytes((Resolve-Path -LiteralPath $PackagePath))
}
else {
    (Invoke-WebRequest "https://www.powershellgallery.com/api/v2/package/Pester/$version").Content
}

$sha256 = [System.Convert]::ToHexString([System.Security.Cryptography.SHA256]::HashData([byte[]]$package))
if ($sha256 -ne $pinnedSha256) {
    throw "The Pester $version package has the checksum $sha256, but the pinned checksum is $pinnedSha256."
}

$module = Join-Path $Destination "Pester/$version"
$archive = [System.IO.Compression.ZipArchive]::new([System.IO.MemoryStream]::new([byte[]]$package))
[System.IO.Compression.ZipFileExtensions]::ExtractToDirectory($archive, $module, $true)
$archive.Dispose()
foreach ($packaging in '_rels', 'package', '[Content_Types].xml', 'Pester.nuspec') {
    Remove-Item -LiteralPath (Join-Path $module $packaging) -Recurse -Force
}
