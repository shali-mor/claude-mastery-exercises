#!/usr/bin/env bash
# PreToolUse hook: require PLAN.md before allowing Write or Edit operations
# Exit 0 = allow, Exit 2 = block

STDIN=$(cat)
TOOL_NAME=$(echo "$STDIN" | jq -r '.tool_name // ""' 2>/dev/null || echo "")

# TODO: Check if the tool being invoked is "Write" or "Edit"
# If it is:
#   - Check if PLAN.md exists in the current working directory
#   - If PLAN.md exists: exit 0 (allow)
#   - If PLAN.md does NOT exist: print an error and exit 2 (block)
# If the tool is anything else: exit 0 (allow)

exit 0
