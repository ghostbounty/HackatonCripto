# Arquitectura operativa del framework

## Objetivo

Este repositorio separa tres capas con contratos distintos:

1. `docs/product/` como dominio historico preservado.
2. `genlayer-mvp/` como baseline activo para nuevos slices.
3. `legacy/` como archivo de implementaciones previas que no deben guiar trabajo nuevo.

La arquitectura busca que cualquier agente pueda retomar el repo sin confundir el material preservado con la direccion activa del MVP.

Cuando un slice toque UI o evidencia visual, `docs/design-system.md` complementa esta arquitectura con el contrato visual de la superficie activa.

## Tesis operativa actual

El framework existe para construir un MVP de adjudicacion inteligente y auditable sobre GenLayer.

Caso canonico:

- un sponsor fondea un caso o milestone,
- el ejecutor presenta evidencia estructurada segun una politica definida,
- un Intelligent Contract formula una pregunta estrecha y emite una decision acotada,
- la app muestra decision, justificacion breve y estado del receipt,
- el timeline off-chain avanza por `accepted` y luego `finalized`.

## Principios de operacion

- El agente trabaja por slices pequenos y verificables.
- Ningun slice se considera completo sin `sdd-test` y `sdd-verify`.
- La politica de evidencia se disena antes de implementar.
- La IA opera con inputs estructurados, fuentes permitidas y outputs restringidos.
- El baseline activo debe verse limpio aunque el historial legado permanezca accesible.

## Frontera entre activo y legado

`docs/product/` y los `changes/` historicos se preservan sin reescritura. Su valor es contextual, no normativo para el baseline actual.

El trabajo nuevo debe seguir:

- `AGENTS.md`
- `docs/archive-boundary.md`
- `genlayer-mvp/README.md`

El material en `legacy/marketplace-demo/` queda fuera de la ruta recomendada para nuevos cambios.

## Unidad de cambio

`changes/<change-name>/` es el contenedor obligatorio para cada iniciativa trazable. Debe reunir, segun aplique:

- `proposal.md`
- `spec.md`
- `design.md`
- `tasks.md`
- `progress.md`
- `verify-checklist.md` o `verify.md`

Los `changes/` previos se preservan como historial. El baseline actual se construye agregando nuevos changes, no reinterpretando los anteriores.

## Modelo operativo del MVP

Estado de negocio recomendado:

- `draft`
- `funded`
- `evidence_submitted`
- `under_adjudication`
- `accepted`
- `finalized`
- `needs_revision`
- `undetermined`
- `appealed`
- `canceled`

El framework exige distinguir:

- decision de negocio,
- estado tecnico del receipt,
- estado visible en UX.

`accepted` y `finalized` no son equivalentes.

## Baseline activo

`genlayer-mvp/` es un scaffold operativo minimo con cuatro zonas:

- `cases/` para el intake estructurado del caso
- `evidence-policies/` para reglas permitidas de evidencia
- `receipts/` para el contrato visible entre decision y protocolo
- `integration/` para puntos de integracion con GenLayerJS

Ese scaffold existe para que la siguiente implementacion parta de un contrato claro y no del legado archivado.

## Distribucion de responsabilidades

- Dominio off-chain: intake, metadata, audit trail y timeline del caso.
- Contrato GenLayer: decision critica, justificacion breve y estado verificable.
- UX del baseline: visualizacion de evidencia, decision y recibos con distincion entre `accepted` y `finalized`.
- SDK recomendado para el camino principal: GenLayerJS.

## Capa de skills

`skills/` organiza el flujo SDD en skills discretas. El orden operativo obligatorio por slice es:

1. `sdd-init`
2. `sdd-explore`
3. `sdd-propose`
4. `sdd-spec`
5. `sdd-design`
6. `sdd-tasks`
7. `sdd-apply`
8. `sdd-test`
9. `sdd-verify`
10. `decision-gate`
11. `next-slice` o `stop`

Para slices visuales, `sdd-design`, `sdd-apply`, `sdd-test` y `sdd-verify` deben consultar o hacer cumplir `docs/design-system.md`.

## Capa de testing y evidencia

La validacion del framework se apoya en:

- Playwright CLI como herramienta estandar de journeys,
- seeds demo del caso de adjudicacion,
- evidencia breve de `pass`, `retry-needed` o `stop`,
- receipts o evidencia equivalente para `ACCEPTED` y `FINALIZED` cuando el slice toca GenLayer.

## Automatizacion y artifacts regenerables

- `scripts/install.*` validan prerequisitos y crean estructura base del baseline activo.
- `scripts/setup.*` regeneran `.atl/skill-registry.md`.
- `scripts/validate-structure.*` validan la frontera entre activo y legado, el lenguaje del pivot y la presencia del nuevo scaffold.
- `.atl/skill-registry.md` es derivado.

## Decision gate

Entre slices existe una compuerta explicita. El agente solo puede continuar si:

- el slice tiene criterio de aceptacion claro,
- existe evidencia de seeds, testing y politica de evidencia,
- hay estados observables del caso,
- `progress.md` refleja el estado vivo mas reciente,
- la estructura sigue alineada con el baseline activo,
- no existen fallas repetidas sin resolver.

Si el gate falla, el agente corrige el slice actual o se detiene con contexto accionable.
