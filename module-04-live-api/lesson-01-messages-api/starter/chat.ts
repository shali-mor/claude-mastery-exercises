import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

// TODO: Add a system prompt that gives Claude a fun persona
const SYSTEM = 'TODO: write a persona here';

async function chat(messages: Anthropic.MessageParam[]): Promise<string> {
  const response = await client.messages.create({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 512,
    system: SYSTEM,
    messages,
  });
  return (response.content[0] as Anthropic.TextBlock).text;
}

async function main() {
  const messages: Anthropic.MessageParam[] = [];

  const turns = [
    'What is your name?',
    'What is your favourite food?',
    'Tell me a joke in your style.',
  ];

  for (const userMessage of turns) {
    console.log(`\nYou: ${userMessage}`);

    // TODO: Push the user message to messages array
    // messages.push({ role: 'user', content: userMessage });

    const reply = await chat(messages);
    console.log(`Claude: ${reply}`);

    // TODO: Push the assistant reply to messages array
    // so the next turn has full context
  }
}

main().catch(console.error);
