# Exercise: Entering and Exiting Plan Mode

## Goal
Master Plan Mode controls and build a hook that auto-suggests planning for risky tasks.

---

## Task 1: Cheat-sheet (5 min)

Complete `starter/cheat-sheet.md` — a quick reference for all Plan Mode controls:
- How to enter / exit
- Which tools are available in Plan Mode
- Which tools are blocked in Plan Mode
- The `ExitPlanMode` vs `AskUserQuestion` decision

---

## Task 2: Auto-plan hook (15 min)

Complete `starter/hooks/auto-plan-suggest.sh`:

A `UserPromptSubmit` hook that checks if the user's prompt contains risky keywords:
- "delete", "drop", "rm", "reset", "force push", "truncate", "overwrite"

If any are found: print a suggestion to enter Plan Mode first, then exit 0 (don't block, just warn).

---

## Task 3: Plan Mode journal (5 min)

After doing Tasks 1 & 2, write a short entry in `starter/journal.md`:
- One task where Plan Mode saved you from a mistake
- One task where Plan Mode felt unnecessary
- Your personal rule for when to use it

---

## Validation

`bash check.sh`
