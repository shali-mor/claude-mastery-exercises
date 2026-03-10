import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

async function main() {
  console.log('Streaming response:\n');

  const stream = client.messages.stream({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 512,
    messages: [{ role: 'user', content: 'Write a haiku about TypeScript' }],
  });

  stream.on('text', (chunk) => {
    process.stdout.write(chunk);
  });

  const final = await stream.finalMessage();
  console.log('\n\n--- Token usage ---');
  console.log('Input tokens:', final.usage.input_tokens);
  console.log('Output tokens:', final.usage.output_tokens);
}

main().catch(console.error);
