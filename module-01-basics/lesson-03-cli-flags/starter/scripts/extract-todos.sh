#!/usr/bin/env bash
# extract-todos.sh — extract and prioritize TODO comments using Claude
# Usage: bash extract-todos.sh <directory>

DIR="${1:-.}"

echo "Scanning for TODOs in: $DIR"
echo "---"

# TODO:
# 1. Use grep to find all lines containing "TODO" in *.ts files under $DIR
# 2. Pipe those lines to claude -p asking it to prioritize them by importance
# 3. Print the result
#
# Hint: grep -rn "TODO" "$DIR" --include="*.ts" | claude -p "Prioritize these TODO comments by importance, most critical first:"
