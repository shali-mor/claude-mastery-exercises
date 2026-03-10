# Exercise: Streaming Responses

## Goal
Build a streaming client and a streaming API endpoint.

---

## Task 1: Basic streaming (10 min)

Complete `starter/stream-basic.ts`:
1. Use `client.messages.stream()` instead of `client.messages.create()`
2. Listen to `stream.on('text', ...)` and write each chunk to `process.stdout`
3. After streaming, call `stream.finalMessage()` and log input/output token counts
4. Ask Claude to "write a haiku about TypeScript" and watch it appear token by token

---

## Task 2: Streaming with abort (10 min)

Complete `starter/stream-abort.ts`:
1. Start a long streaming request (ask Claude for "a 500-word story")
2. After 2 seconds, call `stream.abort()` to cancel
3. Log how many tokens were received before abort

---

## Task 3: Streaming Express endpoint (15 min)

Complete `starter/stream-server.ts`:
- `POST /chat` — accepts `{ message: string }` in body
- Sets headers: `Content-Type: text/event-stream`, `Cache-Control: no-cache`
- Streams Claude's response as SSE: `data: <chunk>\n\n`
- Sends `data: [DONE]\n\n` when finished

Test with: `curl -X POST http://localhost:3000/chat -d '{"message":"Hello"}' -H 'Content-Type: application/json'`

---

## Validation

`bash check.sh`
