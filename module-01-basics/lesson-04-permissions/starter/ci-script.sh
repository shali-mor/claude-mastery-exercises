#!/usr/bin/env bash
# ci-script.sh — run Claude Code in CI to review changed files
# This runs inside an isolated CI container, so bypassPermissions is safe.

set -euo pipefail

CHANGED_FILES=$(git diff --name-only HEAD~1 HEAD)

if [ -z "$CHANGED_FILES" ]; then
  echo "No files changed. Skipping Claude review."
  exit 0
fi

echo "Running Claude review on changed files..."

# TODO: Use claude with:
# 1. --dangerously-skip-permissions (we're in CI, isolated container)
# 2. -p flag with a prompt asking Claude to review the changed files for bugs and security issues
# 3. --output-format json to parse results downstream
# 4. Pipe the list of changed files as context
#
# Hint: echo "$CHANGED_FILES" | claude --dangerously-skip-permissions --output-format json -p "..."
