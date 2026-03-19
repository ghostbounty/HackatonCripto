---
name: sdd-verify
description: Verificar que un change y la estructura del repositorio cumplan criterios explícitos. Usar cuando se deban ejecutar checks, completar verify-checklist, validar skills, scripts y compatibilidad con docs/product y changes existentes.
---

# Propósito

Comprobar consistencia, completitud y criterios de aceptación antes del PR.

# Cuándo usarla

Usar después de aplicar cambios y antes de archivar o abrir PR.

# Inputs

- Cambio aplicado
- `scripts/validate-structure.sh`
- `verify-checklist.md` o `verify.md`

# Pasos esperados

1. Ejecutar validaciones automáticas.
2. Revisar estructura y links críticos.
3. Completar o actualizar artifacts de verify.
4. Dejar estado listo para PR.

# Outputs / artifacts

- Evidencia de validación
- `verify-checklist.md` actualizado si aplica

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
