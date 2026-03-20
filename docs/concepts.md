# Conceptos del framework

## Contexto funcional preservado

El contexto funcional historico del producto vive en `docs/product/`. No debe duplicarse innecesariamente ni modificarse para seguir el pivot operativo del framework.

## Baseline activo

El **baseline activo** es el punto de partida recomendado para nuevos cambios. En este repo vive en `genlayer-mvp/` y representa el MVP actual de adjudicacion sobre GenLayer.

## Archivo legado

El **archivo legado** es material preservado pero no normativo para implementacion nueva. En este repo incluye `legacy/marketplace-demo/` y los `changes/` historicos previos al reset del baseline.

## Change

Un **change** es la unidad de trabajo trazable y debe vivir en `changes/<change-name>/`.

## Slice

Un **slice** es la unidad minima de avance verificable. En este framework, un slice debe acotar una decision subjetiva estrecha, su politica de evidencia y sus estados observables.

## Skill

Una **skill** es una guia operativa reutilizable ubicada en `skills/<skill-name>/SKILL.md`.

## Registry

`.atl/skill-registry.md` es un indice regenerable que resume nombre, path, triggers, inputs, outputs y gates declarados de las skills.

## Politica de evidencia

La **politica de evidencia** define:

- que fuentes estan permitidas,
- que senales cuentan como prueba fuerte,
- que texto libre se considera auxiliar,
- como se trata evidencia contradictoria o insuficiente.

Sin esa politica, un slice de adjudicacion no esta listo para testing ni verify.

## Estados del caso

El framework recomienda separar:

- estado de negocio del caso,
- estado del receipt o del protocolo,
- estado visible en UX.

`accepted` y `finalized` deben tratarse como estados distintos cuando el slice toca GenLayer.

## Verify

La etapa de **verify** reune validaciones automaticas y checklist manual para comprobar que el change y el framework cumplen los criterios definidos.

## Single-change PR

El patron recomendado es un solo change principal por PR. Esto mejora revision, rollback y trazabilidad documental.
