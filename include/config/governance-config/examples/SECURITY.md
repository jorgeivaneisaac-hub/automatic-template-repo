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

-   **Acuse de recibo:** En un plazo máximo de **48 horas**, los mantenedores confirmarán la recepción del reporte de forma privada.
-   **Evaluación e investigación:** Se realizará un análisis técnico para verificar la validez, el alcance y la severidad del riesgo reportado.
-   **Mitigación y Parche:** Si se confirma la vulnerabilidad, se desarrollará un parche de seguridad de forma privada en una rama aislada.
-   **Divulgación Coordinada:** Se publicará un aviso de seguridad (_Advisory_) junto con la nueva versión liberada una vez que la solución esté disponible para los usuarios.

---

## Directrices de Integridad del Código

Para minimizar la superficie de ataques y vulnerabilidades por dependencias:

-   Todos los cambios pasan por análisis estático automatizado (`PSScriptAnalyzer`, `Clang-Tidy`, `Clippy`, `Ruff`).
-   Las dependencias de terceros son monitoreadas semanalmente de forma automatizada (vía Dependabot).
-   No se aceptan contribuciones que omitan la validación estricta de entradas o que expongan credenciales en texto plano.

Agradecemos profundamente a la comunidad de investigadores y desarrolladores que colaboran para mantener este ecosistema seguro y resiliente.
