# Instalacion y bootstrap

## Requisitos minimos

- Bash o PowerShell
- Git
- Node.js con `npm` y `npx`
- Python 3
- Permisos para ejecutar scripts locales

## Bootstrap rapido

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
./scripts/validate-structure.ps1
```

## Que hace cada script

- `scripts/install.sh`: comprueba herramientas minimas y crea carpetas base faltantes.
- `scripts/install.ps1`: equivalente para PowerShell.
- `scripts/setup.sh`: regenera `.atl/skill-registry.md` a partir de `skills/`.
- `scripts/setup.ps1`: equivalente para PowerShell.
- `scripts/validate-structure.sh`: valida la estructura esperada del framework y el dominio vigente.
- `scripts/validate-structure.ps1`: equivalente para PowerShell.

## Flujo recomendado tras clonar

1. Ejecutar instalacion.
2. Ejecutar setup.
3. Validar estructura.
4. Leer `AGENTS.md`, `README.md` y `docs/architecture.md` para entender el marco de Proof of Hand.
5. Revisar `docs/product/` antes de abrir o retomar un change.
6. Si el trabajo es del MVP vigente, comenzar por `changes/traceable-humanitarian-delivery-on-avalanche/`.
