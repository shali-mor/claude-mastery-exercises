#!/usr/bin/env bash
# session-cost-logger.sh — SessionEnd hook
# Logs token usage at the end of every Claude Code session.
#
# Input JSON shape (from stdin):
# {
#   "session_id": "abc123",
#   "usage": {
#     "input_tokens": 45000,
#     "output_tokens": 3200
#   }
# }

LOG_FILE="$HOME/.claude-sessions.log"

# TODO:
# 1. Read JSON from stdin
# 2. Extract session_id, input_tokens, output_tokens using jq
# 3. Get current timestamp with: date '+%Y-%m-%d %H:%M:%S'
# 4. Append a line to $LOG_FILE:
#    [TIMESTAMP] session=SESSION_ID input=INPUT_TOKENS output=OUTPUT_TOKENS
#
# Example output line:
# [2026-03-10 14:23:05] session=abc123 input=45000 output=3200
