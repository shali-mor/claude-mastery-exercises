#!/usr/bin/env bash
# UserPromptSubmit hook: suggest Plan Mode for risky operations
# Exit 0 always (warn but don't block)

STDIN=$(cat)
PROMPT=$(echo "$STDIN" | jq -r '.prompt // ""' 2>/dev/null || echo "")

RISKY_PATTERN="delete|drop|rm |reset|force.push|truncate|overwrite|destroy|purge"

if echo "$PROMPT" | grep -qiE "$RISKY_PATTERN"; then
  echo "💡 Tip: This looks like a risky operation." >&2
  echo "   Consider entering Plan Mode first (Shift+Tab) to review the approach before making changes." >&2
fi

exit 0
