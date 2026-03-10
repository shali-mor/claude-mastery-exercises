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
echo "=== Lesson 3-3 Checks ==="
echo ""

check "session-cost-logger.sh TODO removed" "! grep -q 'TODO' starter/hooks/session-cost-logger.sh"
check "session-cost-logger.sh appends to log file" "grep -q 'LOG_FILE\|claude-sessions' starter/hooks/session-cost-logger.sh"
check "cost-check.md TODO removed" "! grep -q '^TODO' starter/commands/cost-check.md"
check "cost-check.md mentions compact threshold" "grep -qi '30.000\|30000\|compact' starter/commands/cost-check.md"
check "workflow.md TODOs removed" "! grep -q '# TODO' starter/workflow.md"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Module 3 complete."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
