#!/usr/bin/env bash
# deploy-check.sh — PreToolUse hook
# Runs npm test before allowing any git push.
# Input: JSON with tool_name and tool_input

INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name // ""' 2>/dev/null)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // ""' 2>/dev/null)

if [[ "$TOOL" == "Bash" ]] && echo "$CMD" | grep -q "git push"; then
  echo "Running tests before push..."
  if ! npm test --silent; then
    echo "Tests failed. Fix them before pushing."
    exit 2
  fi
fi

exit 0
