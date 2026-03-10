#!/usr/bin/env bash
PASS=0
FAIL=0

check() {
  local desc="$1"
  local cmd="$2"
  if eval "$cmd" &>/dev/null; then
    echo "  [PASS] $desc"
    ((PASS++))
  else
    echo "  [FAIL] $desc"
    ((FAIL++))
  fi
}

echo ""
echo "=== Lesson 3-2 Checks ==="
echo ""

check "ai.ts has cache_control" "grep -q 'cache_control' starter/src/ai.ts"
check "ai.ts has ephemeral type" "grep -q 'ephemeral' starter/src/ai.ts"
check "chatbot.ts TODO removed" "! grep -q 'TODO' starter/src/chatbot.ts"
check "chatbot.ts calls askWithCaching" "grep -q 'askWithCaching' starter/src/chatbot.ts"
check "chatbot.ts prints cache stats" "grep -qi 'cache' starter/src/chatbot.ts"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Move on to Lesson 3-3."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
