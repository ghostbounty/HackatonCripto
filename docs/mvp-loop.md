# Loop de avance del MVP

## Objetivo

Definir como el agente decide avanzar al siguiente slice o detenerse.

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
- el testing paso,
- verify paso,
- no hay bloqueos repetidos,
- existe claridad suficiente para el siguiente paso.

## Estados posibles

- `continue`: el gate aprueba y puede empezar el siguiente slice.
- `retry-current-slice`: hay una falla corregible dentro del mismo slice.
- `stop-and-escalate`: el agente debe detenerse y resumir contexto.

## Regla de oro

No avanzar por momentum. Avanzar solo por evidencia.
