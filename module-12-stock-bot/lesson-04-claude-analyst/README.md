# Lesson 04: Claude as the Swing Trading Analyst

Complete the stock bot by connecting Claude to the signal pipeline.

---

## What's in this folder

```
lesson-04-claude-analyst/
├── workflow/
│   └── stock-bot-workflow.json   ← Import this into n8n to get the full 13-node workflow
├── nodes/
│   ├── 01-set-watchlist.js       ← Code node: define 20 tickers
│   ├── 02-compute-signals.js     ← Code node: RSI / MACD / SMA / volume ratio
│   ├── 03-build-prompt.js        ← Code node: build Claude prompt (run once for all items)
│   ├── 04-parse-response.js      ← Code node: extract + validate Claude's JSON response
│   ├── 05-format-message.js      ← Code node: build Telegram HTML message
│   └── 06-error-message.js       ← Code node: error branch alert
├── .env.example                  ← Documents which credentials you need to create in n8n
└── README.md
```

---

## Quick start: Import the workflow

1. Open n8n → **Workflows** → **⊕ Add Workflow**
2. Click the **⋯ menu** (top-right) → **Import from File**
3. Select `workflow/stock-bot-workflow.json`
4. The full 13-node workflow will appear — continue to [Configure credentials](#configure-credentials)

> **Note:** After import you'll see credential warnings on the Telegram nodes and the Claude API node.
> That's expected — follow the steps below to wire in your own credentials.

---

## Configure credentials

### 1 — Anthropic API key

1. n8n → **Settings** → **Credentials** → **New**
2. Search for **"Header Auth"** (Generic Credential Type)
3. Name it exactly: `Anthropic`
4. Header name: `x-api-key`
5. Header value: your key from [console.anthropic.com](https://console.anthropic.com)
6. Save — then open the **Claude API** node and select this credential

### 2 — Telegram bot token

1. Message **@BotFather** in Telegram → `/newbot` → follow the prompts
2. Copy the bot token (format: `12345678:ABCdef...`)
3. n8n → **Settings** → **Credentials** → **New** → search **"Telegram API"**
4. Name it: `Telegram Bot`, paste the token
5. Save — then open the **Telegram Trigger**, **Send Picks**, and **Send Error** nodes and select this credential

### 3 — Your Telegram chat ID

- Message **@userinfobot** in Telegram → it replies with your numeric chat ID
- Open the **Send Picks** and **Send Error** nodes → set **Chat ID** to your number

---

## Build it yourself (without importing)

If you prefer to build node-by-node, paste the contents of each `nodes/*.js` file
into the corresponding **Code** node in n8n:

| Node # | Node name | File | n8n Code mode |
|--------|-----------|------|----------------|
| 4 | Set Watchlist | `nodes/01-set-watchlist.js` | Run Once For All Items |
| 6 | Compute Signals | `nodes/02-compute-signals.js` | Run Once For Each Item |
| 8 | Build Prompt | `nodes/03-build-prompt.js` | **Run Once For All Items** |
| 10 | Parse Response | `nodes/04-parse-response.js` | Run Once For Each Item |
| 11 | Format Message | `nodes/05-format-message.js` | Run Once For Each Item |
| 13 | Error Message | `nodes/06-error-message.js` | Run Once For Each Item |

> ⚠️ The **Build Prompt** node **must** be set to "Run Once For All Items" — it aggregates
> all filtered tickers into a single Claude API call.

---

## Non-code node configuration

### Yahoo Finance HTTP node (node 5)
- Type: HTTP Request
- Method: GET
- URL: `https://query1.finance.yahoo.com/v8/finance/chart/{{ $json.ticker }}?interval=1d&range=90d`
- No authentication needed

### Filter node (node 7)
- Condition 1: `{{ $json.rsi }}` is less than `70`
- Condition 2: `{{ $json.priceChange30d }}` is less than `20`
- Condition 3: `{{ $json.skip }}` does not equal `true`
- Combine with: AND

### Claude API HTTP node (node 9)
- Method: POST
- URL: `https://api.anthropic.com/v1/messages`
- Auth: Generic Credential Type → Header Auth → `Anthropic` credential
- Extra header: `anthropic-version: 2023-06-01`
- Body (JSON):
  ```json
  {
    "model": "claude-haiku-4-5-20251001",
    "max_tokens": 1024,
    "messages": [{ "role": "user", "content": "{{ $json.prompt }}" }]
  }
  ```
- **Settings → On Error: `Continue to error output`** — this enables the error branch

### Telegram nodes (12 + 14)
- Parse Mode: HTML
- Chat ID: your numeric Telegram chat ID

---

## Activating the workflow

1. Click **Activate** (top-right toggle in n8n) → the schedule trigger goes live
2. To test immediately: click **Execute Workflow** — runs the full pipeline now
3. To test the Telegram trigger: send `/picks` to your bot in Telegram
4. Check **n8n → Executions** to see run logs and debug any failures

---

## Customising

| What to change | Where |
|----------------|-------|
| Watchlist tickers | `nodes/01-set-watchlist.js` lines 3–8 |
| Trading strategy / scoring criteria | `nodes/03-build-prompt.js` — edit the prompt text |
| Claude model | Claude API node JSON body → `"model"` field |
| Schedule (e.g. 7 AM) | Schedule Trigger → cron expression → `0 7 * * 1-5` |
| Output channel (Slack, email…) | Replace Telegram nodes with the relevant n8n node |
