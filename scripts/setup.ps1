$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
Set-Location $Root

New-Item -ItemType Directory -Force -Path '.atl' | Out-Null

$header = @(
  '# Skill Registry',
  '',
  'Índice regenerable de skills. Regenerar con `./scripts/setup.sh` o `pwsh ./scripts/setup.ps1`.',
  '',
  '| Skill | Path | Trigger | Inputs | Outputs |',
  '| --- | --- | --- | --- | --- |'
)

$rows = foreach ($file in Get-ChildItem -Path 'skills' -Filter 'SKILL.md' -Recurse | Sort-Object FullName) {
  $content = Get-Content $file.FullName -Raw
  $name = ([regex]'(?m)^name:\s*(.+)$').Match($content).Groups[1].Value.Trim()
  $trigger = ([regex]'(?m)^description:\s*(.+)$').Match($content).Groups[1].Value.Trim()
  $path = ($file.DirectoryName.Replace($Root + [IO.Path]::DirectorySeparatorChar, '') -replace '\\','/')
  "| ``$name`` | ``$path`` | $trigger | Ver `SKILL.md` | Ver `SKILL.md` |"
}

Set-Content -Path '.atl/skill-registry.md' -Value ($header + $rows)
Write-Host 'Generated .atl/skill-registry.md'
