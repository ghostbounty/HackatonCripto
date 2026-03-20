# Seeds demo para formularios y endpoints

## Objetivo

Estandarizar los datos demo que el agente debe preparar o verificar para probar el MVP del marketplace.

## Fixture base del marketplace

Las seeds estandar deben cubrir, como minimo:

- proyecto publico de demo,
- voluntario postulante o miembro,
- tarea con estado trazable,
- registro de merito,
- sponsorship o aporte de demo.

## Uso esperado

Estas seeds sirven para:

- poblar formularios con datos reproducibles,
- validar endpoints sin depender de data manual,
- soportar el journey del `docs/product/demo-script.md`,
- reducir preguntas al usuario durante sesiones largas.

## Reglas

- Las seeds deben representar el dominio del hackathon, no un dominio generico ajeno.
- Si un slice requiere solo una parte del fixture base, el agente puede usar un subconjunto, pero debe declararlo.
- Si faltan seeds criticas, `sdd-test` no puede aprobar el gate.

## Evidencia requerida

Cada validacion debe indicar:

- que fixture del marketplace se uso,
- que formulario o endpoint dependia de ella,
- si la semilla existia, fue regenerada o quedo pendiente.
