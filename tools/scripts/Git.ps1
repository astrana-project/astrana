# SPDX-License-Identifier: MPL-2.0

# Runs git for the check scripts that dot-source this file. It stops the script when git fails, so that a check never
# passes on output git did not produce, and it returns file names unquoted in UTF-8, so that names with characters
# outside ASCII match like any other.
function Invoke-Git {
    [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()
    $output = git -c core.quotePath=false @args
    if ($LASTEXITCODE -ne 0) { throw "git $args failed with exit code $LASTEXITCODE." }
    $output
}
