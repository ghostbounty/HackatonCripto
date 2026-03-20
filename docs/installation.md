# Instalacion y bootstrap

## Requisitos minimos

- Bash o PowerShell
- Git
- Node.js 18+ con `npm` y `npx`
- Python 3.12+ o equivalente disponible en PATH
- Docker 26+ para flujos locales mas cercanos a GenLayer Studio o integracion local
- Permisos para ejecutar scripts locales

## Resultado esperado del bootstrap

Tras correr instalacion y validacion, el repo debe quedar con:

- `genlayer-mvp/` listo como baseline activo
- `legacy/marketplace-demo/` separado como referencia archivada
- `.atl/skill-registry.md` regenerable
- `output/playwright/` listo para evidencia local

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

- `scripts/install.sh`: comprueba herramientas minimas, prerequisitos del flujo GenLayer local y crea carpetas base faltantes del baseline activo.
- `scripts/install.ps1`: equivalente para PowerShell.
- `scripts/setup.sh`: regenera `.atl/skill-registry.md` a partir de `skills/`.
- `scripts/setup.ps1`: equivalente para PowerShell.
- `scripts/validate-structure.sh`: valida la estructura esperada del framework, la frontera entre activo y legado y el lenguaje del pivot.
- `scripts/validate-structure.ps1`: equivalente para PowerShell.

## Flujo recomendado tras clonar

1. Ejecutar instalacion.
2. Ejecutar setup.
3. Validar estructura.
4. Leer `AGENTS.md`, `README.md`, `docs/architecture.md` y `docs/archive-boundary.md`.
5. Revisar `genlayer-mvp/README.md` como entrada tecnica activa.
6. Revisar `docs/product/` solo como contexto preservado antes de abrir un nuevo change.
