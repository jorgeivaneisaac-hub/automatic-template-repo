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

```text
+-------------------------------------------------------------------------+
| <tipo>(<alcance_opcional>): <descripción corta en imperativo>           |
|                                                                         |
| [cuerpo opcional detallando el motivo del cambio]                       |
|                                                                         |
| [pie opcional: referencias a issues, breaking changes, etc.]            |
+-------------------------------------------------------------------------+

```

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
