# Parallel Worktrees Prompt — Solution

Spawn 3 isolated agents in parallel:

Agent 1 (worktree, general-purpose):
  Add zod validation to all routes in src/app/api/users/.
  Do not touch any other directory.

Agent 2 (worktree, general-purpose):
  Add zod validation to all routes in src/app/api/payments/.
  Do not touch any other directory.

Agent 3 (worktree, general-purpose):
  Add zod validation to all routes in src/app/api/auth/.
  Do not touch any other directory.

When all three finish, show me a summary of changes per agent.
I will review each diff before merging.
