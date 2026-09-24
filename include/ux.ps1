class TUI_Colors {
    static [string]$RESET = "$([char]0x1b)[0m"
    static [string]$RED = "$([char]0x1b)[31m"
    static [string]$GREEN = "$([char]0x1b)[32m"
    static [string]$YELLOW = "$([char]0x1b)[33m"
    static [string]$BLUE = "$([char]0x1b)[34m"
    static [string]$MAGENTA = "$([char]0x1b)[35m"
    static [string]$CYAN = "$([char]0x1b)[36m"
    static [string]$WHITE = "$([char]0x1b)[37m"
}

class TUI_Icons {
    static [string]$FAIL = "✖"
    static [string]$NOTE = "ℹ"
    static [string]$GOOD = "✔"
}

class TUI_Styles {
    static [string]$BOLD = "$([char]0x1b)[1m"
    static [string]$UNDERLINE = "$([char]0x1b)[4m"
    static [string]$REVERSED = "$([char]0x1b)[7m"
}

class TUI {
    [string]$ColorTema

    # 1. CONSTRUCTOR CON PARÁMETRO (Faltaba este)
    TUI([string]$color) {
        $this.ColorTema = $color
    }

    # 2. CONSTRUCTOR POR DEFECTO
    TUI() {
        $this.ColorTema = [TUI_Colors]::CYAN
    }

    [string]question_bool([string]$mensaje, [string]$answer = "s") {
        $prefijo = "$([TUI_Styles]::BOLD)$($this.ColorTema)? $([TUI_Colors]::RESET)"
        $respuesta = Read-Host "$prefijo $mensaje (s/n)"

        if ($respuesta.Trim() -eq $answer) {
            return $respuesta
        }
        return "Error: la respuesta ingresada no es válida"
    }

    [void]mark_fail([string]$mensaje) {
        Write-Host "$([TUI_Colors]::RED)$([TUI_Icons]::FAIL) $mensaje$([TUI_Colors]::RESET)"
    }

    [void]mark_note([string]$mensaje) {
        Write-Host "$([TUI_Colors]::YELLOW)$([TUI_Icons]::NOTE) $mensaje$([TUI_Colors]::RESET)"
    }

    [void]mark_good([string]$mensaje) {
        Write-Host "$([TUI_Colors]::GREEN)$([TUI_Icons]::GOOD) $mensaje$([TUI_Colors]::RESET)"
    }

    [void]log([string]$mensaje) {
        Write-Host "$($this.ColorTema)$mensaje$([TUI_Colors]::RESET)"
    }

}
