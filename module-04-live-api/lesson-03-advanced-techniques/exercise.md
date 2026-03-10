# Exercise: Advanced API Techniques

## Goal
Implement tool use, vision, and structured outputs.

---

## Task 1: Tool use agent (20 min)

Complete `starter/tool-agent.ts`:

1. Define two tools:
   - `get_weather(city: string)` — returns a mock weather string
   - `calculate(expression: string)` — evaluates a math expression safely

2. Send a message: "What's the weather in Paris and what is 42 * 7?"

3. Handle the `tool_use` response:
   - Check `response.stop_reason === 'tool_use'`
   - Find the tool_use blocks in `response.content`
   - Execute the appropriate function
   - Send back a `tool_result` message

4. Print the final text response

---

## Task 2: Structured JSON output (10 min)

Complete `starter/structured-output.ts`:

Define a tool `extract_person` with JSON schema:
```json
{
  "name": "string",
  "age": "number",
  "email": "string | null"
}
```

Pass several natural-language sentences and extract structured data from each.

---

## Validation

`bash check.sh`
