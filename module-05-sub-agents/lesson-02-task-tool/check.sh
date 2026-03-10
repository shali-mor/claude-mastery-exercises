#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 02: Task Tool checks ==="

for f in prompt-fixes.md task-templates.md; do
  F="${WORK}/${f}"
  if [[ ! -f "$F" ]]; then bad "${f} not found"; else
    [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: no TODOs" || bad "${f}: still has TODOs"
    [[ $(wc -l < "$F") -ge 10 ]] && ok "${f}: has substantial content" || bad "${f}: too short"
  fi
done

# Check task-templates.md has key Task tool params
TT="${WORK}/task-templates.md"
grep -qi "subagent_type\|run_in_background\|model" "$TT" 2>/dev/null && ok "task-templates.md mentions Task params" || bad "task-templates.md missing Task tool params"

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
