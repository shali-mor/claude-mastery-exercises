#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 01: GSD Methodology checks ==="

for f in PROJECT.md vocabulary.md command-map.md; do
  F="${WORK}/${f}"
  if [[ ! -f "$F" ]]; then bad "${f} not found"; else
    [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: no TODOs" || bad "${f}: has TODOs"
    [[ $(wc -l < "$F") -ge 8 ]] && ok "${f}: has content" || bad "${f}: too short"
  fi
done

PM="${WORK}/PROJECT.md"
grep -qi "milestone\|phase" "$PM" 2>/dev/null && ok "PROJECT.md has milestone/phase structure" || bad "PROJECT.md missing milestone/phase"

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
