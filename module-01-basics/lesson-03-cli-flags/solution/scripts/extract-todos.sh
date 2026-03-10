#!/usr/bin/env bash
DIR="${1:-.}"
echo "Scanning for TODOs in: $DIR"
echo "---"
grep -rn "TODO" "$DIR" --include="*.ts" | \
  claude -p "These are TODO comments from a codebase. Prioritize them by importance (security, bugs, missing features, nice-to-haves), most critical first. Format as a numbered list."
