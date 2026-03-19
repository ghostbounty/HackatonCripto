# AGENTS.md

## Propósito

Este archivo es el índice operativo del repositorio. Define cómo orientarse, qué artifacts consultar primero y cómo ejecutar el flujo completo de trabajo sin alterar los artifacts funcionales existentes.

## Contexto obligatorio del dominio

- Tratar `docs/product/` como el contexto funcional y de negocio de referencia para el dominio del hackathon.
- Preservar y consultar especialmente:
  - `docs/product/hackathon-vision.md`
  - `docs/product/domain-rules.md`
  - `docs/product/blockchain-scope.md`
  - `docs/product/demo-script.md`
- No mover ni romper artifacts existentes en `docs/product/` ni en `changes/`.

## Lugar obligatorio de artifacts por change

Cada cambio debe vivir en `changes/<change-name>/` y mantener, según corresponda, los siguientes artifacts:

- `proposal.md`
- `spec.md`
- `design.md`
- `tasks.md`
- `verify-checklist.md` o `verify.md`

## Skills disponibles en `skills/`

| Skill | Trigger principal | Salida esperada |
| --- | --- | --- |
| `skills/sdd-init/` | Crear o alinear la estructura base del repo/change | Estructura base, rutas y prechecks |
| `skills/sdd-explore/` | Entender contexto funcional/técnico existente | Notas de contexto y mapa de impacto |
| `skills/sdd-propose/` | Redactar o ajustar `proposal.md` | Propuesta de cambio |
| `skills/sdd-spec/` | Redactar o ajustar `spec.md` | Delta funcional y escenarios |
| `skills/sdd-design/` | Redactar o ajustar `design.md` | Diseño técnico y decisiones |
| `skills/sdd-tasks/` | Desglosar ejecución en `tasks.md` | Checklist accionable |
| `skills/sdd-apply/` | Implementar artifacts/código alineados al change | Cambios aplicados y referencias |
| `skills/sdd-verify/` | Verificar estructura, consistencia y criterios | Checklist y validaciones |
| `skills/sdd-archive/` | Cerrar o archivar un change | Estado final y resumen |
| `skills/skill-registry/` | Regenerar `.atl/skill-registry.md` | Índice actualizado de skills |
| `skills/issue-creation/` | Abrir issues trazables desde un change | Issue(s) con contexto |
| `skills/branch-pr/` | Preparar branch/PR con change único | Branch, PR checklist y resumen |

## Triggers y orden del flujo

Usar el flujo por defecto en este orden, salvo que el pedido del usuario indique otra cosa:

1. `sdd-init`
2. `sdd-explore`
3. `sdd-propose`
4. `sdd-spec`
5. `sdd-design`
6. `sdd-tasks`
7. `sdd-apply`
8. `sdd-verify`
9. `issue-creation` cuando haga falta sincronizar backlog
10. `branch-pr` para preparar PR
11. `sdd-archive` cuando el change se cierre

### Triggers sugeridos

- Si el usuario pide "alinear framework", "bootstrap", "setup del repo" o "estructura base", activar `sdd-init`.
- Si el usuario pide "entender el contexto", "revisar docs/product" o "mapear impacto", activar `sdd-explore`.
- Si el usuario pide "proposal", "spec", "design", "tasks" o "verify", activar la skill correspondiente.
- Si el usuario pide "registrar skills", "actualizar índice" o "regenerar catálogo", activar `skill-registry`.
- Si el usuario pide "abrir issue", activar `issue-creation`.
- Si el usuario pide "abrir PR", "dejar listo el PR" o "preparar branch", activar `branch-pr`.

## Reglas operativas

- Leer `README.md` y `docs/architecture.md` para entender el marco del repositorio.
- Consultar `docs/product/` antes de proponer cambios funcionales.
- Mantener un solo change por PR siempre que sea posible.
- Usar `.atl/skill-registry.md` como índice regenerable, no como fuente única de verdad.
- Usar `scripts/setup.sh` o `scripts/setup.ps1` para regenerar artifacts auxiliares.
- Usar `scripts/validate-structure.sh` antes de abrir o actualizar un PR.

## Rutas clave

- Dominio funcional: `docs/product/`
- Framework de trabajo: `docs/`
- Changes: `changes/`
- Skills: `skills/`
- Índice regenerable: `.atl/skill-registry.md`
- Automatización: `scripts/`
- Templates de colaboración: `.github/`
