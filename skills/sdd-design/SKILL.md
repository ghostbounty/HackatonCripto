---
name: sdd-design
description: Redactar o ajustar el diseno tecnico de un change con foco en Avalanche C-Chain, MilestoneEscrow, backend verificador y PWA offline-first.
---

# Proposito

Bajar la spec a decisiones tecnicas concretas, justificadas y listas para validacion autonoma.

# Cuando usarla

Usar cuando el change necesite arquitectura, flujos tecnicos, integraciones, persistencia o decisiones de testabilidad.

# Inputs

- `spec.md`
- `docs/architecture.md`
- Restricciones tecnicas del repo

# Outputs / artifacts

- `changes/<change-name>/design.md`

# Done criteria

- Los componentes afectados y el flujo tecnico quedan definidos.
- El diseno contempla como se sembraran datos demo o se verificaran endpoints y formularios.
- Los tradeoffs y supuestos tecnicos estan documentados.
- `sdd-tasks` puede particionar el trabajo en slices verificables.

# Blocking criteria

- La spec no es suficientemente clara.
- El diseno requerido compromete artifacts preservados o no puede probarse de forma segura.

# Next allowed skill

- `sdd-tasks`

# Pasos esperados

1. Identificar componentes afectados.
2. Definir flujos, interfaces y persistencia.
3. Registrar decisiones pendientes y tradeoffs.
4. Alinear el diseno con los artifacts existentes.
5. Incorporar plan de testabilidad y seeds demo.

# Reglas de autonomia

- Preferir soluciones que reduzcan incertidumbre de testing y verify.
- No aprobar un diseno que deje al agente sin una forma razonable de validar avance.

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `docs/`
