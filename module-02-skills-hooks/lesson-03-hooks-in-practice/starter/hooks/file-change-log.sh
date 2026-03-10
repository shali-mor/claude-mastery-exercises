#!/usr/bin/env bash
# file-change-log.sh — PostToolUse hook
# Appends an audit entry when Claude writes a file.
#
# Input: JSON on stdin with shape:
#   { "tool_name": "Write", "tool_input": { "file_path": "/path/to/file", ... } }
#
# Output: appends to ~/.claude-audit.log

LOG_FILE="$HOME/.claude-audit.log"

# TODO:
# 1. Read JSON from stdin
# 2. Extract "tool_name" and "tool_input.file_path" using jq
# 3. Only log if tool_name is "Write" or "Edit"
# 4. Append a line to $LOG_FILE in the format:
#    [YYYY-MM-DD HH:MM:SS] TOOL: <tool_name> FILE: <file_path>
#
# Example:
#   TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
#   echo "[$TIMESTAMP] TOOL: $TOOL FILE: $FILE" >> "$LOG_FILE"
