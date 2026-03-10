# Lesson 01: Stock Bot Architecture

Design a Telegram stock bot that combines live market data with Claude analysis.

## What you'll build
- A system architecture diagram for the stock bot
- A data flow design (Telegram → bot → Yahoo Finance → Claude → Telegram)
- A component specification for each module

## The stock bot
- **Interface**: Telegram bot (BotFather for setup)
- **Data**: Yahoo Finance OHLCV (Open/High/Low/Close/Volume) via free API
- **Signals**: RSI, MACD, SMA calculated in JavaScript
- **Analysis**: Claude interprets the signals and gives a recommendation
- **Delivery**: Telegram message with emoji-formatted analysis

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
