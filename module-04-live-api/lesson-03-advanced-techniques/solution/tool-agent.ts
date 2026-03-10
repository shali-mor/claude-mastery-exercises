import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

function get_weather(city: string): string {
  const conditions = ['sunny', 'cloudy', 'rainy', 'snowy'];
  const temp = Math.floor(Math.random() * 30) + 5;
  return `${city}: ${temp}°C, ${conditions[Math.floor(Math.random() * conditions.length)]}`;
}

function calculate(expression: string): string {
  try {
    const result = Function(`"use strict"; return (${expression})`)();
    return String(result);
  } catch {
    return 'Error: invalid expression';
  }
}

const tools: Anthropic.Tool[] = [
  {
    name: 'get_weather',
    description: 'Get current weather for a city',
    input_schema: {
      type: 'object',
      properties: { city: { type: 'string', description: 'City name' } },
      required: ['city'],
    },
  },
  {
    name: 'calculate',
    description: 'Evaluate a mathematical expression',
    input_schema: {
      type: 'object',
      properties: { expression: { type: 'string', description: 'Math expression to evaluate' } },
      required: ['expression'],
    },
  },
];

async function runAgent() {
  const messages: Anthropic.MessageParam[] = [
    { role: 'user', content: "What's the weather in Paris and what is 42 * 7?" }
  ];

  let response = await client.messages.create({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 1024,
    tools,
    messages,
  });

  while (response.stop_reason === 'tool_use') {
    const toolUseBlocks = response.content.filter(
      (b): b is Anthropic.ToolUseBlock => b.type === 'tool_use'
    );

    messages.push({ role: 'assistant', content: response.content });

    const toolResults: Anthropic.ToolResultBlockParam[] = toolUseBlocks.map(block => {
      let result: string;
      if (block.name === 'get_weather') {
        result = get_weather((block.input as { city: string }).city);
      } else if (block.name === 'calculate') {
        result = calculate((block.input as { expression: string }).expression);
      } else {
        result = 'Unknown tool';
      }
      console.log(`Tool: ${block.name}(${JSON.stringify(block.input)}) → ${result}`);
      return { type: 'tool_result', tool_use_id: block.id, content: result };
    });

    messages.push({ role: 'user', content: toolResults });

    response = await client.messages.create({
      model: 'claude-haiku-4-5-20251001',
      max_tokens: 1024,
      tools,
      messages,
    });
  }

  const textBlock = response.content.find((b): b is Anthropic.TextBlock => b.type === 'text');
  console.log('\nFinal response:', textBlock?.text);
}

runAgent().catch(console.error);
