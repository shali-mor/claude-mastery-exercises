# Lesson 01: Messages API Fundamentals

Make your first real Anthropic API call and understand the request/response structure.

## What you'll build
- A TypeScript client that calls `client.messages.create()`
- A multi-turn conversation loop with message history
- Role-based message handling (user/assistant)

## Key concepts
- Every call needs: `model`, `max_tokens`, `messages`
- `messages` is an array of `{ role, content }` objects
- The assistant's response is always `response.content[0].text`
- Build multi-turn by appending each exchange to the messages array

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
