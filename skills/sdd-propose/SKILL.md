---
name: sdd-propose
description: Redactar o ajustar la propuesta de un change en changes/<change-name>/proposal.md. Usar cuando se necesite definir intencion, problema, alcance, riesgos, rollback y criterios iniciales del cambio alrededor de una decision auditable.
---

# Proposito

Definir el proposito del change y el objetivo del slice antes de entrar en especificacion detallada.

# Cuando usarla

Usar cuando falte `proposal.md`, cuando la propuesta requiera realineacion o cuando un slice necesite quedar acotado.

# Inputs

- Hallazgos de `docs/product/`
- Contexto de `changes/` relacionados
- Restricciones del repo y del PR

# Outputs / artifacts

- `changes/<change-name>/proposal.md`

# Done criteria

- El problema y el valor del slice quedan claros.
- La propuesta se formula alrededor de adjudicacion inteligente y estados auditables, no solo de receipts visibles.
- El alcance y fuera de alcance estan definidos.
- Se describen riesgos, rollback y criterio inicial de exito.
- El slice queda listo para especificarse sin ambiguedad alta.

# Blocking criteria

- No existe claridad minima sobre el problema a resolver.
- El slice propuesto contradice `docs/product/` o un change preservado.

# Next allowed skill

- `sdd-spec`

# Pasos esperados

1. Nombrar el change o slice.
2. Redactar intencion y problema.
3. Definir alcance y fuera de alcance.
4. Capturar riesgos, rollback y condicion de stop.
5. Conectar la propuesta con testing y verify futuros.

# Reglas de autonomia

- No redactar propuestas amplias si el trabajo puede partirse en slices menores.
- Dejar claro que el gate final requiere testing y verify, no solo implementacion.

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
