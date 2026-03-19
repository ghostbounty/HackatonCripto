---
name: sdd-apply
description: Aplicar cambios en documentación, código o estructura siguiendo el change activo. Usar cuando proposal, spec, design y tasks ya definieron qué debe implementarse o alinearse dentro del repositorio.
---

# Propósito

Ejecutar el change preservando trazabilidad y compatibilidad estructural.

# Cuándo usarla

Usar al materializar artifacts o implementación derivada del change.

# Inputs

- Artifacts del change activo
- Convenciones del repo
- Scripts de setup/validación

# Pasos esperados

1. Aplicar cambios mínimos necesarios.
2. Mantener enlaces entre docs, skills y changes.
3. Regenerar artifacts auxiliares cuando corresponda.
4. Preparar evidencia para verify y PR.

# Outputs / artifacts

- Archivos modificados o creados
- Referencias actualizadas

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
