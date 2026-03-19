# HackatonCripto

Repositorio base para trabajar cambios orientados a especificación (`changes/`) sobre el dominio funcional del hackathon documentado en `docs/product/`.

## Qué contiene este framework

- Un índice operativo del repositorio en `AGENTS.md`.
- Un conjunto de skills en `skills/` para recorrer un flujo SDD completo.
- Documentación del framework en `docs/` sin alterar los artifacts funcionales de `docs/product/`.
- Scripts en `scripts/` para instalar, preparar y validar la estructura.
- Un registro regenerable de skills en `.atl/skill-registry.md`.
- Templates de colaboración en `.github/`.

## Estructura raíz esperada

La raíz del repo debe exponer explícitamente:

- `AGENTS.md`
- `README.md`
- `CONTRIBUTING.md`
- `skills/`
- `scripts/`
- `examples/`
- `docs/`
- `changes/`
- `.atl/`
- `.github/`

## Contexto funcional preservado

Los siguientes artifacts se preservan como referencia de negocio del hackathon:

- `docs/product/hackathon-vision.md`
- `docs/product/domain-rules.md`
- `docs/product/blockchain-scope.md`
- `docs/product/demo-script.md`

## Changes existentes preservados

- `changes/traceable-volunteering-with-demo-crypto/`
- `changes/stretch-merit-reputation/`

Cada change debe mantener sus artifacts dentro de `changes/<change-name>/` y seguir el patrón `proposal/spec/design/tasks/verify`.

## Flujo recomendado para un solo change por PR

1. Leer `AGENTS.md` y `docs/architecture.md`.
2. Revisar `docs/product/` para entender el contexto funcional.
3. Crear o actualizar `changes/<change-name>/proposal.md`.
4. Continuar con `spec.md`, `design.md`, `tasks.md` y `verify-checklist.md`.
5. Aplicar cambios de implementación si corresponden.
6. Ejecutar `scripts/setup.sh` o `scripts/setup.ps1` para refrescar artifacts auxiliares.
7. Ejecutar `scripts/validate-structure.sh`.
8. Abrir un solo PR que refiera un único change principal y mantenga trazabilidad.

## Criterios de aceptación para este framework alignment

- La estructura raíz debe coincidir con la lista anterior.
- Cada subcarpeta de `skills/` debe contener un `SKILL.md`.
- `docs/product/` y `changes/` deben permanecer compatibles con su estructura actual.
- La documentación debe dejar explícito cómo trabajar un solo change y abrir futuros PRs con el mismo patrón.

## Comandos útiles

```bash
./scripts/setup.sh
./scripts/validate-structure.sh
pwsh ./scripts/setup.ps1
pwsh ./scripts/install.ps1
```

## Lecturas relacionadas

- Framework y decisiones: `docs/architecture.md`
- Instalación y bootstrap: `docs/installation.md`
- Conceptos del flujo: `docs/concepts.md`
- Persistencia de artifacts: `docs/persistence.md`
- Ejemplos para herramientas: `examples/`
