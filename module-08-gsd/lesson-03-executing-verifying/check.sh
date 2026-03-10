#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 03: Execute & Verify checks ==="

for f in execution-log.md verification-report.md rollback-plan.md; do
  F="${WORK}/${f}"
  if [[ ! -f "$F" ]]; then bad "${f} not found"; else
    [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: no TODOs" || bad "${f}: has TODOs"
    [[ $(wc -l < "$F") -ge 5 ]] && ok "${f}: has content" || bad "${f}: too short"
  fi
done

VR="${WORK}/verification-report.md"
grep -qi "pass\|fail\|partial\|goal" "$VR" 2>/dev/null && ok "verification-report.md has verdict" || bad "verification-report.md missing verdict"

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
