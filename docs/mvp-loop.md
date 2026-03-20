# Loop de avance del MVP

## Objetivo

Definir como el agente decide avanzar al siguiente slice o detenerse en un MVP centrado en adjudicacion inteligente y auditable sobre el baseline activo.

## Flujo

1. `sdd-init`
2. `sdd-explore`
3. `sdd-propose`
4. `sdd-spec`
5. `sdd-design`
6. `sdd-tasks`
7. `sdd-apply`
8. `sdd-test`
9. `sdd-verify`
10. `decision-gate`

## Decision gate

El siguiente slice solo puede comenzar si:

- el slice actual cumple su criterio de aceptacion,
- la decision subjetiva del slice esta acotada,
- existe politica de evidencia documentada,
- el testing paso,
- verify paso,
- `progress.md` fue actualizado con el estado real mas reciente,
- si aplica, hay evidencia de `ACCEPTED` y `FINALIZED`,
- el trabajo nuevo se apoya en `genlayer-mvp/` o en docs activas, no en rutas archivadas como baseline,
- no hay bloqueos repetidos,
- existe claridad suficiente para el siguiente paso.

## Estados posibles

- `continue`: el gate aprueba y puede empezar el siguiente slice.
- `retry-current-slice`: hay una falla corregible dentro del mismo slice.
- `stop-and-escalate`: el agente debe detenerse y resumir contexto.

## Regla de oro

No avanzar por momentum. Avanzar solo por evidencia.
