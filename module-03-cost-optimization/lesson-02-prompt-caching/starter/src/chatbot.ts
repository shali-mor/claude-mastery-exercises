// chatbot.ts — simulates a multi-turn chatbot to demonstrate prompt caching
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

    // TODO: Call askWithCaching(question) and:
    // 1. Print the response text
    // 2. Print the cache stats:
    //    - cache_creation_input_tokens (> 0 means cache WRITE)
    //    - cache_read_input_tokens (> 0 means cache READ / hit)
    //    - input_tokens
    //    - output_tokens
    // 3. Indicate whether this was a cache hit or miss

    console.log('');
  }
}

main().catch(console.error);
