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
echo "=== Lesson 2-2 Checks ==="
echo ""

check "add-jsdoc.md TODO removed" "! grep -q '^TODO' starter/commands/add-jsdoc.md"
check "security-review.md TODO removed" "! grep -q '^TODO' starter/commands/security-review.md"
check "commit-msg.md TODO removed" "! grep -q '^TODO' starter/commands/commit-msg.md"
check "explain.md TODO removed" "! grep -q '^TODO' starter/commands/explain.md"
check "explain.md uses \$ARGUMENTS" "grep -q '\$ARGUMENTS' starter/commands/explain.md"
check "security-review.md has output format" "grep -qi 'severity\|issue\|fix' starter/commands/security-review.md"
check "commit-msg.md mentions git diff" "grep -q 'git diff' starter/commands/commit-msg.md"

echo ""
echo "Results: $PASS passed, $FAIL failed"
echo ""
if [ "$FAIL" -eq 0 ]; then
  echo "All checks passed! Move on to Lesson 2-3 (Hooks in Practice)."
else
  echo "Fix the failing checks above, then re-run: bash check.sh"
fi
