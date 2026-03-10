import express from 'express';
import Anthropic from '@anthropic-ai/sdk';

const app = express();
app.use(express.json());
const client = new Anthropic();

app.post('/chat', async (req, res) => {
  const { message } = req.body as { message: string };

  res.setHeader('Content-Type', 'text/event-stream');
  res.setHeader('Cache-Control', 'no-cache');
  res.setHeader('Connection', 'keep-alive');

  const stream = client.messages.stream({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 1024,
    messages: [{ role: 'user', content: message }],
  });

  stream.on('text', (chunk) => {
    res.write(`data: ${JSON.stringify(chunk)}\n\n`);
  });

  await stream.finalMessage();
  res.write('data: [DONE]\n\n');
  res.end();
});

app.listen(3000, () => console.log('Server running at http://localhost:3000'));
