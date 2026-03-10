interface StockData {
  ticker: string;
  price: number;
  priceChangePercent: number;
  rsi: number;
  macdSignal: 'bullish' | 'bearish' | 'neutral';
  smaSignal: 'above_both' | 'below_both' | 'mixed';
  claudeAnalysis: string;
  date: string;
}

// TODO: Implement formatAnalysis(data: StockData): string
// Return a Telegram-formatted message with:
// - Header with ticker and date
// - Price with % change
// - RSI value with interpretation (< 30 oversold, > 70 overbought, else neutral)
// - MACD signal with emoji
// - SMA crossover signal
// - Claude's analysis in a quoted block
// - Disclaimer: "⚠️ Not financial advice"
// Use Markdown formatting: *bold*, `code`, etc.
export function formatAnalysis(data: StockData): string {
  // TODO: implement
  return `TODO: format ${data.ticker} analysis`;
}
