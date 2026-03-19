---
name: sdd-design
description: Redactar o ajustar el diseño técnico de un change en changes/<change-name>/design.md. Usar cuando la spec requiera decisiones de arquitectura, modelo de datos, integración, persistencia o tradeoffs antes de ejecutar tareas.
---

# Propósito

Bajar la spec a decisiones técnicas concretas y justificadas.

# Cuándo usarla

Usar cuando el change necesite arquitectura, flujos técnicos o decisiones de persistencia.

# Inputs

- `spec.md`
- `docs/architecture.md`
- Restricciones técnicas del repo

# Pasos esperados

1. Identificar componentes afectados.
2. Definir flujos, interfaces y persistencia.
3. Registrar decisiones pendientes y tradeoffs.
4. Alinear el diseño con los artifacts existentes.

# Outputs / artifacts

- `changes/<change-name>/design.md`

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
