# Exercise 2-1: Skills vs Hooks vs Commands — The Right Tool

## Objective
Build a clear mental model of which extension point to use, so you never write a skill when you need a hook.

---

## Quick Reference

| Tool | Lives in | Triggered by | Use when |
|------|----------|-------------|----------|
| Built-in command | (built-in) | User types `/command` | Standard Claude Code actions |
| Skill | `.claude/commands/name.md` | User types `/name` | Repeatable prompts/workflows you invoke manually |
| Hook | `.claude/hooks/name.sh` + `settings.json` | Claude Code event fires | Automatic enforcement, logging, guards — no user input |

---

## Task 1 — Decision guide
Open `starter/decision-guide.md`. For each situation, choose the right tool and briefly explain why.

---

## Task 2 — Audit the broken `.claude/` directory
Look at `starter/broken-claude-dir/`. It has three files in the wrong places or wrong formats.

For each file, identify the problem and write the fix:

**File: `commands/daily-standup.md`**
```
# TODO: What's wrong with this file?
Problem:
Fix:
```

**File: `commands/deploy.sh`**
```
# TODO: What's wrong with this file?
Problem:
Fix:
```

**File: `hooks/write-test.md`**
```
# TODO: What's wrong with this file?
Problem:
Fix:
```

---

## Task 3 — Refactor to the correct structure
Look at the `solution/fixed-claude-dir/` to see the corrected layout.

In your own project, create a minimal `.claude/` directory with:
- One skill (a prompt you use regularly)
- One hook (something you want to enforce automatically)
- Correct `settings.json` wiring for the hook

---

## Validate
```bash
bash check.sh
```
