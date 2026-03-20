# Spec: GenLayer MVP baseline reset

## ADDED

### Requirement: Archive boundary

El repositorio MUST exponer una frontera explicita entre baseline activo y material preservado.

#### Scenario: Active onboarding path

- Given una persona clona el repo
- When sigue `README.md`
- Then encuentra `AGENTS.md`, `docs/archive-boundary.md` y `genlayer-mvp/README.md` como ruta de entrada activa
- And no necesita inferir desde material legado cual es el MVP actual

### Requirement: Active GenLayer scaffold

El repositorio MUST incluir un scaffold minimo en `genlayer-mvp/` para intake del caso, politica de evidencia, receipts y puntos de integracion.

#### Scenario: New slice starts from active scaffold

- Given un agente inicia un change nuevo
- When revisa el baseline activo
- Then encuentra contratos minimos para caso, evidencia, receipt e integracion
- And `accepted` y `finalized` aparecen como estados distintos

### Requirement: Archive of previous app path

La implementacion previa MUST dejar de presentarse como baseline activo y quedar bajo una ruta archivada.

#### Scenario: Legacy app is still preserved

- Given una persona necesita consultar el historial tecnico
- When navega a `legacy/marketplace-demo/`
- Then encuentra la implementacion previa con una nota explicita de archivo
- And el root del repo no la presenta como la ruta recomendada para trabajo nuevo

## MODIFIED

### Requirement: Framework-facing docs describe only the active thesis

`README.md`, `docs/`, `.github/`, `skills/` y `scripts/validate-structure.*` MUST describir la tesis activa de adjudicacion sobre GenLayer en sus superficies normativas.

#### Scenario: Legacy framing blocked in active docs

- Given un cambio reintroduce framing operativo legado en docs activas
- When se ejecuta `scripts/validate-structure.*`
- Then la validacion falla
- And el repo no puede declararse listo para avanzar de slice

### Requirement: Validation covers archive boundary

Las validaciones estructurales MUST comprobar presencia de rutas activas y preservadas.

#### Scenario: Required paths exist

- Given el repo fue alineado
- When corre `scripts/validate-structure.*`
- Then valida `genlayer-mvp/`, `legacy/marketplace-demo/`, `docs/product/` y el change de reset
- And confirma que el baseline activo y el archivo siguen separados
