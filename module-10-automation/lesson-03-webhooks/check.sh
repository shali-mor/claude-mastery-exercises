#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 03: Webhooks checks ==="

WS="${WORK}/webhook-server.ts"
if [[ ! -f "$WS" ]]; then bad "webhook-server.ts not found"; else
  [[ $(grep -c "TODO" "$WS" 2>/dev/null || true) -eq 0 ]] && ok "webhook-server.ts: no TODOs" || bad "webhook-server.ts: has TODOs"
  grep -q "createHmac\|timingSafeEqual\|signature" "$WS" && ok "Validates webhook signature" || bad "Missing signature validation"
  grep -q "claude\|Anthropic\|messages" "$WS" && ok "Calls Claude API" || bad "Missing Claude API call"
fi

SC="${WORK}/security-checklist.md"
[[ -f "$SC" && $(grep -c "TODO" "$SC" 2>/dev/null || true) -eq 0 ]] && ok "security-checklist.md completed" || bad "security-checklist.md missing or has TODOs"

RQ="${WORK}/retry-queue.ts"
if [[ ! -f "$RQ" ]]; then bad "retry-queue.ts not found"; else
  [[ $(grep -c "TODO" "$RQ" 2>/dev/null || true) -eq 0 ]] && ok "retry-queue.ts: no TODOs" || bad "retry-queue.ts: has TODOs"
  grep -q "backoff\|exponential\|setTimeout\|attempts" "$RQ" && ok "Implements retry with backoff" || bad "Missing retry/backoff logic"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
