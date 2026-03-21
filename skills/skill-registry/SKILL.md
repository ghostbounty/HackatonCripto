---
name: skill-registry
description: Regenerar y mantener el indice de skills del repositorio en .atl/skill-registry.md a partir de la metadata actualizada del flujo SDD.
---

# Proposito

Mantener un catalogo regenerable, confiable y alineado con el loop autonomo.

# Cuando usarla

Usar cada vez que cambie `skills/` o se requiera validar su cobertura.

# Inputs

- Carpetas bajo `skills/`
- Frontmatter y cuerpo de cada `SKILL.md`
- Scripts de setup

# Outputs / artifacts

- `.atl/skill-registry.md`

# Done criteria

- El registry lista todas las skills activas del flujo.
- Se distinguen skills de produccion, gate y soporte cuando la metadata lo permita.
- El catalogo queda alineado con `AGENTS.md` y `docs/`.

# Blocking criteria

- Hay skills sin `SKILL.md`.
- La metadata no permite reconstruir el catalogo de forma confiable.

# Next allowed skill

- `sdd-verify`

# Pasos esperados

1. Leer la metadata esencial de cada `SKILL.md`.
2. Extraer trigger, inputs, outputs y gates declarados.
3. Regenerar `.atl/skill-registry.md`.
4. Validar que el registro y `skills/` sigan alineados.

# Reglas de autonomia

- El registry siempre es derivado. No debe ser la unica fuente de verdad.
- Si hay desalineacion entre skills y registry, regenerar antes de continuar.

# Rutas concretas del repo

- `skills/`
- `.atl/`
- `scripts/`
