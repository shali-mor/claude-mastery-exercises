#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 04: Production Patterns checks ==="

RC="${WORK}/resilient-client.ts"
if [[ ! -f "$RC" ]]; then bad "resilient-client.ts not found"; else
  [[ $(grep -c "TODO" "$RC" 2>/dev/null || true) -eq 0 ]] && ok "resilient-client.ts: no TODOs" || bad "resilient-client.ts: has TODOs"
  grep -q "maxRetries" "$RC" && ok "Uses maxRetries" || bad "Missing maxRetries"
  grep -q "RateLimitError\|APIConnectionError" "$RC" && ok "Handles rate limits and connection errors" || bad "Missing error classification"
fi

CL="${WORK}/cost-logger.ts"
if [[ ! -f "$CL" ]]; then bad "cost-logger.ts not found"; else
  [[ $(grep -c "TODO" "$CL" 2>/dev/null || true) -eq 0 ]] && ok "cost-logger.ts: no TODOs" || bad "cost-logger.ts: has TODOs"
  grep -q "input_tokens\|output_tokens" "$CL" && ok "Tracks token usage" || bad "Missing token tracking"
  grep -q "getSessionCost\|sessionCost" "$CL" && ok "Has session cost tracking" || bad "Missing session cost"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
