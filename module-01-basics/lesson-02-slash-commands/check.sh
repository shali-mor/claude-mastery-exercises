#!/usr/bin/env bash
# check.sh — validates Lesson 1-2 exercise completion

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
echo "=== Lesson 1-2 Checks ==="
echo ""

# Check scenarios.md has no remaining TODO lines
check "scenarios.md TODOs are filled in" "! grep -q '# TODO' starter/scenarios.md"

# Check buggy project files exist
check "buggy-project files exist" "[ -f starter/buggy-project/auth.ts ] && [ -f starter/buggy-project/db.ts ]"

# Check Claude Code is installed
check "Claude Code is installed" "command -v claude"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""

if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Move on to Lesson 1-3."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
