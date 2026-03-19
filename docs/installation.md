# Instalación y bootstrap

## Requisitos mínimos

- Bash o PowerShell
- Git
- Permisos para ejecutar scripts locales

## Bootstrap rápido

### Unix / macOS / Linux

```bash
./scripts/install.sh
./scripts/setup.sh
./scripts/validate-structure.sh
```

### PowerShell

```powershell
./scripts/install.ps1
./scripts/setup.ps1
bash ./scripts/validate-structure.sh
```

## Qué hace cada script

- `scripts/install.sh`: comprueba herramientas mínimas y crea carpetas base faltantes.
- `scripts/install.ps1`: equivalente para PowerShell.
- `scripts/setup.sh`: regenera `.atl/skill-registry.md` a partir de `skills/`.
- `scripts/setup.ps1`: equivalente para PowerShell.
- `scripts/validate-structure.sh`: valida la estructura esperada del framework.

## Flujo recomendado tras clonar

1. Ejecutar instalación.
2. Ejecutar setup.
3. Validar estructura.
4. Leer `AGENTS.md`, `README.md` y `docs/architecture.md`.
5. Revisar `docs/product/` antes de abrir un nuevo change.
