# Reglas del dominio

## Objetivo del dominio

El sistema busca demostrar que la ayuda humanitaria puede seguir una secuencia verificable desde la custodia de fondos hasta la entrega fisica y la liberacion de pagos por hitos.

## Actores

- `Sponsor`: deposita fondos y espera evidencia verificable.
- `ONG ejecutora`: coordina campanas, lotes y operacion.
- `Operator`: registra entregas en campo.
- `Provider`: puede recibir parte del payout al cumplirse un milestone.
- `Backend verificador`: consolida evidencia y dispara la liberacion on-chain.

## Entidades principales

### Campaign

- representa una campana humanitaria financiada,
- debe tener sponsor wallet,
- debe tener estado y monto total.

### Milestone

- representa una condicion de liberacion,
- pertenece a una campaign,
- define payout rules y estado.

### DeliveryLot

- representa una unidad logistica trazable,
- debe tener QR unico,
- debe pertenecer a una campaign.

### DeliveryEvent

- representa la prueba capturada en campo,
- debe incluir `lot_id`, `operator_id`, GPS y timestamp,
- puede incluir identidad minima opcional del receptor,
- debe registrar `device_nonce`, `local_hash`, `previous_hash` y `sync_status`.

### PayoutRule

- define quienes reciben fondos al cumplirse un milestone,
- la suma de porcentajes debe cubrir el total del milestone.

### PayoutExecution

- registra la ejecucion on-chain del hito,
- debe guardar `tx_hash`, monto, fecha y snapshot de destinatarios.

## Reglas funcionales

- RF-01: el sponsor debe poder bloquear fondos para una campaign.
- RF-02: el sistema debe permitir definir multiples milestones por campaign.
- RF-03: cada milestone debe poder distribuir fondos a multiples actores.
- RF-04: el operador debe poder registrar una entrega mediante QR.
- RF-05: el sistema debe capturar GPS y timestamp del evento.
- RF-06: la identidad del beneficiario sera opcional y minima.
- RF-07: la app debe funcionar sin conectividad temporal.
- RF-08: los eventos offline deben sincronizarse luego sin perder orden logico.
- RF-09: el backend debe prevenir duplicacion de eventos por lote.
- RF-10: el contrato debe impedir liberar dos veces el mismo milestone.

## Reglas de offline-first

- la PWA debe permitir registrar entregas sin internet,
- cada evento se guarda en IndexedDB,
- cada evento mantiene integridad secuencial con `previous_hash` y `local_hash`,
- al sincronizar, el backend valida formato, pertenencia y duplicados.

## Reglas de payout

- el payout ocurre por milestone, no por unidad individual,
- el release se dispara solo despues de consolidar evidencia suficiente,
- la evidencia completa queda off-chain,
- on-chain solo vive un digest resumido de la prueba.

## Regla de demo

La demo debe poder completarse en menos de 3 minutos y cubrir funding, captura offline, sync y release sin depender de infraestructura fuera de alcance del hackathon.
