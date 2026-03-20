---
name: sdd-design
description: Redactar o ajustar el diseno tecnico de un change en changes/<change-name>/design.md. Usar cuando la spec requiera decisiones de arquitectura, modelo de datos, integracion, persistencia, politica de evidencia o tradeoffs antes de ejecutar tareas.
---

# Proposito

Bajar la spec a decisiones tecnicas concretas, justificadas y listas para validacion autonoma.

# Cuando usarla

Usar cuando el change necesite arquitectura, flujos tecnicos, integraciones, persistencia o decisiones de testabilidad.

# Inputs

- `spec.md`
- `docs/architecture.md`
- `docs/design-system.md` cuando el slice toque UI o evidencia visual
- Restricciones tecnicas del repo

# Outputs / artifacts

- `changes/<change-name>/design.md`

# Done criteria

- Los componentes afectados y el flujo tecnico quedan definidos.
- El diseno fija el perimetro pequeno de IA, la separacion entre off-chain y on-chain y la politica de fuentes permitidas.
- El diseno contempla como se sembraran datos demo o se verificaran endpoints y formularios.
- Si el slice toca UI, el diseno traduce `docs/design-system.md` a decisiones concretas de paleta, jerarquia, superficies y estados visibles.
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
6. Si el slice toca UI, registrar como la interfaz mostrara evidencia, decision, `accepted` y `finalized`.

# Reglas de autonomia

- Preferir soluciones que reduzcan incertidumbre de testing y verify.
- No aprobar un diseno que deje al agente sin una forma razonable de validar avance.
- No aprobar un diseno visual que contradiga `docs/design-system.md` cuando el slice toque UI.

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `docs/`
