# Exercise: Building a Custom MCP Server

## Goal
Build and register a working MCP server that Claude Code can call.

---

## Task 1: Complete the server (25 min)

Open `starter/todo-server.ts` and complete the TODOs:

1. Import `Server`, `StdioServerTransport`, `ListToolsRequestSchema`, `CallToolRequestSchema` from `@modelcontextprotocol/sdk/server`

2. Implement `ListToolsRequestSchema` handler — return two tools:
   - `get_todos`: no inputs, returns all todos as a JSON list
   - `create_todo`: input `{ text: string, priority: "low" | "medium" | "high" }`

3. Implement `CallToolRequestSchema` handler — route to the correct function

4. Connect with `StdioServerTransport` and start the server

---

## Task 2: Register the server (5 min)

Complete `starter/settings.json` to register your server:
```json
{
  "mcpServers": {
    "todo-manager": {
      "type": "stdio",
      "command": "npx",
      "args": ["ts-node", "path/to/todo-server.ts"]
    }
  }
}
```

---

## Task 3: Demo prompt (5 min)

Write in `starter/demo-prompts.md` the 3 Claude prompts you'd use to:
1. List all todos
2. Create a high-priority todo: "Ship MCP server lesson"
3. Create a low-priority todo and then list all todos

---

## Validation

`bash check.sh`
