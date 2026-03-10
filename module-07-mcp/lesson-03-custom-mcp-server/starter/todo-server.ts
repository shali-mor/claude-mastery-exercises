// TODO: Import from '@modelcontextprotocol/sdk/server/index.js':
// Server, StdioServerTransport, ListToolsRequestSchema, CallToolRequestSchema

interface Todo {
  id: string;
  text: string;
  priority: 'low' | 'medium' | 'high';
  createdAt: string;
}

const todos: Todo[] = [];

// TODO: Create a new Server instance with name and version

// TODO: Implement setRequestHandler for ListToolsRequestSchema
// Return two tools: get_todos (no input) and create_todo ({ text, priority })

// TODO: Implement setRequestHandler for CallToolRequestSchema
// Route 'get_todos' → return JSON.stringify(todos)
// Route 'create_todo' → create todo with uuid, return success message

// TODO: Connect StdioServerTransport and run the server
// const transport = new StdioServerTransport();
// await server.connect(transport);
