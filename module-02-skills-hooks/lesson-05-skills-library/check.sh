#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
CMDS="${DIR}/starter/commands"

echo "=== Lesson 05: Skills Library checks ==="

for skill in changelog debug-plan refactor-check env-audit new-skill; do
  F="${CMDS}/${skill}.md"
  if [[ ! -f "$F" ]]; then
    bad "${skill}.md not found"
  else
    [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] \
      && ok "${skill}.md has no remaining TODOs" \
      || bad "${skill}.md still has TODO markers"
    [[ $(wc -l < "$F") -ge 5 ]] \
      && ok "${skill}.md has meaningful content (≥5 lines)" \
      || bad "${skill}.md is too short"
  fi
done

# SKILLS.md index
SM="${DIR}/starter/SKILLS.md"
if [[ ! -f "$SM" ]]; then bad "SKILLS.md not found"; else
  [[ $(grep -c "TODO" "$SM" 2>/dev/null || true) -eq 0 ]] && ok "SKILLS.md no TODOs" || bad "SKILLS.md still has TODOs"
  grep -q "|" "$SM" && ok "SKILLS.md has a table" || bad "SKILLS.md missing table"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
