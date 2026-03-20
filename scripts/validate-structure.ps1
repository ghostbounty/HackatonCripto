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
  'docs/archive-boundary.md',
  'docs/architecture.md',
  'docs/design-system.md',
  'docs/autonomous-vibecoding.md',
  'docs/testing-strategy.md',
  'docs/seed-fixtures.md',
  'docs/mvp-loop.md',
  'docs/handoff-progress.md',
  'docs/progress-template.md',
  'genlayer-mvp',
  'genlayer-mvp/cases',
  'genlayer-mvp/evidence-policies',
  'genlayer-mvp/receipts',
  'genlayer-mvp/integration',
  'legacy/marketplace-demo',
  'changes/genlayer-mvp-baseline-reset'
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

foreach ($dir in Get-ChildItem changes -Directory) {
  $progressFile = Join-Path $dir.FullName 'progress.md'
  if (-not (Test-Path $progressFile)) {
    throw "Missing progress artifact: $progressFile"
  }
}

if (-not (Test-Path '.atl/skill-registry.md')) {
  throw 'Missing generated registry'
}

$checks = @(
  @{ Path = 'README.md'; Pattern = 'genlayer-mvp/'; Message = 'README.md missing active baseline reference' },
  @{ Path = 'README.md'; Pattern = 'docs/archive-boundary.md'; Message = 'README.md missing archive boundary reference' },
  @{ Path = 'README.md'; Pattern = 'docs/design-system.md'; Message = 'README.md missing design-system reference' },
  @{ Path = 'AGENTS.md'; Pattern = 'genlayer-mvp/'; Message = 'AGENTS.md missing active baseline path' },
  @{ Path = 'AGENTS.md'; Pattern = 'legacy/marketplace-demo/'; Message = 'AGENTS.md missing archive path' },
  @{ Path = 'AGENTS.md'; Pattern = 'docs/design-system.md'; Message = 'AGENTS.md missing design-system reference' },
  @{ Path = 'AGENTS.md'; Pattern = 'accepted'; Message = 'AGENTS.md missing accepted state' },
  @{ Path = 'AGENTS.md'; Pattern = 'finalized'; Message = 'AGENTS.md missing finalized state' },
  @{ Path = 'AGENTS.md'; Pattern = 'Playwright CLI'; Message = 'AGENTS.md missing Playwright CLI strategy' },
  @{ Path = 'AGENTS.md'; Pattern = 'No avanzar sin pruebas'; Message = 'AGENTS.md missing no-test gate policy' },
  @{ Path = 'AGENTS.md'; Pattern = 'progress.md'; Message = 'AGENTS.md missing progress.md contract' },
  @{ Path = 'docs/architecture.md'; Pattern = 'GenLayerJS'; Message = 'docs/architecture.md missing GenLayerJS' },
  @{ Path = 'docs/architecture.md'; Pattern = 'docs/design-system.md'; Message = 'docs/architecture.md missing design-system reference' },
  @{ Path = 'docs/design-system.md'; Pattern = 'accepted'; Message = 'docs/design-system.md missing accepted state' },
  @{ Path = 'docs/design-system.md'; Pattern = 'finalized'; Message = 'docs/design-system.md missing finalized state' },
  @{ Path = 'docs/design-system.md'; Pattern = 'evidencia'; Message = 'docs/design-system.md missing evidence guidance' },
  @{ Path = 'docs/archive-boundary.md'; Pattern = 'baseline activo'; Message = 'docs/archive-boundary.md missing active/archive framing' },
  @{ Path = 'docs/testing-strategy.md'; Pattern = 'APPROVED'; Message = 'docs/testing-strategy.md missing APPROVED scenario' },
  @{ Path = 'docs/testing-strategy.md'; Pattern = 'FINALIZED'; Message = 'docs/testing-strategy.md missing FINALIZED scenario' },
  @{ Path = 'docs/seed-fixtures.md'; Pattern = 'evidencia estructurada'; Message = 'docs/seed-fixtures.md missing evidence fixture definition' },
  @{ Path = 'docs/mvp-loop.md'; Pattern = 'Avanzar solo por evidencia'; Message = 'docs/mvp-loop.md missing evidence rule' },
  @{ Path = 'docs/handoff-progress.md'; Pattern = 'politica de evidencia vigente'; Message = 'docs/handoff-progress.md missing evidence handoff guidance' },
  @{ Path = '.github/PULL_REQUEST_TEMPLATE.md'; Pattern = 'progress.md'; Message = 'PR template missing progress.md reference' },
  @{ Path = '.github/PULL_REQUEST_TEMPLATE.md'; Pattern = 'genlayer-mvp/'; Message = 'PR template missing active surface reference' },
  @{ Path = '.github/PULL_REQUEST_TEMPLATE.md'; Pattern = 'docs/design-system.md'; Message = 'PR template missing design-system reference' },
  @{ Path = 'skills/sdd-design/SKILL.md'; Pattern = 'docs/design-system.md'; Message = 'sdd-design missing design-system reference' },
  @{ Path = 'skills/sdd-apply/SKILL.md'; Pattern = 'docs/design-system.md'; Message = 'sdd-apply missing design-system reference' },
  @{ Path = 'skills/sdd-test/SKILL.md'; Pattern = 'docs/design-system.md'; Message = 'sdd-test missing design-system reference' },
  @{ Path = 'skills/sdd-verify/SKILL.md'; Pattern = 'docs/design-system.md'; Message = 'sdd-verify missing design-system reference' },
  @{ Path = '.atl/skill-registry.md'; Pattern = 'sdd-test'; Message = 'Registry missing sdd-test' },
  @{ Path = '.atl/skill-registry.md'; Pattern = 'Next'; Message = 'Registry missing expanded columns' },
  @{ Path = 'legacy/marketplace-demo/README.md'; Pattern = 'archivado'; Message = 'Legacy archive missing archived notice' },
  @{ Path = 'genlayer-mvp/README.md'; Pattern = 'accepted'; Message = 'Active scaffold missing accepted state' },
  @{ Path = 'genlayer-mvp/README.md'; Pattern = 'finalized'; Message = 'Active scaffold missing finalized state' }
)

foreach ($check in $checks) {
  $content = Get-Content $check.Path -Raw
  if ($content -notmatch [regex]::Escape($check.Pattern)) {
    throw $check.Message
  }
}

$legacyGuardPaths = @(
  'README.md',
  'AGENTS.md',
  'docs/architecture.md',
  'docs/testing-strategy.md',
  'docs/seed-fixtures.md',
  'docs/installation.md'
)

$forbiddenPatterns = @(
  'merito peer-to-peer',
  'window.ethereum',
  'tx_hash',
  'marketplace de voluntariado',
  'testnet compatible con Ethereum'
)

foreach ($path in $legacyGuardPaths) {
  $content = Get-Content $path -Raw
  foreach ($pattern in $forbiddenPatterns) {
    if ($content -match [regex]::Escape($pattern)) {
      throw "Legacy operational framing still present in ${path}: $pattern"
    }
  }
}

Write-Host 'Structure validation passed'
