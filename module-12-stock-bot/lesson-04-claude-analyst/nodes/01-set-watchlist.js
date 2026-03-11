// ─────────────────────────────────────────────────────────────────────────────
// n8n Code node: "Set Watchlist"
// Mode: Run Once For All Items
//
// Purpose: Define the list of stock tickers to screen each day.
// Output:  One item per ticker → feeds into the Yahoo Finance HTTP node.
// ─────────────────────────────────────────────────────────────────────────────

const tickers = [
  'AAPL', 'MSFT', 'NVDA', 'GOOGL', 'META',
  'AMZN', 'TSLA', 'JPM',  'V',     'MA',
  'UNH',  'LLY',  'XOM',  'CVX',   'HD',
  'COST', 'AVGO', 'ASML', 'AMD',   'NFLX',
];

// Tip: edit this array to match your own watchlist.
// Keep it at 20–30 tickers; Yahoo Finance rate-limits at ~50 req/min.

return tickers.map(ticker => ({ json: { ticker } }));
