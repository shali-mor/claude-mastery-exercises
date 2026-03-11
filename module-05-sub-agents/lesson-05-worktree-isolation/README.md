# Lesson 05: Worktree Isolation

Practice the full worktree lifecycle — from requesting isolation to reviewing, merging, and cleaning up.

## What you'll build
- A delegation prompt that correctly requests worktree isolation
- A shell script that walks through every git command in the worktree workflow
- A parallel-agents prompt that spawns multiple isolated agents simultaneously

## Key concepts
- `isolation: "worktree"` gives an agent its own git branch and working directory
- Your main branch is never touched until you explicitly merge
- `git worktree list` shows all active worktrees and their branches
- `git diff main...worktree/<branch>` reviews exactly what changed
- Always clean up with `git worktree remove <path>` after merging

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
