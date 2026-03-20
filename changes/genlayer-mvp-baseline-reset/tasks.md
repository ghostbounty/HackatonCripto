# Tasks: GenLayer MVP baseline reset

## Slice 1 - Archive boundary and active baseline

- [x] Crear `docs/archive-boundary.md`.
- [x] Crear `genlayer-mvp/` con scaffold minimo.
- [x] Mover la implementacion previa a `legacy/marketplace-demo/`.
- [x] Agregar nota explicita de archivo en la ruta legacy.
- Acceptance: el repo distingue claramente baseline activo y archivo.
- Testing: validar estructura, rutas y textos base.
- Verify gate: confirmar que `docs/product/` y `changes/` historicos siguen intactos.

## Slice 2 - Framework alignment

- [x] Realinear `README.md`, `docs/`, `.github/` y skills activas al baseline de GenLayer.
- [x] Actualizar scripts de bootstrap y validacion.
- [x] Regenerar `.atl/skill-registry.md`.
- Acceptance: las superficies activas describen solo la tesis vigente.
- Testing: correr validacion estructural y revisar guardas de lenguaje legado.
- Verify gate: confirmar consistencia entre docs, skills, scripts y registry.

## Slice 3 - Persisted handoff

- [x] Completar `proposal/spec/design/tasks/progress/verify-checklist`.
- [x] Registrar evidencia de testing y verify.
- [x] Dejar siguiente paso exacto para el siguiente agente.
- Acceptance: otro agente puede retomar el repo sin reinterpretar el historial.
- Testing: lectura cruzada de `progress.md` y `verify-checklist.md`.
- Verify gate: change listo para PR unico.
