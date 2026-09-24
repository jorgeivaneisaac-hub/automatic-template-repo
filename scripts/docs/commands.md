# Comandos para registrar cambios en ./changes y en CHANGELOG.md

**Registra un cambio:**

```ps1
pwsh -File .\scripts\src\changelog-manager.ps1 -Action add -Type "feat" -Message "Implementada la autenticación por token"
```

**Registra un error o comportamiento inesperado**

```ps1
pwsh -File .\scripts\src\changelog-manager.ps1 -Action add -Type "fix" -Message "Solucionado el error de ruta en el módulo principal"
```

**Compila en un CHANELOG.md**

```ps1
pwsh -File .\scripts\src\changelog-manager.ps1 -Action generate
```

**Hacer un Commit**

```bash
git add <module>
git commit -m "<tipo>(<alcance_opcional>): <descripción corta en imperativo>"
```
