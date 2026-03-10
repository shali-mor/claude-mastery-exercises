# Exercise: Stock Bot Architecture

## Goal
Design the complete stock bot system before coding.

---

## Task 1: Architecture diagram (10 min)

Complete `starter/architecture.md`:
Draw the full system:
1. User sends `/analyze AAPL` to Telegram
2. Bot receives command
3. Fetch AAPL OHLCV data from Yahoo Finance
4. Calculate RSI, MACD, SMA
5. Send signals + price data to Claude
6. Claude returns analysis + recommendation
7. Bot sends formatted response to Telegram

---

## Task 2: Component spec (10 min)

Complete `starter/component-spec.md`:
For each component, define:
- Input / Output
- Technology used
- Error handling approach

Components: Telegram listener, Yahoo Finance fetcher, Signal calculator, Claude analyser, Response formatter

---

## Task 3: Signal definitions (5 min)

Complete `starter/signal-definitions.md`:
Define the 3 technical indicators the bot will use:
- RSI: what it measures, how to interpret (overbought/oversold)
- MACD: what it measures, signal line crossover interpretation
- SMA: 20-day vs 50-day crossover interpretation

---

## Validation

`bash check.sh`
