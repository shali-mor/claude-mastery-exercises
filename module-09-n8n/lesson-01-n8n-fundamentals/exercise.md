# Exercise: n8n Fundamentals

## Goal
Build and document your first n8n workflows.

---

## Task 1: Workflow design (15 min)

Open `starter/workflow-design.md` and design (in text) a workflow that:
1. Triggers every morning at 8am
2. Fetches the top 5 Hacker News stories (use their API)
3. Sends each story title to a Slack channel

For each step, specify:
- Node type
- Configuration needed
- Data flow (what data passes to the next node)

---

## Task 2: n8n concepts quiz (5 min)

Complete `starter/concepts-quiz.md` — match n8n concepts to their definitions.

---

## Task 3: Credential setup plan (5 min)

Complete `starter/credential-setup.md`:
List the credentials you'd need to configure for a workflow that:
- Reads from GitHub
- Calls Claude API
- Posts to Slack
- Writes to Google Sheets

For each credential: name, type, required fields.

---

## Validation

`bash check.sh`
