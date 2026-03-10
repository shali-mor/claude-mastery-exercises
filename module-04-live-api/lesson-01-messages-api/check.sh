#!/usr/bin/env bash
set -euo pipefail
PASS=0; FAIL=0
ok()  { echo "  ✅ $1"; ((PASS++)); }
bad() { echo "  ❌ $1"; ((FAIL++)); }

DIR="$(cd "$(dirname "$0")" && pwd)"
WORK="${DIR}/starter"

echo "=== Lesson 01: Messages API checks ==="

for f in hello-claude.ts chat.ts; do
  F="${WORK}/${f}"
  if [[ ! -f "$F" ]]; then bad "${f} not found"; else
    [[ $(grep -c "TODO" "$F" 2>/dev/null || true) -eq 0 ]] && ok "${f}: no TODOs" || bad "${f}: still has TODOs"
    grep -q "messages.create\|messages\.create" "$F" && ok "${f}: calls messages.create()" || bad "${f}: missing messages.create()"
  fi
done

grep -q "system" "${WORK}/chat.ts" 2>/dev/null && ok "chat.ts has a system prompt" || bad "chat.ts missing system prompt"
grep -q "role.*assistant\|assistant.*role" "${WORK}/chat.ts" 2>/dev/null && ok "chat.ts appends assistant messages" || bad "chat.ts not building conversation history"

echo ""
echo "Results: ${PASS} passed, ${FAIL} failed"
[[ $FAIL -eq 0 ]] && echo "🎉 All checks passed!" && exit 0 || exit 1
