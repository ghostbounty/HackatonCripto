## Summary

- Change principal:
- Alcance del PR:
- Artifacts afectados:

## Checklist

- [ ] El PR mantiene un solo change principal.
- [ ] `docs/product/` permanece intacto.
- [ ] `changes/` existentes permanecen intactos.
- [ ] Se ejecutó `scripts/setup.sh` o `scripts/setup.ps1` si cambió `skills/`.
- [ ] Se ejecutó `scripts/validate-structure.sh`.

## Acceptance criteria

- La raíz del repo expone `AGENTS.md`, `README.md`, `CONTRIBUTING.md`, `skills/`, `scripts/`, `examples/`, `docs/`, `changes/`, `.atl/` y `.github/`.
- Cada subcarpeta de `skills/` contiene `SKILL.md`.
- `docs/product/` y `changes/` siguen siendo compatibles con la estructura actual.
- La documentación deja explícito el flujo completo para trabajar con un solo change y abrir futuros PRs siguiendo el mismo patrón.
