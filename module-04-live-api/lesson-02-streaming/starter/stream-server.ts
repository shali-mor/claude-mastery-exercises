import express from 'express';
import Anthropic from '@anthropic-ai/sdk';

const app = express();
app.use(express.json());
const client = new Anthropic();

app.post('/chat', async (req, res) => {
  const { message } = req.body as { message: string };

  // TODO: Set SSE headers
  // res.setHeader('Content-Type', 'text/event-stream');
  // res.setHeader('Cache-Control', 'no-cache');
  // res.setHeader('Connection', 'keep-alive');

  // TODO: Create a stream with client.messages.stream()

  // TODO: On each text chunk, send: `data: ${chunk}\n\n`

  // TODO: When done (await stream.finalMessage()), send: `data: [DONE]\n\n` then res.end()
});

app.listen(3000, () => console.log('Server running at http://localhost:3000'));
