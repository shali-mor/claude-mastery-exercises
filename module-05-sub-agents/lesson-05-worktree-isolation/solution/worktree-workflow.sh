#!/usr/bin/env bash
# Worktree workflow — complete solution

echo "=== Step 1: List all active worktrees ==="
git worktree list

echo ""
echo "=== Step 2: Review what the agent changed ==="
git diff main...worktree/add-user-validation

echo ""
echo "=== Step 3: Navigate into the worktree ==="
cd .claude/worktrees/agent-abc123

echo ""
echo "=== Step 4: Merge the worktree branch into main ==="
git checkout main
git merge worktree/add-user-validation

echo ""
echo "=== Step 5: Clean up the worktree ==="
git worktree remove .claude/worktrees/agent-abc123
