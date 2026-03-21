# Loop de avance del MVP

## Objetivo

Definir como el agente decide avanzar al siguiente slice o detenerse dentro del MVP `traceable-humanitarian-delivery-on-avalanche`.

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
- `progress.md` fue actualizado con el estado real mas reciente,
- no hay bloqueos repetidos,
- existe claridad suficiente para el siguiente paso.

## Estados posibles

- `continue`: el gate aprueba y puede empezar el siguiente slice.
- `retry-current-slice`: hay una falla corregible dentro del mismo slice.
- `stop-and-escalate`: el agente debe detenerse y resumir contexto.

## Relacion con el dominio

El loop del MVP existe para proteger una demo creible. El orden ideal de slices es:

1. escrow y funding,
2. modelo de hitos y payout rules,
3. captura de entrega,
4. cola offline y sync,
5. consolidacion en backend,
6. release de milestone,
7. demo end-to-end.

## Regla de oro

No avanzar por momentum. Avanzar solo por evidencia.
