# Lesson 04: Production Patterns

Harden your API integration for reliability, observability, and scale.

## What you'll build
- A resilient client with retry logic, timeouts, and error classification
- A request logger middleware that tracks cost per call
- A rate-limit-aware queue for high-throughput scenarios

## Key concepts
- Use `maxRetries` and `timeout` options on the Anthropic client
- Classify errors: `APIError` (4xx), `RateLimitError` (429), `APIConnectionError` (network)
- Log `usage.input_tokens` + `usage.output_tokens` to track cost
- Wrap calls in a queue with concurrency limits to stay under rate limits

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
