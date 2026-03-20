# GenLayer MVP Baseline

Scaffold minimo para el MVP activo de adjudicacion auditable sobre GenLayer.

## Proposito

Dar una superficie limpia para nuevos cambios sin depender del marketplace legado. Este directorio describe el contrato activo del MVP aunque todavia no contenga una implementacion completa.

## Superficies activas

- `cases/`: intake estructurado del caso y campos minimos
- `evidence-policies/`: politicas permitidas de evidencia
- `receipts/`: semantica visible de `accepted` y `finalized`
- `integration/`: puntos de integracion y contratos esperados con GenLayerJS

## Caso canonico

- sponsor o owner crea un caso
- ejecutor presenta evidencia estructurada
- el contrato decide `APPROVED`, `REJECTED`, `NEEDS_REVISION` o `UNDETERMINED`
- la app refleja `accepted` antes de `finalized`

## Regla operativa

Todo change nuevo que afecte el baseline actual debe referir este scaffold o ampliarlo explicitamente.
