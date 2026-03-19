# Arquitectura del framework de trabajo

## Objetivo

Este repositorio combina dos capas que deben convivir sin interferirse:

1. **Capa funcional del dominio** en `docs/product/`.
2. **Capa operativa del framework** en `docs/`, `skills/`, `scripts/`, `.atl/`, `examples/` y `.github/`.

La arquitectura busca agregar estructura faltante sin mover ni romper los artifacts ya existentes del producto y de los changes.

## Capas principales

### 1. Contexto funcional del dominio

`docs/product/` conserva el contexto del hackathon y sigue siendo la fuente de verdad de negocio. Referencias preservadas:

- `docs/product/hackathon-vision.md`
- `docs/product/domain-rules.md`
- `docs/product/blockchain-scope.md`
- `docs/product/demo-script.md`

### 2. Unidad de cambio

`changes/<change-name>/` es el contenedor obligatorio de trabajo para cada PR o iniciativa trazable. Debe reunir, según aplique:

- `proposal.md`
- `spec.md`
- `design.md`
- `tasks.md`
- `verify-checklist.md` o `verify.md`

Esta convención preserva la compatibilidad con los changes existentes:

- `changes/traceable-volunteering-with-demo-crypto/`
- `changes/stretch-merit-reputation/`

### 3. Capa de skills

`skills/` organiza el flujo SDD en skills discretas. Las skills se consumen desde `AGENTS.md` y se registran en `.atl/skill-registry.md`.

Orden operativo recomendado:

1. `sdd-init`
2. `sdd-explore`
3. `sdd-propose`
4. `sdd-spec`
5. `sdd-design`
6. `sdd-tasks`
7. `sdd-apply`
8. `sdd-verify`
9. `issue-creation`
10. `branch-pr`
11. `sdd-archive`

### 4. Automatización y artifacts regenerables

- `scripts/setup.sh` y `scripts/setup.ps1` refrescan `.atl/skill-registry.md`.
- `scripts/validate-structure.sh` valida la estructura base del repo.
- `.atl/skill-registry.md` es regenerable; no debe editarse como fuente única.

## Flujo completo para un solo change

1. Alinear la estructura base si hace falta.
2. Explorar `docs/product/` y los changes existentes.
3. Crear o actualizar `changes/<change-name>/proposal.md`.
4. Continuar con `spec.md`, `design.md`, `tasks.md` y `verify`.
5. Aplicar cambios estructurales o de implementación.
6. Regenerar artifacts auxiliares.
7. Validar estructura y consistencia.
8. Abrir un único PR enfocado en un solo change principal.

## Compatibilidad preservada

La alineación del framework no modifica el contenido existente de `docs/product/` ni reubica los changes vigentes. La nueva capa documental referencia esos artifacts en lugar de reemplazarlos.
