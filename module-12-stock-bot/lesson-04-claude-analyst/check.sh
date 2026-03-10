#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 04: Claude Analyst checks ==="

AZ="${WORK}/analyzer.ts"
if [[ ! -f "$AZ" ]]; then bad "analyzer.ts not found"; else
  [[ $(grep -c "TODO" "$AZ" 2>/dev/null || true) -eq 0 ]] && ok "analyzer.ts: no TODOs" || bad "analyzer.ts: has TODOs"
  grep -q "Anthropic\|claude\|messages" "$AZ" && ok "Calls Claude API" || bad "Missing Claude API call"
  grep -q "system\|analyst" "$AZ" && ok "Has system prompt" || bad "Missing system prompt"
fi

IX="${WORK}/index.ts"
if [[ ! -f "$IX" ]]; then bad "index.ts not found"; else
  [[ $(grep -c "TODO" "$IX" 2>/dev/null || true) -eq 0 ]] && ok "index.ts: no TODOs" || bad "index.ts: has TODOs"
  grep -q "analyzeStock\|bot.launch" "$IX" && ok "index.ts wires bot and analyzer" || bad "index.ts missing wiring"
fi

TB="${WORK}/test-bot.ts"
[[ -f "$TB" && $(grep -c "TODO" "$TB" 2>/dev/null || true) -eq 0 ]] && ok "test-bot.ts: no TODOs" || bad "test-bot.ts: missing or has TODOs"

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
