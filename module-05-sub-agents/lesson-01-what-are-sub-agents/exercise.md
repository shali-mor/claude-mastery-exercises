# Exercise: What Are Sub-agents?

## Goal
Build a clear mental model of the orchestrator/sub-agent pattern before writing any code.

---

## Task 1: Classification worksheet (10 min)

Open `starter/classification.md` and for each scenario, decide:
- Should this use **sub-agents** or a **single direct call**?
- If sub-agents: sequential or parallel?
- Fill in your reasoning

---

## Task 2: Architecture diagram (10 min)

Open `starter/architecture.md` and draw (in ASCII or Markdown) the flow for this system:
> *"An orchestrator receives a GitHub PR URL, then simultaneously: (1) asks a sub-agent to summarise the diff, (2) asks a sub-agent to check for security issues, (3) asks a sub-agent to suggest test cases. It collects all three results and writes a final review comment."*

---

## Task 3: Limitations list (5 min)

Open `starter/limitations.md` and complete the table of sub-agent trade-offs (cost, latency, context isolation, error handling).

---

## Validation

`bash check.sh`
