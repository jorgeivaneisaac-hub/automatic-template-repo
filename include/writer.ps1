. (Join-Path $PSScriptRoot "ux.ps1")

<#
.SYNOPSIS
    Clase para automatizar la creación y estructuración de proyectos locales.
.DESCRIPTION
    Genera un directorio en el Escritorio, lee configuraciones de un JSON e inicializa un repositorio Git.
#>
class Generador_Proyects {
    # Propiedades principales
    [string]$NAME_FILE
    [string]$NAME_PROYECT
    [string]$RUTA_ABSOLUTA

    # CORREGIDO: Propiedades estáticas de rutas al estilo C#
    [string]$LICENSE_MIT
    [string]$LICENSE_GPLv3
    [string]$CODE_OF_CONDUCT

    # Constructor optimizado con .NET
    Generador_Proyects([string]$name_file, [string]$name_proyect) {
        $this.NAME_FILE = $name_file
        $this.NAME_PROYECT = $name_proyect

        # .NET combina la ruta del escritorio de forma limpia
        $desktop = [Environment]::GetFolderPath("Desktop")
        $this.RUTA_ABSOLUTA = [System.IO.Path]::Combine($desktop, $name_proyect)

        # Inicialización de tus constantes de rutas (Apunta a tus carpetas de origen)
        $this.LICENSE_MIT = [System.IO.Path]::Combine($PSScriptRoot, "LICENSES\examples\MIT-LICENSE.txt")
        $this.LICENSE_GPLv3 = [System.IO.Path]::Combine($PSScriptRoot, "LICENSES\examples\GNU-GPLv3.txt")
        $this.CODE_OF_CONDUCT = [System.IO.Path]::Combine($PSScriptRoot, "Config\gobernanza-config\examples\CODE_OF_CONDUCT.md")
    }

    # Copia un archivo individual a velocidad .NET
    [void]copy_files([string]$RutaOrigen, [string]$RutaDestino, [bool]$Overwrite) {
        if ([System.IO.File]::Exists($RutaOrigen)) {
            [System.IO.File]::Copy($RutaOrigen, $RutaDestino, $Overwrite)
        }
    }

    # CORREGIDO: Copiador recursivo de directorios completos usando clases de .NET
    # Copiador recursivo de directorios completos (PowerShell 7+)
    [void]copy_dir([string]$RutaOrigen, [string]$RutaDestino, [bool]$Overwrite) {
        if (-not [System.IO.Directory]::Exists($RutaOrigen)) { return }

        # Si el destino no existe, lo creamos
        if (-not [System.IO.Directory]::Exists($RutaDestino)) {
            [void][System.IO.Directory]::CreateDirectory($RutaDestino)
        }

        # Indexamos todos los archivos recursivamente
        $archivos = [System.IO.Directory]::EnumerateFiles($RutaOrigen, "*", [System.IO.SearchOption]::AllDirectories)

        # Procesamiento en paralelo usando ForEach-Object -Parallel
        $archivos | ForEach-Object -Parallel {
            $origenBase = $using:RutaOrigen
            $destinoBase = $using:RutaDestino
            $sobreescribir = $using:Overwrite

            # Replicamos la estructura del árbol de carpetas
            $subRuta = $_.Substring($origenBase.Length).TrimStart([System.IO.Path]::DirectorySeparatorChar)
            $destinoFinal = [System.IO.Path]::Combine($destinoBase, $subRuta)

            $carpetaDestino = [System.IO.Path]::GetDirectoryName($destinoFinal)
            if (-not [System.IO.Directory]::Exists($carpetaDestino)) {
                [void][System.IO.Directory]::CreateDirectory($carpetaDestino)
            }

            [System.IO.File]::Copy($_, $destinoFinal, $sobreescribir)
        }
    }

    # Método auxiliar optimizado con .NET
    [string]create_dir([string]$name_dir) {
        $rut = $this.RUTA_ABSOLUTA
        $dir = [System.IO.Path]::Combine($rut, $name_dir)
        if (-not [System.IO.Directory]::Exists($dir)) {
            [System.IO.Directory]::CreateDirectory($dir) | Out-Null
        }
        return $dir
    }

    [void]create_struct([string]$language) {
        $file_languages = "C:\Users\Lenovo\Desktop\Template\include\Config\config.json"#[System.IO.Path]::Combine($PSScriptRoot, "Config\config.json")

        if (-not [System.IO.File]::Exists($file_languages)) {
            Write-Warning "No se encontró el archivo de configuración en: $file_languages"
            return
        }

        $jsonTexto = [System.IO.File]::ReadAllText($file_languages, [System.Text.Encoding]::UTF8)
        $configs = $jsonTexto | ConvertFrom-Json

        if ($configs.lenguajes.PSObject.Properties.Name -contains $language) {

            # --- CAPTURA DE VARIABLES (Sustituto de $this) ---
            $rutaProyecto = $this.RUTA_ABSOLUTA
            $langData = $configs.lenguajes.$language

            # 1. CREACIÓN DE CARPETAS EN PARALELO (.NET)
            # 1. CREACIÓN DE CARPETAS EN PARALELO (PowerShell 7+)
            if ($langData.carpetas) {
                $langData.carpetas | ForEach-Object -Parallel {
                    $dirCompleta = [System.IO.Path]::Combine($using:rutaProyecto, $_)
                    if (-not [System.IO.Directory]::Exists($dirCompleta)) {
                        [void][System.IO.Directory]::CreateDirectory($dirCompleta)
                    }
                }
            }

            # 2. PROCESAMIENTO HÍBRIDO DE ARCHIVOS OBLIGATORIOS (.NET)
            if ($langData.files_obligatory) {
                $archivosObligatorios = $langData.files_obligatory.PSObject.Properties

                foreach ($archivoProp in $archivosObligatorios) {
                    $valorPropiedad = $archivoProp.Value

                    # Caso A: Estructura Nueva (como tu C) -> Es un objeto anidado con Ruta y Código
                    if ($valorPropiedad.PSObject.Properties.Name -and -not ($valorPropiedad -is [System.Array])) {
                        $datosArchivo = $valorPropiedad.PSObject.Properties

                        foreach ($propContenido in $datosArchivo) {
                            $rutaRelativa = $propContenido.Name
                            $contenidoBase = $propContenido.Value # Toma el string del array

                            $rutaFinalArchivo = [System.IO.Path]::Combine($rutaProyecto, $rutaRelativa)
                            $directorioContenedor = [System.IO.Path]::GetDirectoryName($rutaFinalArchivo)

                            if (-not [System.IO.Directory]::Exists($directorioContenedor)) {
                                [System.IO.Directory]::CreateDirectory($directorioContenedor) | Out-Null
                            }

                            if (-not [System.IO.File]::Exists($rutaFinalArchivo)) {
                                [System.IO.File]::WriteAllText($rutaFinalArchivo, $contenidoBase, [System.Text.Encoding]::UTF8)
                            }
                        }
                    }
                    # Caso B: Estructura Antigua (como tu C++) -> Es solo un array con la ruta relativa (crea archivo vacío)
                    else {
                        foreach ($rutaRelativa in $valorPropiedad) {
                            $rutaFinalArchivo = [System.IO.Path]::Combine($rutaProyecto, $rutaRelativa)
                            $directorioContenedor = [System.IO.Path]::GetDirectoryName($rutaFinalArchivo)

                            if (-not [System.IO.Directory]::Exists($directorioContenedor)) {
                                [System.IO.Directory]::CreateDirectory($directorioContenedor) | Out-Null
                            }

                            if (-not [System.IO.File]::Exists($rutaFinalArchivo)) {
                                [System.IO.File]::Create($rutaFinalArchivo).Close()
                            }
                        }
                    }
                }
            }

            Write-Host "Estructura de carpetas y archivos obligatorios para '$language' generada con éxito." -ForegroundColor Cyan
        }
        else {
            Write-Warning "El lenguaje '$language' no está definido."
        }
    }

    [void]init_git() {
        try {
            if (-not [System.IO.Directory]::Exists($this.RUTA_ABSOLUTA)) {
                [System.IO.Directory]::CreateDirectory($this.RUTA_ABSOLUTA) | Out-Null
            }

            $psi = New-Object System.Diagnostics.ProcessStartInfo -Property @{
                FileName               = "git"
                WorkingDirectory       = $this.RUTA_ABSOLUTA
                RedirectStandardOutput = $true
                RedirectStandardError  = $true
                UseShellExecute        = $false
                CreateNoWindow         = $true
            }

            $psi.Arguments = "init"
            $proceso = [System.Diagnostics.Process]::Start($psi)
            $proceso.WaitForExit()

            $psi.Arguments = "branch -m main"
            $proceso = [System.Diagnostics.Process]::Start($psi)
            $proceso.WaitForExit()

            Write-Host "Repositorio Git inicializado en 'main' exitosamente en $($this.RUTA_ABSOLUTA)." -ForegroundColor Green
        }
        catch {
            Write-Error "Fallo crítico al inicializar el repositorio Git: $_"
            throw $_
        }
    }
}
