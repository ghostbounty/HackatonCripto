# HackatonCripto

Repositorio base para trabajar cambios orientados a especificacion (`changes/`) sobre el dominio funcional del hackathon documentado en `docs/product/`.

## Que contiene este framework

- Un indice operativo del repositorio en `AGENTS.md`.
- Un conjunto de skills en `skills/` para recorrer un flujo SDD completo.
- Documentacion del framework en `docs/` sin separar el trabajo operativo del dominio vigente.
- Scripts en `scripts/` para instalar, preparar y validar la estructura.
- Un registro regenerable de skills en `.atl/skill-registry.md`.
- Templates de colaboracion en `.github/`.

## Dominio vigente

El repo esta alineado al MVP `traceable-humanitarian-delivery-on-avalanche`.

La tesis del producto es demostrar esta secuencia en una demo de hackathon:

1. un sponsor bloquea fondos en Avalanche C-Chain,
2. un operador registra una entrega de lote con QR + GPS + timestamp,
3. la captura funciona offline y se sincroniza despues,
4. el backend consolida evidencia de hito,
5. el contrato libera el payout programable.

## Estructura raiz esperada

La raiz del repo debe exponer explicitamente:

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

Los siguientes artifacts contienen la fuente de verdad de negocio del MVP:

- `docs/product/hackathon-vision.md`
- `docs/product/domain-rules.md`
- `docs/product/blockchain-scope.md`
- `docs/product/demo-script.md`

## Change principal recomendado

- `changes/traceable-humanitarian-delivery-on-avalanche/`

## Changes historicos preservados

- `changes/traceable-volunteering-with-demo-crypto/`
- `changes/stretch-merit-reputation/`
- `changes/multi-agent-collaboration-protocol/`

Cada change debe mantener sus artifacts dentro de `changes/<change-name>/` y seguir el patron `proposal/spec/design/tasks/progress/verify`.

## Flujo recomendado para un solo change por PR

1. Leer `AGENTS.md` y `docs/architecture.md`.
2. Revisar `docs/product/` para entender el contexto funcional.
3. Crear o actualizar `changes/<change-name>/proposal.md`.
4. Continuar con `spec.md`, `design.md`, `tasks.md`, `progress.md` y `verify-checklist.md`.
5. Aplicar cambios de implementacion si corresponden.
6. Ejecutar `scripts/setup.sh` o `scripts/setup.ps1` para refrescar artifacts auxiliares.
7. Ejecutar `scripts/validate-structure.sh` o `scripts/validate-structure.ps1`.
8. Abrir un solo PR que refiera un unico change principal y mantenga trazabilidad.

## Contrato de testing

- Playwright CLI es la herramienta estandar para validar journeys end-to-end.
- Las seeds minimas del dominio vigente cubren sponsor, campaign, milestone, delivery lot, operator, delivery event y payout execution.
- Ningun slice se considera terminado sin evidencia de `sdd-test`, `sdd-verify` y actualizacion de `progress.md`.

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

- Framework y decisiones: `docs/architecture.md`
- Instalacion y bootstrap: `docs/installation.md`
- Conceptos del flujo: `docs/concepts.md`
- Persistencia de artifacts: `docs/persistence.md`
- Estrategia de testing: `docs/testing-strategy.md`
- Ejemplos para herramientas: `examples/`
