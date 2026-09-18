param(
    [Parameter(Mandatory = $true)]
    [string]$NombreRepo
)

# Importas la clase desde include
. "$PSScriptRoot\..\include\writer.ps1"

# Creas la instancia pasándole el nombre que recibiste por consola
$nuevoProyecto = [Generador_Proyects]::new("all", $NombreRepo)
$nuevoProyecto.create_struct("c")
