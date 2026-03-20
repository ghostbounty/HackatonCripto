---
name: issue-creation
description: Convertir un change o una parte de sus tasks en issues trazables para seguimiento. Usar cuando se necesite descomponer trabajo en tickets que referencien changes, docs/product y criterios de verificacion.
---

# Proposito

Abrir issues alineados al change, al contexto funcional y al gate autonomo del repo.

# Cuando usarla

Usar cuando el backlog deba reflejar proposal, spec, design o tasks de un change.

# Inputs

- `changes/<change-name>/tasks.md`
- `proposal.md`, `spec.md` o `design.md`
- Templates de `.github/ISSUE_TEMPLATE/`

# Outputs / artifacts

- Issue draft o issue creado

# Done criteria

- El issue referencia el change correcto.
- Incluye criterio de aceptacion, testing, politica de evidencia y condicion de cierre.
- La granularidad sigue el patron de slices pequenos.

# Blocking criteria

- El trabajo no esta suficientemente acotado.
- El issue mezclaria multiples slices o multiples changes principales.

# Next allowed skill

- `branch-pr` o regreso al flujo del slice segun corresponda

# Pasos esperados

1. Elegir el fragmento trazable del change.
2. Redactar titulo, contexto y criterio de aceptacion.
3. Vincular el issue con artifacts del repo.
4. Anadir condicion de test y verify.

# Reglas de autonomia

- No crear tickets vagos o imposibles de cerrar con evidencia.
- Mantener cada issue alineado a un gate verificable.

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.github/`
