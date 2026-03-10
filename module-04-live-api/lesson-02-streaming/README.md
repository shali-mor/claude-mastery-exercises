# Lesson 02: Streaming Responses

Stream Claude's output token-by-token for a snappy, real-time user experience.

## What you'll build
- A streaming client using `client.messages.stream()`
- A terminal progress display with token counting
- A streaming Express endpoint ready for production

## Key concepts
- `client.messages.stream()` returns an async event emitter
- Listen for `stream.on('text', chunk => ...)` for incremental tokens
- `stream.finalMessage()` gives you the complete response after streaming ends
- Streaming is essential for any UI where users see text appearing live

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
