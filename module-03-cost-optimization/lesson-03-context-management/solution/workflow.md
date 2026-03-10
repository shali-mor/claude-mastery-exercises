# Context Management Workflow — Solutions

## Short session (< 30 minutes, focused task)

```
Start: Open claude (or claude -c to continue recent session)
During: No action needed — context stays small
End: Optional: run /cost to note usage for your records
```

## Long session (> 1 hour, multiple tasks)

```
Start: Open fresh claude session
Every 30 min: Run /cost to check token count
When tokens > 30K: Run /compact to summarise and reduce context by ~90%
End: Session logs automatically if you set up the SessionEnd hook
```

## When switching to an unrelated task

```
Best approach: Start a new claude session (close current one, open fresh)
Why not just continue: The existing context is noise for the new task,
making Claude less focused and every request more expensive.
```

## When starting a new session on the same project

```
Use flag: claude --continue (or claude -c) to resume where you left off
Or: claude (no flag) to start fresh with a clean context
```

## Signs you should run /compact right now

```
1. /cost shows input tokens above 30,000–50,000
2. Responses feel slower or less focused
3. You're about to start a long new subtask within the same session
```
