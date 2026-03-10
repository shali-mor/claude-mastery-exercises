---
description: Check session token usage and advise whether to /compact
---

# /cost-check

TODO: Write a skill that checks the current session token usage.

Requirements:
1. Run /cost to get current token usage
2. Check if input tokens exceed 30,000 (the compact threshold)
3. If above threshold:
   - Say "Your context is large (X tokens). Consider running /compact."
   - Explain the savings: "Compacting now would reduce your context by ~90%,
     saving approximately $Y on every subsequent request."
4. If below threshold:
   - Confirm the session is within normal range
5. Always show:
   - Current input token count
   - Current output token count
   - Active model
   - Estimated session cost so far
