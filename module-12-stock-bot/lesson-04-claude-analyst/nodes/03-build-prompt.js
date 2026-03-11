// ─────────────────────────────────────────────────────────────────────────────
// n8n Code node: "Build Prompt"
// Mode: Run Once For All Items  ← IMPORTANT: must be set to this mode
//
// Input:  All filtered ticker signal objects (from Filter node)
// Output: Single item with the full Claude prompt string
// ─────────────────────────────────────────────────────────────────────────────

const stocks = $input.all()
  .map(i => i.json)
  .filter(s => !s.skip);   // drop any tickers that had insufficient data

if (stocks.length === 0) {
  return [{ json: { prompt: null, stockCount: 0, error: 'No stocks passed the filter.' } }];
}

const stockTable = stocks.map(s =>
  `${s.ticker}: price=$${s.currentPrice} ` +
  `RSI=${s.rsi} ` +
  `MACD=${s.macdLine}(${s.macdCrossingUp ? 'crossing up' : 'flat'}) ` +
  `vs50SMA=${s.aboveSMA50 ? 'above' : 'below'} ` +
  `volRatio=${s.volumeRatio}x ` +
  `30d%=${s.priceChange30d}%`
).join('\n');

const today = new Date().toISOString().split('T')[0];

const prompt =
`You are a swing trading analyst. The investor's strategy is to hold positions for
1–2 months, targeting 10–25% gains by riding medium-term momentum.

Today's date: ${today}
Screening data for ${stocks.length} pre-filtered stocks:
${stockTable}

Scoring criteria for a strong swing trade candidate:
- RSI between 40–65 (momentum building, not overbought)
- MACD crossing up or recently positive (momentum turning)
- Price above 50-day SMA (medium-term uptrend intact)
- Volume ratio > 1.2 on recent up days (institutional interest)
- Not already up 20%+ in 30 days (room to run)

Task:
1. Score each stock against these criteria (0–5 points)
2. Select the TOP 3 buy candidates
3. For each pick: ticker, score, one-sentence reason, one key risk

Respond ONLY in this exact JSON format (no markdown fences, no commentary):
{
  "date": "${today}",
  "picks": [
    {
      "ticker": "AAPL",
      "score": 4,
      "reason": "RSI recovering from 48 with MACD crossover and volume surge.",
      "risk": "Watch for broad market selloff given high beta."
    }
  ],
  "summary": "One sentence market context for today."
}`;

return [{ json: { prompt, stockCount: stocks.length } }];
