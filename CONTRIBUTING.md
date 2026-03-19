# Contributing

## Objetivo

Mantener un flujo consistente basado en `docs/product/` como fuente funcional y `changes/` como unidad principal de trabajo para propuestas, especificaciones, diseño, tareas y verificación.

## Reglas básicas

- Preservar `docs/product/` y `changes/` existentes.
- Trabajar un change principal por PR.
- Escribir o actualizar artifacts dentro de `changes/<change-name>/`.
- Mantener las skills y el registro `.atl/skill-registry.md` alineados.
- Ejecutar los scripts de setup y validación antes de abrir PR.

## Flujo de contribución

1. Crear o elegir un `change-name` corto y estable.
2. Verificar si ya existe `changes/<change-name>/`.
3. Redactar o actualizar:
   - `proposal.md`
   - `spec.md`
   - `design.md`
   - `tasks.md`
   - `verify-checklist.md` o `verify.md`
4. Si el cambio modifica el framework, actualizar `docs/`, `skills/`, `examples/`, `scripts/` o `.github/` según corresponda.
5. Ejecutar:
   - `./scripts/setup.sh`
   - `./scripts/validate-structure.sh`
6. Preparar un PR con contexto, alcance y criterio de aceptación.

## Checklist antes del PR

- [ ] `docs/product/` sigue intacto.
- [ ] `changes/` existentes siguen intactos.
- [ ] El nuevo o actualizado change vive dentro de `changes/<change-name>/`.
- [ ] Cada skill tocada mantiene su `SKILL.md`.
- [ ] `.atl/skill-registry.md` fue regenerado si hubo cambios en `skills/`.
- [ ] La validación estructural pasó correctamente.

## Convenciones

- Usar Markdown claro y orientado a decisiones.
- Mantener compatibilidad hacia atrás de la estructura documental.
- Preferir referencias entre documentos antes que duplicar contexto funcional.
- Documentar scripts y automatizaciones en `docs/installation.md` y `docs/architecture.md`.
