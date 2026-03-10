# Lesson 04: Advanced GSD Workflows

Handle the real-world situations that derail most AI-assisted development: bugs that outlive context windows, unfamiliar codebases, urgent mid-milestone hotfixes, and multi-session handoffs.

## What you'll build
- A `/gsd:debug` session for a persistent bug with hypothesis tracking
- A `/gsd:map-codebase` analysis of an unfamiliar project
- A mid-phase pivot using `/gsd:insert-phase`
- A pause/resume handoff document

## Key concepts

### /gsd:debug — bugs that survive context resets
GSD writes debugging state (hypotheses, tests run, findings) to `.planning/debug/`. When the context window resets, `/gsd:resume-work` picks up exactly where you left off — no re-explaining the bug.

### /gsd:map-codebase — joining an unfamiliar codebase
Spawns 4 parallel mapper agents (tech, architecture, quality, concerns) that write structured documents to `.planning/codebase/`. GSD uses these documents to inform every subsequent phase plan.

### /gsd:insert-phase — urgent work mid-milestone
Inserts a decimal phase (e.g. Phase 3.1) between existing phases without renumbering. Use for security hotfixes, critical bugs, or scope changes discovered mid-milestone.

### /gsd:quick — small tasks without planning overhead
For a clearly-defined, single-file task that doesn't need full planning, execute it directly with GSD's atomic commit guarantees but without spawning the planning agent suite.

### /gsd:pause-work + /gsd:resume-work — context handoffs
`/gsd:pause-work` captures exact state: tasks completed, what's in progress, blockers, and next steps — into `PAUSE.md`. `/gsd:resume-work` restores it all in a new session.

## When to use which command
| Scenario | Command |
|---|---|
| Bug investigation losing context across resets | `/gsd:debug` |
| First time on a large or inherited codebase | `/gsd:map-codebase` |
| Urgent hotfix needed before next planned phase | `/gsd:insert-phase` |
| Small known task, no planning needed | `/gsd:quick` |
| Stopping mid-phase, need to resume later | `/gsd:pause-work` |
| Returning to paused work | `/gsd:resume-work` |

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
