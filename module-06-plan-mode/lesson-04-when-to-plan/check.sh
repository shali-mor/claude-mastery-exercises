#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 04: When To Plan checks ==="

for f in decision-tree.md CLAUDE.md-section.md; do
  F="${WORK}/${f}"
  [[ -f "$F" && $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: completed" || bad "${f}: missing or has TODOs"
done

HK="${WORK}/hooks/require-plan.sh"
if [[ ! -f "$HK" ]]; then bad "hooks/require-plan.sh not found"; else
  [[ $(grep -c "TODO" "$HK" 2>/dev/null || true) -eq 0 ]] && ok "require-plan.sh: no TODOs" || bad "require-plan.sh: has TODOs"
  grep -q "exit 2" "$HK" && ok "Hook exits 2 to block" || bad "Hook missing exit 2"
  grep -q "PLAN.md" "$HK" && ok "Hook checks for PLAN.md" || bad "Hook doesn't check for PLAN.md"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
