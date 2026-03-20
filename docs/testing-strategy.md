# Estrategia de testing

## Objetivo

Definir una estrategia de pruebas que permita a un agente validar sus avances con baja supervision antes de pasar a la siguiente fase del MVP de adjudicacion GenLayer.

## Herramienta estandar

- Playwright CLI es la herramienta estandar para validar journeys end-to-end.
- "Pathwright" se interpreta como Playwright CLI dentro de este repositorio.
- Si el entorno no puede ejecutar Playwright CLI, el agente debe detener el gate o dejar evidencia de la limitacion.

## Enfoque del baseline activo

El baseline activo no asume un marketplace heredado. Las pruebas deben validar el flujo canonico de adjudicacion en `genlayer-mvp/` o en el slice activo que lo extienda.

## Cobertura minima por slice

Cada slice debe validar, segun aplique:

- formularios afectados,
- endpoints afectados,
- journey principal de usuario ligado al slice,
- politica de evidencia activa,
- estado visible del caso,
- estado visible del receipt,
- evidencia breve de resultado.

## Escenarios minimos del caso canonico

La demo y los slices relacionados con adjudicacion deben aspirar a cubrir al menos:

- evidencia suficiente -> `APPROVED`,
- evidencia debil -> `NEEDS_REVISION`,
- evidencia contradictoria -> `REJECTED` o `UNDETERMINED`,
- visualizacion de receipt primero en `ACCEPTED` y luego en `FINALIZED`.

## Evidencia minima

El resultado de testing debe poder clasificarse como:

- `pass`
- `retry-needed`
- `stop`

La evidencia debe indicar:

- que seeds demo se usaron,
- que journey se probo,
- que formulario o endpoint se valido,
- que politica de evidencia se aplico,
- que estado del caso y del receipt se observo,
- que fallo o paso.

## Relacion con verify

`sdd-verify` consume la evidencia de `sdd-test`. Si el testing no entrega evidencia suficiente, verify no puede aprobar el gate.

## Recomendaciones operativas

- Guardar artifacts locales en `output/playwright/` cuando haga falta.
- Repetir pruebas pequenas y dirigidas despues de cada cambio relevante.
- No sustituir pruebas por inspeccion superficial del codigo.
- Si el slice usa web/API/LLM, preferir mocks o fixtures reproducibles antes de depender de llamadas abiertas.
