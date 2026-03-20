# Persistencia y compatibilidad de artifacts

## Principio base

La alineacion del framework agrega estructura y reencuadra la tesis operativa, pero no reemplaza la persistencia documental existente.

## Que debe permanecer estable

- `docs/product/` como contexto funcional preservado.
- `changes/` como historial y unidad de trabajo.
- `legacy/` como area de archivo explicita para implementaciones previas.
- `.gitattributes` como configuracion existente de fin de linea.

## Que es regenerable

- `.atl/skill-registry.md`
- Cualquier indice auxiliar documentado por `scripts/setup.*`

## Contrato de compatibilidad

- No mover artifacts funcionales existentes.
- No asumir que un change nuevo invalida los changes previos.
- Tratar los changes existentes como historial legado cuando el framing operativo actual los exceda.
- Referir la frontera entre activo y legado desde `README.md`, `AGENTS.md` y `docs/architecture.md`.
