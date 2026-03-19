---
name: sdd-propose
description: Redactar o ajustar la propuesta de un change en changes/<change-name>/proposal.md. Usar cuando se necesite definir intención, problema, alcance, riesgos, rollback y criterios iniciales del cambio.
---

# Propósito

Definir el propósito del change y su alcance antes de entrar en especificación detallada.

# Cuándo usarla

Usar cuando falte `proposal.md` o cuando la propuesta requiera realineación.

# Inputs

- Hallazgos de `docs/product/`
- Contexto de `changes/` relacionados
- Restricciones del repo y del PR

# Pasos esperados

1. Nombrar el change.
2. Redactar intención y problema.
3. Definir alcance y fuera de alcance.
4. Capturar riesgos y estrategia de rollback.

# Outputs / artifacts

- `changes/<change-name>/proposal.md`

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
