#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

required_paths=(
  "AGENTS.md"
  "README.md"
  "CONTRIBUTING.md"
  "skills"
  "scripts"
  "examples"
  "docs"
  "changes"
  ".atl"
  ".github"
  "docs/product"
  "docs/archive-boundary.md"
  "docs/architecture.md"
  "docs/autonomous-vibecoding.md"
  "docs/testing-strategy.md"
  "docs/seed-fixtures.md"
  "docs/mvp-loop.md"
  "docs/handoff-progress.md"
  "docs/progress-template.md"
  "genlayer-mvp"
  "genlayer-mvp/cases"
  "genlayer-mvp/evidence-policies"
  "genlayer-mvp/receipts"
  "genlayer-mvp/integration"
  "legacy/marketplace-demo"
  "changes/genlayer-mvp-baseline-reset"
)

required_skills=(
  "skills/sdd-init/SKILL.md"
  "skills/sdd-explore/SKILL.md"
  "skills/sdd-propose/SKILL.md"
  "skills/sdd-spec/SKILL.md"
  "skills/sdd-design/SKILL.md"
  "skills/sdd-tasks/SKILL.md"
  "skills/sdd-apply/SKILL.md"
  "skills/sdd-test/SKILL.md"
  "skills/sdd-verify/SKILL.md"
  "skills/sdd-archive/SKILL.md"
  "skills/skill-registry/SKILL.md"
  "skills/issue-creation/SKILL.md"
  "skills/branch-pr/SKILL.md"
)

for path in "${required_paths[@]}"; do
  [[ -e "$path" ]] || { echo "Missing required path: $path" >&2; exit 1; }
done

for skill in "${required_skills[@]}"; do
  [[ -f "$skill" ]] || { echo "Missing skill file: $skill" >&2; exit 1; }
done

for preserved in \
  "docs/product/hackathon-vision.md" \
  "docs/product/domain-rules.md" \
  "docs/product/blockchain-scope.md" \
  "docs/product/demo-script.md" \
  "changes/multi-agent-collaboration-protocol/progress.md" \
  "changes/traceable-volunteering-with-demo-crypto/proposal.md" \
  "changes/traceable-volunteering-with-demo-crypto/progress.md" \
  "changes/stretch-merit-reputation/proposal.md" \
  "changes/stretch-merit-reputation/progress.md"; do
  [[ -e "$preserved" ]] || { echo "Missing preserved artifact: $preserved" >&2; exit 1; }
done

for dir in changes/*; do
  [ -d "$dir" ] || continue
  [ -f "$dir/progress.md" ] || { echo "Missing progress artifact: $dir/progress.md" >&2; exit 1; }
done

[[ -f ".atl/skill-registry.md" ]] || { echo "Missing generated registry" >&2; exit 1; }

grep -q "genlayer-mvp/" README.md || { echo "README.md missing active baseline reference" >&2; exit 1; }
grep -q "docs/archive-boundary.md" README.md || { echo "README.md missing archive boundary reference" >&2; exit 1; }
grep -q "genlayer-mvp/" AGENTS.md || { echo "AGENTS.md missing active baseline path" >&2; exit 1; }
grep -q "legacy/marketplace-demo/" AGENTS.md || { echo "AGENTS.md missing archive path" >&2; exit 1; }
grep -q "accepted" AGENTS.md || { echo "AGENTS.md missing accepted state" >&2; exit 1; }
grep -q "finalized" AGENTS.md || { echo "AGENTS.md missing finalized state" >&2; exit 1; }
grep -q "Playwright CLI" AGENTS.md || { echo "AGENTS.md missing Playwright CLI strategy" >&2; exit 1; }
grep -q "No avanzar sin pruebas" AGENTS.md || { echo "AGENTS.md missing no-test gate policy" >&2; exit 1; }
grep -q "progress.md" AGENTS.md || { echo "AGENTS.md missing progress.md contract" >&2; exit 1; }

grep -q "GenLayerJS" docs/architecture.md || { echo "docs/architecture.md missing GenLayerJS" >&2; exit 1; }
grep -qi "baseline activo" docs/archive-boundary.md || { echo "docs/archive-boundary.md missing active/archive framing" >&2; exit 1; }
grep -q "APPROVED" docs/testing-strategy.md || { echo "docs/testing-strategy.md missing APPROVED scenario" >&2; exit 1; }
grep -q "FINALIZED" docs/testing-strategy.md || { echo "docs/testing-strategy.md missing FINALIZED scenario" >&2; exit 1; }
grep -q "evidencia estructurada" docs/seed-fixtures.md || { echo "docs/seed-fixtures.md missing evidence fixture definition" >&2; exit 1; }
grep -q "Avanzar solo por evidencia" docs/mvp-loop.md || { echo "docs/mvp-loop.md missing evidence rule" >&2; exit 1; }
grep -qi "politica de evidencia vigente" docs/handoff-progress.md || { echo "docs/handoff-progress.md missing evidence handoff guidance" >&2; exit 1; }
grep -q "progress.md" .github/PULL_REQUEST_TEMPLATE.md || { echo "PR template missing progress.md reference" >&2; exit 1; }
grep -q "genlayer-mvp/" .github/PULL_REQUEST_TEMPLATE.md || { echo "PR template missing active surface reference" >&2; exit 1; }
grep -q "sdd-test" .atl/skill-registry.md || { echo "Registry missing sdd-test" >&2; exit 1; }
grep -q "Next" .atl/skill-registry.md || { echo "Registry missing expanded columns" >&2; exit 1; }
grep -qi "archivado" legacy/marketplace-demo/README.md || { echo "Legacy archive missing archived notice" >&2; exit 1; }
grep -q "accepted" genlayer-mvp/README.md || { echo "Active scaffold missing accepted state" >&2; exit 1; }
grep -q "finalized" genlayer-mvp/README.md || { echo "Active scaffold missing finalized state" >&2; exit 1; }

legacy_guard_paths=(
  "README.md"
  "AGENTS.md"
  "docs/architecture.md"
  "docs/testing-strategy.md"
  "docs/seed-fixtures.md"
  "docs/installation.md"
)

for path in "${legacy_guard_paths[@]}"; do
  ! grep -q "merito peer-to-peer" "$path" || { echo "Legacy operational framing still present in $path: merito peer-to-peer" >&2; exit 1; }
  ! grep -q "window.ethereum" "$path" || { echo "Legacy operational framing still present in $path: window.ethereum" >&2; exit 1; }
  ! grep -q "tx_hash" "$path" || { echo "Legacy operational framing still present in $path: tx_hash" >&2; exit 1; }
  ! grep -q "marketplace de voluntariado" "$path" || { echo "Legacy operational framing still present in $path: marketplace de voluntariado" >&2; exit 1; }
  ! grep -q "testnet compatible con Ethereum" "$path" || { echo "Legacy operational framing still present in $path: testnet compatible con Ethereum" >&2; exit 1; }
done

echo "Structure validation passed"
