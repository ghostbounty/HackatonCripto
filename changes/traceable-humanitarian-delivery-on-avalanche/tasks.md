# Tasks: traceable-humanitarian-delivery-on-avalanche

## Slice 1: Align framework to the new domain

- [x] Reescribir `docs/product/` para que sea la fuente de verdad del MVP humanitario.
- [x] Alinear `AGENTS.md`, `docs/`, `skills/`, `scripts/` y `.github/`.
- [x] Regenerar `.atl/skill-registry.md`.

Acceptance:

- El framework deja de referenciar normativamente el marketplace anterior.
- El repo valida estructura y dominio vigente con scripts.

Testing and verify:

- Ejecutar `scripts/setup.ps1`.
- Ejecutar `scripts/validate-structure.ps1`.
- Verificar que el registry y los templates reflejen el nuevo dominio.

## Slice 2: Milestone escrow foundation

- [ ] Definir contrato `MilestoneEscrow`.
- [ ] Modelar campaign funding y milestone configuration.
- [ ] Probar bloqueo de doble release.

Acceptance:

- Funding y definicion de milestone son trazables.
- El contrato evita doble ejecucion.

Testing and verify:

- Seeds: sponsor, campaign, milestone.
- Journeys: funding y release fallido por duplicado.

## Slice 3: Field capture and offline queue

- [ ] Implementar captura QR + GPS + timestamp.
- [ ] Guardar `DeliveryEvent` en IndexedDB con `pending_sync`.
- [ ] Encadenar `previous_hash` y `local_hash`.

Acceptance:

- La captura funciona sin conectividad.
- El orden logico local queda preservado.

Testing and verify:

- Seeds: delivery lot, operator.
- Journeys: captura online y captura offline.

## Slice 4: Sync and milestone consolidation

- [ ] Implementar sync de eventos pendientes.
- [ ] Validar deduplicacion y pertenencia de lotes.
- [ ] Consolidar cumplimiento de milestone.

Acceptance:

- El backend puede recibir y consolidar eventos sincronizados.
- No se duplican entregas validas del mismo lote.

Testing and verify:

- Seeds: delivery event, milestone.
- Journeys: sync posterior y consolidacion.

## Slice 5: End-to-end demo

- [ ] Integrar funding, captura, sync y release.
- [ ] Preparar demo de 2 a 3 minutos.
- [ ] Cerrar verify checklist del change.

Acceptance:

- El flujo completo es demostrable de punta a punta.
- La demo mantiene foco y claridad.

Testing and verify:

- Seeds: sponsor, campaign, milestone, delivery lot, operator, payout execution.
- Journeys: demo completa de funding -> captura -> sync -> release.
