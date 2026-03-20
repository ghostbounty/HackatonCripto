# Design: GenLayer MVP baseline reset

## Overview

El reset separa el repo en tres dominios de lectura:

- preservado: `docs/product/`
- activo: `genlayer-mvp/` y docs operativas
- archivado: `legacy/marketplace-demo/`

La meta no es borrar historia, sino impedir que el historial se lea como producto vigente.

## Information architecture

- `README.md` orienta a la ruta activa.
- `docs/archive-boundary.md` explica la frontera.
- `genlayer-mvp/` ofrece el scaffold tecnico minimo.
- `legacy/marketplace-demo/` conserva la implementacion anterior con etiquetado de archivo.
- `changes/genlayer-mvp-baseline-reset/` documenta el reset y deja el handoff persistente.

## Validation strategy

`scripts/validate-structure.*` validan:

- rutas raiz requeridas,
- rutas activas y archivadas obligatorias,
- preservacion de `docs/product/` y `changes/` historicos,
- presencia del nuevo change,
- ausencia de framing legado en docs activas clave.

La deteccion de lenguaje legado se limita a superficies activas para no romper artifacts preservados.

## Active scaffold shape

`genlayer-mvp/` usa un scaffold documental minimo en lugar de una app completa:

- `cases/` define intake estructurado,
- `evidence-policies/` define la politica de evidencia,
- `receipts/` fuerza la separacion entre decision y estado visible,
- `integration/` fija el punto de entrada esperado para GenLayerJS.

Esto deja un baseline listo para futuros slices sin arrastrar supuestos del app legado.

## Risks and mitigations

- Mezcla accidental entre activo y legado: mitigada con frontera documentada y validaciones.
- Perdida de contexto tecnico util: mitigada archivando, no destruyendo.
- Falta de implementacion ejecutable en el baseline activo: mitigada declarando explicitamente que `genlayer-mvp/` es un scaffold listo para la siguiente iteracion.
