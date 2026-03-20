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
- evidencia breve de resultado.

## Evidencia minima

El resultado de testing debe poder clasificarse como:

- `pass`
- `retry-needed`
- `stop`

La evidencia debe indicar:

- que seeds demo se usaron,
- que journey se probó,
- que formulario o endpoint se valido,
- que fallo o paso.

## Relacion con verify

`sdd-verify` consume la evidencia de `sdd-test`. Si el testing no entrega evidencia suficiente, verify no puede aprobar el gate.

## Recomendaciones operativas

- Guardar artifacts locales en `output/playwright/` cuando haga falta.
- Repetir pruebas pequenas y dirigidas despues de cada cambio relevante.
- No sustituir pruebas por inspeccion superficial del codigo.
