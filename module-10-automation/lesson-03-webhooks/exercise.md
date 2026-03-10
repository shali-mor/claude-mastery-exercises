# Exercise: Webhook-Driven Automation

## Goal
Build a production-grade webhook receiver that triggers Claude.

---

## Task 1: Secure webhook handler (20 min)

Complete `starter/webhook-server.ts`:

1. Express POST `/webhook/github` endpoint
2. Validate `x-hub-signature-256` header using HMAC-SHA256 with `WEBHOOK_SECRET`
3. Parse the GitHub push event
4. For each changed file in the push, call Claude to summarise the changes
5. Log the summary to `~/webhook-summaries/YYYY-MM-DD.log`

---

## Task 2: Security checklist (5 min)

Complete `starter/security-checklist.md`:
Check off each security measure and note where it's implemented in your code.

---

## Task 3: Retry queue (10 min)

Complete `starter/retry-queue.ts`:
A simple in-memory queue that:
- Accepts failed Claude API calls
- Retries them with exponential backoff (1s, 2s, 4s, 8s, max 3 attempts)
- Logs success or permanent failure

---

## Validation

`bash check.sh`
