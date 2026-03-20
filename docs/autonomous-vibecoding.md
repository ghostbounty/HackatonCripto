# Estrategia de vibecoding autonomo

## Objetivo

Dejar el repo listo para que cualquier persona lo clone y pueda ejecutar un agente durante horas con supervision minima, manteniendo control de calidad, decisiones explicitas y evidencia auditable.

## Contrato del agente

El agente debe:

- explorar antes de preguntar,
- trabajar por slices pequenos,
- registrar supuestos cuando el repo no resuelva un detalle menor,
- persistir el estado vivo del change en `changes/<change-name>/progress.md`,
- validar con frecuencia,
- detener el avance cuando falle un gate,
- disenar decisiones subjetivas estrechas con outputs restringidos,
- distinguir `accepted` de `finalized` cuando el slice toque GenLayer,
- evitar que material archivado se use como baseline activo por accidente.

## Loop operativo

Cada iteracion sigue este patron:

1. descubrir el contexto del slice,
2. proponer y especificar lo minimo necesario,
3. disenar para testabilidad y politica de evidencia,
4. implementar solo el slice actual,
5. preparar seeds demo,
6. ejecutar pruebas del slice,
7. verificar consistencia global,
8. decidir si avanza o se detiene.

## Checkpoints

- Correr checkpoints despues de cada cambio relevante.
- No esperar al final de una sesion larga para validar.
- Dejar evidencia corta sobre el estado del gate.
- Actualizar `progress.md` en cada checkpoint para que otro agente pueda retomar sin historial de chat.

## Reintentos

- Maximo 2 reintentos dirigidos por la misma falla.
- Si la causa persiste, detenerse.
- El resumen debe incluir causa, impacto y siguiente paso minimo seguro.

## Condiciones de escalacion

Escalar solo si:

- el repo no contiene la informacion necesaria,
- existe una decision funcional con impacto alto,
- o el cambio compromete artifacts preservados.

## Resultado esperado

El agente no solo implementa; tambien sabe cuando no debe seguir. Ese comportamiento es parte del MVP del framework.
Tambien debe dejar un handoff legible y persistente para la siguiente sesion.
