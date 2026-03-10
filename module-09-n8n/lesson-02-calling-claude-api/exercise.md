# Exercise: Calling Claude API from n8n

## Goal
Configure a working Claude API call inside n8n.

---

## Task 1: HTTP Request node config (15 min)

Complete `starter/http-request-config.json` with a valid n8n HTTP Request node configuration:
- Method: POST
- URL: Anthropic messages endpoint
- Authentication: Header Auth using `ANTHROPIC_API_KEY`
- Headers: `anthropic-version: 2023-06-01`, `content-type: application/json`
- Body: `claude-haiku-4-5-20251001`, `max_tokens: 512`, and the user message from the previous node

---

## Task 2: Response parser (5 min)

Complete `starter/response-parser.md`:
Write the n8n expression to extract:
- The response text: from `$json.content[0].text`
- The input token count
- The output token count
- A cost estimate

---

## Task 3: PR summary workflow (15 min)

Complete `starter/pr-summary-workflow.md`:
Design a full workflow that:
1. Triggers on a GitHub webhook (PR opened)
2. Extracts the PR diff from the webhook payload
3. Calls Claude to summarise it
4. Posts the summary as a PR comment

---

## Validation

`bash check.sh`
