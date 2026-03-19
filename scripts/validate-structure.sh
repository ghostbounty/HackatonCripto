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
)

required_skills=(
  "skills/sdd-init/SKILL.md"
  "skills/sdd-explore/SKILL.md"
  "skills/sdd-propose/SKILL.md"
  "skills/sdd-spec/SKILL.md"
  "skills/sdd-design/SKILL.md"
  "skills/sdd-tasks/SKILL.md"
  "skills/sdd-apply/SKILL.md"
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
  "changes/traceable-volunteering-with-demo-crypto/proposal.md" \
  "changes/stretch-merit-reputation/proposal.md"; do
  [[ -e "$preserved" ]] || { echo "Missing preserved artifact: $preserved" >&2; exit 1; }
done

[[ -f ".atl/skill-registry.md" ]] || { echo "Missing generated registry" >&2; exit 1; }

echo "Structure validation passed"
