#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 05: Auto Model Selection checks ==="

PM="${WORK}/commands/pick-model.md"
if [[ ! -f "$PM" ]]; then bad "commands/pick-model.md not found"; else
  [[ $(grep -c "TODO" "$PM" 2>/dev/null || true) -eq 0 ]] && ok "No TODOs in pick-model.md" || bad "pick-model.md still has TODOs"
  grep -qi "haiku\|sonnet\|opus" "$PM" && ok "Skill mentions model names" || bad "Skill missing model names"
  grep -qi "score\|0–\|0-" "$PM" && ok "Skill has scoring rubric" || bad "Skill missing scoring rubric"
fi

MG="${WORK}/hooks/model-guard.sh"
if [[ ! -f "$MG" ]]; then bad "hooks/model-guard.sh not found"; else
  [[ $(grep -c "TODO" "$MG" 2>/dev/null || true) -eq 0 ]] && ok "No TODOs in model-guard.sh" || bad "model-guard.sh still has TODOs"
  grep -q "exit 2\|exit2" "$MG" && ok "Hook uses exit 2 to block" || bad "Hook missing exit 2"
fi

SW="${WORK}/scoring-worksheet.md"
if [[ ! -f "$SW" ]]; then bad "scoring-worksheet.md not found"; else
  [[ $(grep -c "TODO" "$SW" 2>/dev/null || true) -eq 0 ]] && ok "scoring-worksheet.md filled in" || bad "scoring-worksheet.md still has TODOs"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
