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

def section(text: str, title: str) -> str:
    match = re.search(rf'^# {re.escape(title)}\n\n(.*?)(?=^# |\Z)', text, re.S | re.M)
    if not match:
        return ''
    return ' '.join(line.strip() for line in match.group(1).strip().splitlines() if line.strip())

def clean(value: str) -> str:
    return value.replace('|', '/').replace('\n', ' ').strip()

entries = []
for skill_md in sorted(skills_dir.glob('*/SKILL.md')):
    if skill_md.parent.name == '_shared':
        continue
    text = skill_md.read_text(encoding='utf-8')
    name_match = re.search(r'^name:\s*(.+)$', text, re.M)
    desc_match = re.search(r'^description:\s*(.+)$', text, re.M)
    entries.append((
        name_match.group(1).strip() if name_match else skill_md.parent.name,
        skill_md.parent.as_posix(),
        desc_match.group(1).strip() if desc_match else '',
        section(text, 'Inputs'),
        section(text, 'Outputs / artifacts'),
        section(text, 'Done criteria'),
        section(text, 'Blocking criteria'),
        section(text, 'Next allowed skill'),
    ))

lines = [
    '# Skill Registry',
    '',
    'Indice regenerable de skills. Regenerar con `./scripts/setup.sh` o `pwsh ./scripts/setup.ps1`.',
    '',
    '| Skill | Path | Trigger | Inputs | Outputs | Done | Blocks | Next |',
    '| --- | --- | --- | --- | --- | --- | --- | --- |',
]

for name, path, trigger, inputs, outputs, done, blocks, next_skill in entries:
    lines.append(
        f'| `{name}` | `{path}` | {clean(trigger)} | {clean(inputs)} | {clean(outputs)} | {clean(done)} | {clean(blocks)} | {clean(next_skill)} |'
    )

out.write_text('\n'.join(lines) + '\n', encoding='utf-8')
PY

echo "Generated .atl/skill-registry.md"
