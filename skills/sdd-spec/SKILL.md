---
name: sdd-spec
description: Redactar o ajustar la especificacion delta de un change en changes/<change-name>/spec.md. Usar cuando sea necesario formalizar requisitos ADDED, MODIFIED, REMOVED, estados y escenarios de aceptacion sobre la base de docs/product.
---

# Proposito

Formalizar el comportamiento esperado del change de manera trazable y verificable.

# Cuando usarla

Usar despues de la propuesta y antes de diseno o implementacion.

# Inputs

- `proposal.md`
- Reglas de `docs/product/`
- Changes relacionados en `changes/`

# Outputs / artifacts

- `changes/<change-name>/spec.md`

# Done criteria

- Los cambios funcionales estan expresados como deltas claros.
- Hay escenarios de aceptacion verificables.
- La spec define inputs estructurados, outputs restringidos y estados observables cuando el slice toca adjudicacion.
- El criterio de prueba del slice queda explicitado.
- La spec es consistente con el dominio y el loop autonomo.

# Blocking criteria

- Falta propuesta valida o existe contradiccion con `docs/product/`.
- No pueden definirse escenarios verificables.

# Next allowed skill

- `sdd-design`

# Pasos esperados

1. Traducir intencion a deltas claros.
2. Redactar secciones `ADDED`, `MODIFIED` o `REMOVED`.
3. Anadir escenarios Given/When/Then.
4. Declarar que evidencia debera producir `sdd-test`.

# Reglas de autonomia

- No aceptar requisitos que no puedan validarse de forma observable.
- Si el comportamiento no es testeable, devolver el trabajo a propuesta o diseno antes de implementar.

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
