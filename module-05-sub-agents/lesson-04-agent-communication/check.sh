#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 04: Agent Communication checks ==="

RS="${WORK}/result-schema.json"
if [[ ! -f "$RS" ]]; then bad "result-schema.json not found"; else
  python3 -c "import json,sys; json.load(open('$RS'))" 2>/dev/null && ok "result-schema.json is valid JSON" || bad "result-schema.json is invalid JSON"
  grep -q "findings\|status\|summary" "$RS" && ok "Schema has required fields" || bad "Schema missing required fields"
fi

SP="${WORK}/sub-agent-prompt.md"
if [[ ! -f "$SP" ]]; then bad "sub-agent-prompt.md not found"; else
  [[ $(grep -c "TODO" "$SP" 2>/dev/null || true) -eq 0 ]] && ok "sub-agent-prompt.md: no TODOs" || bad "sub-agent-prompt.md: has TODOs"
  grep -q '```json\|json' "$SP" && ok "Prompt specifies JSON output" || bad "Prompt missing JSON format instruction"
fi

OH="${WORK}/orchestrator-handler.ts"
if [[ ! -f "$OH" ]]; then bad "orchestrator-handler.ts not found"; else
  [[ $(grep -c "TODO" "$OH" 2>/dev/null || true) -eq 0 ]] && ok "orchestrator-handler.ts: no TODOs" || bad "orchestrator-handler.ts: has TODOs"
  grep -q "JSON.parse\|try.*catch" "$OH" && ok "Handler parses JSON and handles errors" || bad "Handler missing JSON parsing or error handling"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
