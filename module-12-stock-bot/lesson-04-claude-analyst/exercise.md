# Exercise: Claude as the Analyst

## Goal
Complete the stock bot by integrating Claude analysis and wiring everything together.

---

## Task 1: Claude analyser (15 min)

Complete `starter/analyzer.ts`:
1. Build the system prompt: "You are an expert technical stock analyst. Based on the signals provided, give a concise 2-3 sentence analysis and a clear BUY/HOLD/SELL recommendation. Be specific about what the signals indicate."
2. Build the user message with ticker, price, RSI, MACD signal, SMA position
3. Call Claude (Haiku, max 150 tokens)
4. Return the analysis text

---

## Task 2: Wire everything together (10 min)

Complete `starter/index.ts` — the main entry point that:
1. Imports: bot, fetcher, RSI/SMA calculators, analyser, formatter
2. Implements `analyzeStock(ticker)` function:
   - Fetch data
   - Calculate RSI (14-period), SMA20, SMA50
   - Call Claude analyser
   - Return formatted message string
3. Starts the bot

---

## Task 3: End-to-end test (5 min)

Complete `starter/test-bot.ts`:
A script (not using Telegram) that:
1. Calls `analyzeStock('AAPL')`
2. Prints the formatted result to console
3. Verifies the result contains price, RSI, and Claude's recommendation

---

## Validation

`bash check.sh`
