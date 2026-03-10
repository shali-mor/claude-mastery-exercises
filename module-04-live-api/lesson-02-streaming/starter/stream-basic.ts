import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

async function main() {
  console.log('Streaming response:\n');

  // TODO: Use client.messages.stream() (not messages.create)
  // with model 'claude-haiku-4-5-20251001', max_tokens 512
  // and message: 'Write a haiku about TypeScript'

  // TODO: Listen to stream.on('text', (chunk) => ...)
  // and write each chunk to process.stdout (no newline)

  // TODO: After streaming, call stream.finalMessage()
  // and log the input/output token counts

  const stream = null; // TODO: create stream

  // TODO: wire up the text event listener

  // TODO: await stream.finalMessage() and log tokens
}

main().catch(console.error);
