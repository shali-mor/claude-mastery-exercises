# Lesson 03: Webhook-Driven Automation

Build a secure webhook receiver that triggers Claude pipelines.

## What you'll build
- An Express webhook handler with HMAC signature validation
- A webhook-to-Claude pipeline for GitHub push events
- A retry queue for failed Claude calls

## Key concepts
- Always validate webhook signatures: `crypto.createHmac('sha256', secret).update(body).digest('hex')`
- Compare with timing-safe comparison to prevent timing attacks
- Queue failed calls for retry — don't lose events
- Log every webhook: timestamp, event type, payload hash, processing status
- Use environment variables for secrets — never hardcode

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
