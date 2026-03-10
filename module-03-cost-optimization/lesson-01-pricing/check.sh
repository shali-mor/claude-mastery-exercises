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
echo "=== Lesson 3-1 Checks ==="
echo ""

check "cost-calculator.md TODOs filled in" "! grep -q '# TODO' starter/cost-calculator.md"
check "model-picker.md TODOs filled in" "! grep -q '# TODO' starter/model-picker.md"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Move on to Lesson 3-2."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
