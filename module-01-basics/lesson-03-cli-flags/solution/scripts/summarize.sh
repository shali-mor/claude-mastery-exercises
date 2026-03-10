#!/usr/bin/env bash
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
claude -p "Summarize this file in one paragraph. Focus on what it does and its key exports." < "$FILE"
