# Exercise: Batch API

## Goal
Build a batch ticket classifier that saves 50% on API costs compared to sequential calls.

---

## Task 1: Build the batch classifier (20 min)

Open `starter/classify-tickets.ts` and complete the TODOs:

1. **Create batch requests** — map each ticket in `TICKETS` to a batch request object with:
   - `custom_id`: `"ticket-{index}"`
   - `params.model`: `"claude-haiku-4-5-20251001"`
   - `params.max_tokens`: `20`
   - `params.messages`: classify as `billing`, `bug`, `feature`, or `support`

2. **Submit the batch** — call `client.messages.batches.create({ requests })` and log the batch ID

3. **Poll for results** — loop with `client.messages.batches.retrieve(batchId)` until `processing_status === "ended"`

4. **Process results** — iterate `client.messages.batches.results(batchId)` and print `custom_id → category`

---

## Task 2: Cost comparison (5 min)

Open `starter/cost-comparison.md` and fill in the math:

Given 1,000 tickets, each with ~50 input tokens and ~5 output tokens, using `claude-haiku-4-5-20251001`:
- Real-time cost = ?
- Batch cost = ?
- Savings = ?

---

## Validation

`bash check.sh`
