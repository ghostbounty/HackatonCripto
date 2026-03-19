---
name: sdd-init
description: Inicializar o alinear la estructura base de un repositorio orientado a specification-driven development. Usar cuando se necesite crear o reparar la capa estructural del repo, verificar la presencia de docs, changes, skills, scripts, .atl o templates de colaboración.
---

# Propósito

Inicializar la estructura operativa mínima del repositorio sin romper `docs/product/` ni `changes/`.

# Cuándo usarla

Usar al crear el framework base, al bootstrappear un repo o al detectar carpetas raíz faltantes.

# Inputs

- Estado actual de la raíz del repo.
- Contenido existente en `docs/product/` y `changes/`.
- Reglas operativas definidas en `AGENTS.md`.

# Pasos esperados

1. Inspeccionar la raíz del repositorio.
2. Preservar `docs/product/` como contexto funcional.
3. Preservar `changes/` existentes.
4. Crear o alinear `skills/`, `scripts/`, `examples/`, `.atl/`, `.github/` y documentación raíz.
5. Dejar instrucciones claras para setup y validación.

# Outputs / artifacts

- `AGENTS.md`
- `README.md`
- `CONTRIBUTING.md`
- Estructura base del framework

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
