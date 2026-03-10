# Model Scoring Worksheet

| Dimension | Classify email as spam/not-spam | Summarise a 200-page PDF | Debug a production outage | Write a legal contract review | Generate a weekly status report |
|-----------|--------------------------------|--------------------------|---------------------------|-------------------------------|--------------------------------|
| Complexity | 0 (trivial binary) | 1 (moderate) | 2 (deep reasoning) | 2 (high expertise) | 1 (moderate) |
| Context size | 0 (< 10K) | 2 (100K+ doc) | 1 (logs + code) | 2 (long contract) | 0 (structured data) |
| Output quality | 0 (draft OK) | 1 (good) | 2 (must be correct) | 2 (legal-grade) | 1 (good) |
| Latency | 0 (background) | 0 (background) | 2 (urgent) | 0 (background) | 0 (background) |
| Stakes | 1 (medium) | 0 (low) | 2 (production) | 2 (legal) | 0 (internal) |
| **Total** | **1** | **4** | **9** | **8** | **2** |
| **Model** | Haiku | Sonnet | Opus | Opus | Haiku |
