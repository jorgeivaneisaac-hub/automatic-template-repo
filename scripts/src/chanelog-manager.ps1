<#
.SYNOPSIS
    Gestor de Cambios y Changelogs Multi-Proyecto (Enterprise Grade)
.DESCRIPTION
    Registra cambios granulares en formato JSON y compila automáticamente
    un CHANGELOG.md estructurado bajo estándares de Conventional Commits.
.PARAMETER Action
    Acción a realizar: 'add' (registrar cambio) o 'generate' (compilar changelog).
.PARAMETER Type
    Tipo de cambio semántico (feat, fix, docs, refactor, perf, test, ci, chore).
.PARAMETER Message
    Descripción clara y concisa del cambio realizado.
.PARAMETER Module
    (Opcional) Submódulo o componente afectado en proyectos multi-repositorio.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [ValidateSet("add", "generate")]
    [string]$Action = "add",

    [Parameter(Mandatory = $false)]
    [ValidateSet("feat", "fix", "docs", "refactor", "perf", "test", "ci", "chore")]
    [string]$Type = "feat",

    [Parameter(Mandatory = $false)]
    [string]$Message = "",

    [Parameter(Mandatory = $false)]
    [string]$Module = "core"
)

# Configuración de Rutas Seguras (Absolutas basadas en la raíz del workspace)
$WorkspaceRoot = $PSScriptRoot
$ChangesDir = Join-Path $WorkspaceRoot ".changes"
$ChangelogFile = Join-Path $WorkspaceRoot "CHANGELOG.md"

# Asegurar la existencia del directorio de cambios con manejo de errores
try {
    if (-not (Test-Path $ChangesDir)) {
        New-Item -ItemType Directory -Path $ChangesDir -Force -ErrorAction Stop | Out-Null
    }
}
catch {
    Write-Error "[CRITICAL] No se pudo inicializar el directorio .changes: $_"
    exit 1
}

if ($Action -eq "add") {
    try {
        if ([string]::IsNullOrWhiteSpace($Message)) {
            $Message = Read-Host "Introduce la descripción técnica del cambio"
            if ([string]::IsNullOrWhiteSpace($Message)) {
                throw "El mensaje de cambio no puede estar vacío."
            }
        }

        $Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
        $RandomHash = -join ((65..90) + (97..122) | Get-Random -Count 4 | ForEach-Object { [char]$_ })
        $ChangeFile = Join-Path $ChangesDir "$Timestamp-$Module-$Type-$RandomHash.json"

        $ChangeData = [PSCustomObject]@{
            timestamp = (Get-Date -Format o)
            module    = $Module.ToLower()
            type      = $Type.ToLower()
            message   = $Message.Trim()
        }

        $ChangeData | ConvertTo-Json -Depth 3 | Set-Content -Path $ChangeFile -Encoding utf8 -ErrorAction Stop
        Write-Host "[OK] Cambio registrado en [.changes/]: [$Module] ($Type) -> $Message" -ForegroundColor Green
    }
    catch {
        Write-Error "[ERROR] Falló el registro del cambio: $_"
        exit 1
    }
}
elseif ($Action -eq "generate") {
    try {
        $ChangeFiles = Get-ChildItem -Path $ChangesDir -Filter "*.json" -ErrorAction Stop

        if ($ChangeFiles.Count -eq 0) {
            Write-Host "[INFO] No hay cambios pendientes en .changes/ para compilar." -ForegroundColor Yellow
            return
        }

        Write-Host "[INFO] Procesando $($ChangeFiles.Count) archivos de cambio..." -ForegroundColor Cyan

        # Agrupar cambios por tipo para un reporte limpio y ordenado
        $CategorizedChanges = @{
            "feat"     = @()
            "fix"      = @()
            "refactor" = @()
            "perf"     = @()
            "docs"     = @()
            "ci"       = @()
            "other"    = @()
        }

        foreach ($file in $ChangeFiles) {
            $content = Get-Content $file.FullName -Raw | ConvertFrom-Json
            $targetKey = if ($CategorizedChanges.ContainsKey($content.type)) { $content.type } else { "other" }

            $CategorizedChanges[$targetKey] += [PSCustomObject]@{
                Module  = $content.module
                Message = $content.message
            }
        }

        # Construcción de la entrada del Changelog
        $ReleaseDate = Get-Date -Format 'yyyy-MM-dd HH:mm'
        $LogEntry = "## [Release v$(Get-Date -Format 'yyyy.MM.dd')] - $ReleaseDate`n`n"

        $SectionTitles = @{
            "feat"     = "### Nuevas Características (Features)"
            "fix"      = "### Correcciones de Errores (Bug Fixes)"
            "refactor" = "### Refactorización de Código"
            "perf"     = "### Mejoras de Rendimiento"
            "docs"     = "### Documentación"
            "ci"       = "### CI/CD e Infraestructura"
            "other"    = "### Otros Cambios"
        }

        foreach ($key in $SectionTitles.Keys) {
            if ($CategorizedChanges[$key].Count -gt 0) {
                $LogEntry += "$($SectionTitles[$key])`n"
                foreach ($item in $CategorizedChanges[$key]) {
                    $LogEntry += "- **[$($item.Module)]**: $($item.Message)`n"
                }
                $LogEntry += "`n"
            }
        }

        # Actualización atómica del archivo CHANGELOG.md
        if (Test-Path $ChangelogFile) {
            $ExistingContent = Get-Content $ChangelogFile -Raw -Encoding utf8
            Set-Content -Path $ChangelogFile -Value ($LogEntry + "`n" + $ExistingContent) -Encoding utf8 -ErrorAction Stop
        } else {
            Set-Content -Path $ChangelogFile -Value $LogEntry -Encoding utf8 -ErrorAction Stop
        }

        # Limpieza segura de los archivos procesados
        $ChangeFiles | Remove-Item -Force -ErrorAction Stop
        Write-Host "[OK] CHANGELOG.md actualizado exitosamente y .changes/ depurado." -ForegroundColor Green
    }
    catch {
        Write-Error "[CRITICAL] Error durante la generación del changelog: $_"
        exit 1
    }
}
