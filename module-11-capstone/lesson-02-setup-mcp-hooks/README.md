# Lesson 02: Setup — MCP & Hooks

Configure the GitHub MCP server and prompt caching hooks for the capstone.

## What you'll build
- A working GitHub MCP connection
- A `cache-logger.sh` PostToolUse hook that tracks prompt cache hit rates
- A session startup script that validates the environment

## Key concepts
- GitHub MCP: `npx @modelcontextprotocol/server-github` with `GITHUB_PERSONAL_ACCESS_TOKEN`
- Prompt caching: add `cache_control: { type: "ephemeral" }` to long system prompts
- PostToolUse hook: fires after every tool call, receives tool name and result
- Environment validation: check for required env vars before the pipeline runs

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
