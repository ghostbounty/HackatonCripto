---
name: sdd-test
description: Preparar entorno, seeds demo y pruebas Playwright CLI para validar funding, captura offline, sync y release del slice activo.
---

# Proposito

Convertir un slice aplicado en evidencia verificable. Esta skill existe para que el agente compruebe avances sin supervision continua y solo habilite el siguiente paso cuando el comportamiento esperado fue validado.

# Cuando usarla

Usar inmediatamente despues de `sdd-apply` y antes de `sdd-verify`.

# Inputs

- Slice activo ya implementado o alineado
- `docs/product/`
- `DESIGN.md` para comprobar cumplimiento visual en slices UI
- `docs/testing-strategy.md`
- `docs/seed-fixtures.md`
- Scripts de instalacion, setup y validacion
- Entorno local necesario para Playwright CLI y datos demo

# Outputs / artifacts

- Evidencia breve de pass o fail del slice
- Estado de seeds demo usadas
- Referencia a journeys, formularios y endpoints validados
- Hand-off claro para `sdd-verify`
- `progress.md` actualizado con resultado `pass`, `retry-needed` o `stop`

# Done criteria

- El entorno minimo de testing fue comprobado.
- Las seeds demo relevantes al slice existen, se prepararon o se verificaron.
- Se validaron formularios y endpoints del slice con Playwright CLI o con evidencia equivalente prevista por el repo.
- Si el slice toca interfaz, se dejo evidencia breve de conformidad o desviacion respecto de `DESIGN.md`.
- Se registraron claramente resultados, fallas y supuestos.
- Existe una conclusion binaria: `pass`, `retry-needed` o `stop`.
- `progress.md` deja la ultima evidencia de testing y el siguiente paso exacto.

# Blocking criteria

- No hay forma segura de preparar el entorno minimo.
- Faltan seeds criticas para reproducir el flujo.
- Los endpoints o formularios del slice no son accesibles o no tienen evidencia suficiente.
- Playwright CLI no puede ejecutarse y no existe alternativa documentada para el gate.

# Next allowed skill

- `sdd-verify` si el resultado es `pass`
- `sdd-apply` si el resultado es `retry-needed`
- `stop` si el resultado es `stop`

# Pasos esperados

1. Confirmar prerequisitos del entorno autonomo.
2. Preparar o verificar las seeds demo del dominio vigente:
   - sponsor,
   - campaign,
   - milestone,
   - delivery lot,
   - operator,
   - delivery event,
   - payout execution.
3. Ejecutar o guiar la validacion de journeys clave con Playwright CLI.
4. Comprobar formularios y endpoints afectados por el slice.
5. Si el slice afecta interfaz, contrastar componentes y layout contra `DESIGN.md`.
6. Dejar evidencia corta y accionable para el gate siguiente.
7. Registrar el resultado en `progress.md`.

# Reglas de autonomia

- No inventar evidencia. Si no hay pass real, marcar `retry-needed` o `stop`.
- Reintentar hasta 2 veces como maximo cuando la falla sea corregible y acotada.
- Si la misma causa persiste, detener el avance y escalar con contexto.
- No aprobar un slice por inspeccion visual solamente cuando el repo exige validacion de comportamiento.
- El resultado del test no existe para el siguiente agente si no quedo persistido en `progress.md`.

# Rutas concretas del repo

- `docs/product/`
- `DESIGN.md`
- `docs/testing-strategy.md`
- `docs/seed-fixtures.md`
- `scripts/`
- `output/playwright/`
