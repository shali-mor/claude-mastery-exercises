import Anthropic from '@anthropic-ai/sdk';

const client = new Anthropic();

const SYSTEM_PROMPT = `
You are a helpful customer support assistant for Acme Corp.

PRODUCT CATALOG:
- Widget Pro: $49.99 — professional grade widget for power users
- Widget Lite: $19.99 — entry-level widget for casual use
- Widget Enterprise: $199.99/mo — unlimited widgets with priority support

RETURN POLICY:
- 30-day returns for unused items in original packaging
- 14-day returns for opened software licenses
- No returns on custom orders or digital downloads

SHIPPING POLICY:
- Standard shipping: 5-7 business days, free over $50
- Express shipping: 2-3 business days, $9.99
- Overnight shipping: next business day, $24.99
- International: 10-15 business days, rates vary

SUPPORT HOURS:
- Monday-Friday: 9am-6pm EST
- Saturday: 10am-4pm EST
- Sunday: Closed
- Emergency support (Enterprise): 24/7 via priority line

COMMON ISSUES AND SOLUTIONS:
1. Widget not turning on — check battery level, try holding power for 5 seconds
2. Widget not syncing — ensure Bluetooth is enabled, try re-pairing
3. Widget overheating — ensure vents are clear, avoid direct sunlight
4. App crashes — update to latest version, clear app cache
5. Account locked — use forgot password flow, contact support if not resolved in 15 minutes

ESCALATION PROCEDURE:
- Tier 1: Common issues, handled by this assistant
- Tier 2: Technical issues, escalate with ticket number
- Tier 3: Executive escalations, manager approval required

Always be polite, empathetic, and solution-focused. If unsure, say so and escalate.
`.trim();

export interface CachedResponse {
  text: string;
  usage: {
    input_tokens: number;
    output_tokens: number;
    cache_creation_input_tokens: number;
    cache_read_input_tokens: number;
  };
}

export async function askWithCaching(userMessage: string): Promise<CachedResponse> {
  const response = await client.messages.create({
    model: 'claude-haiku-4-5-20251001',
    max_tokens: 256,
    system: [
      {
        type: 'text',
        text: SYSTEM_PROMPT,
        cache_control: { type: 'ephemeral' }, // ← this is the only change needed
      } as Anthropic.TextBlockParam,
    ],
    messages: [{ role: 'user', content: userMessage }],
  });

  const text = response.content[0].type === 'text' ? response.content[0].text : '';
  const usage = response.usage as typeof response.usage & {
    cache_creation_input_tokens: number;
    cache_read_input_tokens: number;
  };

  return {
    text,
    usage: {
      input_tokens: usage.input_tokens,
      output_tokens: usage.output_tokens,
      cache_creation_input_tokens: usage.cache_creation_input_tokens ?? 0,
      cache_read_input_tokens: usage.cache_read_input_tokens ?? 0,
    },
  };
}
