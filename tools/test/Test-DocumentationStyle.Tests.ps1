# SPDX-License-Identifier: MPL-2.0

BeforeAll {
    . (Join-Path $PSScriptRoot 'TestRepository.ps1')
}

Describe 'Test-DocumentationStyle' {
    BeforeEach {
        $repository = New-TestRepository
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'passes plain prose' {
        Set-TestFile $repository 'docs/guide.md' "# Guide`n`nInstall it, then start it.`n"

        (Invoke-Check $repository 'Test-DocumentationStyle').ExitCode | Should -Be 0
    }

    It 'fails <Name> in prose, naming the file and line' -ForEach @(
        @{ Name = 'a semicolon'; Text = 'Install it; then start it.' }
        @{ Name = 'an em dash'; Text = "Install it $([char]0x2014) then start it." }
        @{ Name = 'e.g.'; Text = 'Use a host, e.g. a laptop.' }
        @{ Name = 'i.e.'; Text = 'Use the owner, i.e. you.' }
        @{ Name = 'etc.'; Text = 'Posts, photos, etc.' }
    ) {
        Set-TestFile $repository 'docs/guide.md' "# Guide`n`n$Text`n"

        $result = Invoke-Check $repository 'Test-DocumentationStyle'

        $result.ExitCode | Should -Be 1
        $result.Output | Should -Match 'docs/guide.md:3'
    }

    It 'ignores <Name>' -ForEach @(
        @{ Name = 'a semicolon in a code block'; Text = "``````csharp`nvar x = 1;`n``````" }
        @{ Name = 'a semicolon in inline code'; Text = 'Write `var x = 1;` here.' }
        @{ Name = 'a semicolon in a link address'; Text = 'See [the page](https://example.test/a;b).' }
        @{ Name = 'a rule term in quotation marks'; Text = 'Do not write "e.g.", "i.e." or "etc.".' }
    ) {
        Set-TestFile $repository 'docs/guide.md' "# Guide`n`n$Text`n"

        (Invoke-Check $repository 'Test-DocumentationStyle').ExitCode | Should -Be 0
    }

    It 'reports the right line after a code block' {
        $fence = '```'
        $content = "# Guide`n`n${fence}text`nline`nline`n$fence`n`nInstall it; then start it.`n"
        Set-TestFile $repository 'docs/guide.md' $content

        (Invoke-Check $repository 'Test-DocumentationStyle').Output | Should -Match 'docs/guide.md:8:'
    }

    It 'ignores <Name>' -ForEach @(
        @{ Name = 'an HTML entity'; Text = 'Rock &amp; roll, with a&nbsp;space.' }
        @{ Name = 'a semicolon in a code block fenced with tildes'; Text = "~~~`nvar x = 1;`n~~~" }
        @{ Name = 'a semicolon in an indented code block'; Text = "    var x = 1;" }
    ) {
        Set-TestFile $repository 'docs/guide.md' "# Guide`n`n$Text`n"

        (Invoke-Check $repository 'Test-DocumentationStyle').ExitCode | Should -Be 0
    }

    It 'leaves out the code of conduct, which is adopted text' {
        Set-TestFile $repository 'CODE_OF_CONDUCT.md' "Be kind; be fair.`n"

        (Invoke-Check $repository 'Test-DocumentationStyle').ExitCode | Should -Be 0
    }
}

Describe 'Test-DocumentationStyle on file names outside ASCII' {
    BeforeEach {
        $repository = New-TestRepository
    }

    AfterEach {
        Remove-Item -Recurse -Force $repository
    }

    It 'fails prose in a Markdown file whose name has characters outside ASCII' {
        Set-TestFile $repository "docs/caf$([char]0x00E9).md" "# Guide`n`nInstall it; then start it.`n"
        Add-TestCommit $repository 'Add' | Out-Null

        (Invoke-Check $repository 'Test-DocumentationStyle').ExitCode | Should -Be 1
    }
}
