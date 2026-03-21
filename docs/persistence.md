# Persistencia y compatibilidad de artifacts

## Principio base

La alineacion del framework agrega estructura pero no reemplaza la persistencia documental existente.

## Que debe permanecer estable

- `docs/product/` como contexto funcional vigente.
- `changes/` como historial y unidad de trabajo.
- `.gitattributes` como configuracion existente de fin de linea.

## Que es regenerable

- `.atl/skill-registry.md`
- cualquier indice auxiliar documentado por `scripts/setup.*`

## Contrato de compatibilidad

- No mover artifacts funcionales existentes.
- No asumir que un change nuevo invalida los changes previos.
- Referir los documents preservados desde `README.md`, `AGENTS.md` y `docs/architecture.md`.

## Persistencia del dominio vigente

El hecho de reescribir `docs/product/` cambia la fuente de verdad del repo, pero no autoriza a borrar los changes historicos. El framework debe poder convivir con:

- un dominio vigente humanitario,
- changes historicos del dominio anterior,
- evidencia nueva en `changes/traceable-humanitarian-delivery-on-avalanche/`.
