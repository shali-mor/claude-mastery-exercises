# Lesson 02: Telegram Bot Setup

Create the Telegram bot and handle commands with the telegraf library.

## What you'll build
- A working Telegram bot with `/analyze <ticker>` command
- A message formatter that renders stock analysis beautifully
- Error handling for invalid tickers and API failures

## Key concepts
- BotFather: `@BotFather` on Telegram → `/newbot` → get token
- Store token in `TELEGRAM_BOT_TOKEN` env var
- Use `telegraf` npm package: `bot.command('analyze', ctx => ...)`
- `ctx.reply('message')` sends a response to the same chat
- `{ parse_mode: 'Markdown' }` enables bold, italic, code formatting

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
