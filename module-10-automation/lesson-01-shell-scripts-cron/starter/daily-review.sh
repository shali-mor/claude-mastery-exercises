#!/usr/bin/env bash
set -euo pipefail

REVIEW_DIR="$HOME/.claude-reviews"
DATE=$(date +%Y-%m-%d)
mkdir -p "$REVIEW_DIR"

echo "=== Daily Code Review: $DATE ==="

# TODO: Find all TypeScript files changed in the last 24 hours
# Hint: git diff --name-only HEAD~1 HEAD -- '*.ts'
# Or: git diff --since="24 hours ago" --name-only

CHANGED_FILES=() # TODO: populate this array

if [[ ${#CHANGED_FILES[@]} -eq 0 ]]; then
  echo "No TypeScript files changed in the last 24 hours."
  exit 0
fi

# TODO: For each changed file:
# 1. Read the file content
# 2. Pipe to: claude -p "Review this TypeScript file for bugs, security issues, and code style problems. Be concise."
# 3. Save output to $REVIEW_DIR/$DATE-$(basename $file .ts).md
# 4. Print the filename being reviewed

echo ""
echo "Reviews saved to $REVIEW_DIR/"
echo "Files reviewed: ${#CHANGED_FILES[@]}"
