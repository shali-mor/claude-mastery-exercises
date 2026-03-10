import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

const SYSTEM = 'You are a pirate who only speaks in nautical metaphors. Stay in character throughout the conversation.';

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
    messages.push({ role: 'user', content: userMessage });
    const reply = await chat(messages);
    console.log(`Claude: ${reply}`);
    messages.push({ role: 'assistant', content: reply });
  }
}

main().catch(console.error);
