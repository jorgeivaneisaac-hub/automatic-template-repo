BeforeDiscovery {
    $scripts = Get-ChildItem (Join-Path $PSScriptRoot '..') -Recurse -Filter *.ps1 |
        Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' } |
        ForEach-Object { @{ Path = $_.FullName; Name = $_.Name } }
}

Describe 'Sintaxis de scripts' {
    It '<Name> no tiene errores de sintaxis' -ForEach $scripts {
        $errors = $null
        [void][System.Management.Automation.Language.Parser]::ParseFile($Path, [ref]$null, [ref]$errors)
        $errors | Should -BeNullOrEmpty
    }
}
