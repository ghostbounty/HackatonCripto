---
name: skill-registry
description: Regenerar y mantener el índice de skills del repositorio en .atl/skill-registry.md. Usar cuando se agreguen, renombren o ajusten skills, triggers, inputs u outputs y se necesite sincronizar el catálogo operativo.
---

# Propósito

Mantener un catálogo regenerable y confiable de las skills disponibles.

# Cuándo usarla

Usar cada vez que cambie `skills/` o se requiera validar su cobertura.

# Inputs

- Carpetas bajo `skills/`
- Frontmatter y cuerpo de cada `SKILL.md`
- Scripts de setup

# Pasos esperados

1. Leer la metadata esencial de cada `SKILL.md`.
2. Extraer trigger, inputs y outputs declarados.
3. Regenerar `.atl/skill-registry.md`.
4. Validar que el registro y `skills/` sigan alineados.

# Outputs / artifacts

- `.atl/skill-registry.md`

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
