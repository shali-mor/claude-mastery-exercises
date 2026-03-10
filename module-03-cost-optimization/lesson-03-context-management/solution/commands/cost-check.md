---
description: Check session token usage and advise whether to /compact
---

# /cost-check

Check the current session token usage and advise on context management.

Steps:
1. Run `/cost` to get the current input tokens, output tokens, model, and estimated cost.
2. Check if the input token count exceeds 30,000 tokens.

If input tokens > 30,000:
- Print: "⚠️ Your context is large ([X] tokens). Running /compact is recommended."
- Calculate approximate savings: compact reduces context by ~90%, so each future request saves ~0.9 × (input_tokens / 1,000,000) × [model input price per million].
- Print the estimated savings per request.
- Recommend: "Run /compact now, then continue your work."

If input tokens ≤ 30,000:
- Print: "✓ Context is within normal range ([X] tokens). No action needed."

Always show at the end:
- Active model
- Input tokens used
- Output tokens generated
- Estimated session cost so far
