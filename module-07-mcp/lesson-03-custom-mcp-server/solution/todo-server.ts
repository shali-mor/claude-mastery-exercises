import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { CallToolRequestSchema, ListToolsRequestSchema } from '@modelcontextprotocol/sdk/types.js';
import { randomUUID } from 'crypto';

interface Todo {
  id: string;
  text: string;
  priority: 'low' | 'medium' | 'high';
  createdAt: string;
}

const todos: Todo[] = [];

const server = new Server(
  { name: 'todo-manager', version: '1.0.0' },
  { capabilities: { tools: {} } }
);

server.setRequestHandler(ListToolsRequestSchema, async () => ({
  tools: [
    {
      name: 'get_todos',
      description: 'List all todos',
      inputSchema: { type: 'object', properties: {} },
    },
    {
      name: 'create_todo',
      description: 'Create a new todo item',
      inputSchema: {
        type: 'object',
        properties: {
          text: { type: 'string', description: 'Todo text' },
          priority: { type: 'string', enum: ['low', 'medium', 'high'] },
        },
        required: ['text', 'priority'],
      },
    },
  ],
}));

server.setRequestHandler(CallToolRequestSchema, async (request) => {
  if (request.params.name === 'get_todos') {
    return {
      content: [{ type: 'text', text: JSON.stringify(todos, null, 2) }],
    };
  }

  if (request.params.name === 'create_todo') {
    const { text, priority } = request.params.arguments as { text: string; priority: Todo['priority'] };
    const todo: Todo = { id: randomUUID(), text, priority, createdAt: new Date().toISOString() };
    todos.push(todo);
    return {
      content: [{ type: 'text', text: `Created todo: ${JSON.stringify(todo)}` }],
    };
  }

  throw new Error(`Unknown tool: ${request.params.name}`);
});

const transport = new StdioServerTransport();
await server.connect(transport);
