# Alcance de blockchain para la demo

Este documento define como se integra la blockchain en la demo del hackathon. El objetivo es mostrar custodia y liberacion programable de fondos sin complejidad infraestructural innecesaria.

## Red elegida

Se utilizara Avalanche C-Chain. Esta eleccion responde a un criterio de realismo de hackathon:

- compatibilidad EVM y tooling conocido,
- menor friccion que una Avalanche L1 propia,
- despliegue rapido con Solidity y Hardhat,
- foco del equipo en el producto y no en operar infraestructura nueva.

## Contrato principal

Se usara un contrato `MilestoneEscrow` con estas responsabilidades:

- recibir fondos del sponsor,
- registrar milestones y payout rules,
- impedir doble ejecucion,
- liberar fondos solo una vez por hito,
- repartir a multiples wallets segun porcentajes predefinidos.

## Funciones minimas esperadas

- `createCampaign(...)`
- `fundCampaign(campaignId)`
- `defineMilestone(campaignId, milestoneId, totalAmount, recipients[], bps[])`
- `releaseMilestone(milestoneId, proofDigest)`
- `getMilestoneStatus(milestoneId)`

## Restricciones

- un milestone no puede ejecutarse dos veces,
- la suma de `bps` debe ser 100%,
- solo un backend o rol autorizado puede llamar `releaseMilestone`,
- `proofDigest` representa evidencia resumida, no evidencia completa.

## Datos on-chain vs off-chain

- On-chain:
  - campaign funding,
  - milestone configuration,
  - payout execution,
  - proof digest del milestone.
- Off-chain:
  - delivery lots,
  - delivery events,
  - GPS,
  - timestamps de dispositivo,
  - deduplicacion,
  - consolidacion de hitos,
  - auditoria detallada.

## Exclusiones explicitas

Quedan fuera del core del MVP:

- Avalanche L1 propia,
- Teleporter o ICM,
- x402 como flujo principal,
- microliquidacion por cada entrega individual,
- almacenamiento on-chain de evidencia completa.

## Tesis tecnica

La blockchain no inventa la verdad del mundo fisico. Su funcion en este MVP es custodiar y liberar fondos cuando la aplicacion y el backend producen una evidencia estructurada suficiente para cumplir un hito.
