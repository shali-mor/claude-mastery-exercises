#!/usr/bin/env bash
# review-files.sh — review multiple files for bugs and security issues
# Usage: bash review-files.sh file1.ts file2.ts ...

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <file1> [file2] ..."
  exit 1
fi

for FILE in "$@"; do
  echo ""
  echo "=============================="
  echo "Reviewing: $FILE"
  echo "=============================="

  # TODO: Pipe $FILE into claude -p with a prompt asking Claude to review the file
  # for bugs and security issues. Print Claude's response.
  # Hint: claude -p "..." < "$FILE"

done
