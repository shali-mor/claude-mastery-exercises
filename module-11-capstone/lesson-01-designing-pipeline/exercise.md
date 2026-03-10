# Exercise: Designing the Capstone Pipeline

## Goal
Design the full capstone system before writing a single line of code.

---

## Task 1: Architecture diagram (15 min)

Complete `starter/architecture.md`:
Draw the complete system flow:
1. GitHub webhook → n8n trigger
2. n8n → Orchestrator Claude (with GitHub MCP) → fetches diff
3. Orchestrator → 3 parallel sub-agents (security, quality, tests)
4. Orchestrator collects results → composes final review
5. n8n → GitHub API → post PR comment

---

## Task 2: settings.json design (10 min)

Complete `starter/settings.json` for the orchestrator session:
- GitHub MCP server configured
- Prompt caching hook (PostToolUse) that logs cache hit rates
- `defaultMode: bypassPermissions` for unattended CI mode

---

## Task 3: Cost estimate (5 min)

Complete `starter/cost-estimate.md`:
Estimate the cost per PR review:
- Orchestrator: ~5K input tokens (with cache after first run)
- 3 sub-agents: ~3K tokens each
- n8n: free (self-hosted)
- Prompt caching saves: 90% of repeated system prompt tokens

---

## Validation

`bash check.sh`
