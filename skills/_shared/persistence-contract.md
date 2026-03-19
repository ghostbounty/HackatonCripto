# Persistence Contract

## Reglas

- No mover ni renombrar artifacts existentes en `docs/product/` ni `changes/` salvo instrucción explícita.
- Tratar `changes/<change-name>/` como contenedor persistente del ciclo completo del cambio.
- Considerar `.atl/skill-registry.md` como artifact regenerable por script o skill dedicada.
- Si se agregan artifacts auxiliares, documentar su proceso de regeneración en `scripts/setup.*`.

## Compatibilidad

- La estructura nueva debe convivir con los changes existentes.
- Los links desde `README.md`, `AGENTS.md` y `docs/architecture.md` deben apuntar a rutas reales y estables.
