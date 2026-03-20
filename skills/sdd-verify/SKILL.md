---
name: sdd-verify
description: Verificar que un change y la estructura del repositorio cumplan criterios explicitos. Usar cuando se deban ejecutar checks, completar verify-checklist, validar skills, scripts, testing y compatibilidad con docs/product y changes existentes.
---

# Proposito

Comprobar consistencia, completitud y readiness real antes del siguiente slice o del PR.

# Cuando usarla

Usar despues de `sdd-test` y antes de archivar o abrir PR.

# Inputs

- Cambio aplicado
- Evidencia de `sdd-test`
- `scripts/validate-structure.sh`
- `verify-checklist.md` o `verify.md`

# Outputs / artifacts

- Evidencia de validacion
- `verify-checklist.md` actualizado si aplica
- Resultado del gate: `pass`, `retry-needed` o `stop`

# Done criteria

- Las validaciones automaticas y estructurales fueron ejecutadas.
- Existe evidencia suficiente de testing del slice.
- El repo, el change y el flujo operativo siguen alineados.
- Hay una decision clara sobre si se puede avanzar al siguiente slice.

# Blocking criteria

- Faltan validaciones estructurales o evidencia de testing.
- El repo queda inconsistente con `AGENTS.md`, `docs/` o el registry.
- Persisten fallas despues de 2 reintentos dirigidos.

# Next allowed skill

- `branch-pr` o `sdd-archive` si el resultado es `pass` y el trabajo termina
- `sdd-apply` si el resultado es `retry-needed`
- `stop` si el resultado es `stop`

# Pasos esperados

1. Ejecutar validaciones automaticas.
2. Revisar estructura y links criticos.
3. Confirmar evidencia de seeds y testing.
4. Completar o actualizar artifacts de verify.
5. Emitir decision de gate para continuar o detenerse.

# Reglas de autonomia

- `verify` no es una formalidad. Si no hay evidencia, el resultado no puede ser `pass`.
- No avanzar al siguiente slice con fallas abiertas en el gate.
- Si una falla se repite, detenerse con causa y proximo paso minimo seguro.

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
- `scripts/`
