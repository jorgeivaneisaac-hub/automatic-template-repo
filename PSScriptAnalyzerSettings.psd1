@{
    # ==============================================================================
    # CONFIGURACION DE PSSCRIPTANALYZER (Alineada al estandar del proyecto)
    # ==============================================================================
    Severity     = @('Error', 'Warning')

    IncludeRules = @(
        'PSAvoidUsingCmdletAliases',
        'PSAvoidUsingPositionalParameters',
        'PSAvoidGlobalVars',
        'PSAvoidUsingPlainTextForPassword',
        'PSAvoidUsingConvertToSecureStringWithPlainText',
        'PSUseDeclaredVarsMoreThanAssignments',
        'PSUseShouldProcessForStateChangingFunctions',
        'PSUseSingularNouns',
        'PSProvideCommentHelp',
        'PSUseConsistentIndentation',
        'PSUseConsistentWhitespace'
    )

    Rules        = @{
        PSUseConsistentIndentation = @{
            Enable          = $true
            IndentationSize = 4
        }

        PSUseConsistentWhitespace  = @{
            Enable         = $true
            CheckPipe      = $true
            CheckSeparator = $true
        }

        PSProvideCommentHelp       = @{
            Enable                  = $true
            ExportedOnly            = $false
            BlockComment            = $true
            VSCodeSnippetCorrection = $true
            Placement               = 'begin'
        }
    }
}
