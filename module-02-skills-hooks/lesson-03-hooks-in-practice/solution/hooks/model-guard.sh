#!/usr/bin/env bash
INPUT=$(cat)
PROMPT=$(echo "$INPUT" | jq -r '.prompt // ""' 2>/dev/null || echo "$INPUT")

if echo "$PROMPT" | grep -qi "opus"; then
  echo "Opus requires explicit approval. Remove 'opus' from your prompt or ask your lead."
  exit 2
fi

exit 0
