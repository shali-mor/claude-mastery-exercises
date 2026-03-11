# Lesson 2-1: Skills vs Hooks vs Commands — The Right Tool

**Module:** Skills, Hooks & Commands
**Estimated time:** 10 minutes
**Course link:** Module 2 → Lesson 1

## What you'll practice

- Distinguishing between built-in commands, bundled skills, custom skills, and hooks
- Deciding which extension point to reach for in real situations
- Auditing an existing `.claude/` directory and identifying what's wrong

## The four extension types (updated)

| Type | What it is | Example |
|------|------------|---------|
| Built-in command | Hardcoded in Claude Code binary | `/btw`, `/clear`, `/compact` |
| Bundled skill | Anthropic-authored `.md` shipped with Claude Code | `/simplify`, `/batch`, `/loop` |
| Custom skill | Your `.md` file in `.claude/commands/` | `/write-test`, `/security-review` |
| Hook | Shell script that fires on events | PostToolUse, UserPromptSubmit |

**Quick test:** If it works on a fresh machine with no `.claude/` folder → it's a command or bundled skill. If it needs a `.md` file you created → it's a custom skill.

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

## Tasks

### Task 1 — Fill in the decision guide

Open `starter/decision-guide.md`. For each scenario, decide: built-in command, bundled skill, custom skill, or hook?

| Scenario | Correct tool |
|----------|-------------|
| You want Claude to summarize the conversation when it gets long | ? |
| You want to auto-format files after Claude writes them | ? |
| You want a `/pr-review` command your whole team can use | ? |
| You need `/simplify` to review your git diff for code quality | ? |
| You want to block Claude from running `rm -rf` | ? |

### Task 2 — Fix the broken `.claude/` directory

Look at `starter/broken-claude-dir/`. Three things are wrong. Identify them and create a corrected version.

### Task 3 — Build a minimal `.claude/` structure

Create a `.claude/` directory with:
1. One custom skill of your choice
2. One PostToolUse hook that logs file writes to a `.claude/write.log`
