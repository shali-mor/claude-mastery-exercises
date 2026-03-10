# Exercise: Agent Communication Patterns

## Goal
Design a robust communication contract between an orchestrator and its sub-agents.

---

## Task 1: Define the result schema (10 min)

Open `starter/result-schema.json` and define a JSON schema for a code review sub-agent's output:
- `agent_id`: string — which agent produced this
- `status`: "success" | "error"
- `findings`: array of `{ severity, file, line, message, suggestion }`
- `summary`: string — one-paragraph overview
- `error`: string | null — error message if status is "error"

---

## Task 2: Sub-agent prompt template (10 min)

Complete `starter/sub-agent-prompt.md` — a template for a security review sub-agent that:
1. States its role clearly
2. Lists exactly what files to read
3. Specifies the exact JSON output format (matching your schema)
4. Instructs it to wrap output in ```json ... ``` so the orchestrator can parse it

---

## Task 3: Orchestrator result handler (10 min)

Complete `starter/orchestrator-handler.ts`:
1. Parse the sub-agent's text response to extract the JSON block
2. Validate it against the schema (at minimum: check required fields exist)
3. Handle the error case gracefully (log and continue, don't crash)
4. Aggregate results from multiple agents into a single report

---

## Validation

`bash check.sh`
