# Lesson 01: n8n Fundamentals

Learn n8n's core concepts: nodes, workflows, credentials, and triggers.

## What you'll build
- A simple n8n workflow that sends a prompt to Claude and prints the response
- A credential setup for the Anthropic API
- A workflow that runs on a schedule (cron)

## Key concepts
- n8n is open-source workflow automation (like Zapier but self-hosted) — [n8n.io](https://n8n.io)
- **Nodes**: individual steps in a workflow (HTTP Request, Code, Schedule, Telegram, etc.)
- **Triggers**: what starts a workflow (webhook, schedule, manual button)
- **Credentials**: securely stored API keys referenced by name in nodes
- Claude API in n8n: use HTTP Request node + Header Auth credential (`x-api-key`)

## Quick start: import the starter workflow

1. n8n → **Workflows** → **⊕ Add Workflow**
2. Click **⋯ menu** → **Import from File**
3. Select `workflow/hello-claude-workflow.json`
4. Create an **Anthropic credential** (see below), wire it to the Claude API node
5. Click **Execute Workflow** — Claude's reply appears in the Extract Response node output

### Create the Anthropic credential
- n8n → **Settings** → **Credentials** → **New** → search **"Header Auth"**
- Name: `Anthropic` · Header name: `x-api-key` · Value: your key from [console.anthropic.com](https://console.anthropic.com)

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
