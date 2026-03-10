# Exercise: Building a Skills Library

## Goal
Create a polished, documented skills library that any team member can drop into their project.

---

## Task 1: Complete the skill stubs (20 min)

Open each file in `starter/commands/` and replace every `TODO:` with real skill content.

### Skills to complete:

**`changelog.md`** — Generate a CHANGELOG entry
- Input: `$ARGUMENTS` = version number (e.g. `1.2.0`)
- Read `git log --oneline` since last tag
- Output formatted Markdown with Added / Changed / Fixed / Breaking sections

**`debug-plan.md`** — Structured debugging checklist
- Read the error message from `$ARGUMENTS`
- Output: hypothesis list, what to check first, suggested `console.log` placements, related files to inspect

**`refactor-check.md`** — Refactor safety review
- Run on a file path passed via `$ARGUMENTS`
- Check: any callers that will break, test coverage gaps, naming improvements, complexity hot-spots

**`env-audit.md`** — Environment variable audit
- Read `.env.example` (or equivalent)
- For each var: is it documented? Is it validated at startup? Is it used anywhere?

---

## Task 2: Skills index (5 min)

Edit `starter/SKILLS.md` — replace TODOs with a table listing each skill, its trigger, and one-line description.

---

## Task 3: Meta-skill (10 min)

Complete `starter/commands/new-skill.md` — a skill that, when given a name and description via `$ARGUMENTS`, generates a correctly-formatted new skill file and suggests where to save it.

---

## Validation

`bash check.sh`
