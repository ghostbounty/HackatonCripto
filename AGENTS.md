# AGENTS.md

## Proposito

Este archivo es el contrato operativo principal del repositorio para agentes autonomos de vibecoding. Define como orientarse, que artifacts consultar primero, que flujo seguir por cada slice del MVP y en que condiciones el agente puede continuar, reintentar o detenerse.

## Contexto obligatorio del dominio

- Tratar `docs/product/` como la fuente de verdad funcional y de negocio del hackathon.
- Preservar y consultar especialmente:
  - `docs/product/hackathon-vision.md`
  - `docs/product/domain-rules.md`
  - `docs/product/blockchain-scope.md`
  - `docs/product/demo-script.md`
- No mover, reescribir ni romper artifacts existentes en `docs/product/` ni en `changes/`.

## Lugar obligatorio de artifacts por change

Cada cambio debe vivir en `changes/<change-name>/` y mantener, segun corresponda, los siguientes artifacts:

- `proposal.md`
- `spec.md`
- `design.md`
- `tasks.md`
- `verify-checklist.md` o `verify.md`

## Flujo obligatorio por slice

Todo slice del MVP debe seguir este flujo, en este orden:

1. `sdd-init`
2. `sdd-explore`
3. `sdd-propose`
4. `sdd-spec`
5. `sdd-design`
6. `sdd-tasks`
7. `sdd-apply`
8. `sdd-test`
9. `sdd-verify`
10. `decision-gate`
11. `next-slice` o `stop`

Ninguna skill puede saltarse el gate anterior. `sdd-apply` no habilita avanzar por si sola. `sdd-test` y `sdd-verify` son obligatorias antes de continuar con el siguiente slice.

## Politica de autonomia

- Explorar antes de preguntar. El agente debe intentar resolver dudas con lectura del repo, docs, scripts, changes y configuraciones antes de escalar al usuario.
- Preferir decisiones derivables del repo. Si una decision puede inferirse desde artifacts existentes, no se debe abrir una pregunta.
- Registrar supuestos. Cuando falte contexto no critico, el agente debe dejar el supuesto por escrito en el artifact correspondiente o en la evidencia de verify.
- Trabajar en slices pequenos. Cada iteracion debe producir un avance acotado, verificable y reversible.
- No avanzar sin pruebas. Un slice no se considera terminado hasta pasar seeds demo, pruebas Playwright CLI y verificacion estructural.
- Detenerse ante evidencia insuficiente. Si falla testing, verify o el contexto no permite una decision segura, el agente debe corregir o detenerse con evidencia breve y accionable.

## Politica de checkpoints

- Ejecutar un checkpoint despues de cada cambio relevante de codigo, docs operativas o estructura.
- No acumular una sesion larga sin volver a correr validaciones.
- Dejar evidencia corta y accionable del estado actual:
  - que slice esta en curso,
  - que gate paso,
  - que gate fallo,
  - que sigue o por que se detiene.

## Politica de reintentos y escalacion

- Limite por defecto: hasta 2 reintentos dirigidos por gate fallido antes de escalar.
- Reintento dirigido significa ajustar solo lo necesario para resolver la falla detectada, no abrir un refactor amplio.
- Si un mismo gate falla 2 veces por la misma causa, el agente debe:
  - detener el avance al siguiente slice,
  - resumir causa, impacto y evidencia,
  - proponer el siguiente paso minimo seguro.
- Solo escalar al usuario cuando:
  - el repo no contiene la informacion necesaria,
  - existe una decision de producto con impacto alto,
  - o la falla no puede aislarse sin riesgo de romper artifacts preservados.

## Decision gate

El gate entre slices solo puede aprobarse si se cumplen todos estos criterios:

- El slice tiene objetivo y criterio de aceptacion explicitados.
- Los cambios aplicados son minimos y trazables a un change.
- Las seeds demo requeridas para formularios y endpoints fueron preparadas o verificadas.
- Los journeys principales se validaron con Playwright CLI o con evidencia equivalente prevista por `sdd-test`.
- `sdd-verify` confirma consistencia del repo, del change y de los artifacts operativos.

Si cualquiera de estos puntos falla, el agente debe volver a `sdd-apply`, `sdd-test` o detenerse.

## Estrategia de testing obligatoria

- La herramienta estandar para journeys end-to-end del repo es Playwright CLI.
- "Pathwright" se normaliza como Playwright CLI dentro de este framework.
- Las seeds demo son parte del contrato de prueba y deben representar fixtures del marketplace de la demo:
  - proyecto,
  - voluntario,
  - tarea,
  - merito,
  - sponsorship.
- Las pruebas deben cubrir al menos formularios y endpoints relevantes del slice antes de habilitar el siguiente avance.

## Skills disponibles en `skills/`

| Skill | Rol | Trigger principal | Salida esperada |
| --- | --- | --- | --- |
| `skills/sdd-init/` | produccion | Crear o alinear la estructura base del repo o del change | Prechecks, rutas y estructura minima |
| `skills/sdd-explore/` | produccion | Entender contexto funcional y tecnico antes de decidir | Notas de contexto, riesgos y mapa de impacto |
| `skills/sdd-propose/` | produccion | Redactar o ajustar `proposal.md` | Propuesta del slice o change |
| `skills/sdd-spec/` | produccion | Redactar o ajustar `spec.md` | Delta funcional y escenarios |
| `skills/sdd-design/` | produccion | Redactar o ajustar `design.md` | Diseno tecnico y decisiones |
| `skills/sdd-tasks/` | produccion | Desglosar trabajo en slices verificables | Checklist accionable con tests y gates |
| `skills/sdd-apply/` | produccion | Implementar artifacts o codigo alineado al slice activo | Cambios aplicados y listos para probar |
| `skills/sdd-test/` | gate | Preparar entorno, seeds y pruebas Playwright CLI | Evidencia de pass/fail para forms y endpoints |
| `skills/sdd-verify/` | gate | Verificar estructura, consistencia y readiness para avanzar | Checklist y validaciones de gate |
| `skills/issue-creation/` | soporte | Sincronizar backlog desde un change | Issue draft o issue trazable |
| `skills/branch-pr/` | soporte | Preparar branch y PR con un solo change principal | Resumen de entrega y checklist de revision |
| `skills/sdd-archive/` | cierre | Cerrar o archivar el change ya verificado | Estado final y continuidad documentada |
| `skills/skill-registry/` | soporte | Regenerar `.atl/skill-registry.md` | Catalogo actualizado |

## Triggers sugeridos

- Si el usuario pide "alinear framework", "bootstrap", "setup del repo" o "estructura base", activar `sdd-init`.
- Si el usuario pide "entender el contexto", "revisar docs/product" o "mapear impacto", activar `sdd-explore`.
- Si el usuario pide "proposal", "spec", "design", "tasks" o "verify", activar la skill correspondiente.
- Si el usuario pide "testing", "playwright", "pathwright", "journeys", "forms", "endpoints" o "seed data", activar `sdd-test`.
- Si el usuario pide "registrar skills", "actualizar indice" o "regenerar catalogo", activar `skill-registry`.
- Si el usuario pide "abrir issue", activar `issue-creation`.
- Si el usuario pide "abrir PR", "dejar listo el PR" o "preparar branch", activar `branch-pr`.

## Reglas operativas

- Leer `README.md` y `docs/architecture.md` para entender el marco del repositorio.
- Consultar `docs/product/` antes de proponer cambios funcionales.
- Mantener un solo change por PR siempre que sea posible.
- Usar `.atl/skill-registry.md` como indice regenerable, no como fuente unica de verdad.
- Usar `scripts/install.sh` o `scripts/install.ps1` para prechecks del entorno autonomo.
- Usar `scripts/setup.sh` o `scripts/setup.ps1` para regenerar artifacts auxiliares.
- Usar `scripts/validate-structure.sh` o `scripts/validate-structure.ps1` antes de abrir o actualizar un PR y despues de cambios relevantes al framework.
- Guardar artifacts de Playwright bajo `output/playwright/` si se generan evidencias locales.

## Condiciones de stop

El agente debe detenerse y no continuar al siguiente slice si ocurre cualquiera de estas condiciones:

- falla `sdd-test`,
- falla `sdd-verify`,
- no existe evidencia suficiente para aprobar el gate,
- se detecta riesgo de alterar `docs/product/` o changes preservados,
- el mismo problema persiste despues de 2 reintentos dirigidos,
- falta una decision de producto o acceso que el repo no puede resolver.

## Rutas clave

- Dominio funcional: `docs/product/`
- Framework de trabajo: `docs/`
- Changes: `changes/`
- Skills: `skills/`
- Indice regenerable: `.atl/skill-registry.md`
- Automatizacion: `scripts/`
- Templates de colaboracion: `.github/`
- Evidencia opcional local: `output/playwright/`
