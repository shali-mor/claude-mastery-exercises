# Exercise: Real-World n8n Workflows

## Goal
Design 3 production-ready workflow blueprints.

---

## Task 1: Daily Standup Generator (15 min)

Complete `starter/standup-workflow.md`:

Design a workflow that runs at 9am Mon-Fri:
1. Runs `git log --since="24 hours ago" --oneline` via SSH or local command
2. Sends the commits to Claude with prompt: "Format these commits as a developer standup update"
3. Posts the result to Slack #standup channel
4. Includes error handling if git log fails

---

## Task 2: Support Ticket Classifier (15 min)

Complete `starter/ticket-classifier-workflow.md`:

Webhook trigger (new Zendesk ticket) → Claude classifies as billing/bug/feature/support → updates ticket label via API

---

## Task 3: Error handling patterns (5 min)

Complete `starter/error-handling.md`:
Describe how to handle these failure scenarios in n8n:
- Claude API returns 429 (rate limit)
- Webhook payload is malformed
- Downstream Slack post fails

---

## Validation

`bash check.sh`
