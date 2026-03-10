#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 02: Starting & Planning checks ==="

PM="${WORK}/PLAN.md"
if [[ ! -f "$PM" ]]; then bad "PLAN.md not found"; else
  [[ $(grep -c "TODO" "$PM" 2>/dev/null || true) -eq 0 ]] && ok "PLAN.md: no TODOs" || bad "PLAN.md: has TODOs"
  grep -qi "task\|step\|commit" "$PM" && ok "PLAN.md has tasks and commits" || bad "PLAN.md missing tasks"
  [[ $(wc -l < "$PM") -ge 15 ]] && ok "PLAN.md is substantial" || bad "PLAN.md too short"
fi

RC="${WORK}/research-checklist.md"
[[ -f "$RC" && $(grep -c "TODO" "$RC" 2>/dev/null || true) -eq 0 ]] && ok "research-checklist.md completed" || bad "research-checklist.md missing or has TODOs"

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
