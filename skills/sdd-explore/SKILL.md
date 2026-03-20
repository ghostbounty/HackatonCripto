---
name: sdd-explore
description: Explorar el contexto funcional y tecnico existente antes de proponer cambios. Usar cuando sea necesario leer docs/product, changes vigentes y documentacion marco para comprender alcance, restricciones, fuentes de evidencia e impacto.
---

# Proposito

Comprender el estado actual del dominio, del framework y del slice activo antes de redactar o aplicar cambios.

# Cuando usarla

Usar al inicio de un change o antes de ajustar proposal, spec, design o tasks.

# Inputs

- `docs/product/`
- `changes/<change-name>/`
- `docs/architecture.md`
- `README.md`
- Estado actual del repo

# Outputs / artifacts

- Resumen de contexto
- Riesgos y dependencias
- Mapa de impacto para el slice

# Done criteria

- Se leyeron los artifacts funcionales obligatorios del dominio.
- Se identificaron changes relacionados y restricciones operativas.
- Se detecto si el slice toca decision subjetiva, fuentes de evidencia, estados del caso o integracion con GenLayerJS.
- Se documentaron riesgos, dependencias y supuestos relevantes.
- El agente puede proponer sin preguntas evitables.

# Blocking criteria

- No se puede localizar el change o los artifacts de dominio necesarios.
- Existe ambiguedad critica que el repo no permite resolver.

# Next allowed skill

- `sdd-propose`

# Pasos esperados

1. Leer `docs/product/`.
2. Identificar changes relacionados en `changes/`.
3. Revisar la documentacion operativa del framework.
4. Resumir restricciones, dependencias, estados y decisiones previas.
5. Detectar politica de evidencia existente o faltante.
6. Preparar un mapa de impacto para proposal, spec, design y tasks.

# Reglas de autonomia

- Explorar antes de preguntar.
- Preferir hechos observables del repo sobre supuestos.
- Si hace falta escalar, presentar el contexto ya descubierto y la duda residual exacta.

# Rutas concretas del repo

- `docs/product/`
- `changes/`
- `docs/`
- `.atl/`
