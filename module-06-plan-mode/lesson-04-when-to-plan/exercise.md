# Exercise: When to Use Plan Mode

## Goal
Create a personal and team policy for when Plan Mode is required.

---

## Task 1: Decision tree (10 min)

Complete `starter/decision-tree.md`:
Draw (ASCII or Markdown) a decision tree that answers:
**"Should I use Plan Mode for this task?"**

Key decision points to include:
- Is the task irreversible?
- Does it touch > 3 files?
- Is the blast radius unknown?
- Is it a production system?
- Is it a learning/exploration task?

---

## Task 2: Team CLAUDE.md section (10 min)

Open `starter/CLAUDE.md-section.md` and write the "Plan Mode Policy" section you would add to your team's CLAUDE.md:
- When planning is **required**
- When planning is **optional**
- When planning is **unnecessary**

---

## Task 3: Enforcement hook (10 min)

Complete `starter/hooks/require-plan.sh`:
A `PreToolUse` hook that:
1. Checks if the tool being used is `Write` or `Edit`
2. If so, checks if a `PLAN.md` file exists in the current directory
3. If no PLAN.md: print an error message and exit 2 (block)
4. If PLAN.md exists: exit 0 (allow)

---

## Validation

`bash check.sh`
