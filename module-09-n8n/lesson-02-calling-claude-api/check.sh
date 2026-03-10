#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 02: Calling Claude API checks ==="

HRC="${WORK}/http-request-config.json"
if [[ ! -f "$HRC" ]]; then bad "http-request-config.json not found"; else
  python3 -c "import json,sys; json.load(open('$HRC'))" 2>/dev/null && ok "http-request-config.json is valid JSON" || bad "Invalid JSON"
  grep -q "anthropic\|claude\|messages" "$HRC" && ok "Config references Claude API" || bad "Config missing Claude API reference"
fi

for f in response-parser.md pr-summary-workflow.md; do
  F="${WORK}/${f}"
  [[ -f "$F" && $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: completed" || bad "${f}: missing or has TODOs"
done

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
