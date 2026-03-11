// ─────────────────────────────────────────────────────────────────────────────
// n8n Code node: "Compute Signals"
// Mode: Run Once For Each Item  (runs once per ticker from Yahoo Finance)
//
// Input:  Raw Yahoo Finance API response for one ticker
// Output: Structured signal object with RSI, MACD, SMA, volume ratio
// ─────────────────────────────────────────────────────────────────────────────

const item   = $input.first().json;
const ticker = item.meta?.symbol ?? 'UNKNOWN';

const closes  = item.indicators?.quote?.[0]?.close  ?? [];
const volumes = item.indicators?.quote?.[0]?.volume ?? [];

if (closes.length < 50) {
  // Not enough history — skip this ticker
  return [{ json: { ticker, skip: true, reason: 'Insufficient data' } }];
}

// ── RSI (14-period Wilder smoothing) ─────────────────────────────────────────
function calcRSI(prices, period = 14) {
  let gains = 0, losses = 0;
  for (let i = 1; i <= period; i++) {
    const d = prices[i] - prices[i - 1];
    if (d > 0) gains  += d;
    else       losses -= d;
  }
  let avgGain = gains / period;
  let avgLoss = losses / period;
  for (let i = period + 1; i < prices.length; i++) {
    const d = prices[i] - prices[i - 1];
    avgGain = (avgGain * (period - 1) + Math.max(d, 0))  / period;
    avgLoss = (avgLoss * (period - 1) + Math.max(-d, 0)) / period;
  }
  return avgLoss === 0 ? 100 : 100 - 100 / (1 + avgGain / avgLoss);
}

// ── EMA ───────────────────────────────────────────────────────────────────────
function calcEMA(prices, period) {
  const k = 2 / (period + 1);
  let ema = prices.slice(0, period).reduce((a, b) => a + b, 0) / period;
  for (let i = period; i < prices.length; i++) {
    ema = prices[i] * k + ema * (1 - k);
  }
  return ema;
}

// ── MACD line and signal line ─────────────────────────────────────────────────
const ema12 = calcEMA(closes, 12);
const ema26 = calcEMA(closes, 26);
const macdLine = ema12 - ema26;

// Build MACD series for the last 9 bars to compute signal line
const macdSeries = closes.slice(-35).map((_, i, arr) => {
  const slice = closes.slice(0, closes.length - arr.length + i + 1);
  return calcEMA(slice, 12) - calcEMA(slice, 26);
});
const signalLine = calcEMA(macdSeries, 9);

// ── 50-day SMA ────────────────────────────────────────────────────────────────
const sma50 = closes.slice(-50).reduce((a, b) => a + b, 0) / 50;

// ── Volume ratio (5-day avg vs 20-day avg) ────────────────────────────────────
const recentVol = volumes.slice(-5).reduce((a, b) => a + (b ?? 0), 0) / 5;
const avgVol20  = volumes.slice(-20).reduce((a, b) => a + (b ?? 0), 0) / 20;
const volumeRatio = avgVol20 > 0 ? recentVol / avgVol20 : 1;

// ── 30-day price change ───────────────────────────────────────────────────────
const price30dAgo  = closes[closes.length - 31] ?? closes[0];
const currentPrice = closes[closes.length - 1];
const priceChange30d = ((currentPrice - price30dAgo) / price30dAgo) * 100;

return [{
  json: {
    ticker,
    currentPrice:   Math.round(currentPrice   * 100) / 100,
    rsi:            Math.round(calcRSI(closes) *  10) /  10,
    macdLine:       Math.round(macdLine        * 100) / 100,
    macdCrossingUp: macdLine > signalLine && macdLine > 0,
    aboveSMA50:     currentPrice > sma50,
    volumeRatio:    Math.round(volumeRatio     * 100) / 100,
    priceChange30d: Math.round(priceChange30d  *  10) /  10,
  },
}];
