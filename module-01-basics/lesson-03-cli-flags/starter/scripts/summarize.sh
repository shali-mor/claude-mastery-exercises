#!/usr/bin/env bash
# summarize.sh — summarize a file using Claude CLI
# Usage: bash summarize.sh <filepath>

FILE="$1"

if [ -z "$FILE" ]; then
  echo "Usage: $0 <filepath>"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "Error: file not found: $FILE"
  exit 1
fi

echo "Summarizing: $FILE"
echo "---"

# TODO: Use `claude -p` to pipe the file content to Claude and ask for a one-paragraph summary.
# Hint: claude -p "your prompt here" < "$FILE"
