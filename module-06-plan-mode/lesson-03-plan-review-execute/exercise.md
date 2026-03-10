# Exercise: Plan → Review → Execute

## Goal
Write a complete plan, review it critically, then execute it on a sample codebase.

---

## Task 1: Write the plan (15 min)

Open `starter/plan.md`. The task is:
> Refactor `starter/app/auth.ts` to extract token validation into a separate `token-validator.ts` module, update all imports, and add unit tests.

Write a complete plan covering:
- Files to create, modify, and delete
- Step-by-step order of changes
- How to verify each step
- Rollback strategy if something breaks

---

## Task 2: Review checklist (5 min)

Open `starter/review-checklist.md` and check off each item for your plan.
Flag any items you can't check — these are risks to address before executing.

---

## Task 3: Execute and log (15 min)

Actually implement the refactoring in `starter/app/`:
1. Create `starter/app/token-validator.ts`
2. Update `starter/app/auth.ts` to import from it
3. Verify `starter/app/auth.test.ts` still passes (review it manually)

Then update `starter/execution-log.md` with what actually happened vs the plan.

---

## Validation

`bash check.sh`
