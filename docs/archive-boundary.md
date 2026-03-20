# Frontera Entre Baseline Activo y Archivo

## Objetivo

Evitar que el material historico del repo se interprete como la direccion vigente del MVP.

## Baseline activo

Se considera activo y normativo para trabajo nuevo:

- `AGENTS.md`
- `README.md`
- `docs/architecture.md`
- `docs/testing-strategy.md`
- `docs/seed-fixtures.md`
- `genlayer-mvp/`
- `changes/<change-name>/` creados o actualizados para trabajo vigente

## Material preservado

Se considera preservado pero no normativo:

- `docs/product/`
- `changes/` historicos previos al baseline reset
- `legacy/marketplace-demo/`

Ese material puede consultarse para contexto, trazabilidad o rollback historico, pero no debe usarse como baseline para nuevas decisiones de implementacion.

## Regla practica

Si una instruccion nueva contradice el material preservado, prevalece el baseline activo salvo que el change en curso documente explicitamente una razon para apoyarse en el legado.

## Resultado esperado

Cualquier persona que clone el repo debe poder distinguir en pocos minutos:

- que esta vigente,
- que esta archivado,
- y donde empezar trabajo nuevo sin reinterpretar el historial.
