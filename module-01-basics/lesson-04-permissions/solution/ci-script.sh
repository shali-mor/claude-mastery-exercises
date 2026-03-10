#!/usr/bin/env bash
set -euo pipefail

CHANGED_FILES=$(git diff --name-only HEAD~1 HEAD)

if [ -z "$CHANGED_FILES" ]; then
  echo "No files changed. Skipping Claude review."
  exit 0
fi

echo "Running Claude review on changed files..."

echo "$CHANGED_FILES" | claude \
  --dangerously-skip-permissions \
  --output-format json \
  -p "Review these changed files for bugs and security issues. For each issue, note the filename, a description, and severity (low/medium/high). If no issues found, return an empty issues array."
