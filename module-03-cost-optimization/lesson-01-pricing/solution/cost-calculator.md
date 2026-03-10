# Cost Calculator — Solutions

**Scenario 1:** Chatbot, Sonnet 4.6, 10,000 requests/day.
```
Daily input tokens:    20,000,000  (2,000 * 10,000)
Daily output tokens:    5,000,000  (500 * 10,000)
Daily input cost:         $60.00   (20M / 1M * $3.00)
Daily output cost:        $75.00   (5M / 1M * $15.00)
Daily total:             $135.00
Monthly total (~30d):  $4,050.00
```

**Scenario 2:** Nightly batch, Haiku 4.5, 50,000 tickets.
```
Total input tokens:    10,000,000  (200 * 50,000)
Total output tokens:    1,000,000  (20 * 50,000)
Total cost (Haiku):        $12.00  (10M * $0.80/M + 1M * $4.00/M)
Cost if using Sonnet:      $45.00  (10M * $3.00/M + 1M * $15.00/M)
Savings from Haiku:           73%
```

**Scenario 3:** Claude Code session, 2 hours, Sonnet 4.6.
```
Session input cost:        $0.24   (80,000 / 1M * $3.00)
Session output cost:       $0.075  (5,000 / 1M * $15.00)
Session total:             ~$0.315
```

**Scenario 4:** Same session with /compact.
```
First hour (40K input, 2.5K output): ~$0.158
Second hour with compact (40K input instead of 80K): ~$0.158
Total with compact: ~$0.316  (similar total but context was lower each turn)
Note: Real savings come from reduced context per subsequent turn in the second hour.
```

**Scenario 5:** Opus vs Sonnet, 500 req/day.
```
Daily cost on Opus:    $120.00  (500 * 3K * $15/M + 500 * 2K * $75/M)
Daily cost on Sonnet:   $19.50  (500 * 3K * $3/M + 500 * 2K * $15/M)
Monthly savings (Sonnet vs Opus): ~$3,015
```
