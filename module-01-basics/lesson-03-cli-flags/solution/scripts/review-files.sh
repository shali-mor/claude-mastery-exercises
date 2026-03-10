#!/usr/bin/env bash
for FILE in "$@"; do
  echo ""
  echo "=============================="
  echo "Reviewing: $FILE"
  echo "=============================="
  claude -p "Review this file for bugs, security issues, and code quality problems. Be concise." < "$FILE"
done
