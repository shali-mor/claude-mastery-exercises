import { askWithCaching } from './ai';

const questions = [
  "What are your shipping options?",
  "How do I return a product?",
  "My widget is not turning on, what should I do?",
];

async function main() {
  console.log('=== Prompt Caching Demo ===\n');
  console.log('Sending 3 requests with the same large system prompt.');
  console.log('Watch the cache stats — request 1 is a cache WRITE, requests 2+ are cache READS.\n');

  for (let i = 0; i < questions.length; i++) {
    const question = questions[i];
    console.log(`--- Request ${i + 1} ---`);
    console.log(`Q: ${question}`);

    const result = await askWithCaching(question);

    console.log(`A: ${result.text}`);
    console.log(`\nCache stats:`);
    console.log(`  cache_creation_input_tokens: ${result.usage.cache_creation_input_tokens}`);
    console.log(`  cache_read_input_tokens:     ${result.usage.cache_read_input_tokens}`);
    console.log(`  input_tokens:                ${result.usage.input_tokens}`);
    console.log(`  output_tokens:               ${result.usage.output_tokens}`);

    const cacheHit = result.usage.cache_read_input_tokens > 0;
    console.log(`  → Cache: ${cacheHit ? '✓ HIT (90% discount on system prompt)' : '✗ MISS (cache written)'}`);
    console.log('');
  }
}

main().catch(console.error);
