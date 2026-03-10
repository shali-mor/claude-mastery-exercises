# Architecture Diagram

Draw the orchestrator → sub-agent flow for this system:

> *"An orchestrator receives a GitHub PR URL, then simultaneously: (1) asks a sub-agent to summarise the diff, (2) asks a sub-agent to check for security issues, (3) asks a sub-agent to suggest test cases. It collects all three results and writes a final review comment."*

```
TODO: Draw your ASCII diagram here

Example structure to fill in:
┌─────────────────────────────────────┐
│         Orchestrator                │
│  Input: GitHub PR URL               │
└──────────────┬──────────────────────┘
               │
   ┌───────────┼───────────┐
   ▼           ▼           ▼
TODO         TODO         TODO
```

## Data flow
- Input to each sub-agent: TODO
- Output from each sub-agent: TODO
- How the orchestrator combines results: TODO
