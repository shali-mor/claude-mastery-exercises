import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

// Mock implementations
function get_weather(city: string): string {
  const conditions = ['sunny', 'cloudy', 'rainy', 'snowy'];
  const temp = Math.floor(Math.random() * 30) + 5;
  return `${city}: ${temp}°C, ${conditions[Math.floor(Math.random() * conditions.length)]}`;
}

function calculate(expression: string): string {
  try {
    // Safe eval for simple math only
    const result = Function(`"use strict"; return (${expression})`)();
    return String(result);
  } catch {
    return 'Error: invalid expression';
  }
}

// TODO: Define the tools array with two tools:
// 1. get_weather: takes { city: string }
// 2. calculate: takes { expression: string }
const tools: Anthropic.Tool[] = [
  // TODO: tool 1
  // TODO: tool 2
];

async function runAgent() {
  const messages: Anthropic.MessageParam[] = [
    { role: 'user', content: "What's the weather in Paris and what is 42 * 7?" }
  ];

  // TODO: First API call with tools
  let response = await client.messages.create({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 1024,
    tools,
    messages,
  });

  // TODO: Check if stop_reason === 'tool_use'
  // If so, find tool_use blocks, execute functions, and send tool_result
  // Keep looping until stop_reason === 'end_turn'

  while (response.stop_reason === 'tool_use') {
    // TODO: Process tool calls and loop
    break; // remove this when implemented
  }

  // TODO: Print the final text response
}

runAgent().catch(console.error);
