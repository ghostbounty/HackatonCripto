# Proposal: traceable-humanitarian-delivery-on-avalanche

## Contexto

En escenarios de desastre natural, el problema no es solo mover ayuda, sino demostrar que realmente llego a la ultima milla sin desvio, corrupcion o perdida operativa. El valor del MVP no esta en coordinar voluntariado de forma general, sino en cerrar esta secuencia:

1. evento fisico de entrega verificado,
2. prueba registrada,
3. liberacion programable de fondos.

## Objetivo del change

Construir un MVP de hackathon donde:

- un sponsor bloquea fondos en un contrato escrow sobre Avalanche C-Chain,
- la operacion de campo registra una entrega de lote con QR + geolocalizacion + timestamp,
- el evento puede capturarse offline,
- al sincronizarse y validarse el hito, el contrato libera fondos al actor correspondiente segun reglas predefinidas,
- el flujo completo se demuestra en una demo de 2 a 3 minutos.

## Alcance

### Incluido

- sponsor crea una campaign de ayuda y deposita fondos,
- definicion de milestones con montos y destinatarios,
- registro de entregas de lotes por operador,
- captura de QR, geolocalizacion, timestamp y operador autenticado,
- almacenamiento offline local en IndexedDB,
- sincronizacion posterior al backend,
- consolidacion de entregas por milestone,
- liberacion de payout al cumplirse un milestone.

### Excluido

- reputacion o auditoria comunitaria,
- Avalanche L1 propia,
- Teleporter o ICM,
- x402 como flujo principal,
- hardware fisico real,
- biometria,
- KYC fuerte de damnificados,
- liberacion por cada unidad individual en tiempo real.

## Riesgos reconocidos

- verdad del mundo fisico: la blockchain no valida por si sola si la entrega fue genuina,
- GPS debil o manipulable: para hackathon se acepta como evidencia suficiente,
- sync inconsistente: se mitiga con append-only log y hash encadenado,
- demasiado alcance: se mitiga dejando fuera capacidades no esenciales.

## Rollback

Si el alcance resulta demasiado grande, el rollback seguro es conservar:

- `MilestoneEscrow` basico,
- una sola campaign de demo,
- un milestone principal,
- una sola captura offline y un solo release programable.

## Criterio inicial de exito

El change se considera encaminado si deja listos artifacts SDD y slices capaces de demostrar funding, captura offline, sync y release dentro del flujo del hackathon.
