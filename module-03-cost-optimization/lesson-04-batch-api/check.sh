#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 04: Batch API checks ==="

F="${WORK}/classify-tickets.ts"
if [[ ! -f "$F" ]]; then bad "classify-tickets.ts not found"; else
  [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "No TODOs remaining" || bad "Still has TODO markers"
  grep -q "batches.create" "$F" && ok "Uses batches.create()" || bad "Missing batches.create() call"
  grep -q "batches.retrieve\|batches.results" "$F" && ok "Polls for results" || bad "Missing polling logic"
  grep -q "custom_id" "$F" && ok "Uses custom_id" || bad "Missing custom_id"
fi

CC="${WORK}/cost-comparison.md"
if [[ ! -f "$CC" ]]; then bad "cost-comparison.md not found"; else
  [[ $(grep -c "TODO" "$CC" 2>/dev/null || true) -eq 0 ]] && ok "cost-comparison.md filled in" || bad "cost-comparison.md still has TODOs"
  grep -qi "50%\|half\|savings" "$CC" && ok "Shows cost savings" || bad "Missing cost savings calculation"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
