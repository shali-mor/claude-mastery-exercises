#!/usr/bin/env bash
# check.sh — validates Lesson 1-1 exercise completion

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
echo "=== Lesson 1-1 Checks ==="
echo ""

# Check Claude Code is installed
check "Claude Code is installed" "command -v claude"

# Check CLAUDE.md was generated in sample-project
check "CLAUDE.md exists in sample-project" "[ -f starter/sample-project/CLAUDE.md ]"

# Check CLAUDE.md.template has no remaining TODO lines
check "CLAUDE.md.template TODOs are filled in" "! grep -q 'TODO:' starter/CLAUDE.md.template"

# Check sample project runs
check "sample-project runs without errors" "node starter/sample-project/app.js"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""

if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Move on to Lesson 1-2."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
