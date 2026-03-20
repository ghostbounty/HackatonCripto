#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

required_commands=(git bash)
for cmd in "${required_commands[@]}"; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 1
  fi
done

mkdir -p docs skills changes examples scripts .atl .github output/playwright \
  genlayer-mvp/cases genlayer-mvp/evidence-policies genlayer-mvp/receipts genlayer-mvp/integration \
  legacy/marketplace-demo
printf 'Bootstrap complete in %s\n' "$ROOT_DIR"
echo 'Active baseline: genlayer-mvp/'
echo 'Archived reference: legacy/marketplace-demo/'

for cmd in node npm npx python3 python docker; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf '[ok] optional command available: %s\n' "$cmd"
    "$cmd" --version 2>/dev/null | head -n 1 || true
  else
    printf '[warn] optional command missing: %s\n' "$cmd"
  fi
done

if ! command -v npx >/dev/null 2>&1; then
  echo '[warn] Playwright CLI requires npx. Install Node.js/npm before relying on autonomous testing gates.'
fi

if ! command -v docker >/dev/null 2>&1; then
  echo '[warn] Docker is recommended for GenLayer local and Studio-like development flows.'
fi
