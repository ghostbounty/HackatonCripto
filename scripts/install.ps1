$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
Set-Location $Root

function Test-Command($Name) {
  return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Get-Version($Command, $Args = @('--version')) {
  try {
    return (& $Command @Args 2>$null | Select-Object -First 1)
  } catch {
    return $null
  }
}

$required = @('git')
foreach ($cmd in $required) {
  if (-not (Test-Command $cmd)) {
    throw "Missing required command: $cmd"
  }
}

$optional = @('node', 'npm', 'npx', 'python', 'python3', 'docker')
$status = foreach ($cmd in $optional) {
  [PSCustomObject]@{
    Command = $cmd
    Available = Test-Command $cmd
    Version = Get-Version $cmd
  }
}

$dirs = @('docs','skills','changes','examples','scripts','.atl','.github','output','output/playwright','genlayer-mvp','genlayer-mvp/cases','genlayer-mvp/evidence-policies','genlayer-mvp/receipts','genlayer-mvp/integration','legacy','legacy/marketplace-demo')
foreach ($dir in $dirs) {
  New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

Write-Host "Bootstrap complete in $Root"
Write-Host "Active baseline: genlayer-mvp/"
Write-Host "Archived reference: legacy/marketplace-demo/"
Write-Host "Optional tooling status:"
$status | Format-Table -AutoSize | Out-String | Write-Host

if (-not (Test-Command 'npx')) {
  Write-Warning 'Playwright CLI requires npx. Install Node.js/npm before relying on autonomous testing gates.'
}

if (-not (Test-Command 'docker')) {
  Write-Warning 'Docker is recommended for GenLayer local and Studio-like development flows.'
}

if (-not (Test-Command 'python') -and -not (Test-Command 'python3')) {
  Write-Warning 'Python 3.12+ is recommended for GenLayer-aligned local development.'
}
