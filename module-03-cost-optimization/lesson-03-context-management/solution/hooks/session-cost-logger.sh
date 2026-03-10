#!/usr/bin/env bash
LOG_FILE="$HOME/.claude-sessions.log"

INPUT=$(cat)
SESSION_ID=$(echo "$INPUT" | jq -r '.session_id // "unknown"' 2>/dev/null)
INPUT_TOKENS=$(echo "$INPUT" | jq -r '.usage.input_tokens // 0' 2>/dev/null)
OUTPUT_TOKENS=$(echo "$INPUT" | jq -r '.usage.output_tokens // 0' 2>/dev/null)
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$TIMESTAMP] session=$SESSION_ID input=$INPUT_TOKENS output=$OUTPUT_TOKENS" >> "$LOG_FILE"

exit 0
