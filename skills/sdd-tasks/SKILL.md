---
name: sdd-tasks
description: Desglosar un change en tareas accionables dentro de changes/<change-name>/tasks.md. Usar cuando se requiera convertir proposal/spec/design en un plan ejecutable y verificable por fases.
---

# Propósito

Convertir el change en trabajo secuenciado y verificable.

# Cuándo usarla

Usar tras cerrar proposal/spec/design o cuando el checklist necesite mantenimiento.

# Inputs

- `proposal.md`
- `spec.md`
- `design.md`
- Convención compartida de tareas

# Pasos esperados

1. Agrupar trabajo por fase.
2. Crear checklist accionable.
3. Referir rutas y dependencias concretas.
4. Preparar tareas para verificación posterior.

# Outputs / artifacts

- `changes/<change-name>/tasks.md`

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
