# HackatonCripto

Repositorio base para un MVP de GenLayer centrado en decisiones subjetivas auditables y ejecutables on-chain. La experiencia activa del repo parte de un baseline limpio para adjudicacion, mientras `docs/product/` y `changes/` anteriores se conservan como historial preservado.

## Fuente activa de verdad

Para trabajo actual, leer en este orden:

1. `AGENTS.md`
2. `docs/architecture.md`
3. `docs/design-system.md` si el slice toca UI o evidencia visual
4. `docs/archive-boundary.md`
5. `genlayer-mvp/README.md`
6. `docs/testing-strategy.md`

## Tesis operativa actual

La tesis activa del framework es:

- decisiones subjetivas auditables y ejecutables on-chain alrededor de GenLayer

El caso canonico del baseline es:

- aceptar o rechazar evidencia estructurada para liberar sponsorship o cerrar un milestone solo cuando la adjudicacion del Intelligent Contract lo respalde

La UX y los artifacts deben distinguir siempre:

- `accepted` como decision aceptada por consenso inicial
- `finalized` como estado final estable del protocolo

## Baseline activo

El baseline activo vive en `genlayer-mvp/` y expone un scaffold minimo para:

- intake del caso
- politica de evidencia
- receipts y estados observables
- puntos de integracion con GenLayer

Ese scaffold es la ruta por defecto para nuevos cambios. `backend/` y `frontend/` ya no son rutas activas del baseline.

## Material preservado

- `docs/product/` permanece intacto como contexto historico del hackathon
- `changes/` existentes permanecen intactos como historial legado
- `legacy/marketplace-demo/` conserva la implementacion previa solo como referencia archivada

Ese material puede consultarse, pero no define el MVP actual. La frontera exacta esta en `docs/archive-boundary.md`.

## Flujo de trabajo recomendado

1. Leer `AGENTS.md`, `docs/architecture.md` y `docs/archive-boundary.md`.
2. Leer `docs/design-system.md` cuando el slice toque frontend, layout o evidencia visual.
3. Revisar `docs/product/` solo como contexto preservado.
4. Crear o actualizar un unico `changes/<change-name>/`.
5. Mantener `proposal/spec/design/tasks/progress/verify`.
6. Implementar contra `genlayer-mvp/` o contra el framework activo, no contra el material archivado.
7. Ejecutar `scripts/setup.sh` o `scripts/setup.ps1` si cambian skills.
8. Ejecutar `scripts/validate-structure.sh` o `scripts/validate-structure.ps1`.
9. Abrir un PR con un solo change principal.

## Estructura raiz esperada

- `AGENTS.md`
- `README.md`
- `CONTRIBUTING.md`
- `genlayer-mvp/`
- `legacy/`
- `skills/`
- `scripts/`
- `examples/`
- `docs/`
- `changes/`
- `.atl/`
- `.github/`

## Comandos utiles

```bash
./scripts/install.sh
./scripts/setup.sh
./scripts/validate-structure.sh
pwsh ./scripts/install.ps1
pwsh ./scripts/setup.ps1
pwsh ./scripts/validate-structure.ps1
```

## Lecturas relacionadas

- Arquitectura activa: `docs/architecture.md`
- Sistema de diseno operativo: `docs/design-system.md`
- Frontera de archivo: `docs/archive-boundary.md`
- Scaffold activo: `genlayer-mvp/README.md`
- Instalacion y bootstrap: `docs/installation.md`
- Conceptos del flujo: `docs/concepts.md`
- Persistencia de artifacts: `docs/persistence.md`
- Estrategia de testing y seeds: `docs/testing-strategy.md`, `docs/seed-fixtures.md`
