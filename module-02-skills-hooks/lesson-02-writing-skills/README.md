# Lesson 2-2: Writing Skills That Work

**Module:** Skills, Hooks & Commands
**Estimated time:** 18 minutes
**Course link:** Module 2 → Lesson 2

## What you'll practice

- Writing skill files in `.claude/commands/`
- Using `$ARGUMENTS` for flexible, reusable skills
- Using the new frontmatter fields: `argument-hint`, `allowed-tools`, `context`, `model`
- Enabling auto-activation via the `description:` field
- Improving vague skills into reliable, specific ones

## Frontmatter field reference

| Field | Purpose |
|-------|---------|
| `description` | Claude reads this to auto-activate the skill when relevant |
| `argument-hint` | Hint shown in autocomplete when typing the command |
| `allowed-tools` | Restrict which tools Claude can use during this skill |
| `context: fork` | Run in an isolated subagent (no shared state) |
| `model` | Pin a specific Claude model for this skill |
| `user-invocable: false` | Hidden from `/` menu — Claude can still auto-invoke it |

## Files in this lesson

```
starter/
  commands/
    add-jsdoc.md          ← TODO: write a skill to add JSDoc (with argument-hint)
    security-review.md    ← TODO: improve a vague skill + add allowed-tools
    commit-msg.md         ← TODO: write a conventional commit skill
    fix-tests.md          ← TODO: write a test-fixing skill with context: fork
  sample-code/
    api-client.ts         ← file to test your skills against
solution/
  commands/
    add-jsdoc.md
    security-review.md
    commit-msg.md
    fix-tests.md
```

## Tasks

### Task 1 — Write `add-jsdoc.md`

Create a skill that adds JSDoc comments to a function. Requirements:
- Use `$ARGUMENTS` for the function name
- Add `argument-hint: [function-name]`
- Add `allowed-tools: [Read]` (read-only — no writes to source files)
- The skill must NOT modify the function body

### Task 2 — Improve `security-review.md`

The starter file has a vague, unreliable skill. Rewrite it to be specific:
- Add `allowed-tools: [Bash, Read, Grep, Glob]`
- Add a numbered checklist of what to look for (injection, auth, secrets, etc.)
- Define a clear output format (severity levels)

### Task 3 — Write `commit-msg.md`

Write a skill that reads the staged git diff and outputs a conventional commit message:
- Format: `type(scope): description`
- Add `description:` so Claude auto-activates it when you're about to commit
- Add `argument-hint: [optional scope]`

### Task 4 — Write `fix-tests.md` with `context: fork`

Write a skill that runs `npm test`, reads the failures, and fixes the source code:
- Add `context: fork` so it runs in an isolated subagent
- Add `allowed-tools: [Bash, Read, Write, Glob, Grep]`
- Steps: run tests → read failures → fix source → re-run to confirm green

### Task 5 — Test auto-activation

Add a `description:` to one of your skills. Start a new Claude session and describe
a task that matches that description — without typing the `/command`. 
Observe whether Claude auto-invokes the skill.
