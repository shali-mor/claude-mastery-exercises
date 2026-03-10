# Exercise 2-3: Hooks in Practice

## Objective
Write real hooks that intercept Claude Code events — the same pattern used in production teams.

---

## Background: Hook Types

| Hook | Trigger | Common uses |
|------|---------|-------------|
| `UserPromptSubmit` | Every time you press Enter | Input validation, guardrails, logging |
| `PreToolUse` | Before Claude calls a tool | Block dangerous commands, require approval |
| `PostToolUse` | After a tool completes | Audit logging, notifications |
| `SessionStart` | When a session begins | Print reminders, load context |
| `SessionEnd` | When a session ends | Save notes, send summaries |

Hooks are shell commands. They receive event data as JSON via stdin.
Exit code `0` = allow. Exit code `2` = block with message.

---

## Task 1 — Session reminder hook
Open `starter/hooks/session-reminder.sh`. Fill in the TODO to print a formatted message like:

```
========================================
 Claude Code Session Started
 Date: 2026-03-10
 Reminder: Review open PRs before starting new work
========================================
```

---

## Task 2 — Model guard hook
Open `starter/hooks/model-guard.sh`. Fill in the TODO so that:
- If the prompt contains the word "opus" (case-insensitive), the hook exits with code `2` and prints: `"Opus requires explicit approval. Remove 'opus' from your prompt or ask your lead."`
- Otherwise exits `0` (allow)

The hook receives the prompt via JSON on stdin. Use `jq` to extract it.

---

## Task 3 — File change audit log hook
Open `starter/hooks/file-change-log.sh`. Fill in the TODO to:
- Append a line to `~/.claude-audit.log` whenever a file is written
- The line should include: timestamp, the file path, and the tool name
- Parse these from the JSON input via stdin

---

## Task 4 — Wire the hooks
Open `starter/settings.json.template`. Fill in the `hooks` section to:
- Register `session-reminder.sh` on `SessionStart`
- Register `model-guard.sh` on `UserPromptSubmit`
- Register `file-change-log.sh` on `PostToolUse`

Copy the completed file to `.claude/settings.json` in a test project and verify the hooks fire.

---

## Validate
```bash
bash check.sh
```
