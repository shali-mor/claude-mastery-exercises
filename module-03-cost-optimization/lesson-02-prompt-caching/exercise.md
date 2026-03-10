# Exercise 3-2: Prompt Caching

## Objective
Add prompt caching to a real API call and observe the cost savings from cache hits.

> **Note:** This exercise requires an Anthropic API key and makes real API calls.
> Estimated cost: < $0.01 for the full exercise.

---

## Background

Prompt caching works by marking a portion of your request with `cache_control: { type: 'ephemeral' }`.

- **Cache write** (first request): costs 1.25× the normal input price
- **Cache read** (subsequent requests): costs 0.10× the normal input price
- **Break-even**: after just 2 requests (1 write + 1 read = 1.35× vs 2.00× uncached)

---

## Task 1 — Add caching to ai.ts
Open `starter/src/ai.ts`.

It has a large `SYSTEM_PROMPT` constant (simulating a large system prompt like tool definitions or company docs).

Your task: add `cache_control: { type: 'ephemeral' }` to the system prompt block so it gets cached.

The function should:
- Return the response text
- Also return the usage stats (input tokens, cache write tokens, cache read tokens)

---

## Task 2 — Implement chatbot.ts
Open `starter/src/chatbot.ts`. It calls `ai.ts` in a loop, simulating a multi-turn chatbot.

Fill in the TODO to:
- Call `askWithCaching()` for each user message
- Print the response
- Print the cache stats after each call (hit or miss, tokens saved)

---

## Task 3 — Run the chatbot and observe
```bash
cd starter
npm install
npm run start
```

After 3 requests, you should see cache reads (not writes) starting from request 2.

Fill in your observations:
```
# TODO: Fill in after running
Request 1 — cache_creation_input_tokens:
Request 1 — cache_read_input_tokens:
Request 2 — cache_creation_input_tokens:
Request 2 — cache_read_input_tokens:
Cost difference (req 1 vs req 2):
```

---

## Task 4 — Calculate your savings
Given: system prompt = 5,000 tokens, Sonnet 4.6 pricing.

```
# TODO: Fill in
Cost of 1 uncached request (input only):
Cost of cache write (1.25×):
Cost of cache read (0.10×):
Total cost for 10 requests (1 write + 9 reads):
Total cost for 10 uncached requests:
Savings over 10 requests:
```

---

## Validate
```bash
bash check.sh
```
