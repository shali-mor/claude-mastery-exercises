# Exercise: Prompt Engineering for Automation

## Goal
Write reliable, deterministic prompts for automated workflows.

---

## Task 1: Prompt template library (15 min)

Complete `starter/prompt-library.md` with prompts for:

1. **Email classifier**: input = email text, output = JSON `{ category, priority, summary }`
2. **Code review**: input = diff, output = JSON `{ issues: [{ line, severity, message }], approved: bool }`
3. **Meeting notes**: input = transcript, output = JSON `{ summary, action_items: [], decisions: [] }`
4. **Sentiment analyser**: input = review text, output = JSON `{ sentiment, score, keywords: [] }`
5. **Release notes**: input = git log, output = Markdown with Added/Fixed/Breaking sections

---

## Task 2: Edge case test cases (5 min)

For the email classifier prompt, complete `starter/test-cases.md`:
Write 5 edge case inputs and the expected output for each.

---

## Task 3: Output validator (10 min)

Complete `starter/output-validator.ts`:
A function that takes Claude's raw response text and validates it matches the expected JSON schema.
If invalid: return `{ valid: false, error: "..." }`.
If valid: return `{ valid: true, data: ... }`.

---

## Validation

`bash check.sh`
