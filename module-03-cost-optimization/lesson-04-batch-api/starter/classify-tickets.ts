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
  // TODO: Map TICKETS to batch request objects
  // Each request needs:
  // - custom_id: `ticket-${index}`
  // - params.model: "claude-haiku-4-5-20251001"
  // - params.max_tokens: 20
  // - params.system: SYSTEM
  // - params.messages: [{ role: 'user', content: ticket }]
  const requests = TICKETS.map((ticket, index) => ({
    custom_id: `TODO-${index}`,
    params: {
      model: 'TODO',
      max_tokens: 0, // TODO
      system: '',    // TODO
      messages: [],  // TODO
    },
  }));

  // TODO: Submit the batch using client.messages.batches.create({ requests })
  // Log the batch ID
  const batch = { id: 'TODO' };
  console.log('Batch submitted:', batch.id);

  // TODO: Poll until processing_status === "ended"
  // Use client.messages.batches.retrieve(batch.id)
  // Add a 2-second delay between polls
  let status = { processing_status: 'TODO' };
  while (status.processing_status !== 'ended') {
    await new Promise(r => setTimeout(r, 2000));
    // TODO: retrieve batch status
    console.log('Status:', status.processing_status);
  }

  // TODO: Iterate client.messages.batches.results(batch.id)
  // Print: `${result.custom_id} → ${result.result.message.content[0].text}`
  console.log('\nResults:');
}

classifyTicketsBatch().catch(console.error);
