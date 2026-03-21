# Vision para el hackathon

Nuestro hackathon de 24 horas tiene como objetivo demostrar una version end-to-end de entrega humanitaria trazable sobre Avalanche C-Chain. La plataforma se llama `Proof of Hand` y no busca coordinar voluntariado de forma general ni construir una infraestructura blockchain maximalista; su propuesta es cerrar una secuencia simple y defendible:

1. un sponsor bloquea fondos para una campana,
2. la operacion de campo registra la entrega fisica de un lote,
3. la evidencia se captura incluso sin conectividad,
4. al sincronizarse y consolidarse el hito, el contrato libera fondos.

## Desafio del hackathon

En solo un dia tres desarrolladores deben entregar una demo que pruebe la tesis del producto. En lugar de intentar reputacion, biometria, microliquidacion por unidad o una Avalanche L1 propia, nos concentraremos en una lamina fina:

- sponsor financia campaign en escrow,
- se definen milestones y payout rules,
- operador registra entregas con QR + GPS + timestamp,
- la PWA soporta cola offline,
- el backend valida y sincroniza,
- el contrato ejecuta un payout por hito.

## Diferenciador del MVP

El valor del MVP no esta en "poner blockchain" a una app de campo. El diferenciador es unir tres capas que normalmente viven separadas:

- operacion fisica de ultima milla,
- prueba verificable de entrega,
- liquidacion programable de fondos.

La blockchain cumple un rol nitido: custodiar fondos y ejecutar reglas transparentes cuando la operacion produce evidencia suficiente.

## Alcance de la demo

La demo se centra en:

- campaign financiada por sponsor,
- milestones con payout multiple,
- delivery lots trazables por QR,
- captura de delivery events offline-first,
- sync posterior hacia backend,
- release on-chain cuando el milestone se cumple.

Se excluyen:

- reputacion comunitaria,
- biometria,
- KYC fuerte de damnificados,
- hardware fisico especializado,
- Avalanche L1 propia,
- ICM o Teleporter,
- x402 como componente central.

## Resultado esperado

Al final del hackathon presentaremos una aplicacion funcional de `Proof of Hand` donde un sponsor bloquea fondos, un operador registra desde refugio la entrega de un lote y, al sincronizar la evidencia, el sistema libera el pago del hito al actor correspondiente. La demo debe sentirse pragmatica, creible y ejecutable por un equipo pequeno en tiempo limitado.
