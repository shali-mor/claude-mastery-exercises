# Batch API Cost Comparison

## Scenario
- Tickets to process: **1,000**
- Model: `claude-haiku-4-5-20251001`
- Average tokens per ticket: ~50 input + ~5 output

## Pricing (Haiku)
- Input: $0.80 per million tokens
- Output: $4.00 per million tokens
- Batch discount: **50% off**

## Real-time API Cost
```
Input:  50,000 tokens × $0.80/M = $0.040
Output:  5,000 tokens × $4.00/M = $0.020
Total:  $0.060
```

## Batch API Cost
```
Input:  50,000 tokens × $0.80/M × 0.5 = $0.020
Output:  5,000 tokens × $4.00/M × 0.5 = $0.010
Total:  $0.030
```

## Savings
```
Saved: $0.030 (50%)
```

## When to use Batch API
- ✅ Nightly content classification pipelines
- ✅ Bulk document summarisation / embedding generation
- ✅ Background sentiment analysis on historical data
- ❌ Real-time chat (user is waiting for response)
- ❌ Time-sensitive alerts or monitoring
