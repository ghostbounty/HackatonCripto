$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
Set-Location $Root

function Test-Command($Name) {
  return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

$required = @('git')
foreach ($cmd in $required) {
  if (-not (Test-Command $cmd)) {
    throw "Missing required command: $cmd"
  }
}

$optional = @('node', 'npm', 'npx', 'python', 'python3')
$status = foreach ($cmd in $optional) {
  [PSCustomObject]@{
    Command = $cmd
    Available = Test-Command $cmd
  }
}

$dirs = @('docs','skills','changes','examples','scripts','.atl','.github','output','output/playwright')
foreach ($dir in $dirs) {
  New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

Write-Host "Bootstrap complete in $Root"
Write-Host 'Optional tooling status for the hackathon stack:'
$status | Format-Table -AutoSize | Out-String | Write-Host

if (-not (Test-Command 'npx')) {
  Write-Warning 'Playwright CLI requires npx. Install Node.js/npm before relying on autonomous testing gates.'
} else {
  Write-Host 'npx detected. Playwright CLI workflows are available to the autonomous testing strategy.'
}

if (-not (Test-Command 'node')) {
  Write-Warning 'Hardhat and the Avalanche C-Chain demo tooling require Node.js.'
}

if ((-not (Test-Command 'python')) -and (-not (Test-Command 'python3'))) {
  Write-Warning 'Python is recommended for backend scripts, fixture helpers and validator utilities.'
}
