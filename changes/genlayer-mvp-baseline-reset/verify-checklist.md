# Verify Checklist: genlayer-mvp-baseline-reset

## Estructura

- [x] `docs/product/` sigue presente en la misma ubicacion.
- [x] Los `changes/` historicos siguen presentes.
- [x] Existe `docs/archive-boundary.md`.
- [x] Existe `genlayer-mvp/` como baseline activo.
- [x] Existe `legacy/marketplace-demo/` como area archivada.

## Framing activo

- [x] `README.md` apunta al baseline activo.
- [x] `docs/architecture.md` describe solo la tesis vigente.
- [x] `docs/testing-strategy.md` mantiene `accepted` y `finalized` como estados distintos.
- [x] `.github/` mantiene trazabilidad por change y `progress.md`.
- [x] Las skills activas siguen el loop SDD sin depender del framing legado.

## Preservacion

- [x] `docs/product/` no fue reescrito por este change.
- [x] Los `changes/` historicos no fueron reescritos por este change.
- [x] El legado tecnico queda archivado y no presentado como baseline.

## Validacion

- [x] `scripts/setup.sh` o `scripts/setup.ps1` ejecutado.
- [x] `scripts/validate-structure.sh` o `scripts/validate-structure.ps1` ejecutado.
- [x] `progress.md` actualizado con el estado real posterior a testing y verify.
