# Exercise: Messages API Fundamentals

## Goal
Build a working API client that sends messages and maintains conversation history.

---

## Task 1: First API call (10 min)

Open `starter/hello-claude.ts` and complete the TODOs:
1. Import and initialise the Anthropic client
2. Call `client.messages.create()` with model, max_tokens, and a user message
3. Print the response text

Run it: `npx ts-node hello-claude.ts`

---

## Task 2: Multi-turn chat (15 min)

Open `starter/chat.ts` and implement a conversation loop:
1. Maintain a `messages` array
2. After each assistant reply, append `{ role: 'assistant', content: reply }` to the array
3. Then append the next user message and call the API again
4. Hold a 3-turn conversation about a topic of your choice

---

## Task 3: System prompts (5 min)

Modify `starter/chat.ts` to add a system prompt that gives Claude a persona (e.g., "You are a pirate who only speaks in nautical metaphors"). Verify the persona holds across multiple turns.

---

## Validation

`bash check.sh`
