# Lesson 03: Building a Custom MCP Server

Write your own MCP server that exposes tools to Claude Code.

## What you'll build
- A TypeScript MCP server with 2 custom tools: `get_todos` and `create_todo`
- A `settings.json` that registers your server
- A demo prompt showing Claude using your custom tools

## Key concepts
- Use `@modelcontextprotocol/sdk` to build servers
- Implement `ListToolsRequestSchema` to declare available tools
- Implement `CallToolRequestSchema` to handle tool invocations
- Use `StdioServerTransport` for local development
- Return results as `{ content: [{ type: 'text', text: '...' }] }`

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
