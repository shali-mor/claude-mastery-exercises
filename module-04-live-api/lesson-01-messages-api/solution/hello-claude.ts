import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

async function main() {
  const response = await client.messages.create({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 256,
    messages: [{ role: 'user', content: 'Say "Hello, Claude Mastery!" and nothing else.' }],
  });

  console.log('Response:', (response.content[0] as Anthropic.TextBlock).text);
  console.log('Input tokens:', response.usage.input_tokens);
  console.log('Output tokens:', response.usage.output_tokens);
}

main().catch(console.error);
