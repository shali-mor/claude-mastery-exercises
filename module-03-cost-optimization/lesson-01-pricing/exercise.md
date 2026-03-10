# Exercise 3-1: Understanding Claude Pricing

## Objective
Build intuition for token costs so you can make smart model and architecture decisions.

---

## Pricing Reference (2026)

| Model | Input (per M tokens) | Output (per M tokens) | Cache Read |
|-------|---------------------|-----------------------|------------|
| Claude Opus 4.6 | $15.00 | $75.00 | $1.50 |
| Claude Sonnet 4.6 | $3.00 | $15.00 | $0.30 |
| Claude Haiku 4.5 | $0.80 | $4.00 | $0.08 |

**Rule of thumb:** 1 token ≈ 0.75 words. 1,000 words ≈ 1,333 tokens.

---

## Task 1 — Cost calculations
Open `starter/cost-calculator.md`. For each scenario, calculate the approximate cost.

---

## Task 2 — Model selection
Open `starter/model-picker.md`. For each task, choose the best model and explain why.

---

## Task 3 — Observe your own session cost
Start a Claude Code session, do some work for 10-15 minutes, then run:
```
/cost
```

Write down the numbers:
```
# TODO: Fill in after running /cost
Input tokens used:
Output tokens generated:
Estimated session cost:
```

How does this compare to your estimate before running `/cost`?

---

## Task 4 — The /compact experiment
In the same session, run:
```
/compact
```

Then run `/cost` again.

```
# TODO: Fill in
Token count before compact:
Token count after compact:
Cost saved per subsequent request:
```

---

## Validate
```bash
bash check.sh
```
