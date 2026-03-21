# Design: traceable-humanitarian-delivery-on-avalanche

## Resumen tecnico

El MVP se organiza en cuatro capas:

1. `Sponsor UI` para campaign funding.
2. `Field PWA` para captura QR + GPS + timestamp con soporte offline-first.
3. `Backend verificador` para sync, deduplicacion y consolidacion de milestones.
4. `MilestoneEscrow` en Avalanche C-Chain para custodia y release.

Para las superficies de interfaz del MVP, el repo agrega una capa visual transversal en `DESIGN.md`. Ese artifact rige Sponsor UI, NGO console y Field PWA cuando el slice afecte componentes, formularios, layout o estilo. El `design.md` del change sigue concentrado en arquitectura tecnica, flujos, persistencia y testabilidad.

## Componentes principales

### Blockchain

- Red: Avalanche C-Chain.
- Contrato: `MilestoneEscrow`.
- Responsabilidades:
  - recibir fondos,
  - definir milestones,
  - bloquear doble release,
  - distribuir pagos a multiples wallets.

### Frontend

- Sponsor dashboard para crear y financiar campaigns.
- Consola operativa para ONG.
- PWA de campo para registro de delivery events.
- Todas estas superficies deben derivar sus decisiones visuales de `DESIGN.md` cuando el slice impacte UI.

### Backend

- API para campaigns, milestones, delivery lots y delivery events.
- Validacion de estructura, pertenencia y duplicados.
- Consolidacion de evidencia por milestone.
- Relayer para `releaseMilestone`.

### Persistencia

- IndexedDB para cola offline.
- PostgreSQL para campaigns, milestones, lots, events y payout executions.

## Modelo de dominio minimo

- `Campaign`
- `Milestone`
- `DeliveryLot`
- `DeliveryEvent`
- `PayoutRule`
- `PayoutExecution`

## Decisiones clave

- Se usa Avalanche C-Chain, no una L1 propia.
- El payout se hace por milestone, no por cada unidad individual.
- La evidencia completa queda off-chain; on-chain solo vive un digest.
- La integridad offline se simula con hash encadenado y orden secuencial razonable, no con hardware confiable.
- `DESIGN.md` es la fuente de verdad visual transversal; este artifact documenta como aterrizarla por slice sin reemplazarla.
- Los slices puramente backend o blockchain no necesitan forzar referencias visuales salvo que expongan interfaz o formularios.

## Tradeoffs

- Se acepta evidencia operativa suficiente, no forense.
- Se privilegia una demo fluida y defendible por encima de features accesorias.
- El backend conserva un rol fuerte como agregador y verificador antes del release.

## Testabilidad

Las pruebas deben cubrir:

- funding de campaign,
- captura de delivery event,
- persistencia offline,
- sync al backend,
- consolidacion de milestone,
- release on-chain.
- En slices UI, tambien debe existir evidencia de alineacion con `DESIGN.md` o nota breve de desviacion controlada.
