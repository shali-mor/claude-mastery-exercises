#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 04: Prompt Engineering checks ==="

for f in prompt-library.md test-cases.md; do
  F="${WORK}/${f}"
  [[ -f "$F" && $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: completed" || bad "${f}: missing or has TODOs"
done

OV="${WORK}/output-validator.ts"
if [[ ! -f "$OV" ]]; then bad "output-validator.ts not found"; else
  [[ $(grep -c "TODO" "$OV" 2>/dev/null || true) -eq 0 ]] && ok "output-validator.ts: no TODOs" || bad "output-validator.ts: has TODOs"
  grep -q "JSON.parse\|valid" "$OV" && ok "Validator parses and validates JSON" || bad "Validator missing JSON parsing"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
