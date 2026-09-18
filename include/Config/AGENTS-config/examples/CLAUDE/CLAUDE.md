# Archivo de Contexto de CLAUDE.md

**\*\***Uso exclusivo para primer mensaje**\*\*\***

## Contexto

### Metodo de actuación

Requiero que actues como un programador senior que analiza primero la estructura a posterior revisa el código posteriormente
la configuración del sistema y genera un archivo de planeación de minimo de 2 páginas y de máximo 10 (En caso de ser necesario
genera un archivo vacio `.exepcion` en la raiz de el proyecto y con eso se te permite tener 5 páginas más) páginas con 5 apartados:

0. (Opcional)Título y versión
1. Planeación
2. Riesgos
3. Modificaciones
4. Un commit
5. Una justificación
6. (Opcional) Logo si es una refactorización

Ningun apartado tiene un rango de renglones pero de preferencia no superar las 10 páginas
En caso de que el proyecto no amerite las 2 páginas crea un archivo `.min` para que o sepa
que esperar.

**En relación a como se define un .min o un .exepcion :**
`.mi` < 2páginas.
Un .min se crea cada que el planteamiento no requiero sobre explicación y con este
archivo no debes de seguir la estructura anterior se sigue la siguiente:

- Planeación
- Riego
- Commit

`.exepcion` > 10 páginas.

Un .exepcion sigue la misma estructura de archivos y solo se crea en cuanto el archivo
de planeación supera las 10 páginas.

### Lenguaje

### **Regla de oro nunca**:

    En caso de que olvides la estructura que se te presenta a continuacion y la configuración del sistema solicita
        "favor de recordar la estructura"

### Estructura del repositorio "":

**Todo desde aquí hasta el final de el archivo es en base a la raiz y en orden de anidamineto**

```txt



```

### Archivos del repositorio

#### Configuración e Infraestructura

1. **`.vscode/`**
   - `1.1. settings.json` — Configuración del entorno de desarrollo local.
2. **`.changes/`** — Directorio para el control y registro de cambios (Changelogs automatizados).
3. **`.gitattributes`** — Atributos y normalización de manejo de archivos de Git.
4. **`.gitignore`** — Exclusiones de control de versiones.
5. **`.github/`**
   - `workflows/ci.yml` — Automatización e integración continua en GitHub Actions.
   - `copilot-instructions.md` — Directivas específicas para GitHub Copilot.
   - `dependabot.yml` — Gestión automatizada de actualización de dependencias.
6. **`.gitlab/`**
   - `ci/` — Configuración modular para pipelines de GitLab.
     - `base-lint.yml` — Validación global y lints generales de estructura.
     - `cpp-ci.yml` — Tareas de compilación y pruebas para C/C++.
     - `node-ci.yml` — Tareas de pruebas y validación para Node.js / JavaScript.
     - `powershell-ci.yml` — Análisis estático de scripts de PowerShell con PSScriptAnalyzer.
     - `python-ci.yml` — Pruebas unitarias y ejecución para Python.
     - `ruby-ci.yml` — Configuración de pruebas para entornos Ruby.
     - `rust-ci.yml` — Compilación y pruebas para proyectos en Rust.
   - `issue_templates/` — Plantillas predefinidas para reportes de errores.
7. **`.gitlab-ci.yml`** — Archivo raíz de configuración para pipelines en GitLab (Orquestador Maestro).
8. **`.pre-commit-config.yaml`** — Ganchos de validación previa al commit (limpieza de espacios, validación YAML, control de tamaño).
9. **`CHANGELOG.md`** — Historial de versiones y modificaciones del proyecto.
10. **`CODE_OF_CONDUCT.md`** — Pautas de convivencia y código de conducta.
11. **`commit_standard.md`** — Especificaciones y formato obligatorio para los mensajes de commit.
12. **`PULL_REQUEST_TEMPLATE.md`** — Plantilla estandarizada para solicitudes de extracción.
13. **`README.md`** — Documentación principal y visión general del repositorio.
14. **`SECURITY.md`** — Políticas de seguridad y reporte de vulnerabilidades.
15. **`scripts/`**
    - `src/changelog-manager.ps1` — Automatizador de el changelog de raiz
    - `docs/comandos.md` — COmandos para poder generar un archivo en la carpeta .changes/ y compilarlo en el CHANGELOG.md principal

#### Directorio de Agentes de IA (`AGENTS/`)

1. **`AGENTS.md`** — Guía general de uso de agentes inteligentes en el proyecto.
2. **`CLAUDE/CLAUDE.md`** — Contexto, directrices y reglas específicas para Claude.
3. **`GEMINI/GEMINI.md`** — Contexto y directrices para Google Gemini.
4. **`OPENAI/CHAT_GPT.md`** — Contexto y directrices para los modelos de OpenAI.

#### Código

#### Configuración e Infraestructura:

1. .vscode/settings.json:

   ```json
   {
     // ==========================================
     // CONFIGURACIÓN GENERAL DE EDITOR
     // ==========================================
     "editor.formatOnSave": true,
     "editor.tabSize": 4,
     "editor.insertSpaces": true,
     "editor.rulers": [80, 120],
     "files.trimTrailingWhitespace": true,
     "files.insertFinalNewline": true,
     "files.encoding": "utf8",

     // ==========================================
     // CONFIGURACIÓN ESPECÍFICA DE POWERSHELL
     // ==========================================
     "powershell.codeFormatting.preset": "Custom",
     "powershell.codeFormatting.openBraceOnSameLine": true,
     "powershell.codeFormatting.addWhitespaceAroundPipe": true,
     "powershell.codeFormatting.pipelineIndentationStyle": "IncreaseIndentationForFirstPipeline",
     "powershell.integratedConsole.showOnStartup": true,
     "powershell.scriptAnalysis.enable": true,
     "powershell.scriptAnalysis.settingsPath": "PSScriptAnalyzerSettings.psd1",

     // ==========================================
     // EXCLUSIONES Y LIMPIEZA DE EXPLORADOR
     // ==========================================
     "files.exclude": {
       "**/.git": true,
       "**/.svn": true,
       "**/.hg": true,
       "**/CVS": true,
       "**/.DS_Store": true,
       "**/Thumbs.db": true,
       "**/target": true
     },
     "search.exclude": {
       "**/target": true,
       "**/.changes": true
     }
   }
   ```

2. .changes/
   **Por el momento no contiene archivos**
3. .gitattributes:

   ```propierties
   # ==============================================================================
   # CONFIGURACIÓN GLOBAL POR DEFECTO
   # ==============================================================================
   # Por defecto, trata todos los archivos como texto y fuerza los saltos de línea
   # a LF (estándar de Linux/Unix), previniendo conflictos por CRLF de Windows.
   * text=auto eol=lf

   # ==============================================================================
       # ARCHIVOS DE CÓDIGO Y TEXTO (Forzar LF explícitamente)
   # ==============================================================================
   *.ps1           text eol=lf
   *.psm1          text eol=lf
   *.psd1          text eol=lf
   *.vbs           text eol=lf
   *.js            text eol=lf
   *.rs            text eol=lf
   *.py            text eol=lf
   *.json          text eol=lf
   *.yml           text eol=lf
   *.yaml          text eol=lf
   *.md            text eol=lf
   *.txt           text eol=lf
   Makefile        text eol=lf
   Dockerfile      text eol=lf

   # ==============================================================================
   # ARCHIVOS DE CONFIGURACIÓN DEL SISTEMA (Mantener CRLF si es estrictamente necesario)
   # ==============================================================================
   *.bat           text eol=crlf
   *.cmd           text eol=crlf

   # ==============================================================================
   # ARCHIVOS BINARIOS Y MULTIMEDIA (Evitar corrupción por diffs de Git)
   # ==============================================================================
   *.exe           binary
   *.dll           binary
   *.bin           binary
   *.iso           binary
   *.img           binary

   # Imágenes y gráficos
   *.png           binary
   *.jpg           binary
   *.jpeg          binary
   *.gif           binary
   *.ico           binary
   *.svg           text diff=xml
   *.pdf           binary

   # Archivos comprimidos y de dependencias empaquetadas
   *.zip           binary
   *.tar           binary
   *.gz            binary
   *.rar           binary
   *.7z            binary
   *.lock          text


   # ==============================================================================
   # CONFIGURACIÓN DE DIFFS Y MERGES PERSONALIZADOS
   # ==============================================================================
   # Permite que los archivos Markdown y JSON muestren diffs más limpios
   *.md            diff=markdown
   *.json          diff=json
   ```

4. .gitignore:

   ```ìgnore
   # ==============================================================================
   # SISTEMA OPERATIVO Y ARCHIVOS TEMPORALES
   # ==============================================================================
   # Windows
   Thumbs.db
   Thumbs.db:encryptable
   ehthumbs.db
   ehthumbs_vista.db
   *.stackdump
   [Dd]esktop.ini
   $RECYCLE.BIN/
   *.cab
   *.msi
   *.msix
   *.msm
   *.msp
   *.lnk

   # macOS
   .DS_Store
   .AppleDouble
   .LSOverride
   Icon?
   ._*
   .Spotlight-V100
   .Trashes

   # Linux
   ~*
   .fuse_hidden*
   .directory
   .Trash-*
   .nfs*

   # ==============================================================================
   # EDITORES Y ENTORNOS DE DESARROLLO (IDE)
   # ==============================================================================
   # VS Code
   .vscode/*
   !.vscode/settings.json
   !.vscode/tasks.json
   !.vscode/extensions.json
   .vscode/.history/
   .vscode/argv.json

   # JetBrains (IntelliJ, PyCharm, CLion, etc.)
   .idea/
   *.iml
   *.iws
   *.ipr
   out/

   # Vim / Neovim / Emacs
   *.swp
   *.swo
   *~
   .#*
   elpa/
   flycheck-*.el

   # ==============================================================================
   # LENGUAJES DE PROGRAMACIÓN Y COMPILACIÓN
   # ==============================================================================
   # Rust (Cargo)
   /target/
   **/*.rs.bk
   Cargo.lock # (Opcional: descomentar si es una librería pura, mantener si es binario/aplicación)

   # Node.js / JavaScript
   node_modules/
   jspm_packages/
   *.tsbuildinfo
   .npm
   .eslintcache
   .yarn/cache
   .yarn/unplugged
   .yarn/build-state.yaml
   .yarn/install-state.gz
   .pnp.*

   # Python
   __pycache__/
   *.py[cod]
   *$py.class
   *.so
   .Python
   build/
   develop-eggs/
   dist/
   downloads/
   eggs/
   .eggs/
   lib/
   lib64/
   parts/
   sdist/
   var/
   wheels/
   share/python-wheels/
   *.egg-info/
   .installed.cfg
   *.egg
   MANIFEST
   .pytest_cache/
   .ruff_cache/
   .mypy_cache/
   .tox/

   # C / C++
   *.o
   *.obj
   *.exe
   *.dll
   *.so
   *.dylib
   *.out
   *.app
   cmake-build-*/

   # ==============================================================================
   # LOGS, BASES DE DATOS Y CONFIGURACIÓN LOCAL
   # ==============================================================================
   logs/
   *.log
   npm-debug.log*
   yarn-debug.log*
   yarn-error.log*
   pnpm-debug.log*
   lerna-debug.log*
   *.sqlite
   *.sqlite3
   *.db
   .env
   .env.*
   !.env.example

   # ==============================================================================
   # HERRAMIENTAS DE AUTOMATIZACIÓN Y PROPIAS DEL AUTOR
   # ==============================================================================
   # Repomix / Cambios automatizados
   .changes/*
   !.changes/.gitkeep
       repomix/output/*
   !repomix/output/.gitkeep

   ```

5. .github/workflows/ci.yml:

```yaml
name: CI PowerShell

on:
  push:
    branches: [main, master]
  pull_request:
    branches: [main, master]

jobs:
  validate-and-test:
    name: Validar y Analizar PowerShell
    runs-on: windows-latest

    steps:
      - name: Clonar repositorio
        uses: actions/checkout@v4

      - name: Configurar PowerShell
        shell: pwsh
        run: |
          Write-Host "Versión de PowerShell:"
          $PSVersionTable.PSVersion

      - name: Instalar PSScriptAnalyzer (Linter)
        shell: pwsh
        run: |
          Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
          Install-Module -Name PSScriptAnalyzer -Force -Scope CurrentUser

      - name: Ejecutar Análisis de Código (PSScriptAnalyzer)
        shell: pwsh
        run: |
          # Analiza todos los scripts .ps1 del repositorio buscando malas prácticas
          $results = Invoke-ScriptAnalyzer -Path . -Recurse -Severity Warning, Error

          if ($results) {
              Write-Host "Se encontraron advertencias o errores de análisis:" -ForegroundColor Yellow
              $results | Format-Table
              # Opcional: Fallar el CI si hay errores críticos
              $errors = $results | Where-Object { $_.Severity -eq 'Error' }
              if ($errors) {
                  Write-Error "El análisis estático encontró errores críticos."
                  exit 1
              }
          } else {
              Write-Host "¡Análisis estático completado sin errores!" -ForegroundColor Green
          }

      - name: Prueba de Sintaxis General
        shell: pwsh
        run: |
          # Verifica que todos los archivos .ps1 compilen/parseen correctamente sin errores de sintaxis
          Get-ChildItem -Path . -Recurse -Filter *.ps1 | ForEach-Object {
              Write-Host "Verificando sintaxis de: $($_.FullName)"
              $null = [System.Management.Automation.Language.Parser]::ParseFile($_.FullName, [ref]$null, [ref]$errors)
              if ($errors) {
                  Write-Error "Error de sintaxis en $($_.Name): $errors"
                  exit 1
              }
          }
          Write-Host "¡Todos los scripts tienen una sintaxis válida!" -ForegroundColor Green
```

6. .github/copilot-instructions.md:

```md
# Directivas Globales para GitHub Copilot (Multi-Language)

## 1. Rol y Comportamiento Principal

Actúa como un **Ingeniero de Software Principal y Arquitecto de Sistemas**. Tu objetivo es escribir código limpio, altamente performante, seguro, mantenible y listo para producción (`Production-Grade`). No sacrifiques la calidad por la velocidad.

---

## 2. Principios Universales de Ingeniería

- **Modularity First:** Divide la lógica en componentes pequeños, cohesivos y reutilizables. Evita funciones monolíticas o archivos gigantescos ("código espagueti").
- **Manejo Estricto de Errores:** Nunca dejes excepciones sin capturar o errores silenciosos. Valida entradas, gestiona fallos de forma controlada y emite mensajes de error descriptivos.
- **Seguridad por Diseño:** Evita vulnerabilidades comunes (inyecciones, desbordamientos de búfer, exposición de credenciales o secretos). Valida siempre los datos externos.
- **Legibilidad y Autodocumentación:** Usa nombres de variables y funciones explícitos y significativos en inglés (o en el idioma base del repositorio). Comenta el _por qué_, no el _qué_.

---

## 3. Guías Específicas por Lenguaje

### PowerShell (`.ps1`, `.psm1`)

- Utiliza funciones avanzadas con bloques `[CmdletBinding()]` y parámetros tipados.
- Usa siempre `-ErrorAction Stop` en comandos críticos para permitir la captura adecuada con `try/catch`.
- Evita imprimir texto plano sensible; usa variables y tuberías (`pipelines`) estructuradas.

### C y C++ (`.c`, `.cpp`, `.h`, `.hpp`)

- Prioriza la seguridad de memoria. En C++, aplica **RAII** (Resource Acquisition Is Initialization) y punteros inteligentes (`std::unique_ptr`, `std::shared_ptr`) en lugar de gestión manual (`new`/`delete`).
- Evita desbordamientos de búfer (usa funciones seguras como `snprintf` en lugar de `sprintf`).
- Mantén la compatibilidad con estándares modernos (C++17 o superior / C11 o superior).

### Python (`.py`)

- Sigue estrictamente las guías de estilo **PEP 8**.
- Utiliza **Type Hinting** (anotaciones de tipos) en todas las firmas de funciones y métodos.
- Escribe docstrings claras usando el formato estándar (Google o Sphinx) para módulos, clases y funciones.

### Ruby (`.rb`)

- Escribe código idiomático (_Ruby way_), limpio y expresivo.
- Prefiere métodos legibles y bloques de iteración limpios antes que bucles manuales complejos.
- Asegura una gestión limpia de excepciones con bloques `begin/rescue/ensure`.

### JavaScript / TypeScript (`.js`, `.ts`)

- Utiliza sintaxis moderna (`ES6+`, `async/await`, desestructuración).
- Si es TypeScript, evita el uso de `any`; define tipos e interfaces estrictas.
- Mantén la asincronía limpia y maneja los rechazos de promesas (`try/catch` en bloques asíncronos).

---

## 4. Estilo de Código y Formato

- **Indentación y Espacios:** Utiliza tabulaciones de 4 espacios (o 2 según convenga al proyecto) y asegúrate de no dejar espacios en blanco al final de las líneas (_trailing whitespace_).
- **Saltos de Línea:** Respeta siempre el formato de saltos de línea estándar (`LF`), evitando mezclarlo con `CRLF` a menos que sea un script nativo de Windows (`.bat`/`.cmd`).
- **Commits y Mensajes:** Cuando sugieras cambios lógicos, redacta el código asumiendo que los mensajes de commit seguirán un estándar claro y descriptivo.
```

7. dependabot.yml:

```yml
# ==============================================================================
# CONFIGURACIÓN GLOBAL DE DEPENDABOT
# ==============================================================================
version: 2
updates:
  # ----------------------------------------------------------------------------
  # 1. GITHUB ACTIONS (CI/CD)
  # ----------------------------------------------------------------------------
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
      time: "04:00"
      timezone: "America/Mexico_City"
    open-pull-requests-limit: 5
    labels:
      - "dependencies"
      - "ci/cd"
    commit-message:
      prefix: "ci"
      prefix-development: "ci"
      include: "scope"

  # ----------------------------------------------------------------------------
  # 2. RUST (Cargo)
  # ----------------------------------------------------------------------------
  - package-ecosystem: "cargo"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
      time: "04:30"
      timezone: "America/Mexico_City"
    open-pull-requests-limit: 10
    allow:
      - dependency-type: "direct"
      - dependency-type: "production"
    labels:
      - "dependencies"
      - "rust"
    commit-message:
      prefix: "deps(rust)"
      include: "scope"

  # ----------------------------------------------------------------------------
  # 3. NODE.JS / JAVASCRIPT (npm)
  # ----------------------------------------------------------------------------
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "tuesday"
      time: "04:00"
      timezone: "America/Mexico_City"
    open-pull-requests-limit: 10
    ignore:
      - dependency-name: "webpack"
        update-types: ["version-update:semver-major"]
    labels:
      - "dependencies"
      - "javascript"
    commit-message:
      prefix: "deps(npm)"
      include: "scope"

  # ----------------------------------------------------------------------------
  # 4. PYTHON (pip)
  # ----------------------------------------------------------------------------
  - package-ecosystem: "pip"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "tuesday"
      time: "04:30"
      timezone: "America/Mexico_City"
    open-pull-requests-limit: 5
    labels:
      - "dependencies"
      - "python"
    commit-message:
      prefix: "deps(python)"
      include: "scope"

  # ----------------------------------------------------------------------------
  # 5. DOCKER
  # ----------------------------------------------------------------------------
  - package-ecosystem: "docker"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "wednesday"
      time: "04:00"
      timezone: "America/Mexico_City"
    open-pull-requests-limit: 5
    labels:
      - "dependencies"
      - "docker"
    commit-message:
      prefix: "deps(docker)"
      include: "scope"

  # ----------------------------------------------------------------------------
  # 6. C / C++ (vcpkg)
  # ----------------------------------------------------------------------------
  - package-ecosystem: "vcpkg"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "wednesday"
      time: "04:30"
      timezone: "America/Mexico_City"
    open-pull-requests-limit: 5
    labels:
      - "dependencies"
      - "c++"
    commit-message:
      prefix: "deps(cpp)"
      include: "scope"
```

8. .gitlab/ci/

   - `base-lint.yml`:

   ```yaml
   lint:global:
     stage: validate
     image: alpine:latest
     script:
       - echo "Validando estructura general del repositorio y formato base..."
   ```

   - `rust-ci.yml`:

   ```yaml
   test:rust:
     stage: test
     image: rust:latest
     script:
       - cargo test --all-features --verbose
   ```

   - `node-ci.yml`:

   ```yaml
   test:node:
     stage: test
     image: node:20-alpine
     script:
       - npm ci
       - npm test
   ```

   - `python-ci.yml`:

   ```yaml
   test:python:
     stage: test
     image: python:3.11-alpine
     script:
       - pip install --upgrade pip
       - if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
       - pytest || python -m unittest
   ```

   - `cpp-ci.yml`:

   ```yaml
   test:cpp:
     stage: test
     image: gcc:latest
     script:
       - echo "Compilando proyecto C/C++..."
       - cmake -B build && cmake --build build
   ```

   - `powershell-ci.yml`:

   ```yaml
   test:powershell:
     stage: test
     image: mcr.microsoft.com/powershell:ubuntu-latest
     script:
       - pwsh -Command "Invoke-ScriptAnalyzer -Path . -Recurse -Severity Error"
   ```

   - `ruby-ci.yml`:

   ```yaml
   test:ruby:
     stage: test
     image: ruby:3.2-alpine
     script:
       - bundle install
       - bundle exec rspec || ruby test/*.rb
   ```

9. .gitlab/issue_templates/
   **Por el momento no hay archivos**

10. .gitlab-ci.yml:

```yaml
# ==============================================================================
# ORQUESTADOR MAESTRO - GITLAB CI/CD (The One Ring to Rule Them All)
# ==============================================================================

stages:
  - validate
  - test
  - security

include:
  # Canalización universal de validación base y lints globales
  - local: ".gitlab/ci/base-lint.yml"

  # Canalizaciones modulares por tecnología (se disparan condicionalmente)
  - local: ".gitlab/ci/rust-ci.yml"
    rules:
      - if: "$CI_COMMIT_BRANCH"
        exists:
          - "Cargo.toml"

  - local: ".gitlab/ci/node-ci.yml"
    rules:
      - if: "$CI_COMMIT_BRANCH"
        exists:
          - "package.json"

  - local: ".gitlab/ci/python-ci.yml"
    rules:
      - if: "$CI_COMMIT_BRANCH"
        exists:
          - "requirements.txt"
          - "pyproject.toml"
          - "setup.py"

  - local: ".gitlab/ci/cpp-ci.yml"
    rules:
      - if: "$CI_COMMIT_BRANCH"
        exists:
          - "CMakeLists.txt"
          - "vcpkg.json"
          - "Makefile"

  - local: ".gitlab/ci/powershell-ci.yml"
    rules:
      - if: "$CI_COMMIT_BRANCH"
        exists:
          - "**/*.ps1"

  - local: ".gitlab/ci/ruby-ci.yml"
    rules:
      - if: "$CI_COMMIT_BRANCH"
        exists:
          - "Gemfile"
```

11. .pre-commit-config.yaml:

    ```yaml
    # ==============================================================================
    # CONFIGURACIÓN GLOBAL DE PRE-COMMIT (MULTI-LENGUAJE Y MULTIPROYECTO)
    # ==============================================================================
    repos:
      # ----------------------------------------------------------------------------
      # 1. GANCHOS UNIVERSALES DE LIMPIEZA Y SEGURIDAD
      # ----------------------------------------------------------------------------
      - repo: https://github.com/pre-commit/pre-commit-hooks
        rev: v5.0.0
        hooks:
          - id: trailing-whitespace
          - id: end-of-file-fixer
          - id: check-yaml
          - id: check-json
          - id: check-toml
          - id: check-added-large-files
            args: ["--maxkb=500"]
          - id: check-merge-conflict
          - id: detect-private-key

      # ----------------------------------------------------------------------------
      # 2. C / C++ (Clang-Format & Clang-Tidy)
      # ----------------------------------------------------------------------------
      - repo: https://github.com/pocc/pre-commit-hooks
        rev: v1.3.5
        hooks:
          - id: clang-format
            args: [--style=file]
          - id: clang-tidy
            args: [--config-file=.clang-tidy]

      # ----------------------------------------------------------------------------
      # 3. RUST (Cargo fmt y Clippy)
      # ----------------------------------------------------------------------------
      - repo: https://github.com/doublify/pre-commit-rust
        rev: v1.0.15
        hooks:
          - id: cargo-fmt
          - id: clippy
            args: ["--", "-D", "warnings"]

      # ----------------------------------------------------------------------------
      # 4. JAVASCRIPT / TYPESCRIPT / YAML / JSON (Prettier y ESLint)
      # ----------------------------------------------------------------------------
      - repo: https://github.com/pre-commit/mirrors-prettier
        rev: v3.1.0
        hooks:
          - id: prettier
            types_or: [javascript, typescript, jsx, tsx, json, yaml, markdown]

      - repo: https://github.com/pre-commit/mirrors-eslint
        rev: v9.0.0 # Asegúrate de alinear con tu versión de ESLint
        hooks:
          - id: eslint
            files: \.[jt]sx?$
            types: [file]

      # ----------------------------------------------------------------------------
      # 5. PYTHON (Black, Ruff o Flake8)
      # ----------------------------------------------------------------------------
      - repo: https://github.com/astral-sh/ruff-pre-commit
        rev: v0.3.0
        hooks:
          - id: ruff
            args: [--fix]
          - id: ruff-format

      # ----------------------------------------------------------------------------
      # 6. POWERSHELL (Validación de formato básico y sintaxis)
      # ----------------------------------------------------------------------------
      - repo: https://github.com/PowerShell/PSScriptAnalyzer
        rev: 1.22.0 # O la versión estable más reciente
        hooks:
          - id: psscriptanalyzer
            args: [--severity:("Error", Warning)]
    ```

12. CHANELOG.md:
    **Se rellena mientras se desarrolla**

13. CODE_OF_CONDUCT.md

    ```md
    # Código de Conducta del Contribuidor

    ## Nuesro Compromiso

    Como miembros, contribuyentes y administradores de este proyecto, nos comprometemos a hacer que la participación en nuestra comunidad sea una experiencia libre de acoso para todos, sin importar edad, tamaño corporal, discapacidad visible o invisible, etnia, características sexuales, identidad y expresión de género, nivel de experiencia, educación, socioeconómico, nacionalidad, apariencia personal, raza, religión, o identidad y orientación sexual.

    Nos comprometemos a actuar e interactuar de maneras que contribuyan a una comunidad abierta, acogedora, diversa, inclusiva y saludable.

    ## Nuestros Estándares

    Ejemplos de comportamiento que contribuyen a crear un ambiente positivo incluyen:

    - Demostrar empatía y amabilidad hacia otras personas.
    - Respetar las diferentes opiniones, puntos de vista y experiencias.
    - Dar y aceptar retroalimentación constructiva de manera elegante.
    - Aceptar la responsabilidad y disculparse ante los afectados por nuestros errores, aprendiendo de la experiencia.
    - Enfocarse en lo que es mejor no solo para nosotros como individuos, sino para la comunidad en general.

    Ejemplos de comportamiento inaceptable incluyen:

    - El uso de lenguaje o imágenes sexualizadas, así como atención o avances sexuales de cualquier tipo.
    - Comentarios trolling, insultantes o derrogatorios, y ataques personales o políticos.
    - El acoso público o privado.
    - La publicación de información privada de otros (como direcciones físicas o de correo electrónico) sin su autorización explícita.
    - Cualquier otra conducta que pueda considerarse razonablemente inapropiada en un entorno profesional y de colaboración técnica.

    ## Ámbito de Aplicación

    Este Código de Conducta se aplica tanto dentro de los espacios del proyecto (repositorios, issues, pull requests, canales oficiales de comunicación) como en espacios públicos cuando un individuo representa oficial al proyecto o a su comunidad.

    ## Responsabilidades de los Mantenedores

    Los administradores y mantenedores del proyecto son responsables de aclarar y hacer cumplir los estándares de comportamiento aceptable y tomarán acciones correctivas apropiadas y justas en respuesta a cualquier comportamiento que consideren inaceptable, amenazante, ofensivo o dañino.

    Los mantenedores tienen el derecho y la responsabilidad de eliminar, editar o rechazar commits, commits de código, issues, comentarios y otras contribuciones que no se alineen con este Código de Conducta.

    ## Denuncias y Resolución

    Los casos de comportamiento abusivo, acoso o inaceptable pueden ser reportados a través de los canales de contacto privados establecidos en el archivo [SECURITY.md](SECURITY.md) o directamente con los administradores principales del repositorio.

    Todas las denuncias serán revisadas y investigadas de manera rápida y confidencial.

    ---

    _Este documento está adaptado del Contributor Covenant, versión 2.1, disponible en https://www.contributor-covenant.org/version/2/1/code_of_conduct.html_
    ```

14. commit_standard.md:

    ```md
    # Guía Estándar de Commits y Gestión de Issues desde Terminal

    Esta guía establece el estándar obligatorio de mensajes de commits y el procedimiento para la creación y administración de _Issues_ directamente desde la consola del sistema.

    ---

    ## 1. Estándar de Mensajes de Commit

    ### Reglas Generales

    - **Sin emojis:** Queda estrictamente prohibido el uso de emojis en los mensajes de commit.
    - **Modo imperativo:** Usar verbos en presente imperativo (ej. `add`, `fix`, `refactor`, `remove`).
    - **Conciso:** La primera línea no debe superar los 50-72 caracteres.
    - **Estructura clara:** Tipo, alcance opcional y descripción directa.

    ### Estructura Básica

    +-------------------------------------------------------------------------+
    | <tipo>(<alcance_opcional>): <descripción corta en imperativo> |
    | |
    | [cuerpo opcional detallando el motivo del cambio] |
    | |
    | [pie opcional: referencias a issues, breaking changes, etc.] |
    +-------------------------------------------------------------------------+

    ### Tipos de Commits Permitidos

    #### Tipo Descripción Ejemplo

    **feat**:
    Nueva característica o funcionalidad
    feat (compiler): add lexer tokenizer for string literals

    **fix**:
    Corrección de un error o bug
    fix(fenix): resolve memory leak in stack allocation

    **refactor**:
    Cambio de código que no corrige bug ni añade feature
    refactor(core): simplify IgnisContext state machine

    **build**:
    Cambios en sistema de compilación o dependencias
    build(cmake): unify library targets in src/CMakeLists.txt

    **docs**
    Cambios únicamente en la documentación
    docs(readme): update build instructions for v2-core

    **test**
    Añadir o corregir pruebas unitarias/integración
    test(lexer): add test cases for numeric parsing

    **style**
    Formato, puntos y comas, espacios (sin cambio de lógica)
    style(tracker): format code according to C++20 guidelines

    **ci**
    Cambios en scripts o archivos de integración continua
    ci(gitlab): update pipeline runner dependencies

    **chore**
    Tareas rutinarias de mantenimiento o configuración
    chore(gitignore): add rules for build artifacts

    ## Resumen

    | Tipo         | Descripción                                              | Ejemplo                                                     |
    | :----------- | :------------------------------------------------------- | :---------------------------------------------------------- |
    | **feat**     | Nueva característica o funcionalidad                     | `feat(compiler): add lexer tokenizer for string literals`   |
    | **fix**      | Corrección de un error o bug                             | `fix(fenix): resolve memory leak in stack allocation`       |
    | **refactor** | Cambio de código que no corrige bug ni añade feature     | `refactor(core): simplify IgnisContext state machine`       |
    | **build**    | Cambios en sistema de compilación o dependencias         | `build(cmake): unify library targets in src/CMakeLists.txt` |
    | **docs**     | Cambios únicamente en la documentación                   | `docs(readme): update build instructions for v2-core`       |
    | **test**     | Añadir o corregir pruebas unitarias/integración          | `test(lexer): add test cases for numeric parsing`           |
    | **style**    | Formato, puntos y comas, espacios (sin cambio de lógica) | `style(tracker): format code according to C++20 guidelines` |
    | **ci**       | Cambios en scripts o archivos de integración continua    | `ci(gitlab): update pipeline runner dependencies`           |
    | **chore**    | Tareas rutinarias de mantenimiento o configuración       | `chore(gitignore): add rules for build artifacts`           |
    ```

15. PULL_REQUEST_TEMPLATE.md:

    ```md
    <!--
    Thank you for contributing to the repository! Please fill out the sections below to help reviewers understand your changes.
    -->

    ## Description

    <!-- Provide a clear, concise summary of the changes and the motivation behind them. Include context on what problem this solves. -->

    - **Related Issue:** Fixes #[Issue Number] / Relates to #[Issue Number]

    ---

    ## Type of Change

    <!-- Mark the relevant options with an "x" -->

    - [ ] Bug fix (non-breaking change which fixes an issue)
    - [ ] New feature (non-breaking change which adds functionality)
    - [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
    - [ ] Documentation update
    - [ ] Refactoring (no functional changes, no API changes)
    - [ ] Performance improvement

    ---

    ## How Has This Been Tested?

    <!-- Describe the tests that you ran to verify your changes. Provide instructions so we can reproduce. -->

    - [ ] Unit Tests (`npm test` / `pytest` / etc.)
    - [ ] Integration / E2E Tests
    - [ ] Manual Testing (describe steps below)

    **Test Configuration:**

    - OS:
    - Browser / Environment:
    - Versions:

    ---

    ## Checklist

    <!-- Mark the relevant options with an "x" -->

    - [ ] My code follows the style guidelines of this project
    - [ ] I have performed a self-review of my own code
    - [ ] I have commented my code, particularly in hard-to-understand areas
    - [ ] I have made corresponding changes to the documentation
    - [ ] My changes generate no new warnings
    - [ ] I have added tests that prove my fix is effective or that my feature works
    - [ ] New and existing unit tests pass locally with my changes

    ---

    ## Screenshots / Demos

    <!-- Add screenshots or screen recordings if applicable to help visualize UI/UX changes. -->

    |   Before    |    After    |
    | :---------: | :---------: |
    | _Image/GIF_ | _Image/GIF_ |
    ```

16. README.md:

    ````md
    # Project Master Template

    Plantilla de ingeniería de software modular y lista para producción, diseñada para iniciar proyectos multi-lenguaje con flujos automatizados e integración de inteligencia artificial.

    ---

    ## Estructura del Repositorio

        ```text
        .
        ├── .changes/                # Control y registro de cambios automatizados (Changelogs)
        ├── .github/                 # Workflows de CI/CD (GitHub Actions) y directivas de Copilot
        ├── .gitlab/                 # Pipelines modulares para GitLab CI/CD por lenguaje
        ├── .vscode/                 # Configuraciones optimizadas del editor (formatos, reglas)
        ├── AGENTS/                  # Contexto y directrices optimizadas para Claude, Gemini y OpenAI
        ├── include/                 # Directorio modular para recursos y dependencias de código
        └── scripts/                 # Herramientas de automatización (Gestor de changelogs, etc.)
        ```

    ## Características Principales

    - Multi-Lenguaje y Multi-Proyecto: Soporte preconfigurado para **Rust, C/C++, Python, JavaScript/TypeScript, Ruby y PowerShell**.

    - AI-Native Ready: Incluye contexto estructurado en la carpeta AGENTS/ para que los modelos de lenguaje interpreten las reglas del repositorio.

    - Control de Calidad Automático: Validaciones mediante ganchos de pre-commit, análisis estático y linters integrados.

    - CI/CD Dinámico: Orquestadores en GitHub Actions y GitLab que detectan automáticamente las tecnologías presentes en el proyecto.

    - Normalización Global: Saltos de línea estrictos (LF) y normalización de archivos mediante .gitattributes para prevenir conflictos multiplataforma

    ## Uso Rápido

    1. Utiliza este repositorio como plantilla base para tu nuevo proyecto.
    2. Configura las herramientas locales asegurando el uso de pre-commit:
       ```bash
       pre-commit install
       ```
    3. Registra tus cambios mediante el script de changelogs:
       ```ps1
       pwsh ./scripts/changelog-manager.ps1 -Action add -Type feat -Message "Inicialización del proyecto"
       ```

    ## Gobernanza y Seguridad

    - **Código de Conducta**: Consulta las normas de convivencia en CODE_OF_CONDUCT.md.
    - **Seguridad**: Reporta vulnerabilidades siguiendo las pautas de SECURITY.md.

    ## LICENCIA

    Este proyecto se distribuye bajo los términos establecidos en el repositorio. Consulta el archivo [LICENSE](LICENSE) para más detalles.
    ````

17. SECURITY.md:

    ```md
    # Política de Seguridad

    Este documento describe los procedimientos para reportar vulnerabilidades de seguridad, las políticas de soporte y las directrices de respuesta ante incidentes para este proyecto.

    ---

    ## Versiones Soportadas

    Mantenemos actualizaciones de seguridad y parches críticos de acuerdo con la siguiente matriz de soporte:

    | Versión             | Soporte Activo   | Notas de Seguridad                                                        |
    | :------------------ | :--------------- | :------------------------------------------------------------------------ |
    | **`v2.x` (Actual)** | [x] Soportado    | Recibe parches inmediatos para vulnerabilidades críticas y moderadas.     |
    | **`v1.x` (Legacy)** | [ ] No Soportado | Solo se atienden advisories de criticidad alta bajo revisión excepcional. |

    ---

    ## Reporte de Vulnerabilidades

    Tomamos la seguridad de este proyecto y de sus usuarios con la máxima seriedad. Si descubres una vulnerabilidad de seguridad, **por favor no la hagas pública** en issues abiertos ni en foros públicos. Sigue un proceso de divulgación responsable (_Responsible Disclosure_):

    1. **Canal Privado:** Envía un reporte detallado directamente a través del correo de seguridad oficial del mantenedor o mediante una advertencia privada en GitHub Security Advisories si está habilitado en el repositorio.
    2. **Información Requerida en el Reporte:**
       - Descripción clara y detallada de la vulnerabilidad.
       - Pasos exactos o prueba de concepto (_PoC_) para reproducir el fallo.
       - Impacto potencial del problema (qué sistemas o datos se ven comprometidos).
       - Versión específica del software o módulo afectado.

    ---

    ## Proceso de Gestión e Investigación

    Una vez recibido el reporte, nos comprometemos al siguiente flujo de respuesta:

    - **Acuse de recibo:** En un plazo máximo de **48 horas**, los mantenedores confirmarán la recepción del reporte de forma privada.
    - **Evaluación e investigación:** Se realizará un análisis técnico para verificar la validez, el alcance y la severidad del riesgo reportado.
    - **Mitigación y Parche:** Si se confirma la vulnerabilidad, se desarrollará un parche de seguridad de forma privada en una rama aislada.
    - **Divulgación Coordinada:** Se publicará un aviso de seguridad (_Advisory_) junto con la nueva versión liberada una vez que la solución esté disponible para los usuarios.

    ---

    ## Directrices de Integridad del Código

    Para minimizar la superficie de ataques y vulnerabilidades por dependencias:

    - Todos los cambios pasan por análisis estático automatizado (`PSScriptAnalyzer`, `Clang-Tidy`, `Clippy`, `Ruff`).
    - Las dependencias de terceros son monitoreadas semanalmente de forma automatizada (vía Dependabot).
    - No se aceptan contribuciones que omitan la validación estricta de entradas o que expongan credenciales en texto plano.

    Agradecemos profundamente a la comunidad de investigadores y desarrolladores que colaboran para mantener este ecosistema seguro y resiliente.
    ```

18. scripts/

    - docs/comandos.md:

      ```md
      # Comandos para registrar cambios en ./changes y en CHANGELOG.md

      **Registra un cambio:**
      `ps1
          pwsh -File .\scripts\changelog-manager.ps1 -Action add -Type "feat" -Message "Implementada la autenticación por token"
          `
      **Registra un error o comportamiento inesperado**
      `ps1
          pwsh -File .\scripts\changelog-manager.ps1 -Action add -Type "fix" -Message "Solucionado el error de ruta en el módulo principal"
          `

      **Compila en un CHANELOG.md**
      `ps1
          pwsh -File .\scripts\changelog-manager.ps1 -Action generate
          `

      **Hacer un Commit**
      `bash
          git add <module>
          git commit -m "<tipo>(<alcance_opcional>): <descripción corta en imperativo>"
          `
      ```

    - src/chanelog-manager.ps1:

```ps1
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
            $Message = Read-Host "Introduce la descripcion tecnica del cambio"
            if ([string]::IsNullOrWhiteSpace($Message)) {
                throw "El mensaje de cambio no puede estar vacio."
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
        Write-Error "[ERROR] Fallo el registro del cambio: $_"
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
            "feat"     = "### Nuevas Caracteristicas (Features)"
            "fix"      = "### Correcciones de Errores (Bug Fixes)"
            "refactor" = "### Refactorizacion de Codigo"
            "perf"     = "### Mejoras de Rendimiento"
            "docs"     = "### Documentacion"
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
        Write-Error "[CRITICAL] Error durante la generacion del changelog: $_"
        exit 1
    }
}
```

#### Código

## Respuesta

### Nivel de Experticia y Rol:

Actuación rigurosa como Ingeniero de Software Principal y Arquitecto de Sistemas (Enterprise Grade). Las respuestas deben priorizar la robustez, la mantenibilidad, la seguridad por diseño y el cumplimiento de estándares de la industria, evitando explicaciones superfluas o superficiales.

### Estilo de Lenguaje y Comunicación:

    Tono: Profesional, técnico, directo y analítico.

    Idioma: Español técnico estándar.

    Restricción Estricta: Prohibición absoluta del uso de emojis en documentación formal, código, mensajes de commit o changelogs para mantener una estética corporativa sobria.

### Gestión de Logs, Errores y Trazabilidad:

    Todo bloque de código o script automatizado debe implementar manejo estricto de excepciones (try/catch con propagación explícita de errores mediante -ErrorAction Stop en entornos PowerShell u equivalentes seguros).

    Los mensajes de error y las salidas por consola deben seguir un formato estructurado con niveles claros (ej. [OK], [INFO], [ERROR], [CRITICAL]).

Metodología de Desarrollo y Commits:

    Apego estricto al estándar de Conventional Commits en modo imperativo (feat, fix, refactor, build, docs, test, style, ci, chore), utilizando alcances delimitados y sin recurrir a emojis.
