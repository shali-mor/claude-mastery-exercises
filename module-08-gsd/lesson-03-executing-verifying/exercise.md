# Exercise: Executing & Verifying

## Goal
Simulate a GSD execute-verify cycle on a small codebase.

---

## Task 1: Execution log (10 min)

Open `starter/execution-log.md`. Given the PLAN.md from the previous lesson, simulate an execution:
- Mark each task as complete with a commit hash (use fake hashes like `a1b2c3d`)
- Note any deviations from the plan
- Record the actual vs planned time

---

## Task 2: Write a verification report (15 min)

Complete `starter/verification-report.md`:

Use goal-backward analysis on the completed phase:
- State the phase goal
- For each success criterion, verify it's met (yes/no/partial)
- Identify any gaps
- Overall verdict: PASS / FAIL / PARTIAL

---

## Task 3: Rollback plan (5 min)

Complete `starter/rollback-plan.md`:
If task 2 of the phase went wrong and you need to roll back, what exact git commands would you run?

---

## Validation

`bash check.sh`
