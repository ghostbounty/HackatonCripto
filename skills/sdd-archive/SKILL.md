---
name: sdd-archive
description: Cerrar o archivar un change una vez verificado y fusionado. Usar cuando sea necesario documentar el estado final, referencias del PR y cualquier transicion del change activo hacia un estado historico.
---

# Proposito

Dejar trazabilidad final del change y continuidad suficiente para otra sesion autonoma.

# Cuando usarla

Usar al final del ciclo de vida del change o al consolidar cambios fusionados.

# Inputs

- Estado final del change
- Evidencia de verify
- Referencias del PR o merge

# Outputs / artifacts

- Resumen o marca de cierre del change
- Continuidad documentada para sesiones futuras

# Done criteria

- El change esta verificado y su estado final queda claro.
- Se registran resultados, limites y referencias de continuidad.
- Otra sesion autonoma puede retomar el contexto sin reconstruccion manual amplia.

# Blocking criteria

- El change no paso verify.
- Faltan referencias minimas del estado final o del PR.

# Next allowed skill

- `stop`

# Pasos esperados

1. Confirmar que el change esta verificado.
2. Resumir resultados y decisiones finales.
3. Documentar referencias cruzadas utiles.
4. Dejar claro si el siguiente paso es cerrar, retomar o abrir otro slice.

# Reglas de autonomia

- No archivar trabajo con gates fallidos.
- El resumen final debe permitir continuidad sin supervision humana prolongada.

# Rutas concretas del repo

- `changes/`
- `.atl/`
- `.github/`
