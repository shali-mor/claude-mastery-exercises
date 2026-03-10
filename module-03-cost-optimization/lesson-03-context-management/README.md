# Lesson 3-3: Context Management Strategies

**Module:** Cost Optimization
**Estimated time:** 10 minutes
**Course link:** Module 3 → Lesson 3

## What you'll practice

- Using `/cost` and `/compact` strategically during a session
- Writing a `SessionEnd` hook to log session token usage automatically
- Creating a `/cost-check` skill that reminds you to compact when costs are high

## Files in this lesson

```
starter/
  hooks/
    session-cost-logger.sh    ← TODO: log token usage at session end
  commands/
    cost-check.md             ← TODO: write a skill that reads /cost and advises
  workflow.md                 ← TODO: fill in the context management workflow
exercise.md
check.sh
solution/
  hooks/
    session-cost-logger.sh
  commands/
    cost-check.md
  workflow.md
```
