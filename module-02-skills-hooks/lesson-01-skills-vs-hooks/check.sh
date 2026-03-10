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
echo "=== Lesson 2-1 Checks ==="
echo ""

check "decision-guide.md TODOs filled in" "! grep -q '# TODO' starter/decision-guide.md"
check "broken-claude-dir files exist" "[ -f starter/broken-claude-dir/commands/daily-standup.md ]"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Move on to Lesson 2-2."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
