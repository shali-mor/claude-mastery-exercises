#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 03: Parallel Analysis checks ==="

for agent in security-agent quality-agent test-agent; do
  F="${WORK}/agent-prompts/${agent}.md"
  if [[ ! -f "$F" ]]; then bad "${agent}.md not found"; else
    [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${agent}.md: no TODOs" || bad "${agent}.md: has TODOs"
    grep -q '```json\|json' "$F" && ok "${agent}.md specifies JSON output" || bad "${agent}.md missing JSON format"
  fi
done

AG="${WORK}/aggregator.ts"
if [[ ! -f "$AG" ]]; then bad "aggregator.ts not found"; else
  [[ $(grep -c "TODO" "$AG" 2>/dev/null || true) -eq 0 ]] && ok "aggregator.ts: no TODOs" || bad "aggregator.ts: has TODOs"
  grep -q "security\|quality\|test" "$AG" && ok "Aggregator handles all 3 agents" || bad "Aggregator missing agent handling"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
