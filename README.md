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
   pwsh ./scripts/src/chanelog-manager.ps1 -Action add -Type feat -Message "Inicialización del proyecto"
   ```

## Gobernanza y Seguridad

- **Código de Conducta**: Consulta las normas de convivencia en CODE_OF_CONDUCT.md.
- **Seguridad**: Reporta vulnerabilidades siguiendo las pautas de SECURITY.md.

## LICENCIA

Este proyecto se distribuye bajo los términos establecidos en el repositorio. Consulta el archivo [LICENSE](LICENSE.txt) para más detalles.
