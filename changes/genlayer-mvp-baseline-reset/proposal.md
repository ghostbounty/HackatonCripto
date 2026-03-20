# Proposal: GenLayer MVP baseline reset

## Intent

Resetear la experiencia activa del repositorio para que cualquier persona vea un baseline limpio de GenLayer MVP sin confundirlo con el marketplace legado ni con la tesis historica del hackathon.

## Problema que resuelve

El repo ya habia pivotado documentalmente a GenLayer, pero todavia convivian rutas, referencias y artefactos heredados que podian hacer pensar que el baseline actual seguia siendo el marketplace con sponsorship visible. Eso elevaba el riesgo de interpretar mal el objetivo del MVP y de continuar trabajo nuevo sobre una base equivocada.

## Objetivo del cambio

- dejar una sola fuente activa de verdad para el MVP actual,
- preservar `docs/product/` y `changes/` existentes,
- mover la implementacion previa a una zona archivada,
- crear un scaffold minimo y limpio para trabajo nuevo sobre GenLayer,
- reforzar validaciones que detecten regresiones de framing.

## Alcance

- realinear docs, skills, templates y scripts activos,
- introducir `docs/archive-boundary.md`,
- introducir `genlayer-mvp/` como baseline activo,
- archivar el app path previo bajo `legacy/marketplace-demo/`,
- crear artifacts completos del change de reset.

## Fuera de alcance

- reescribir `docs/product/`,
- reescribir `changes/` historicos,
- reintroducir un frontend o backend nuevo completo en este mismo change,
- reescribir el historial de git.

## Riesgos

- que alguien siga usando material archivado como baseline. Mitigacion: frontera de archivo explicita y validaciones estructurales.
- que el reset elimine contexto util. Mitigacion: preservar rutas historicas y referirlas solo como archivo.
- que queden señales mixtas entre docs activas y legado. Mitigacion: endurecer scripts de validacion.

## Estrategia de rollback

El cambio es principalmente estructural y documental. Si el baseline reset resultara incorrecto, puede revertirse este change y restaurarse la presentacion anterior sin alterar `docs/product/` ni los `changes/` historicos.
