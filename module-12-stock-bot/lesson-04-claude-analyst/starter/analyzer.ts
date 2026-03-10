import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

// TODO: Define the system prompt for the stock analyst persona
const SYSTEM_PROMPT = 'TODO: You are an expert technical stock analyst...';

interface SignalData {
  ticker: string;
  price: number;
  changePercent: number;
  rsi: number;
  sma20: number;
  sma50: number;
  macdSignal?: string;
}

// TODO: Implement analyzeWithClaude(signals: SignalData): Promise<string>
// 1. Build a user message describing the signals
// 2. Call client.messages.create with Haiku, max_tokens: 150
// 3. Return the response text
export async function analyzeWithClaude(signals: SignalData): Promise<string> {
  // TODO: implement
  throw new Error('Not implemented');
}
