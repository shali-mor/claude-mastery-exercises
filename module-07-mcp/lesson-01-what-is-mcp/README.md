# Lesson 01: What Is MCP?

Understand the Model Context Protocol and why it unlocks new integration possibilities.

## What you'll build
- A comparison table: MCP vs direct API calls vs Claude Code skills
- A diagram of MCP architecture (client ↔ protocol ↔ server ↔ service)
- A settings.json that connects to a public MCP server

## Key concepts
- MCP = standardised protocol for Claude to call external tools/services
- Two transports: **stdio** (local subprocess) and **HTTP/SSE** (remote server)
- `mcpServers` in `~/.claude/settings.json` maps names to server configs
- MCP servers expose: **tools** (callable), **resources** (readable), **prompts** (templates)
- Unlike skills, MCP tools can interact with external systems (databases, APIs, files)

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
