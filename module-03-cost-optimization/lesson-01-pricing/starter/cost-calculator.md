# Cost Calculator

Use the pricing table from the exercise to fill in each scenario.

Pricing: Haiku input $0.80/M | Sonnet input $3.00/M | Opus input $15.00/M
         Haiku output $4.00/M | Sonnet output $15.00/M | Opus output $75.00/M

---

**Scenario 1:** A chatbot sends a 2,000-token system prompt and receives a 500-token reply, using Sonnet 4.6. This happens 10,000 times per day.

```
Daily input tokens:    # TODO: 2000 * 10,000 = ?
Daily output tokens:   # TODO: 500 * 10,000 = ?
Daily input cost:      # TODO: (input tokens / 1,000,000) * $3.00 = ?
Daily output cost:     # TODO: (output tokens / 1,000,000) * $15.00 = ?
Daily total:           # TODO
Monthly total (~30d):  # TODO
```

---

**Scenario 2:** You run a nightly batch job classifying 50,000 support tickets. Each request is ~200 tokens input, ~20 tokens output, using Haiku 4.5.

```
Total input tokens:    # TODO
Total output tokens:   # TODO
Total cost (Haiku):    # TODO
Cost if using Sonnet:  # TODO
Savings from Haiku:    # TODO (%)
```

---

**Scenario 3:** A developer uses Claude Code for 2 hours. Their session accumulates 80,000 input tokens (context grows) and generates 5,000 output tokens, on Sonnet 4.6.

```
Session input cost:    # TODO
Session output cost:   # TODO
Session total:         # TODO
```

---

**Scenario 4:** Same session as Scenario 3, but the developer runs `/compact` after 1 hour. The compact reduces context to 8,000 tokens. For the second hour, assume 40,000 additional input tokens instead of 80,000.

```
First hour cost:       # TODO (same as scenario 3, first half)
Second hour input tokens with compact: # TODO
Second hour cost:      # TODO
Total with compact:    # TODO
Savings vs no compact: # TODO
```

---

**Scenario 5:** Your team is evaluating whether to use Opus or Sonnet for a complex reasoning task. Each request: 3,000 input tokens, 2,000 output tokens, 500 requests/day.

```
Daily cost on Opus:    # TODO
Daily cost on Sonnet:  # TODO
Monthly savings (Sonnet vs Opus): # TODO
```
