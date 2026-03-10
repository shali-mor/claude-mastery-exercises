#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 04: Choosing Tools checks ==="

for f in roi-calculator.md my-stack.md antipatterns.md; do
  F="${WORK}/${f}"
  if [[ ! -f "$F" ]]; then bad "${f} not found"; else
    [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: no TODOs" || bad "${f}: has TODOs"
    [[ $(wc -l < "$F") -ge 5 ]] && ok "${f}: has content" || bad "${f}: too short"
  fi
done

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
