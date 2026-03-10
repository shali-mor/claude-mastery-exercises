# Exercise: Production Patterns

## Goal
Build a production-grade Claude API client with reliability and observability.

---

## Task 1: Resilient client (15 min)

Complete `starter/resilient-client.ts`:
1. Create an Anthropic client with `maxRetries: 3` and `timeout: 30000`
2. Wrap every call in a try/catch that classifies errors:
   - `Anthropic.RateLimitError` → log "rate limited, backing off" and wait 60s
   - `Anthropic.APIConnectionError` → log "connection error, retrying"
   - `Anthropic.APIError` → log `error.status` and `error.message`
3. Add a `withRetry(fn, maxAttempts)` wrapper that retries on transient errors

---

## Task 2: Cost logger middleware (10 min)

Complete `starter/cost-logger.ts`:
1. Create a `loggedCreate(params)` wrapper around `client.messages.create()`
2. After each call, compute cost using Haiku pricing:
   - Input: $0.80/M tokens
   - Output: $4.00/M tokens
3. Log: model, input tokens, output tokens, estimated cost in USD
4. Export a `getSessionCost()` function that returns the running total

---

## Validation

`bash check.sh`
