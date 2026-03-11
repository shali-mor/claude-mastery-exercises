# Exercise: Worktree Isolation

## Goal
Practice the complete worktree workflow: requesting isolation, reviewing agent output, merging, and cleaning up.

---

## Task 1: Write an isolated delegation prompt (10 min)

Open `starter/delegation-prompt.md`.

Complete the delegation prompt so that:
1. It requests **worktree isolation** (the agent must not touch the main working directory)
2. It scopes the agent to a single directory (`src/app/api/users/`)
3. It specifies a clear goal (add input validation using zod)
4. It specifies the output format (list each file modified with a one-line description)

Replace every `TODO` with real content.

---

## Task 2: Fill in the worktree workflow commands (10 min)

Open `starter/worktree-workflow.sh`.

The script simulates the post-agent workflow. Fill in the correct git commands for each step:

1. List all active worktrees
2. Review the diff between main and the worktree branch
3. Navigate into the worktree directory
4. Merge the worktree branch back into main
5. Clean up the worktree

Use the branch name `worktree/add-user-validation` and the worktree path `.claude/worktrees/agent-abc123`.

---

## Task 3: Write a parallel multi-worktree prompt (10 min)

Open `starter/parallel-worktrees-prompt.md`.

Write a single Claude Code message that:
1. Spawns **3 isolated agents in parallel**, each on its own worktree
2. Each agent targets a different API directory (`users/`, `payments/`, `auth/`)
3. Each agent adds zod validation to all routes in its directory only
4. Asks Claude to summarise results per agent when all three finish

---

## Validation

`bash check.sh`
