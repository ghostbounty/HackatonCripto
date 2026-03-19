# Persistencia y compatibilidad de artifacts

## Principio base

La alineación del framework agrega estructura pero no reemplaza la persistencia documental existente.

## Qué debe permanecer estable

- `docs/product/` como contexto funcional.
- `changes/` como historial y unidad de trabajo.
- `.gitattributes` como configuración existente de fin de línea.

## Qué es regenerable

- `.atl/skill-registry.md`
- Cualquier índice auxiliar documentado por `scripts/setup.*`

## Contrato de compatibilidad

- No mover artifacts funcionales existentes.
- No asumir que un change nuevo invalida los changes previos.
- Referir los documents preservados desde `README.md`, `AGENTS.md` y `docs/architecture.md`.
