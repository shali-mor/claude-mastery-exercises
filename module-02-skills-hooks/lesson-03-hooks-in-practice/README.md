# Lesson 2-3: Hooks in Practice

**Module:** Skills, Hooks & Commands
**Estimated time:** 20 minutes
**Course link:** Module 2 → Lesson 3

## What you'll practice

- Writing a `UserPromptSubmit` hook that guards model usage
- Writing a `PostToolUse` hook that logs file changes
- Writing a `SessionStart` hook that prints a reminder
- Configuring hooks in `settings.json`

## Files in this lesson

```
starter/
  hooks/
    model-guard.sh        ← TODO: block prompts that try to switch to Opus without permission
    file-change-log.sh    ← TODO: log every file write to a local audit file
    session-reminder.sh   ← TODO: print today's goals on session start
  settings.json.template  ← TODO: wire the hooks into Claude Code settings
exercise.md
check.sh
solution/
  hooks/
    model-guard.sh
    file-change-log.sh
    session-reminder.sh
  settings.json
```
