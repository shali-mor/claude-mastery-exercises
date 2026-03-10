# Exercise: Advanced GSD Workflows

## Goal
Handle complex real-world GSD scenarios: pivots, pauses, and team workflows.

---

## Task 1: Mid-phase pivot (10 min)

Scenario: You're mid-way through Phase 2 (Auth) when a critical security bug is found that requires immediate attention. It's unrelated to auth but must ship before Phase 2 completes.

Complete `starter/pivot-procedure.md`:
- How do you use `/gsd:pause-work` to capture current state?
- How do you use `/gsd:insert-phase` to add the security fix as Phase 2.1?
- How do you resume Phase 2 after the fix ships?

---

## Task 2: Multi-milestone roadmap (10 min)

Complete `starter/multi-milestone-roadmap.md`:
Extend the TimeTrack project from Lesson 01 with 3 milestones:
- v1.0 MVP (existing)
- v1.1 Team Features
- v2.0 Enterprise

For each new milestone, list 2-3 phases.

---

## Task 3: Team GSD setup (10 min)

Complete `starter/team-gsd-setup.md`:
Describe how to set up GSD for a 4-person team:
- What to commit to git (hint: `.planning/`)
- Which hooks to add for team workflow
- How to handle concurrent phases on different branches

---

## Validation

`bash check.sh`
