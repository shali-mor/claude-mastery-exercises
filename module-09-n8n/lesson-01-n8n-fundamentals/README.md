# Lesson 01: n8n Fundamentals

Learn n8n's core concepts: nodes, workflows, credentials, and triggers.

## What you'll build
- A simple n8n workflow that polls an RSS feed and sends a Slack message
- A credential setup for the Anthropic API
- A workflow that runs on a schedule (cron)

## Key concepts
- n8n is open-source workflow automation (like Zapier but self-hosted)
- **Nodes**: individual steps in a workflow (HTTP Request, Slack, Schedule, etc.)
- **Triggers**: what starts a workflow (webhook, schedule, manual)
- **Credentials**: securely stored API keys referenced by name in nodes
- Claude API in n8n: use HTTP Request node with Anthropic's API endpoint

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
