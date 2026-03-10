# Lesson 04: Wiring It All Together & Shipping

Connect the pipeline end-to-end and ship it to production.

## What you'll build
- The n8n workflow JSON that wires webhook → orchestrator → PR comment
- A production checklist before going live
- A monitoring dashboard design for the live system

## Key concepts
- Test each component in isolation before connecting
- End-to-end test with a real (or mock) GitHub PR
- Monitor: webhook success rate, Claude API errors, cost per PR, p95 latency
- Observability: structured logs with correlation IDs per PR review
- Rollback: feature flag to disable Claude review if Claude is down

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
