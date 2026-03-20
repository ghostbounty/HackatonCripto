# Progress: genlayer-mvp-baseline-reset

## Estado general

- Estado: `done`
- Resumen breve: se separo el baseline activo de GenLayer del material legado, se introdujo el scaffold `genlayer-mvp/` y se alinearon docs, templates, skills y scripts al nuevo contrato operativo.

## Slice actual

- Slice: baseline reset completo
- Objetivo del slice: dejar una sola ruta activa de onboarding y trabajo nuevo sin reescribir artifacts preservados
- Decision subjetiva del slice: definir que superficies son activas, cuales quedan archivadas y como se evita su interpretacion errada
- Responsable actual: Codex
- Superficie activa o archivada tocada: `README.md`, `docs/`, `scripts/`, `.github/`, `.atl/`, `genlayer-mvp/`, `legacy/marketplace-demo/`

## Ultimo gate aprobado

- Gate: `sdd-verify`
- Fecha o referencia: 2026-03-20
- Nota breve: `setup.ps1` regenero el registry y `validate-structure.ps1` aprobo la frontera entre baseline activo y archivo

## Trabajo completado

- Se creo `docs/archive-boundary.md`.
- Se creo `genlayer-mvp/` como scaffold activo.
- Se movio el app path previo a `legacy/marketplace-demo/`.
- Se actualizaron docs activas, templates, skills y scripts del framework.
- Se preparo el change completo con proposal, spec, design, tasks y verify.

## Trabajo pendiente inmediato

- Ninguno.

## Bloqueos activos

- Ninguno.

## Decisiones y supuestos vigentes

- `docs/product/` y `changes/` historicos permanecen intactos y no normativos para trabajo nuevo.
- `legacy/marketplace-demo/` es archivo, no baseline activo.
- `genlayer-mvp/` es un scaffold minimo listo para futuros slices, no una app completa.

## Politica de evidencia vigente

- Fuentes permitidas: docs activas del repo, estructura real del repo, scripts de validacion, artifacts preservados consultados sin reescritura
- Prueba fuerte: existencia de rutas, textos normativos alineados, validaciones que fallen ante framing legado
- Contexto auxiliar: historial previo del repo y contenido archivado
- Limites o riesgos: el repo no cuenta todavia con una implementacion GenLayer completa, solo con el baseline scaffold

## Ultima evidencia de testing o verify

- Tipo: `sdd-test` y `sdd-verify`
- Resultado: `pass`
- Estados observados: `n/a`
- Referencia: `& .\scripts\setup.ps1` -> `Generated .atl/skill-registry.md`; `& .\scripts\validate-structure.ps1` -> `Structure validation passed`

## Siguiente paso exacto

- Abrir PR con este unico change principal y usar `branch-pr` para resumir el baseline reset con referencia al archivo legado y al scaffold activo.
