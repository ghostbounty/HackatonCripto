---
name: sdd-init
description: Inicializar o alinear la estructura base de un repositorio orientado a specification-driven development. Usar cuando se necesite crear o reparar la capa estructural del repo, verificar la presencia de docs, changes, skills, scripts, .atl o templates de colaboracion.
---

# Proposito

Inicializar la estructura operativa minima del repositorio sin romper `docs/product/` ni `changes/`, dejando el entorno listo para ejecucion autonoma prolongada.

# Cuando usarla

Usar al crear el framework base, al bootstrappear un repo o al detectar carpetas raiz, docs o scripts operativos faltantes.

# Inputs

- Estado actual de la raiz del repo
- Contenido existente en `docs/product/` y `changes/`
- Reglas operativas definidas en `AGENTS.md`

# Outputs / artifacts

- `AGENTS.md`
- Estructura base del framework
- Scripts y docs operativas minimas alineadas

# Done criteria

- Las rutas raiz requeridas existen.
- `docs/product/` y `changes/` se preservan intactos.
- Hay instrucciones claras para instalar, regenerar y validar el framework.
- El repo puede pasar a `sdd-explore`.

# Blocking criteria

- Faltan artifacts funcionales preservados.
- El alineamiento requerido implicaria romper `docs/product/` o `changes/`.

# Next allowed skill

- `sdd-explore`

# Pasos esperados

1. Inspeccionar la raiz del repositorio.
2. Preservar `docs/product/` como contexto funcional.
3. Preservar `changes/` existentes.
4. Crear o alinear `skills/`, `scripts/`, `.atl/`, `.github/` y docs operativas.
5. Dejar instrucciones claras para setup y validacion.

# Reglas de autonomia

- No pedir contexto que pueda descubrirse leyendo el repo.
- No crear estructura innecesaria fuera del contrato operativo.
- Si falta un artifact obligatorio, detenerse y reportarlo antes de inventar reemplazos.

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
- `scripts/`
- `.github/`
