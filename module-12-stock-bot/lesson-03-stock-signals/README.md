# Lesson 03: Stock Signals

Fetch real market data and calculate RSI, MACD, and SMA indicators.

## What you'll build
- A Yahoo Finance OHLCV fetcher
- RSI calculator (14-period)
- MACD calculator (12/26/9 EMA)
- SMA calculator (20-day and 50-day)

## Key concepts
- Yahoo Finance free endpoint: `https://query1.finance.yahoo.com/v8/finance/chart/{ticker}?interval=1d&range=3mo`
- RSI = 100 - (100 / (1 + RS)) where RS = avg gain / avg loss over 14 periods
- MACD = 12-day EMA - 26-day EMA; signal = 9-day EMA of MACD
- SMA = simple average of closing prices over N days
- No API key needed for Yahoo Finance (rate limit: ~100 req/min)

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
