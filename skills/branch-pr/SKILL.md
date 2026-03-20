---
name: branch-pr
description: Preparar la entrega de un change en una rama y un PR coherentes. Usar cuando el trabajo ya fue aplicado, probado y verificado, y se necesite resumir alcance, checks, artifacts afectados y criterio de aceptacion para revision.
---

# Proposito

Empaquetar un change unico en un PR claro, revisable y consistente con el gate autonomo.

# Cuando usarla

Usar al final del flujo, antes de abrir o actualizar un PR.

# Inputs

- Diff final del repo
- Evidencia de `sdd-test` y `sdd-verify`
- Templates de `.github/PULL_REQUEST_TEMPLATE.md`

# Outputs / artifacts

- Resumen para PR
- Checklist de revision

# Done criteria

- Existe un change principal por PR.
- El resumen incluye fase o slice, seeds usadas, politica de evidencia y evidencia de testing.
- El PR deja claro si el agente puede seguir o si debe detenerse.

# Blocking criteria

- El change no paso verify.
- No hay evidencia suficiente de testing o decision-gate.

# Next allowed skill

- `sdd-archive` o `stop`

# Pasos esperados

1. Confirmar un change principal por PR.
2. Resumir artifacts, fase y alcance.
3. Referir validaciones ejecutadas.
4. Preparar mensaje de branch o PR alineado al cambio.

# Reglas de autonomia

- No abrir PR con gates fallidos.
- El resumen debe ser suficiente para que otra persona o agente continue sin reconstruir contexto desde cero.

# Rutas concretas del repo

- `.github/`
- `changes/`
- `.atl/`
