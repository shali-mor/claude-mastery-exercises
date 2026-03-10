# Exercise: Setup — MCP & Hooks

## Goal
Get the capstone infrastructure running before building the pipeline logic.

---

## Task 1: GitHub MCP configuration (10 min)

Complete `starter/settings.json`:
- Add GitHub MCP server (stdio transport)
- Set `GITHUB_PERSONAL_ACCESS_TOKEN` env var reference
- Test it works: ask Claude "list my recent GitHub repos"

---

## Task 2: Cache logger hook (15 min)

Complete `starter/hooks/cache-logger.sh`:
A PostToolUse hook that:
1. Parses the tool result from stdin (JSON)
2. If the tool was `messages.create`, check the `usage` field for `cache_read_input_tokens`
3. Log: `[timestamp] cache_hit: N tokens, cache_miss: M tokens, savings: $X`
4. Append to `~/.claude-cache-stats.log`

---

## Task 3: Environment validator (5 min)

Complete `starter/validate-env.sh`:
A script that checks all required env vars are set before running the pipeline:
- `ANTHROPIC_API_KEY`
- `GITHUB_PERSONAL_ACCESS_TOKEN`
- `WEBHOOK_SECRET`

Exit 1 with a clear error message if any are missing.

---

## Validation

`bash check.sh`
