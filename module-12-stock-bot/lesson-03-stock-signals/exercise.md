# Exercise: Stock Signals

## Goal
Implement the market data fetcher and technical indicator calculations.

---

## Task 1: Yahoo Finance fetcher (10 min)

Complete `starter/fetcher.ts`:
1. Fetch OHLCV data for a ticker from Yahoo Finance
2. Extract: closing prices array, current price, today's % change
3. Handle errors: invalid ticker, network error, no data

---

## Task 2: RSI calculator (10 min)

Complete `starter/indicators/rsi.ts`:
Implement `calculateRSI(closes: number[], period = 14): number`:
1. Calculate daily gains and losses
2. Compute average gain and average loss over the period
3. RS = avgGain / avgLoss
4. RSI = 100 - (100 / (1 + RS))
5. Return the RSI value rounded to 1 decimal

---

## Task 3: SMA calculator (5 min)

Complete `starter/indicators/sma.ts`:
Implement `calculateSMA(closes: number[], period: number): number`:
Return the simple moving average of the last `period` closing prices.

---

## Task 4: MACD calculator (bonus, 10 min)

Complete `starter/indicators/macd.ts`:
Implement `calculateMACD(closes: number[]): { macd: number; signal: number; histogram: number }`:
- 12-day EMA, 26-day EMA, then 9-day EMA of (12-EMA - 26-EMA)

---

## Validation

`bash check.sh`
