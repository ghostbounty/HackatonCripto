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
  "docs/architecture.md"
  "docs/autonomous-vibecoding.md"
  "docs/testing-strategy.md"
  "docs/seed-fixtures.md"
  "docs/mvp-loop.md"
  "docs/handoff-progress.md"
  "docs/progress-template.md"
  "changes/traceable-humanitarian-delivery-on-avalanche"
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
  "changes/stretch-merit-reputation/progress.md" \
  "changes/traceable-humanitarian-delivery-on-avalanche/proposal.md" \
  "changes/traceable-humanitarian-delivery-on-avalanche/progress.md"; do
  [[ -e "$preserved" ]] || { echo "Missing preserved artifact: $preserved" >&2; exit 1; }
done

for dir in changes/*; do
  [ -d "$dir" ] || continue
  [ -f "$dir/progress.md" ] || { echo "Missing progress artifact: $dir/progress.md" >&2; exit 1; }
done

[[ -f ".atl/skill-registry.md" ]] || { echo "Missing generated registry" >&2; exit 1; }

grep -q "traceable-humanitarian-delivery-on-avalanche" AGENTS.md || { echo "AGENTS.md missing active change reference" >&2; exit 1; }
grep -q "Playwright CLI" AGENTS.md || { echo "AGENTS.md missing Playwright CLI strategy" >&2; exit 1; }
grep -q "No avanzar sin pruebas" AGENTS.md || { echo "AGENTS.md missing no-test gate policy" >&2; exit 1; }
grep -q "delivery event" AGENTS.md || { echo "AGENTS.md missing domain seed reference" >&2; exit 1; }
grep -q "progress.md" AGENTS.md || { echo "AGENTS.md missing progress.md contract" >&2; exit 1; }

grep -q "Avalanche C-Chain" README.md || { echo "README.md missing blockchain scope reference" >&2; exit 1; }
grep -q "MilestoneEscrow" docs/architecture.md || { echo "docs/architecture.md missing escrow architecture" >&2; exit 1; }
grep -q "Playwright CLI" docs/testing-strategy.md || { echo "docs/testing-strategy.md missing Playwright CLI" >&2; exit 1; }
grep -q "captura offline" docs/testing-strategy.md || { echo "docs/testing-strategy.md missing offline journey" >&2; exit 1; }
grep -q "delivery lot" docs/seed-fixtures.md || { echo "docs/seed-fixtures.md missing fixture definition" >&2; exit 1; }
grep -q "Avanzar solo por evidencia" docs/mvp-loop.md || { echo "docs/mvp-loop.md missing evidence rule" >&2; exit 1; }
grep -q "progress.md" docs/handoff-progress.md || { echo "docs/handoff-progress.md missing progress.md guidance" >&2; exit 1; }
grep -q "Avalanche C-Chain" docs/product/blockchain-scope.md || { echo "blockchain-scope missing Avalanche C-Chain" >&2; exit 1; }
grep -q "DeliveryEvent" docs/product/domain-rules.md || { echo "domain-rules missing DeliveryEvent" >&2; exit 1; }
grep -q "releaseMilestone" docs/product/demo-script.md || { echo "demo-script missing releaseMilestone step" >&2; exit 1; }

grep -q "sdd-test" .github/PULL_REQUEST_TEMPLATE.md || { echo "PR template missing sdd-test reference" >&2; exit 1; }
grep -q "decision-gate" .github/PULL_REQUEST_TEMPLATE.md || { echo "PR template missing decision-gate" >&2; exit 1; }
grep -q "progress.md" .github/PULL_REQUEST_TEMPLATE.md || { echo "PR template missing progress.md reference" >&2; exit 1; }

grep -q "sdd-test" .atl/skill-registry.md || { echo "Registry missing sdd-test" >&2; exit 1; }
grep -q "traceable-humanitarian" .atl/skill-registry.md || { echo "Registry missing updated triggers" >&2; exit 1; }

echo "Structure validation passed"
