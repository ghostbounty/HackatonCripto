---
name: sdd-explore
description: Explorar el contexto funcional y técnico existente antes de proponer cambios. Usar cuando sea necesario leer docs/product, changes vigentes y documentación marco para comprender alcance, restricciones e impacto.
---

# Propósito

Comprender el estado actual del dominio y del framework antes de redactar o aplicar cambios.

# Cuándo usarla

Usar al inicio de un change o antes de ajustar specs, diseño o tareas.

# Inputs

- `docs/product/`
- `changes/<change-name>/`
- `docs/architecture.md` y `README.md`

# Pasos esperados

1. Leer `docs/product/`.
2. Identificar changes relacionados en `changes/`.
3. Resumir restricciones, dependencias y decisiones previas.
4. Dejar mapa de impacto para proposal/spec/design/tasks.

# Outputs / artifacts

- Resumen de contexto
- Riesgos y dependencias
- Referencias para el change activo

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
