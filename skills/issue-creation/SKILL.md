---
name: issue-creation
description: Convertir un change o una parte de sus tasks en issues trazables para seguimiento. Usar cuando se necesite descomponer trabajo en tickets que referencien changes, docs/product y criterios de verificación.
---

# Propósito

Abrir issues alineados al change y al contexto funcional del repositorio.

# Cuándo usarla

Usar cuando el backlog deba reflejar proposal/spec/design/tasks de un change.

# Inputs

- `changes/<change-name>/tasks.md`
- `proposal.md`, `spec.md` o `design.md`
- Templates de `.github/ISSUE_TEMPLATE/`

# Pasos esperados

1. Elegir el fragmento trazable del change.
2. Redactar título, contexto y criterio de aceptación.
3. Vincular el issue con artifacts del repo.
4. Mantener granularidad consistente con un solo change por PR.

# Outputs / artifacts

- Issue draft o issue creado

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
