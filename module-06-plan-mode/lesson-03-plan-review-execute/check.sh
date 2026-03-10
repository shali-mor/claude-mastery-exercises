#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 03: Plan Review Execute checks ==="

for f in plan.md review-checklist.md execution-log.md; do
  F="${WORK}/${f}"
  if [[ ! -f "$F" ]]; then bad "${f} not found"; else
    [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: no TODOs" || bad "${f}: still has TODOs"
    [[ $(wc -l < "$F") -ge 5 ]] && ok "${f}: has content" || bad "${f}: too short"
  fi
done

# Check refactoring was done
TV="${WORK}/app/token-validator.ts"
[[ -f "$TV" ]] && ok "token-validator.ts created" || bad "token-validator.ts not found"

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
