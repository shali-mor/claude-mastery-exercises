# Exercise: Parallel Sub-agents

## Goal
Design and document a parallel PR review system using 3 concurrent sub-agents.

---

## Task 1: Design the fan-out (10 min)

Open `starter/parallel-pr-review.md` and fill in the orchestrator design:

1. **Input**: a PR diff (provided as text)
2. **Fan-out**: describe the 3 sub-agents and their specialisations:
   - Agent A: TODO (what does it focus on?)
   - Agent B: TODO
   - Agent C: TODO
3. **Fan-in**: how does the orchestrator combine the 3 results into one review?
4. **Output format**: what does the final review look like?

---

## Task 2: Write the orchestrator CLAUDE.md (10 min)

Complete `starter/CLAUDE.md` describing the parallel PR review system for a new Claude session starting the task.

Include:
- What the system does
- How to invoke it (what input is needed)
- The 3 sub-agent roles and their output formats
- How to aggregate the results

---

## Task 3: Cost analysis (5 min)

Complete `starter/cost-analysis.md`:
- Sequential: 3 agents one by one — what's the wall-clock time and cost?
- Parallel: all 3 at once — what's the wall-clock time and cost?
- Fill in the comparison table

---

## Validation

`bash check.sh`
