$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
Set-Location $Root

New-Item -ItemType Directory -Force -Path '.atl' | Out-Null

$header = @(
  '# Skill Registry',
  '',
  'Indice regenerable de skills. Regenerar con `./scripts/setup.sh` o `pwsh ./scripts/setup.ps1`.',
  '',
  '| Skill | Path | Trigger | Inputs | Outputs | Done | Blocks | Next |',
  '| --- | --- | --- | --- | --- | --- | --- | --- |'
)

function Get-SectionLine($Content, $Title) {
  $pattern = "(?ms)^# $([regex]::Escape($Title))\r?\n\r?\n(.*?)(?=^# |\z)"
  $match = [regex]::Match($Content, $pattern)
  if (-not $match.Success) { return '' }
  $value = $match.Groups[1].Value -split "\r?\n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
  return ($value -join ' ')
}

function Clean-Cell($Value) {
  return ($Value -replace '\|','/' -replace '\r?\n',' ').Trim()
}

$rows = foreach ($file in Get-ChildItem -Path 'skills' -Filter 'SKILL.md' -Recurse | Sort-Object FullName) {
  if ($file.FullName -match '\\_shared\\') { continue }
  $content = Get-Content $file.FullName -Raw
  $name = ([regex]'(?m)^name:\s*(.+)$').Match($content).Groups[1].Value.Trim()
  $trigger = ([regex]'(?m)^description:\s*(.+)$').Match($content).Groups[1].Value.Trim()
  $path = ($file.DirectoryName.Replace($Root + [IO.Path]::DirectorySeparatorChar, '') -replace '\\','/')
  $inputs = Get-SectionLine $content 'Inputs'
  $outputs = Get-SectionLine $content 'Outputs / artifacts'
  $done = Get-SectionLine $content 'Done criteria'
  $blocks = Get-SectionLine $content 'Blocking criteria'
  $next = Get-SectionLine $content 'Next allowed skill'
  "| ``$name`` | ``$path`` | $(Clean-Cell $trigger) | $(Clean-Cell $inputs) | $(Clean-Cell $outputs) | $(Clean-Cell $done) | $(Clean-Cell $blocks) | $(Clean-Cell $next) |"
}

Set-Content -Path '.atl/skill-registry.md' -Value ($header + $rows)
Write-Host 'Generated .atl/skill-registry.md'
