import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

// TODO: Define an extract_person tool with input_schema:
// { name: string, age: number, email: string | null }
const extractTool: Anthropic.Tool = {
  name: 'extract_person',
  description: 'Extract structured person data from text',
  input_schema: {
    type: 'object' as const,
    properties: {
      // TODO: add name, age, email properties
    },
    required: ['name', 'age'],
  },
};

const sentences = [
  "Hi, I'm Alice and I'm 28 years old. Reach me at alice@example.com",
  "Bob is a 35-year-old developer with no public email",
  "My name is Carol, age 22, carol@mail.co",
];

async function extract(text: string) {
  const response = await client.messages.create({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 256,
    tools: [extractTool],
    // TODO: force tool use with tool_choice: { type: 'tool', name: 'extract_person' }
    messages: [{ role: 'user', content: text }],
  });

  // TODO: Find the tool_use block and return its input as the structured result
  return response.content[0];
}

async function main() {
  for (const sentence of sentences) {
    const result = await extract(sentence);
    console.log('\nInput:', sentence);
    console.log('Extracted:', JSON.stringify(result, null, 2));
  }
}

main().catch(console.error);
