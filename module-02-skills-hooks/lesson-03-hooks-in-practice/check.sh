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
echo "=== Lesson 2-3 Checks ==="
echo ""

check "session-reminder.sh has no TODO" "! grep -q 'TODO' starter/hooks/session-reminder.sh"
check "model-guard.sh has no TODO" "! grep -q 'TODO' starter/hooks/model-guard.sh"
check "file-change-log.sh has no TODO" "! grep -q 'TODO' starter/hooks/file-change-log.sh"
check "settings.json.template has no TODO" "! grep -q 'TODO' starter/settings.json.template"

# Test model-guard blocks opus
check "model-guard blocks 'opus' prompts" \
  "echo '{\"prompt\":\"use opus for this\"}' | bash starter/hooks/model-guard.sh; [ \$? -eq 2 ]"

# Test model-guard allows normal prompts
check "model-guard allows normal prompts" \
  "echo '{\"prompt\":\"refactor this function\"}' | bash starter/hooks/model-guard.sh"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Great work on hooks."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
