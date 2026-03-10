import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

const PRICING: Record<string, { input: number; output: number }> = {
  'claude-haiku-4-5-20251001': { input: 0.80, output: 4.00 },
  'claude-sonnet-4-6': { input: 3.00, output: 15.00 },
  'claude-opus-4-6': { input: 15.00, output: 75.00 },
};

let sessionTotalCost = 0;

async function loggedCreate(params: Anthropic.MessageCreateParamsNonStreaming) {
  const response = await client.messages.create(params);
  const pricing = PRICING[params.model] ?? { input: 3.00, output: 15.00 };
  const inputCost = (response.usage.input_tokens / 1_000_000) * pricing.input;
  const outputCost = (response.usage.output_tokens / 1_000_000) * pricing.output;
  const callCost = inputCost + outputCost;
  sessionTotalCost += callCost;

  console.log(
    `${params.model} | in: ${response.usage.input_tokens} | out: ${response.usage.output_tokens} | cost: $${callCost.toFixed(6)} | session: $${sessionTotalCost.toFixed(6)}`
  );
  return response;
}

export function getSessionCost(): number {
  return sessionTotalCost;
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
