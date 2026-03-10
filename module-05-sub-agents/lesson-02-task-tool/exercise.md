# Exercise: The Task Tool

## Goal
Write well-crafted Task tool invocations with complete, self-contained prompts.

---

## Task 1: Fix the bad prompts (15 min)

Open `starter/prompt-fixes.md`. Each example shows a bad Task prompt.
Rewrite each one to be self-contained and effective:

**Bad prompt 1:** `"Review the auth code"`
**Bad prompt 2:** `"Write tests for it"`
**Bad prompt 3:** `"Check if this is secure"`

For each, write a good version that includes:
- Clear goal statement
- Specific file paths to read
- Expected output format
- Any constraints (length, model, style)

---

## Task 2: Complete Task invocation templates (10 min)

Open `starter/task-templates.md` and fill in the complete Task tool call for each scenario:
1. **Security audit** — review `src/api/auth.ts` for vulnerabilities, run in background with Haiku
2. **Test generator** — generate Vitest unit tests for `src/lib/utils.ts`, sequential
3. **Doc writer** — generate JSDoc for all exported functions in `src/lib/`, use Sonnet

---

## Validation

`bash check.sh`
