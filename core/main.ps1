param(
    [Parameter(Mandatory = $true)]
    [string]$NombreRepo
)

# Importas la clase desde include
. (Join-Path $PSScriptRoot '..' 'include' 'writer.ps1')
. (Join-Path $PSScriptRoot '..' 'include' 'ux.ps1')


# Instanciar la TUI con color Magenta por defecto
$ui = [TUI]::new([TUI_Colors]::MAGENTA)

# Métodos de registro
$ui.mark_good("Conexión establecida con éxito.")
$ui.mark_note("Guardando archivos temporales...")
$ui.mark_fail("Error al escribir en el disco.")

# Pregunta interactiva
$respuesta = $ui.question_bool("¿Deseas continuar?", "s")
Write-Host "Respuesta: $respuesta"
# Creas la instancia pasándole el nombre que recibiste por consola
$nuevoProyecto = [Generador_Proyects]::new("all", $NombreRepo)
$nuevoProyecto.create_struct("cpp")
