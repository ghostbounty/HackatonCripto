$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
Set-Location $Root

$requiredPaths = @(
  'AGENTS.md',
  'README.md',
  'CONTRIBUTING.md',
  'DESIGN.md',
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
  'docs/progress-template.md',
  'changes/traceable-humanitarian-delivery-on-avalanche'
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
  'changes/stretch-merit-reputation/progress.md',
  'changes/traceable-humanitarian-delivery-on-avalanche/proposal.md',
  'changes/traceable-humanitarian-delivery-on-avalanche/progress.md'
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
  @{ Path = 'AGENTS.md'; Pattern = 'traceable-humanitarian-delivery-on-avalanche'; Message = 'AGENTS.md missing active change reference' },
  @{ Path = 'AGENTS.md'; Pattern = 'DESIGN.md'; Message = 'AGENTS.md missing DESIGN.md contract' },
  @{ Path = 'AGENTS.md'; Pattern = 'Playwright CLI'; Message = 'AGENTS.md missing Playwright CLI strategy' },
  @{ Path = 'AGENTS.md'; Pattern = 'No avanzar sin pruebas'; Message = 'AGENTS.md missing no-test gate policy' },
  @{ Path = 'AGENTS.md'; Pattern = 'delivery event'; Message = 'AGENTS.md missing domain seed reference' },
  @{ Path = 'AGENTS.md'; Pattern = 'progress.md'; Message = 'AGENTS.md missing progress.md contract' },
  @{ Path = 'README.md'; Pattern = 'Avalanche C-Chain'; Message = 'README.md missing blockchain scope reference' },
  @{ Path = 'README.md'; Pattern = 'DESIGN.md'; Message = 'README.md missing DESIGN.md reference' },
  @{ Path = 'docs/architecture.md'; Pattern = 'MilestoneEscrow'; Message = 'docs/architecture.md missing escrow architecture' },
  @{ Path = 'docs/architecture.md'; Pattern = 'DESIGN.md'; Message = 'docs/architecture.md missing DESIGN.md reference' },
  @{ Path = 'docs/autonomous-vibecoding.md'; Pattern = 'DESIGN.md'; Message = 'docs/autonomous-vibecoding.md missing DESIGN.md guidance' },
  @{ Path = 'docs/testing-strategy.md'; Pattern = 'Playwright CLI'; Message = 'docs/testing-strategy.md missing Playwright CLI' },
  @{ Path = 'docs/testing-strategy.md'; Pattern = 'DESIGN.md'; Message = 'docs/testing-strategy.md missing DESIGN.md testing rule' },
  @{ Path = 'docs/testing-strategy.md'; Pattern = 'captura offline'; Message = 'docs/testing-strategy.md missing offline journey' },
  @{ Path = 'docs/seed-fixtures.md'; Pattern = 'delivery lot'; Message = 'docs/seed-fixtures.md missing fixture definition' },
  @{ Path = 'docs/mvp-loop.md'; Pattern = 'Avanzar solo por evidencia'; Message = 'docs/mvp-loop.md missing evidence rule' },
  @{ Path = 'docs/mvp-loop.md'; Pattern = 'DESIGN.md'; Message = 'docs/mvp-loop.md missing DESIGN.md gate rule' },
  @{ Path = 'docs/handoff-progress.md'; Pattern = 'progress.md'; Message = 'docs/handoff-progress.md missing progress.md guidance' },
  @{ Path = 'docs/handoff-progress.md'; Pattern = 'DESIGN.md'; Message = 'docs/handoff-progress.md missing DESIGN.md handoff rule' },
  @{ Path = 'docs/product/blockchain-scope.md'; Pattern = 'Avalanche C-Chain'; Message = 'blockchain-scope missing Avalanche C-Chain' },
  @{ Path = 'docs/product/domain-rules.md'; Pattern = 'DeliveryEvent'; Message = 'domain-rules missing DeliveryEvent' },
  @{ Path = 'docs/product/demo-script.md'; Pattern = 'releaseMilestone'; Message = 'demo-script missing releaseMilestone step' },
  @{ Path = '.github/PULL_REQUEST_TEMPLATE.md'; Pattern = 'sdd-test'; Message = 'PR template missing sdd-test reference' },
  @{ Path = '.github/PULL_REQUEST_TEMPLATE.md'; Pattern = 'decision-gate'; Message = 'PR template missing decision-gate' },
  @{ Path = '.github/PULL_REQUEST_TEMPLATE.md'; Pattern = 'progress.md'; Message = 'PR template missing progress.md reference' },
  @{ Path = '.atl/skill-registry.md'; Pattern = 'sdd-test'; Message = 'Registry missing sdd-test' },
  @{ Path = '.atl/skill-registry.md'; Pattern = 'traceable-humanitarian'; Message = 'Registry missing updated triggers' },
  @{ Path = '.atl/skill-registry.md'; Pattern = 'DESIGN.md'; Message = 'Registry missing DESIGN.md references' }
)

foreach ($check in $checks) {
  $content = Get-Content $check.Path -Raw
  if ($content -notmatch [regex]::Escape($check.Pattern)) {
    throw $check.Message
  }
}

Write-Host 'Structure validation passed'
