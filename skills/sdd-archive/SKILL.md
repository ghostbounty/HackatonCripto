---
name: sdd-archive
description: Cerrar o archivar un change una vez verificado y fusionado. Usar cuando sea necesario documentar el estado final, referencias del PR y cualquier transición del change activo hacia un estado histórico.
---

# Propósito

Dejar trazabilidad final del change sin perder contexto.

# Cuándo usarla

Usar al final del ciclo de vida del change o al consolidar cambios fusionados.

# Inputs

- Estado final del change
- Evidencia de verify
- Referencias del PR o merge

# Pasos esperados

1. Confirmar que el change está verificado.
2. Resumir resultados y decisiones finales.
3. Documentar referencias cruzadas útiles.
4. Mantener compatibilidad con la estructura histórica.

# Outputs / artifacts

- Resumen o marca de cierre del change

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `.atl/`
