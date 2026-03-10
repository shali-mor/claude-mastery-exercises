# Lesson 04: Batch API

Cut costs by 50% on async workloads using the Anthropic Batch API.

## What you'll build
- A batch classifier that processes 100 support tickets in one API call
- A cost comparison script showing batch vs real-time pricing
- A polling loop that waits for batch results and processes them

## Key concepts
- `client.messages.batches.create()` accepts up to 10,000 requests at once
- 50% cost reduction vs the standard Messages API
- Results are async — poll with `client.messages.batches.retrieve(batchId)`
- Each request in the batch has a `custom_id` so you can match results to inputs
- Best for: classification, summarisation, embedding at scale (not user-facing requests)

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
