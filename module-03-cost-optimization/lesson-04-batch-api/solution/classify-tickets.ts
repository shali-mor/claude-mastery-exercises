import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic({ apiKey: process.env.ANTHROPIC_API_KEY });

const TICKETS = [
  "I was charged twice for my subscription this month",
  "The login button doesn't work on Safari",
  "Can you add dark mode support?",
  "My export is stuck at 0% for 2 hours",
  "How do I change my billing address?",
  "App crashes when I upload files > 10MB",
  "Would love a mobile app version",
  "Can't reset my password — email never arrives",
  "Invoice #4521 shows wrong amount",
  "Feature request: bulk CSV export",
];

const SYSTEM = `Classify this support ticket into exactly one category:
- billing
- bug
- feature
- support
Reply with only the category word, nothing else.`;

async function classifyTicketsBatch() {
  const requests = TICKETS.map((ticket, index) => ({
    custom_id: `ticket-${index}`,
    params: {
      model: 'claude-haiku-4-5-20251001' as const,
      max_tokens: 20,
      system: SYSTEM,
      messages: [{ role: 'user' as const, content: ticket }],
    },
  }));

  const batch = await client.messages.batches.create({ requests });
  console.log('Batch submitted:', batch.id);

  let status = await client.messages.batches.retrieve(batch.id);
  while (status.processing_status !== 'ended') {
    await new Promise(r => setTimeout(r, 2000));
    status = await client.messages.batches.retrieve(batch.id);
    console.log('Status:', status.processing_status, `(${status.request_counts.processing} processing)`);
  }

  console.log('\nResults:');
  for await (const result of await client.messages.batches.results(batch.id)) {
    if (result.result.type === 'succeeded') {
      const category = result.result.message.content[0];
      if (category.type === 'text') {
        const ticket = TICKETS[parseInt(result.custom_id.split('-')[1])];
        console.log(`${result.custom_id} → ${category.text.trim()}`);
        console.log(`  "${ticket.slice(0, 50)}..."`);
      }
    }
  }
}

classifyTicketsBatch().catch(console.error);
