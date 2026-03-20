# AGENTS.md

## Proposito

Este archivo es el contrato operativo principal del repositorio para agentes autonomos de vibecoding. Define como orientarse, que artifacts consultar primero, que flujo seguir por cada slice del MVP y en que condiciones el agente puede continuar, reintentar o detenerse.

El framework ya no vende como tesis central "financiamiento visible en testnet". Su tesis operativa pasa a ser "decisiones subjetivas auditables y ejecutables on-chain" alrededor de GenLayer.

## Tesis operativa del MVP

- Tratar el MVP como un sistema de adjudicacion inteligente y auditable, no como un port cosmetico de un marketplace Ethereum.
- Usar como caso canonico una sola decision dificil por slice. El ejemplo principal del framework es:
  - liberar sponsorship o cerrar un hito solo si la evidencia de cumplimiento fue adjudicada por un Intelligent Contract en GenLayer.
- Mantener la IA dentro de un perimetro pequeno:
  - inputs estructurados,
  - politica de evidencia definida,
  - outputs restringidos,
  - justificacion breve y auditable.
- La decision del contrato debe modelarse con enums acotados como:
  - `APPROVED`
  - `REJECTED`
  - `NEEDS_REVISION`
  - `UNDETERMINED` cuando el slice realmente lo requiera.

## Contexto obligatorio del dominio

- Tratar `docs/product/` como la fuente de verdad funcional y de negocio historica del hackathon.
- Preservar y consultar especialmente:
  - `docs/product/hackathon-vision.md`
  - `docs/product/domain-rules.md`
  - `docs/product/blockchain-scope.md`
  - `docs/product/demo-script.md`
- No mover, reescribir ni romper artifacts existentes en `docs/product/`.
- No reescribir ni romper los `changes/` existentes. Deben tratarse como historial legado preservado aunque el framing operativo actual haya pivotado a GenLayer.

## Frontera activa del repo

- Tratar `genlayer-mvp/` como el baseline activo para trabajo nuevo.
- Tratar `legacy/marketplace-demo/` como archivo tecnico preservado, no como ruta activa del MVP.
- Consultar `docs/archive-boundary.md` cuando exista duda sobre si una ruta es normativa o historica.

## Lugar obligatorio de artifacts por change

Cada cambio debe vivir en `changes/<change-name>/` y mantener, segun corresponda, los siguientes artifacts:

- `proposal.md`
- `spec.md`
- `design.md`
- `tasks.md`
- `progress.md`
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

## Requisitos minimos por slice

Cada slice debe dejar explicitados, antes de implementarse:

- una decision subjetiva estrecha y auditable,
- inputs estructurados del caso,
- outputs restringidos y observables,
- politica de evidencia y fuentes permitidas,
- criterio de aceptacion funcional,
- criterio de testing y verify,
- diferencia entre estado de negocio y estado del protocolo.

El estado de negocio recomendado para el caso canonico del framework es:

- `draft`
- `funded`
- `evidence_submitted`
- `under_adjudication`
- `accepted`
- `finalized`
- `needs_revision`
- `undetermined`
- `appealed`
- `canceled`

Cuando el slice toque GenLayer, la UX y el backend deben distinguir al menos:

- `accepted` como decision aceptada por consenso inicial,
- `finalized` como estado final estable del protocolo.

No mostrar "resuelto" antes de tiempo.

## Politica de evidencia

- Diseñar una politica de evidencia antes de programar el slice.
- No permitir que texto libre del usuario sea la unica base de decision.
- Preferir evidencia estructurada y fuentes permitidas por lista corta.
- Separar prueba fuerte de contexto auxiliar.
- Si el contrato consulta web o APIs, documentar equivalencia, validacion y limites de seguridad.
- Considerar prompt injection como riesgo explicito cuando el slice use lenguaje natural o conectividad externa.

## Politica de autonomia

- Explorar antes de preguntar. El agente debe intentar resolver dudas con lectura del repo, docs, scripts, changes y configuraciones antes de escalar al usuario.
- Preferir decisiones derivables del repo. Si una decision puede inferirse desde artifacts existentes, no se debe abrir una pregunta.
- Registrar supuestos. Cuando falte contexto no critico, el agente debe dejar el supuesto por escrito en el artifact correspondiente o en la evidencia de verify.
- Persistir el handoff. El agente debe actualizar `changes/<change-name>/progress.md` en cada checkpoint, antes de cualquier `stop`, `retry-needed` o cambio de slice.
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
- Esa evidencia debe quedar persistida en `changes/<change-name>/progress.md`, no solo en mensajes o PRs.

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

- El slice tiene objetivo, criterio de aceptacion y decision subjetiva explicitados.
- Los cambios aplicados son minimos y trazables a un change.
- Las seeds demo requeridas para formularios y endpoints fueron preparadas o verificadas.
- Los journeys principales se validaron con Playwright CLI o con evidencia equivalente prevista por `sdd-test`.
- La politica de evidencia del caso esta documentada.
- Existe evidencia de los estados relevantes del caso y, si aplica, del receipt en `ACCEPTED` y `FINALIZED`.
- `progress.md` refleja el estado real mas reciente del slice y el siguiente paso exacto para otro agente.
- `sdd-verify` confirma consistencia del repo, del change y de los artifacts operativos.

Si cualquiera de estos puntos falla, el agente debe volver a `sdd-apply`, `sdd-test` o detenerse.

## Estrategia de testing obligatoria

- La herramienta estandar para journeys end-to-end del repo es Playwright CLI.
- "Pathwright" se normaliza como Playwright CLI dentro de este framework.
- Las seeds demo son parte del contrato de prueba y deben representar fixtures del caso principal de adjudicacion:
  - proyecto o caso,
  - sponsor o funding,
  - tarea o milestone,
  - evidencia estructurada,
  - adjudicacion o receipt,
  - appeal opcional como stretch.
- Las pruebas deben cubrir al menos formularios y endpoints relevantes del slice antes de habilitar el siguiente avance.
- La demo debe aspirar a cubrir, como minimo, estos escenarios:
  - evidencia suficiente -> `APPROVED`,
  - evidencia debil -> `NEEDS_REVISION`,
  - evidencia contradictoria -> `REJECTED` o `UNDETERMINED`,
  - receipt visible en `ACCEPTED` y luego en `FINALIZED`.
- El resultado de cada checkpoint debe registrarse en `changes/<change-name>/progress.md` con:
  - estado general,
  - slice actual,
  - ultimo gate aprobado,
  - trabajo completado,
  - trabajo pendiente inmediato,
  - bloqueos activos,
  - decisiones y supuestos vigentes,
  - politica de evidencia vigente,
  - ultima evidencia de testing o verify,
  - siguiente paso exacto para el siguiente agente.

## Skills disponibles en `skills/`

| Skill | Rol | Trigger principal | Salida esperada |
| --- | --- | --- | --- |
| `skills/sdd-init/` | produccion | Crear o alinear la estructura base del repo o del change | Prechecks, rutas y estructura minima |
| `skills/sdd-explore/` | produccion | Entender contexto funcional, tecnico y de evidencia antes de decidir | Notas de contexto, riesgos y mapa de impacto |
| `skills/sdd-propose/` | produccion | Redactar o ajustar `proposal.md` | Propuesta del slice o change |
| `skills/sdd-spec/` | produccion | Redactar o ajustar `spec.md` | Delta funcional, estados y escenarios |
| `skills/sdd-design/` | produccion | Redactar o ajustar `design.md` | Diseno tecnico, limites de IA y politica de evidencia |
| `skills/sdd-tasks/` | produccion | Desglosar trabajo en slices verificables | Checklist accionable con tests y gates |
| `skills/sdd-apply/` | produccion | Implementar artifacts o codigo alineado al slice activo | Cambios aplicados y listos para probar |
| `skills/sdd-test/` | gate | Preparar entorno, seeds y pruebas Playwright CLI | Evidencia de pass/fail para forms, endpoints y estados de adjudicacion |
| `skills/sdd-verify/` | gate | Verificar estructura, consistencia y readiness para avanzar | Checklist y validaciones de gate |
| `skills/issue-creation/` | soporte | Sincronizar backlog desde un change | Issue draft o issue trazable |
| `skills/branch-pr/` | soporte | Preparar branch y PR con un solo change principal | Resumen de entrega y checklist de revision |
| `skills/sdd-archive/` | cierre | Cerrar o archivar el change ya verificado | Estado final y continuidad documentada |
| `skills/skill-registry/` | soporte | Regenerar `.atl/skill-registry.md` | Catalogo actualizado |

## Triggers sugeridos

- Si el usuario pide "alinear framework", "bootstrap", "setup del repo" o "estructura base", activar `sdd-init`.
- Si el usuario pide "entender el contexto", "revisar docs/product", "mapear impacto" o "definir politica de evidencia", activar `sdd-explore`.
- Si el usuario pide "proposal", "spec", "design", "tasks" o "verify", activar la skill correspondiente.
- Si el usuario pide "testing", "playwright", "pathwright", "journeys", "forms", "endpoints", "seed data" o "accepted/finalized", activar `sdd-test`.
- Si el usuario pide "registrar skills", "actualizar indice" o "regenerar catalogo", activar `skill-registry`.
- Si el usuario pide "abrir issue", activar `issue-creation`.
- Si el usuario pide "abrir PR", "dejar listo el PR" o "preparar branch", activar `branch-pr`.

## Reglas operativas

- Leer `README.md` y `docs/architecture.md` para entender el marco del repositorio.
- Leer `docs/archive-boundary.md` antes de reutilizar material legado.
- Consultar `docs/product/` antes de proponer cambios funcionales.
- Implementar trabajo nuevo contra `genlayer-mvp/` o contra docs activas, no contra `legacy/`.
- Tratar los `changes/` existentes como historial legado preservado, no como tesis vigente obligatoria del framework.
- Mantener un solo change por PR siempre que sea posible.
- Usar `.atl/skill-registry.md` como indice regenerable, no como fuente unica de verdad.
- Usar `scripts/install.sh` o `scripts/install.ps1` para prechecks del entorno autonomo.
- Usar `scripts/setup.sh` o `scripts/setup.ps1` para regenerar artifacts auxiliares.
- Usar `scripts/validate-structure.sh` o `scripts/validate-structure.ps1` antes de abrir o actualizar un PR y despues de cambios relevantes al framework.
- Guardar artifacts de Playwright bajo `output/playwright/` si se generan evidencias locales.
- No cambiar de slice ni cerrar sesion operativa sin actualizar `progress.md`.

## Condiciones de stop

El agente debe detenerse y no continuar al siguiente slice si ocurre cualquiera de estas condiciones:

- falla `sdd-test`,
- falla `sdd-verify`,
- no existe evidencia suficiente para aprobar el gate,
- se detecta riesgo de alterar `docs/product/` o changes preservados,
- el mismo problema persiste despues de 2 reintentos dirigidos,
- falta una decision de producto o acceso que el repo no puede resolver.

## Rutas clave

- Dominio funcional preservado: `docs/product/`
- Framework de trabajo: `docs/`
- Baseline activo: `genlayer-mvp/`
- Archivo tecnico: `legacy/marketplace-demo/`
- Changes: `changes/`
- Skills: `skills/`
- Indice regenerable: `.atl/skill-registry.md`
- Automatizacion: `scripts/`
- Templates de colaboracion: `.github/`
- Evidencia opcional local: `output/playwright/`
