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
echo "=== Lesson 1-4 Checks ==="
echo ""

check "scenarios.md TODOs filled in" "! grep -q '# TODO' starter/scenarios.md"
check "settings-template.json TODOs filled in" "! grep -q 'TODO' starter/settings-template.json"
check "ci-script.sh TODO filled in" "! grep -q 'TODO' starter/ci-script.sh"
check "settings-template.json has allow array" "grep -q 'allow' starter/settings-template.json"
check "settings-template.json has deny array" "grep -q 'deny' starter/settings-template.json"
check "ci-script.sh uses dangerously-skip-permissions" "grep -q 'dangerously-skip-permissions' starter/ci-script.sh"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Module 1 complete. Move on to Module 2."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
