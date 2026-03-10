#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 02: Streaming checks ==="

F1="${WORK}/stream-basic.ts"
if [[ ! -f "$F1" ]]; then bad "stream-basic.ts not found"; else
  [[ $(grep -c "TODO" "$F1" 2>/dev/null || true) -eq 0 ]] && ok "stream-basic.ts: no TODOs" || bad "stream-basic.ts: has TODOs"
  grep -q "\.stream(" "$F1" && ok "stream-basic.ts uses .stream()" || bad "stream-basic.ts missing .stream()"
  grep -q "on('text'\|on(\"text\"" "$F1" && ok "stream-basic.ts listens to text events" || bad "stream-basic.ts missing text event handler"
  grep -q "finalMessage" "$F1" && ok "stream-basic.ts calls finalMessage()" || bad "stream-basic.ts missing finalMessage()"
fi

F2="${WORK}/stream-abort.ts"
if [[ ! -f "$F2" ]]; then bad "stream-abort.ts not found"; else
  [[ $(grep -c "TODO" "$F2" 2>/dev/null || true) -eq 0 ]] && ok "stream-abort.ts: no TODOs" || bad "stream-abort.ts: has TODOs"
  grep -q "abort()" "$F2" && ok "stream-abort.ts calls abort()" || bad "stream-abort.ts missing abort()"
fi

F3="${WORK}/stream-server.ts"
if [[ ! -f "$F3" ]]; then bad "stream-server.ts not found"; else
  [[ $(grep -c "TODO" "$F3" 2>/dev/null || true) -eq 0 ]] && ok "stream-server.ts: no TODOs" || bad "stream-server.ts: has TODOs"
  grep -q "text/event-stream\|event-stream" "$F3" && ok "stream-server.ts uses SSE content-type" || bad "stream-server.ts missing SSE headers"
fi

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
