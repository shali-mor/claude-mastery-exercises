# Exercise: Connecting MCP Servers

## Goal
Configure multiple MCP servers and practice using their tools.

---

## Task 1: Configure servers (10 min)

Complete `starter/settings.json` with configurations for:
1. **filesystem** — `npx @modelcontextprotocol/server-filesystem ~/Documents`
2. **github** — `npx @modelcontextprotocol/server-github` (requires GITHUB_PERSONAL_ACCESS_TOKEN env var)

---

## Task 2: Troubleshooting guide (10 min)

Complete `starter/troubleshooting.md`:

For each error scenario, write the likely cause and fix:
- "MCP server not found"
- "Connection refused"
- "Authentication failed"
- "Tool not available"
- Server starts but tools don't appear

---

## Task 3: MCP prompts journal (10 min)

After connecting a server, use it and document your experience in `starter/prompts-journal.md`:
- What server did you connect?
- What tool did you invoke?
- What prompt did you use?
- What was the result?

---

## Validation

`bash check.sh`
