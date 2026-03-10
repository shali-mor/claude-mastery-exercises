# Exercise: Telegram Bot Setup

## Goal
Build the Telegram bot shell that receives commands and sends responses.

---

## Task 1: Complete the bot (15 min)

Complete `starter/bot.ts`:
1. Import and initialise Telegraf with `TELEGRAM_BOT_TOKEN`
2. Handle the `/analyze <ticker>` command:
   - Extract the ticker from `ctx.match[1]` or `ctx.message.text`
   - Validate: 1-5 uppercase letters only (regex)
   - Reply with "🔍 Analysing {{TICKER}}..." while processing
   - Call the `analyzeStock(ticker)` stub function
   - Reply with the formatted result
3. Handle `/start` with a welcome message listing available commands
4. Start the bot with `bot.launch()`

---

## Task 2: Message formatter (10 min)

Complete `starter/formatter.ts`:
A function `formatAnalysis(ticker, data)` that returns a Telegram-formatted message:
```
📈 *AAPL Analysis* — 2026-03-10

💰 Price: $175.23 (+1.2%)
📊 RSI: 65.4 (neutral)
🔀 MACD: Bullish crossover
📉 SMA: Above 20d, below 50d

🤖 *Claude's Take*
[Analysis text here]

⚠️ Not financial advice
```

---

## Validation

`bash check.sh`
