#!/usr/bin/env bash
# UserPromptSubmit hook: suggest Plan Mode for risky operations
# Exit 0 always (warn but don't block)

STDIN=$(cat)
PROMPT=$(echo "$STDIN" | jq -r '.prompt // ""' 2>/dev/null || echo "")

# TODO: Check if the prompt contains any risky keywords:
# delete, drop, rm, reset, "force push", truncate, overwrite
# (case-insensitive)

# TODO: If risky keyword found, print a suggestion like:
# "💡 Tip: This looks like a risky operation. Consider entering Plan Mode first (Shift+Tab) to review the approach before making changes."

# Always exit 0 — this hook warns but never blocks
exit 0
