# Handoff persistente entre agentes

## Objetivo

Permitir que cualquier agente nuevo retome un change solo leyendo el repositorio, incluso si la sesion anterior termino por limite de consumo, corte de entorno o cambio de modelo.

## Artifact obligatorio

Cada change debe incluir `changes/<change-name>/progress.md`.

Ese archivo es el estado vivo de ejecucion. No reemplaza:

- `tasks.md` como plan,
- `design.md` como contrato tecnico,
- `verify-checklist.md` o `verify.md` como criterio de validacion.

## Responsabilidad

El agente activo debe actualizar `progress.md`:

- al iniciar un slice,
- despues de cada checkpoint relevante,
- despues de `sdd-test`,
- despues de `sdd-verify`,
- antes de cualquier `retry-needed`,
- antes de cualquier `stop`,
- antes de pasar al siguiente slice.

## Estructura minima

`progress.md` debe contener estas secciones:

- estado general del change,
- slice actual,
- ultimo gate aprobado,
- trabajo completado,
- trabajo pendiente inmediato,
- bloqueos activos,
- decisiones y supuestos vigentes,
- ultima evidencia de testing o verify,
- siguiente paso exacto para el siguiente agente.

## Regla de handoff

Un change no es retomable si `progress.md` no refleja el estado real mas reciente. Si hay contradiccion entre el repo y `progress.md`, el agente debe corregir el archivo antes de continuar.

## Resultado esperado

Otro agente debe poder responder solo leyendo `progress.md`:

- que esta terminado,
- que falta,
- que bloquea,
- que gate fue el ultimo en pasar,
- cual es el siguiente paso exacto.
