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

mkdir -p docs skills changes examples scripts .atl .github output/playwright
printf 'Bootstrap complete in %s\n' "$ROOT_DIR"

for cmd in node npm npx python3 python; do
  if command -v "$cmd" >/dev/null 2>&1; then
    printf '[ok] optional command available: %s\n' "$cmd"
  else
    printf '[warn] optional command missing: %s\n' "$cmd"
  fi
done

if ! command -v npx >/dev/null 2>&1; then
  echo '[warn] Playwright CLI requires npx. Install Node.js/npm before relying on autonomous testing gates.'
else
  echo '[ok] npx detected. Playwright CLI workflows can be used by the autonomous testing strategy.'
fi
