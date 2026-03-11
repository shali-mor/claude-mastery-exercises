# Context Window Scenarios — Solution

| # | Situation | Command | Why |
|---|-----------|---------|-----|
| 1 | Working 2 hours, 80K tokens, same task | `/compact` | Summarizes conversation to ~10% of tokens while preserving task direction |
| 2 | Finished bug fix, starting unrelated refactor | `/clear` | Completely fresh start — old context from the bug is noise for the new task |
| 3 | Want to see how full the window is | `/context` | Shows a color grid visualization of context usage |
| 4 | Claude references an abandoned approach | `/compact focus on our current approach only` | Compact with focus instructions drops the old approach from the summary |
| 5 | Want to try two solutions from current point | `/fork` | Creates a branch of the conversation — explore both without losing either |
| 6 | Claude went in the wrong direction | `/rewind` | Rolls back conversation (and optionally code changes) to a previous point |

## Bonus answer

**`/compact`** — keeps the session going but summarizes history into fewer tokens. Context is preserved (as a summary). Use when you're mid-task and just need to reduce token cost.

**`/clear`** — wipes the entire conversation. Nothing is preserved. Use when switching to a completely different task where the old context is irrelevant or harmful.
