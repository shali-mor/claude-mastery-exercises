#!/usr/bin/env bash
# deploy.sh — in the wrong place!
#
# PROBLEM: This is a shell script sitting in commands/ (where skills live).
# Skills must be .md files. Shell scripts belong in hooks/ (with settings.json wiring)
# or in a separate scripts/ directory.
#
# This file will be silently ignored by Claude Code.

echo "Deploying to production..."
npm run build
npm run deploy
