import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

// Pricing (per million tokens)
const PRICING = {
  'claude-haiku-4-5-20251001': { input: 0.80, output: 4.00 },
  'claude-sonnet-4-6': { input: 3.00, output: 15.00 },
  'claude-opus-4-6': { input: 15.00, output: 75.00 },
} as const;

// TODO: Track running session cost
let sessionTotalCost = 0; // TODO: accumulate costs here

// TODO: Implement loggedCreate(params)
// - Calls client.messages.create(params)
// - Computes cost from usage.input_tokens and usage.output_tokens
// - Logs: model | in: X | out: Y | cost: $Z | session: $W
// - Adds to sessionTotalCost
async function loggedCreate(params: Anthropic.MessageCreateParamsNonStreaming) {
  const response = await client.messages.create(params);
  // TODO: compute and log cost
  return response;
}

// TODO: Export getSessionCost()
export function getSessionCost(): number {
  return sessionTotalCost; // TODO: return actual total
}

async function main() {
  await loggedCreate({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 100,
    messages: [{ role: 'user', content: 'What is 2+2?' }],
  });

  await loggedCreate({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 200,
    messages: [{ role: 'user', content: 'Write a short poem about TypeScript' }],
  });

  console.log(`\nTotal session cost: $${getSessionCost().toFixed(6)}`);
}

main().catch(console.error);
