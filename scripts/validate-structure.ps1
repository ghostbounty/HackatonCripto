$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
Set-Location $Root

$requiredPaths = @(
  'AGENTS.md',
  'README.md',
  'CONTRIBUTING.md',
  'skills',
  'scripts',
  'examples',
  'docs',
  'changes',
  '.atl',
  '.github',
  'docs/product',
  'docs/architecture.md',
  'docs/autonomous-vibecoding.md',
  'docs/testing-strategy.md',
  'docs/seed-fixtures.md',
  'docs/mvp-loop.md',
  'docs/handoff-progress.md',
  'docs/progress-template.md'
)

$requiredSkills = @(
  'skills/sdd-init/SKILL.md',
  'skills/sdd-explore/SKILL.md',
  'skills/sdd-propose/SKILL.md',
  'skills/sdd-spec/SKILL.md',
  'skills/sdd-design/SKILL.md',
  'skills/sdd-tasks/SKILL.md',
  'skills/sdd-apply/SKILL.md',
  'skills/sdd-test/SKILL.md',
  'skills/sdd-verify/SKILL.md',
  'skills/sdd-archive/SKILL.md',
  'skills/skill-registry/SKILL.md',
  'skills/issue-creation/SKILL.md',
  'skills/branch-pr/SKILL.md'
)

foreach ($path in $requiredPaths) {
  if (-not (Test-Path $path)) {
    throw "Missing required path: $path"
  }
}

foreach ($skill in $requiredSkills) {
  if (-not (Test-Path $skill)) {
    throw "Missing skill file: $skill"
  }
}

$preservedArtifacts = @(
  'docs/product/hackathon-vision.md',
  'docs/product/domain-rules.md',
  'docs/product/blockchain-scope.md',
  'docs/product/demo-script.md',
  'changes/multi-agent-collaboration-protocol/progress.md',
  'changes/traceable-volunteering-with-demo-crypto/proposal.md',
  'changes/traceable-volunteering-with-demo-crypto/progress.md',
  'changes/stretch-merit-reputation/proposal.md',
  'changes/stretch-merit-reputation/progress.md'
)

foreach ($artifact in $preservedArtifacts) {
  if (-not (Test-Path $artifact)) {
    throw "Missing preserved artifact: $artifact"
  }
}

Get-ChildItem changes -Directory | ForEach-Object {
  $progressFile = Join-Path $_.FullName 'progress.md'
  if (-not (Test-Path $progressFile)) {
    throw "Missing progress artifact: $progressFile"
  }
}

if (-not (Test-Path '.atl/skill-registry.md')) {
  throw 'Missing generated registry'
}

$checks = @(
  @{ Path = 'AGENTS.md'; Pattern = 'sdd-test'; Message = 'AGENTS.md missing sdd-test' },
  @{ Path = 'AGENTS.md'; Pattern = 'decision-gate'; Message = 'AGENTS.md missing decision-gate' },
  @{ Path = 'AGENTS.md'; Pattern = 'Playwright CLI'; Message = 'AGENTS.md missing Playwright CLI strategy' },
  @{ Path = 'AGENTS.md'; Pattern = 'No avanzar sin pruebas'; Message = 'AGENTS.md missing no-test gate policy' },
  @{ Path = 'AGENTS.md'; Pattern = 'progress.md'; Message = 'AGENTS.md missing progress.md contract' },
  @{ Path = 'docs/architecture.md'; Pattern = 'sdd-test'; Message = 'docs/architecture.md missing sdd-test' },
  @{ Path = 'docs/testing-strategy.md'; Pattern = 'Playwright CLI'; Message = 'docs/testing-strategy.md missing Playwright CLI' },
  @{ Path = 'docs/seed-fixtures.md'; Pattern = 'proyecto publico'; Message = 'docs/seed-fixtures.md missing fixture definition' },
  @{ Path = 'docs/mvp-loop.md'; Pattern = 'Avanzar solo por evidencia'; Message = 'docs/mvp-loop.md missing evidence rule' },
  @{ Path = 'docs/handoff-progress.md'; Pattern = 'progress.md'; Message = 'docs/handoff-progress.md missing progress.md guidance' },
  @{ Path = '.github/PULL_REQUEST_TEMPLATE.md'; Pattern = 'sdd-test'; Message = 'PR template missing sdd-test reference' },
  @{ Path = '.github/PULL_REQUEST_TEMPLATE.md'; Pattern = 'decision-gate'; Message = 'PR template missing decision-gate' },
  @{ Path = '.github/PULL_REQUEST_TEMPLATE.md'; Pattern = 'progress.md'; Message = 'PR template missing progress.md reference' },
  @{ Path = '.atl/skill-registry.md'; Pattern = 'sdd-test'; Message = 'Registry missing sdd-test' },
  @{ Path = '.atl/skill-registry.md'; Pattern = 'Next'; Message = 'Registry missing expanded columns' }
)

foreach ($check in $checks) {
  $content = Get-Content $check.Path -Raw
  if ($content -notmatch [regex]::Escape($check.Pattern)) {
    throw $check.Message
  }
}

Write-Host 'Structure validation passed'
