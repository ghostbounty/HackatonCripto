---
name: sdd-tasks
description: Desglosar un change en tareas accionables para slices de funding, captura offline, sync, consolidacion y release programable.
---

# Proposito

Convertir el change en trabajo secuenciado por slices pequenos, accionables y verificables.

# Cuando usarla

Usar tras cerrar proposal, spec y design o cuando el checklist necesite mantenimiento.

# Inputs

- `proposal.md`
- `spec.md`
- `design.md`
- `DESIGN.md` si el slice incluye interfaz
- Convencion compartida de tareas

# Outputs / artifacts

- `changes/<change-name>/tasks.md`
- `changes/<change-name>/progress.md` preparado para el primer slice

# Done criteria

- El trabajo esta partido en slices pequenos.
- Cada slice tiene criterio de aceptacion.
- Cada slice declara testing, seeds y verify asociados.
- Los slices UI incluyen tarea explicita de alineacion con `DESIGN.md`.
- Cada slice puede reportarse de forma clara en `progress.md`.
- El orden de ejecucion respeta el loop autonomo.

# Blocking criteria

- Proposal, spec o design no permiten una particion segura.
- Las tareas mezclan multiples slices sin gate intermedio.

# Next allowed skill

- `sdd-apply`

# Pasos esperados

1. Agrupar trabajo por slices.
2. Crear checklist accionable.
3. Referir rutas y dependencias concretas.
4. Anadir para cada slice:
   - criterio de aceptacion,
   - seeds demo necesarias,
   - pruebas esperadas,
   - gate para continuar.
5. Si el slice toca interfaz, incluir trabajo explicito de alineacion visual y evidencia esperada contra `DESIGN.md`.
6. Alinear `progress.md` con el primer slice y con el formato de handoff persistente.

# Reglas de autonomia

- No producir listas enormes sin prioridad.
- Cada slice debe poder completarse, probarse y verificarse en una iteracion corta.
- Si no se puede probar un slice por separado, dividirlo de nuevo.
- `tasks.md` planea el trabajo; `progress.md` registra su estado vivo.

# Rutas concretas del repo

- `docs/product/`
- `DESIGN.md`
- `changes/`
- `.atl/`
