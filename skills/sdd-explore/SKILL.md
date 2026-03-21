---
name: sdd-explore
description: Explorar el contexto funcional y tecnico existente antes de proponer cambios sobre campaigns, delivery lots, milestones, offline sync y payouts.
---

# Proposito

Comprender el estado actual del dominio, del framework y del slice activo antes de redactar o aplicar cambios.

# Cuando usarla

Usar al inicio de un change o antes de ajustar proposal, spec, design o tasks.

# Inputs

- `docs/product/`
- `DESIGN.md` cuando el slice afecta UI, PWA, formularios, layout o frontend
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
- Si el slice toca interfaz, se relevo `DESIGN.md` y sus restricciones visuales relevantes.
- Se documentaron riesgos, dependencias y supuestos relevantes.
- El agente puede proponer sin preguntas evitables.

# Blocking criteria

- No se puede localizar el change o los artifacts de dominio necesarios.
- Existe ambiguedad critica que el repo no permite resolver.

# Next allowed skill

- `sdd-propose`

# Pasos esperados

1. Leer `docs/product/`.
2. Leer `DESIGN.md` si el slice afecta interfaz.
3. Identificar changes relacionados en `changes/`.
4. Revisar la documentacion operativa del framework.
5. Resumir restricciones, dependencias y decisiones previas.
6. Preparar un mapa de impacto para proposal, spec, design y tasks.

# Reglas de autonomia

- Explorar antes de preguntar.
- Preferir hechos observables del repo sobre supuestos.
- Si hace falta escalar, presentar el contexto ya descubierto y la duda residual exacta.

# Rutas concretas del repo

- `docs/product/`
- `DESIGN.md`
- `changes/`
- `docs/`
- `.atl/`
