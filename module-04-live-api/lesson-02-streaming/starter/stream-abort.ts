import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

async function main() {
  let tokenCount = 0;

  // TODO: Start a streaming request asking Claude for "a 500-word story about a robot"
  const stream = null; // TODO

  // TODO: Listen to text events, count tokens, write to stdout

  // TODO: After 2 seconds, call stream.abort() to cancel
  // setTimeout(() => stream.abort(), 2000);

  try {
    // TODO: await stream.finalMessage()
  } catch (e) {
    // AbortError is expected
    console.log(`\n\nAborted after ~${tokenCount} tokens`);
  }
}

main().catch(console.error);
