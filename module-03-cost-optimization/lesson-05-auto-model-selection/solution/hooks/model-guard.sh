#!/usr/bin/env bash
# UserPromptSubmit hook — warns when Opus is requested for a simple task
# Exit 0 = allow, Exit 2 = block with message

STDIN=$(cat)
PROMPT=$(echo "$STDIN" | jq -r '.prompt // ""' 2>/dev/null || echo "")

if echo "$PROMPT" | grep -qi "opus\|claude-opus"; then
  echo "⚠️  Model guard: You're requesting Opus for this task." >&2
  echo "   Run /pick-model to check if a cheaper model would work." >&2
  echo "   Add 'force-opus' to your prompt to bypass this check." >&2

  if echo "$PROMPT" | grep -qi "force-opus"; then
    exit 0
  fi
  exit 2
fi

exit 0
