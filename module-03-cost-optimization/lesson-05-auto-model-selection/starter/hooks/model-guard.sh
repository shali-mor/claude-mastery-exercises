#!/usr/bin/env bash
# UserPromptSubmit hook — warns when Opus is requested for a simple task
# Exit 0 = allow, Exit 2 = block with message

STDIN=$(cat)

# TODO: Use jq to extract the user's prompt from $STDIN
# The JSON has structure: {"prompt": "..."}
PROMPT="TODO"

# TODO: Check if the prompt mentions "opus" or "claude-opus"
# If it does, warn the user and exit 2
# Hint: use grep -qi "opus" <<< "$PROMPT"

# Allow by default
exit 0
