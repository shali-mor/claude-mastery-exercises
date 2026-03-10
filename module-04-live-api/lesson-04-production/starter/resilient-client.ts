import Anthropic from '@anthropic-ai/sdk';

// TODO: Create client with maxRetries: 3, timeout: 30000
const client = new Anthropic({
  // TODO: add maxRetries and timeout
});

// TODO: Implement withRetry(fn, maxAttempts = 3)
// - On Anthropic.RateLimitError: wait 60s then retry
// - On Anthropic.APIConnectionError: wait 2s then retry
// - On other errors: rethrow immediately
async function withRetry<T>(fn: () => Promise<T>, maxAttempts = 3): Promise<T> {
  // TODO: implement retry logic
  return fn();
}

async function main() {
  // TODO: Wrap this call with withRetry and proper error handling
  const response = await client.messages.create({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 100,
    messages: [{ role: 'user', content: 'Hello' }],
  });
  console.log((response.content[0] as Anthropic.TextBlock).text);
}

main().catch(console.error);
