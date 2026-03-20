# Sub-agents y coordinacion operativa

## Idea general

Este framework modela cada fase del trabajo como una skill reutilizable. En la practica, cada skill funciona como un sub-agente especializado sobre una etapa concreta del flujo.

El numero de agentes no cambia la estructura base del repositorio: `docs/product/` sigue siendo la verdad funcional preservada, `changes/<change-name>/` sigue siendo la unidad trazable y la convencion de un solo change principal por PR se mantiene tanto en ejecucion individual como multi-agente.

El baseline activo para ejecucion nueva vive en `genlayer-mvp/`. `legacy/` solo debe entrar en la conversacion cuando haga falta consultar o archivar contexto.

## Roles sugeridos por capacidad

- Exploracion y definicion funcional.
- Diseno tecnico, politica de evidencia y contratos.
- Implementacion, entrega y verificacion.

Estos roles son capacidades, no puestos fijos. Una sola persona o modelo puede ejercer varios roles o un mismo rol puede repartirse entre varios agentes, siempre que el ownership por artifact siga siendo explicito.

## Relacion con las skills del flujo

- `sdd-init`: alinea estructura y precondiciones.
- `sdd-explore`: interpreta contexto funcional, tecnico y de evidencia.
- `sdd-propose`: formula la intencion del change.
- `sdd-spec`: formaliza requisitos verificables y outputs restringidos.
- `sdd-design`: define arquitectura, tradeoffs y limites de IA.
- `sdd-tasks`: transforma el change en ejecucion secuenciada.
- `sdd-apply`: materializa cambios.
- `sdd-test`: prueba journeys, formularios, endpoints y estados `accepted/finalized`.
- `sdd-verify`: valida y prepara evidencia.
- `branch-pr`: empaqueta la entrega para revision.

## Reglas de coordinacion

- Empezar siempre por el contexto de `docs/product/` cuando el cambio afecte negocio.
- Trabajar contra `genlayer-mvp/` cuando el cambio afecte el baseline actual.
- Mantener todos los artifacts del change dentro de `changes/<change-name>/`.
- Asignar ownership por artifact antes de habilitar edicion secuencial o paralela.
- Respetar la jerarquia de autoridad: `docs/product/` -> `proposal/spec` -> `design` -> `tasks/verify` -> implementacion.
- Congelar contracts funcionales y tecnicos antes de habilitar workstreams paralelos.
- Escalar conflictos funcionales a `proposal.md` o `spec.md` y conflictos tecnicos a `design.md`.
- Regenerar `.atl/skill-registry.md` al cambiar `skills/`.
- Abrir PRs con un solo change principal para preservar trazabilidad.
