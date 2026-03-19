# Sub-agents y coordinación operativa

## Idea general

Este framework modela cada fase del trabajo como una skill reutilizable. En la práctica, cada skill funciona como un sub-agente especializado sobre una etapa concreta del flujo.

El número de agentes no cambia la estructura base del repositorio: `docs/product/` sigue siendo la verdad funcional, `changes/<change-name>/` sigue siendo la unidad trazable y la convención de un solo change principal por PR se mantiene tanto en ejecución individual como multi-agente.

## Roles sugeridos por capacidad

- Exploración y definición funcional.
- Diseño técnico y contratos.
- Implementación, entrega y verificación.

Estos roles son capacidades, no puestos fijos. Una sola persona/modelo puede ejercer varios roles o un mismo rol puede repartirse entre varios agentes, siempre que el ownership por artifact siga siendo explícito.

## Relación con las skills del flujo

- `sdd-init`: alinea estructura y precondiciones.
- `sdd-explore`: interpreta contexto funcional y técnico.
- `sdd-propose`: formula la intención del change.
- `sdd-spec`: formaliza requisitos verificables.
- `sdd-design`: define arquitectura y tradeoffs.
- `sdd-tasks`: transforma el change en ejecución secuenciada.
- `sdd-apply`: materializa cambios.
- `sdd-verify`: valida y prepara evidencia.
- `branch-pr`: empaqueta la entrega para revisión.

## Reglas de coordinación

- Empezar siempre por el contexto de `docs/product/` cuando el cambio afecte negocio.
- Mantener todos los artifacts del change dentro de `changes/<change-name>/`.
- Asignar ownership por artifact antes de habilitar edición secuencial o paralela.
- Respetar la jerarquía de autoridad: `docs/product/` -> `proposal/spec` -> `design` -> `tasks/verify` -> implementación.
- Congelar contracts funcionales y técnicos antes de habilitar workstreams paralelos.
- Escalar conflictos funcionales a `proposal.md`/`spec.md` y conflictos técnicos a `design.md`.
- Regenerar `.atl/skill-registry.md` al cambiar `skills/`.
- Abrir PRs con un solo change principal para preservar trazabilidad.
