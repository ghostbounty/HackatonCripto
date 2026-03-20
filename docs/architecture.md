# Arquitectura operativa del framework

## Objetivo

Este repositorio combina dos capas que deben convivir sin interferirse:

1. Capa funcional del dominio en `docs/product/`.
2. Capa operativa del framework en `docs/`, `skills/`, `scripts/`, `.atl/`, `.github/` y `examples/`.

La arquitectura busca permitir sesiones largas de vibecoding con alta autonomia, sin mover ni romper los artifacts funcionales ya existentes del producto y de los changes.

## Principios de operacion

- El agente trabaja por slices pequenos y verificables.
- Ningun slice se considera completo sin testing y verify.
- El repo debe dar suficiente contexto para explorar antes de preguntar.
- El framework debe decirle al agente cuando continuar, cuando reintentar y cuando detenerse.

## Capas principales

### 1. Contexto funcional del dominio

`docs/product/` conserva el contexto del hackathon y sigue siendo la fuente de verdad de negocio. Referencias preservadas:

- `docs/product/hackathon-vision.md`
- `docs/product/domain-rules.md`
- `docs/product/blockchain-scope.md`
- `docs/product/demo-script.md`

### 2. Unidad de cambio

`changes/<change-name>/` es el contenedor obligatorio de trabajo para cada PR o iniciativa trazable. Debe reunir, segun aplique:

- `proposal.md`
- `spec.md`
- `design.md`
- `tasks.md`
- `verify-checklist.md` o `verify.md`

### 3. Capa de skills

`skills/` organiza el flujo SDD en skills discretas. El orden operativo recomendado y obligatorio por slice es:

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
11. `next-slice` o `stop`

### 4. Capa de testing y evidencia

La validacion de comportamiento del framework se apoya en:

- Playwright CLI como herramienta estandar de journeys
- seeds demo del marketplace para formularios y endpoints
- evidencia corta de `pass`, `retry-needed` o `stop`

El objetivo no es que el agente programe indefinidamente, sino que avance de forma segura y medible.

### 5. Automatizacion y artifacts regenerables

- `scripts/install.sh` y `scripts/install.ps1` validan prerequisitos del entorno autonomo.
- `scripts/setup.sh` y `scripts/setup.ps1` regeneran `.atl/skill-registry.md`.
- `scripts/validate-structure.sh` valida la estructura base del repo y la coherencia del loop autonomo.
- `.atl/skill-registry.md` es regenerable; no debe editarse como fuente unica.

## Decision gate

Entre slices existe una compuerta explicita. El agente solo puede continuar si:

- el slice tiene criterio de aceptacion claro,
- hay evidencia de seeds y testing,
- la estructura sigue alineada,
- no existen fallas repetidas sin resolver.

Si el gate falla, el agente corrige el slice actual o se detiene con contexto accionable.

## Compatibilidad preservada

La alineacion del framework no modifica el contenido existente de `docs/product/` ni reubica los changes vigentes. La nueva capa documental referencia esos artifacts en lugar de reemplazarlos.
