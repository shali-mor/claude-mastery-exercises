# Exercise: Parallel Analysis Agents

## Goal
Build the three analysis agents and the orchestrator that runs them.

---

## Task 1: Complete 3 agent prompts (20 min)

Open `starter/agent-prompts/`:
Complete each agent prompt file — they must all return structured JSON.

**security-agent.md**:
- Check for: SQL injection, auth bypass, secrets exposure, OWASP Top 10
- Output JSON: `{ agent: "security", findings: [...], risk_level: "high|medium|low|none" }`

**quality-agent.md**:
- Check for: code duplication, complexity, naming, missing error handling
- Output JSON: `{ agent: "quality", issues: [...], score: 1-10 }`

**test-agent.md**:
- Check for: missing tests, untested edge cases, test quality
- Output JSON: `{ agent: "tests", coverage_gaps: [...], recommendation: "..." }`

---

## Task 2: Result aggregator (10 min)

Complete `starter/aggregator.ts`:
Takes 3 agent JSON results and produces a final Markdown PR review comment.

---

## Validation

`bash check.sh`
