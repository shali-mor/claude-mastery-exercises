# Lesson 01: Designing the Capstone Pipeline

Architect a production-grade multi-agent PR analysis pipeline.

## What you'll build
- A complete architecture diagram for the capstone system
- A settings.json with GitHub MCP + prompt caching hooks
- A design document covering all pipeline stages

## The capstone system
- **Trigger**: GitHub PR opened/updated webhook
- **Orchestrator**: fetches PR metadata and diff via GitHub MCP
- **3 parallel agents**: security review, code quality, test coverage check
- **Prompt caching**: system prompt cached for 90% cost reduction on repeated runs
- **n8n**: posts the combined review as a GitHub PR comment

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
