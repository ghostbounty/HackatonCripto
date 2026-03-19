---
name: sdd-spec
description: Redactar o ajustar la especificación delta de un change en changes/<change-name>/spec.md. Usar cuando sea necesario formalizar requisitos ADDED, MODIFIED, REMOVED y escenarios de aceptación sobre la base de docs/product.
---

# Propósito

Formalizar el comportamiento esperado del change de manera trazable y verificable.

# Cuándo usarla

Usar después de la propuesta y antes de diseño o implementación.

# Inputs

- `proposal.md`
- Reglas de `docs/product/`
- Changes relacionados en `changes/`

# Pasos esperados

1. Traducir intención a deltas claros.
2. Redactar secciones `ADDED`, `MODIFIED` o `REMOVED`.
3. Añadir escenarios Given/When/Then.
4. Revisar consistencia con el dominio.

# Outputs / artifacts

- `changes/<change-name>/spec.md`

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
