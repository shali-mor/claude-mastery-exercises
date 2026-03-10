#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 03: Advanced Techniques checks ==="

TA="${WORK}/tool-agent.ts"
if [[ ! -f "$TA" ]]; then bad "tool-agent.ts not found"; else
  [[ $(grep -c "TODO" "$TA" 2>/dev/null || true) -eq 0 ]] && ok "tool-agent.ts: no TODOs" || bad "tool-agent.ts: has TODOs"
  grep -q "tools:" "$TA" && ok "tool-agent.ts defines tools" || bad "tool-agent.ts missing tools"
  grep -q "tool_use\|tool_result" "$TA" && ok "tool-agent.ts handles tool_use/result" || bad "tool-agent.ts missing tool handling"
fi

SO="${WORK}/structured-output.ts"
if [[ ! -f "$SO" ]]; then bad "structured-output.ts not found"; else
  [[ $(grep -c "TODO" "$SO" 2>/dev/null || true) -eq 0 ]] && ok "structured-output.ts: no TODOs" || bad "structured-output.ts: has TODOs"
  grep -q "input_schema\|json" "$SO" && ok "structured-output.ts uses schema" || bad "structured-output.ts missing schema"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
