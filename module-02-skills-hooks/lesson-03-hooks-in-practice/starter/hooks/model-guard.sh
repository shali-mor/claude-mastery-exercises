#!/usr/bin/env bash
# model-guard.sh — UserPromptSubmit hook
# Blocks prompts that reference "opus" without explicit approval.
#
# Input: JSON on stdin with shape: { "prompt": "user's message" }
# Exit 0 = allow the prompt through
# Exit 2 = block with the message printed to stdout

# TODO:
# 1. Read the JSON from stdin
# 2. Extract the "prompt" field using jq (or grep as fallback)
# 3. Check if it contains "opus" (case-insensitive)
# 4. If yes: print a block message and exit 2
# 5. If no: exit 0
#
# Example jq usage:
#   INPUT=$(cat)
#   PROMPT=$(echo "$INPUT" | jq -r '.prompt // ""')
