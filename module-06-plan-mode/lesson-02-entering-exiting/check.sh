#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 02: Entering/Exiting Plan Mode checks ==="

CS="${WORK}/cheat-sheet.md"
[[ -f "$CS" && $(grep -c "TODO" "$CS" 2>/dev/null || true) -eq 0 ]] && ok "cheat-sheet.md completed" || bad "cheat-sheet.md missing or has TODOs"

HK="${WORK}/hooks/auto-plan-suggest.sh"
if [[ ! -f "$HK" ]]; then bad "hooks/auto-plan-suggest.sh not found"; else
  [[ $(grep -c "TODO" "$HK" 2>/dev/null || true) -eq 0 ]] && ok "auto-plan-suggest.sh: no TODOs" || bad "auto-plan-suggest.sh: has TODOs"
  grep -qi "delete\|drop\|rm\|reset" "$HK" && ok "Hook checks for risky keywords" || bad "Hook missing risky keyword checks"
  grep -q "exit 0" "$HK" && ok "Hook exits 0 (warn but don't block)" || bad "Hook not exiting 0"
fi

JN="${WORK}/journal.md"
[[ -f "$JN" && $(grep -c "TODO" "$JN" 2>/dev/null || true) -eq 0 ]] && ok "journal.md completed" || bad "journal.md missing or has TODOs"

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
