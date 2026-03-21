# Estrategia de testing

## Objetivo

Definir una estrategia de pruebas que permita a un agente validar sus avances con baja supervision antes de pasar a la siguiente fase del MVP.

## Herramienta estandar

- Playwright CLI es la herramienta estandar para validar journeys end-to-end.
- "Pathwright" se interpreta como Playwright CLI dentro de este repositorio.
- Si el entorno no puede ejecutar Playwright CLI, el agente debe detener el gate o dejar evidencia de la limitacion.

## Cobertura minima por slice

Cada slice debe validar, segun aplique:

- formularios afectados,
- endpoints afectados,
- journey principal de usuario ligado al slice,
- alineacion visual con `DESIGN.md` para superficies UI o PWA,
- evidencia breve de resultado.

## Journeys minimos del MVP vigente

- sponsor crea o financia una campaign en escrow,
- operador registra entrega con QR + GPS + timestamp,
- el sistema soporta captura offline antes de sincronizar,
- la entrega puede guardarse sin conectividad,
- los eventos pendientes se sincronizan,
- el backend consolida el hito,
- el contrato libera el payout segun reglas.

## Evidencia minima

El resultado de testing debe poder clasificarse como:

- `pass`
- `retry-needed`
- `stop`

La evidencia debe indicar:

- que seeds demo se usaron,
- que journey se probo,
- que formulario o endpoint se valido,
- que comprobacion visual o de UI se realizo cuando el slice afecta interfaz,
- que fallo o paso.

## Relacion con verify

`sdd-verify` consume la evidencia de `sdd-test`. Si el testing no entrega evidencia suficiente, verify no puede aprobar el gate.

## Recomendaciones operativas

- Guardar artifacts locales en `output/playwright/` cuando haga falta.
- Repetir pruebas pequenas y dirigidas despues de cada cambio relevante.
- No sustituir pruebas por inspeccion superficial del codigo.
- Priorizar la prueba del flujo demo antes que coberturas accesorias.
- Si el slice toca interfaz, comparar la implementacion contra `DESIGN.md` y dejar nota breve de cumplimiento o desviacion.
