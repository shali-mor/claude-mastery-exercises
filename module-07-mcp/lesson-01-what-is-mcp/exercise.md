# Exercise: What Is MCP?

## Goal
Build a clear mental model of MCP and configure your first server connection.

---

## Task 1: Comparison table (10 min)

Complete `starter/comparison.md`:

| Capability | Claude Code Skill | Direct API Call | MCP Tool |
|------------|------------------|-----------------|----------|
| Invocation | TODO | TODO | TODO |
| External access | TODO | TODO | TODO |
| Auth handling | TODO | TODO | TODO |
| Best for | TODO | TODO | TODO |

---

## Task 2: Architecture diagram (10 min)

Complete `starter/architecture.md`:
Draw the MCP request flow from Claude → MCP client → protocol → MCP server → external service and back.

---

## Task 3: settings.json configuration (10 min)

Complete `starter/settings.json`:
Configure two MCP servers:
1. A local `filesystem` server (stdio transport) that gives Claude access to `~/Documents`
2. A hypothetical `github` server (HTTP transport) at `http://localhost:3001`

---

## Validation

`bash check.sh`
