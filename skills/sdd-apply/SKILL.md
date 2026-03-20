---
name: sdd-apply
description: Aplicar cambios en documentacion, codigo o estructura siguiendo el change activo. Usar cuando proposal, spec, design y tasks ya definieron que debe implementarse o alinearse dentro del repositorio.
---

# Proposito

Ejecutar el slice activo preservando trazabilidad, compatibilidad estructural y readiness para testing inmediato.

# Cuando usarla

Usar al materializar artifacts o implementacion derivada del change.

# Inputs

- Artifacts del change activo
- Convenciones del repo
- `docs/design-system.md` cuando el slice toque UI o evidencia visual
- Scripts de setup y validacion

# Outputs / artifacts

- Archivos modificados o creados
- Referencias actualizadas
- Slice listo para `sdd-test`
- `progress.md` actualizado con cambios aplicados y handoff a test

# Done criteria

- Se aplicaron solo los cambios minimos necesarios del slice.
- Los cambios mantienen enlaces entre docs, skills y changes.
- El slice queda preparado para seeds, formularios, endpoints y estados a validar.
- Si el slice toca UI, la implementacion respeta la guia visual activa y conserva la distincion entre evidencia, decision y receipt.
- Existe un hand-off claro hacia `sdd-test`.
- `progress.md` refleja que cambio y que queda listo para probar.

# Blocking criteria

- El trabajo necesario excede el slice definido.
- La implementacion rompe artifacts preservados o requiere decisiones no resueltas.

# Next allowed skill

- `sdd-test`

# Pasos esperados

1. Aplicar cambios minimos necesarios.
2. Mantener enlaces entre docs, skills y changes.
3. Si el slice toca UI, aplicar la guia visual activa sin colapsar `accepted` y `finalized`.
4. Regenerar artifacts auxiliares cuando corresponda.
5. Preparar evidencia y contexto para testing.
6. Actualizar `progress.md` antes de pasar a `sdd-test`.

# Reglas de autonomia

- No marcar un slice como terminado al finalizar la edicion.
- Si el cambio no puede probarse inmediatamente, reducir el alcance del slice o detenerse.
- Evitar refactors amplios que retrasen el siguiente gate.
- No dejar cambios aplicados sin persistir el estado en `progress.md`.
- Si hubo trabajo visual nuevo, dejar claro en el handoff que `docs/design-system.md` fue consultado.

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
- `scripts/`
