# Exercise 3-3: Context Management Strategies

## Objective
Build habits and automation that keep token costs under control during long sessions.

---

## Background: Why Context Grows

Every message you send includes the full conversation history. A 1-hour session might accumulate:
- 50,000 tokens of context
- Each new message costs those 50,000 input tokens + your new message

Running `/compact` replaces the history with a ~5,000 token summary — a 10x reduction.

---

## Task 1 — The compact habit
Practice the `/cost` → `/compact` loop:

1. Start a Claude Code session
2. Work for ~10 minutes (ask several questions)
3. Run `/cost` — note the input token count
4. Run `/compact`
5. Run `/cost` again — note the new input token count

```
# TODO: Fill in your observations
Before compact (input tokens):
After compact (input tokens):
Reduction ratio:
```

---

## Task 2 — Write a session cost logger hook
Open `starter/hooks/session-cost-logger.sh`.

Write a `SessionEnd` hook that appends to `~/.claude-sessions.log` with:
- Date and time
- Session ID (from JSON input: `.session_id`)
- Total input tokens (from JSON input: `.usage.input_tokens`)
- Total output tokens (from JSON input: `.usage.output_tokens`)

This gives you a running log of how much each session cost.

---

## Task 3 — Write a `/cost-check` skill
Open `starter/commands/cost-check.md`.

Write a skill that:
1. Runs `/cost` to get current token usage
2. Compares input tokens to a threshold (e.g. 30,000 tokens)
3. If above threshold: recommends running `/compact` and explains the savings
4. If below threshold: confirms the session is within normal range
5. Always shows the current model and estimated cost

---

## Task 4 — Fill in the workflow
Open `starter/workflow.md`. Fill in the recommended context management workflow for:
- Short sessions (< 30 min)
- Long sessions (> 1 hour)
- When switching tasks
- When starting fresh

---

## Validate
```bash
bash check.sh
```
