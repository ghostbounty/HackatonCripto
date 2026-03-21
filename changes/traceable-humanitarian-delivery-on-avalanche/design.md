# Design: traceable-humanitarian-delivery-on-avalanche

## Resumen tecnico

El MVP se organiza en cuatro capas:

1. `Sponsor UI` para campaign funding.
2. `Field PWA` para captura QR + GPS + timestamp con soporte offline-first.
3. `Backend verificador` para sync, deduplicacion y consolidacion de milestones.
4. `MilestoneEscrow` en Avalanche C-Chain para custodia y release.

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
