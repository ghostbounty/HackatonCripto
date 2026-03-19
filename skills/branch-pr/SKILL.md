---
name: branch-pr
description: Preparar la entrega de un change en una rama y un PR coherentes. Usar cuando el trabajo ya fue aplicado y verificado, y se necesite resumir alcance, checks, artifacts afectados y criterio de aceptación para revisión.
---

# Propósito

Empaquetar un change único en un PR claro y revisable.

# Cuándo usarla

Usar al final del flujo, antes de abrir o actualizar un PR.

# Inputs

- Diff final del repo
- Evidencia de verify
- Templates de `.github/PULL_REQUEST_TEMPLATE.md`

# Pasos esperados

1. Confirmar un change principal por PR.
2. Resumir artifacts y alcance.
3. Referir validaciones ejecutadas.
4. Preparar mensaje de branch/PR alineado al cambio.

# Outputs / artifacts

- Resumen para PR
- Checklist de revisión

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
