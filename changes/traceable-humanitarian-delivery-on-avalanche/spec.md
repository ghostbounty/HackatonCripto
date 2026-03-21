# Spec: traceable-humanitarian-delivery-on-avalanche

## ADDED Requirements

### Requirement: Campaign funding in escrow

El sistema MUST permitir que un sponsor bloquee fondos para una campaign en Avalanche C-Chain.

#### Scenario: Sponsor funds a campaign

- **Given** una campaign creada y una wallet conectada
- **When** el sponsor ejecuta la accion de funding
- **Then** los fondos quedan registrados en escrow para esa campaign

### Requirement: Milestones with programmable payout

El sistema MUST permitir definir milestones con monto total, destinatarios y porcentajes de payout.

#### Scenario: Configure milestone recipients

- **Given** una campaign activa
- **When** se define un milestone con wallets y basis points
- **Then** el sistema guarda la configuracion y la suma de porcentajes equivale al total del hito

### Requirement: Delivery event capture

El sistema MUST permitir que un operador registre una entrega de lote por QR con GPS y timestamp.

#### Scenario: Register delivery event

- **Given** un delivery lot valido
- **When** el operador escanea el QR y confirma ubicacion
- **Then** se crea un `DeliveryEvent` con datos del operador, GPS y timestamp

### Requirement: Offline-first event queue

La PWA MUST poder registrar `DeliveryEvent` sin conectividad y sincronizarlos despues sin perder orden logico.

#### Scenario: Store event while offline

- **Given** que no hay internet
- **When** se registra un `DeliveryEvent`
- **Then** el evento queda almacenado localmente con `pending_sync`

#### Scenario: Sync pending events

- **Given** eventos pendientes en la cola local
- **When** vuelve la conectividad y se sincroniza
- **Then** los eventos llegan al backend y quedan marcados como sincronizados

### Requirement: Milestone release after verification

El backend MUST poder consolidar evidencia de delivery y disparar `releaseMilestone` una sola vez por hito.

#### Scenario: Release milestone payout

- **Given** un milestone cuya condicion ya se cumplio
- **When** el backend invoca `releaseMilestone`
- **Then** el contrato distribuye fondos segun las payout rules

#### Scenario: Prevent duplicate release

- **Given** un milestone ya ejecutado
- **When** se intenta ejecutar otra vez
- **Then** la transaccion revierte

## MODIFIED Requirements

### Requirement: Source of truth for hackathon domain

El repo MUST tratar `docs/product/` como la fuente de verdad del dominio vigente y reflejar alli el MVP humanitario en lugar del marketplace previo.

#### Scenario: Framework references current domain

- **Given** el framework operativo del repo
- **When** un agente lee `AGENTS.md`, `docs/` y `skills/`
- **Then** encuentra referencias normativas al flujo de funding, delivery, sync y release

### Requirement: Repo-level visual source of truth for UI slices

El repo MUST tratar `DESIGN.md` como la fuente de verdad visual transversal para slices que afecten Sponsor UI, NGO console, Field PWA, formularios, layout o frontend.

#### Scenario: UI slice reads visual contract

- **Given** un slice que modifica superficies de interfaz
- **When** un agente recorre `AGENTS.md`, `docs/`, `skills/` y el change activo
- **Then** encuentra que `DESIGN.md` debe consultarse y que `changes/<change-name>/design.md` sigue siendo el artifact tecnico del slice

## Acceptance Criteria

- AC-01: funding de campaign deja fondos en escrow.
- AC-02: escaneo de QR + GPS + timestamp crea un `DeliveryEvent`.
- AC-03: sin internet, el `DeliveryEvent` queda como `pending_sync`.
- AC-04: al volver la conectividad, los eventos llegan al backend y quedan `synced`.
- AC-05: al cumplirse el milestone, `releaseMilestone` transfiere fondos segun payout rules.
- AC-06: un milestone ya ejecutado no puede liberarse dos veces.
- AC-07: los slices UI del framework referencian `DESIGN.md` como contrato visual transversal.
