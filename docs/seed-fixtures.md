# Seeds demo para formularios y endpoints

## Objetivo

Estandarizar los datos demo que el agente debe preparar o verificar para probar el MVP de entrega humanitaria trazable.

## Fixture base del dominio vigente

Las seeds estandar deben cubrir, como minimo:

- sponsor con wallet de demo,
- campaign financiable,
- milestone con payout rules,
- delivery lot con QR valido,
- operator autenticado para captura de campo,
- delivery event pendiente o sincronizable,
- payout execution o snapshot esperado.

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
- Los datos demo deben poder cubrir funding, captura offline, sync y release de milestone.

## Evidencia requerida

Cada validacion debe indicar:

- que fixture del dominio se uso,
- que formulario o endpoint dependia de ella,
- si la semilla existia, fue regenerada o quedo pendiente.
