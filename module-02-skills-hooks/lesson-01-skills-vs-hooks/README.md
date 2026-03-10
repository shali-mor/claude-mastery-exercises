# Lesson 2-1: Skills vs Hooks vs Commands — The Right Tool

**Module:** Skills, Hooks & Commands
**Estimated time:** 10 minutes
**Course link:** Module 2 → Lesson 1

## What you'll practice

- Distinguishing between skills, hooks, and built-in commands
- Deciding which extension point to reach for in real situations
- Auditing an existing `.claude/` directory and identifying what's wrong

## Files in this lesson

```
starter/
  decision-guide.md         ← TODO: fill in the correct tool for each situation
  broken-claude-dir/        ← a .claude/ directory with mistakes to fix
    commands/
      daily-standup.md      ← (has a hook written as a skill — wrong tool)
      deploy.sh             ← (wrong file type for a skill)
    hooks/
      write-test.md         ← (has a skill written as a hook — wrong tool)
exercise.md
check.sh
solution/
  decision-guide.md
  fixed-claude-dir/
    commands/
      daily-standup.md
      write-test.md
    hooks/
      deploy-check.sh
```
