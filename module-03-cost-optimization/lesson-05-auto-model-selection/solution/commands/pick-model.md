# Pick Model

Analyse and score this task for model selection: $ARGUMENTS

Score the task across 5 dimensions (0–2 each):

| Dimension | 0 (low) | 1 (medium) | 2 (high) |
|-----------|---------|------------|----------|
| Complexity | trivial (classify, extract, translate) | moderate (summarise, draft, analyse) | deep reasoning (architecture, research, legal) |
| Context size | < 10K tokens | 10–100K tokens | 100K+ tokens |
| Output quality | draft OK | good quality | publication or production-grade |
| Latency | background (async OK) | < 5s | < 1s (real-time streaming) |
| Stakes | low (internal, reversible) | medium (customer-facing) | high (legal, medical, prod-critical) |

**Routing rules:**
- Score **0–3** → `claude-haiku-4-5-20251001` (30× cheaper, great for simple tasks)
- Score **4–6** → `claude-sonnet-4-6` (balanced power and cost)
- Score **7–10** → `claude-opus-4-6` (maximum capability, use sparingly)

Fill in the table for the given task, compute the total, and output:
1. The completed score table
2. Total score: X/10
3. Recommended model with one-line justification

Example output format:
```
| Dimension     | Score | Reason              |
|---------------|-------|---------------------|
| Complexity    |   1   | moderate analysis   |
| Context size  |   0   | short input         |
| Output quality|   1   | customer-facing     |
| Latency       |   0   | background job      |
| Stakes        |   1   | medium (user-facing)|
| **Total**     | **3** |                     |

→ claude-haiku-4-5-20251001: Score 3/10 — straightforward task, no deep reasoning needed
```
