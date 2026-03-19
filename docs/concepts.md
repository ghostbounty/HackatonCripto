# Conceptos del framework

## Contexto funcional

El contexto funcional del producto vive en `docs/product/`. No debe duplicarse innecesariamente en la capa del framework.

## Change

Un **change** es la unidad de trabajo trazable y debe vivir en `changes/<change-name>/`.

## Skill

Una **skill** es una guía operativa reutilizable ubicada en `skills/<skill-name>/SKILL.md`.

## Registry

`.atl/skill-registry.md` es un índice regenerable que resume nombre, path, triggers, inputs y outputs de las skills.

## Verify

La etapa de **verify** reúne validaciones automáticas y checklist manual para comprobar que el change y el framework cumplen los criterios definidos.

## Single-change PR

El patrón recomendado es un solo change principal por PR. Esto mejora revisión, rollback y trazabilidad documental.
