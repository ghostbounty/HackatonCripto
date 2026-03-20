# Seeds demo para formularios y endpoints

## Objetivo

Estandarizar los datos demo que el agente debe preparar o verificar para probar el MVP del caso de adjudicacion.

## Fixture base del caso canonico

Las seeds estandar deben cubrir, como minimo:

- caso publico de demo con pregunta de adjudicacion,
- sponsor o funding asociado,
- tarea o milestone con criterio de aceptacion,
- evidencia estructurada con URLs o referencias permitidas,
- solicitud de adjudicacion y receipt asociado,
- appeal opcional como stretch.

## Uso esperado

Estas seeds sirven para:

- poblar formularios con datos reproducibles,
- validar endpoints sin depender de data manual,
- soportar un journey de adjudicacion auditable,
- reducir preguntas al usuario durante sesiones largas.

## Politica de datos demo

- Las seeds deben representar el dominio del hackathon, no un dominio generico ajeno.
- Deben alinearse al baseline activo de `genlayer-mvp/`, aunque se inspiren en el contexto preservado de `docs/product/`.
- Si un slice requiere solo una parte del fixture base, el agente puede usar un subconjunto, pero debe declararlo.
- Si faltan seeds criticas, `sdd-test` no puede aprobar el gate.
- La evidencia de usuario libre no debe ser la unica semilla de un caso.

## Evidencia requerida

Cada validacion debe indicar:

- que fixture del caso se uso,
- que formulario o endpoint dependia de ella,
- si la semilla existia, fue regenerada o quedo pendiente,
- que senales del fixture se trataron como prueba fuerte y cuales como contexto auxiliar.
