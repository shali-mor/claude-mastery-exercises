#!/usr/bin/env bash
LOG_FILE="$HOME/.claude-audit.log"

INPUT=$(cat)
TOOL=$(echo "$INPUT" | jq -r '.tool_name // ""' 2>/dev/null)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""' 2>/dev/null)

if [[ "$TOOL" == "Write" || "$TOOL" == "Edit" ]]; then
  TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
  echo "[$TIMESTAMP] TOOL: $TOOL FILE: $FILE" >> "$LOG_FILE"
fi

exit 0
