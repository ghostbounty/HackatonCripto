#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

mkdir -p .atl

python3 - <<'PY'
from pathlib import Path
import re

root = Path('.')
skills_dir = root / 'skills'
out = root / '.atl' / 'skill-registry.md'

entries = []
for skill_md in sorted(skills_dir.glob('*/SKILL.md')):
    text = skill_md.read_text(encoding='utf-8')
    rel = skill_md.parent.as_posix()
    name_match = re.search(r'^name:\s*(.+)$', text, re.M)
    desc_match = re.search(r'^description:\s*(.+)$', text, re.M)
    def section(title):
        m = re.search(rf'^# {re.escape(title)}\n\n(.*?)(?=^# |\Z)', text, re.S | re.M)
        return ' '.join(line.strip() for line in m.group(1).strip().splitlines()) if m else ''
    trigger = desc_match.group(1).strip() if desc_match else ''
    inputs = section('Inputs')
    outputs = section('Outputs / artifacts')
    entries.append((name_match.group(1).strip() if name_match else skill_md.parent.name, rel, trigger, inputs, outputs))

lines = [
    '# Skill Registry',
    '',
    'Índice regenerable de skills. Regenerar con `./scripts/setup.sh` o `pwsh ./scripts/setup.ps1`.',
    '',
    '| Skill | Path | Trigger | Inputs | Outputs |',
    '| --- | --- | --- | --- | --- |',
]
for name, path, trigger, inputs, outputs in entries:
    def clean(value):
        return value.replace('|', '/').replace('\n', ' ').strip()
    lines.append(f'| `{name}` | `{path}` | {clean(trigger)} | {clean(inputs)} | {clean(outputs)} |')
out.write_text('\n'.join(lines) + '\n', encoding='utf-8')
PY

echo "Generated .atl/skill-registry.md"
