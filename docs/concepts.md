# Conceptos del framework

## Contexto funcional

El contexto funcional del producto vive en `docs/product/`. No debe duplicarse innecesariamente en la capa del framework.

## Change

Un **change** es la unidad de trabajo trazable y debe vivir en `changes/<change-name>/`.

## Skill

Una **skill** es una guia operativa reutilizable ubicada en `skills/<skill-name>/SKILL.md`.

## Registry

`.atl/skill-registry.md` es un indice regenerable que resume nombre, path, triggers, inputs y outputs de las skills.

## Verify

La etapa de **verify** reune validaciones automaticas y checklist manual para comprobar que el change y el framework cumplen los criterios definidos.

## Single-change PR

El patron recomendado es un solo change principal por PR. Esto mejora revision, rollback y trazabilidad documental.

## Evento verificable

En el dominio vigente, un **evento verificable** es una captura de entrega que combina QR del lote, geolocalizacion, timestamp, operador autenticado y metadatos suficientes para consolidar un hito.

## Hito

Un **hito** es la unidad de liberacion programable de fondos. El backend puede consolidar multiples eventos de entrega en un mismo hito y, si la condicion se cumple, disparar un payout on-chain.

## Offline-first

**Offline-first** significa que la captura de entrega no depende de conectividad inmediata. La PWA registra el evento localmente, mantiene orden logico e intenta sincronizarlo despues.
