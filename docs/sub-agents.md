# Sub-agents y coordinación operativa

## Idea general

Este framework modela cada fase del trabajo como una skill reutilizable. En la práctica, cada skill funciona como un sub-agente especializado sobre una etapa concreta del flujo.

## Roles sugeridos

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
- Regenerar `.atl/skill-registry.md` al cambiar `skills/`.
- Abrir PRs con un solo change principal para preservar trazabilidad.
