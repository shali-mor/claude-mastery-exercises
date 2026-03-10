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
echo "=== Lesson 1-3 Checks ==="
echo ""

check "Claude Code is installed" "command -v claude"
check "summarize.sh has no remaining TODO" "! grep -q 'TODO' starter/scripts/summarize.sh"
check "review-files.sh has no remaining TODO" "! grep -q 'TODO' starter/scripts/review-files.sh"
check "extract-todos.sh has no remaining TODO" "! grep -q 'TODO' starter/scripts/extract-todos.sh"
check "summarize.sh is executable or runnable" "[ -f starter/scripts/summarize.sh ]"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Move on to Lesson 1-4."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
