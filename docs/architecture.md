# Arquitectura operativa del framework

## Objetivo

Este repositorio combina tres capas que deben convivir sin interferirse:

1. Capa funcional del dominio en `docs/product/`.
2. Capa visual transversal en `DESIGN.md`.
3. Capa operativa del framework en `docs/`, `skills/`, `scripts/`, `.atl/`, `.github/` y `examples/`.

La arquitectura busca permitir sesiones largas de vibecoding con alta autonomia, sin perder el foco del hackathon: demostrar trazabilidad de entrega humanitaria y liberacion programable de fondos por hitos.

El nombre visible de la plataforma documentada por este framework es `Proof of Hand`.

## Principios de operacion

- El agente trabaja por slices pequenos y verificables.
- Ningun slice se considera completo sin `sdd-test` y `sdd-verify`.
- El repo debe dar suficiente contexto para explorar antes de preguntar.
- El framework debe decirle al agente cuando continuar, cuando reintentar y cuando detenerse.
- El dominio vigente prioriza demo creible sobre infraestructura maximalista.

## Capas principales

### 1. Contexto funcional del dominio

`docs/product/` conserva el contexto del MVP del hackathon y sigue siendo la fuente de verdad de negocio. Referencias principales:

- `docs/product/hackathon-vision.md`
- `docs/product/domain-rules.md`
- `docs/product/blockchain-scope.md`
- `docs/product/demo-script.md`

### 2. Contexto visual transversal

`DESIGN.md` define el lenguaje visual comun del repo para Sponsor UI, NGO console, Field PWA y cualquier slice de formularios o frontend. Su funcion es:

- fijar principios de color, tipografia, spacing y jerarquia visual,
- establecer reglas de componentes y layout,
- evitar que cada slice UI invente una estetica incompatible,
- servir de input obligatorio para `sdd-explore`, `sdd-design`, `sdd-test` y `sdd-verify` cuando el slice toca interfaz.

`DESIGN.md` no reemplaza el `design.md` del change. El artifact por change sigue describiendo arquitectura tecnica, flujos, persistencia e integraciones del slice.

### 3. Unidad de cambio

`changes/<change-name>/` es el contenedor obligatorio de trabajo para cada PR o iniciativa trazable. Debe reunir, segun aplique:

- `proposal.md`
- `spec.md`
- `design.md`
- `tasks.md`
- `progress.md`
- `verify-checklist.md` o `verify.md`

El change principal recomendado del repo es `traceable-humanitarian-delivery-on-avalanche`.

### 4. Capa de skills

`skills/` organiza el flujo SDD en skills discretas. El orden operativo recomendado y obligatorio por slice es:

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

Para slices UI, el flujo debe propagar tambien restricciones visuales desde `DESIGN.md` hacia `spec.md`, `design.md`, `tasks.md`, `sdd-test` y `sdd-verify`.

### 5. Capa de testing y evidencia

La validacion de comportamiento del framework se apoya en:

- Playwright CLI como herramienta estandar de journeys
- seeds demo alineadas al dominio humanitario
- evidencia corta de `pass`, `retry-needed` o `stop`
- `progress.md` como handoff persistente del estado del slice
- evidencia visual breve contra `DESIGN.md` cuando el slice afecta interfaz

El objetivo no es que el agente programe indefinidamente, sino que avance de forma segura y medible.

### 6. Automatizacion y artifacts regenerables

- `scripts/install.sh` y `scripts/install.ps1` validan prerequisitos del entorno autonomo.
- `scripts/setup.sh` y `scripts/setup.ps1` regeneran `.atl/skill-registry.md`.
- `scripts/validate-structure.sh` y `scripts/validate-structure.ps1` validan la estructura base del repo y la coherencia del loop autonomo.
- `.atl/skill-registry.md` es regenerable; no debe editarse como fuente unica.

## Decision gate

Entre slices existe una compuerta explicita. El agente solo puede continuar si:

- el slice tiene criterio de aceptacion claro,
- hay evidencia de seeds y testing,
- si hay interfaz afectada, hay evidencia de alineacion con `DESIGN.md`,
- `progress.md` refleja el estado vivo mas reciente,
- la estructura sigue alineada,
- no existen fallas repetidas sin resolver.

Si el gate falla, el agente corrige el slice actual o se detiene con contexto accionable.

## Arquitectura funcional del MVP

La arquitectura del producto que este framework documenta es:

- `Proof of Hand`: nombre visible de la plataforma y de la demo,
- `Sponsor UI`: inicia campanas y bloquea fondos.
- `Field PWA`: registra QR, geolocalizacion y timestamp con soporte offline-first.
- `Backend verificador`: consolida eventos, deduplica y decide si un hito esta cumplido.
- `MilestoneEscrow` en Avalanche C-Chain: custodia fondos y libera payouts una sola vez por hito.

La division de responsabilidad es deliberada:

- la app de campo captura evidencia del mundo fisico,
- el backend resume y valida integridad operativa,
- la blockchain custodia y ejecuta reglas de liberacion.

## Compatibilidad preservada

La alineacion del framework no mueve los changes historicos ni reemplaza su valor como referencia. El repo cambia su dominio vigente, pero preserva el historial documental como contexto complementario.
