# Exercise 2-2: Writing Skills That Work

## Objective
Write four real skills using the patterns from the lesson. Each skill file should be good enough to commit to your own project.

---

## Skill file format (reminder)

```markdown
---
description: One-line description shown in /help
---

# /command-name

Clear objective sentence.

Details, constraints, output format...
```

Place in `.claude/commands/` → becomes `/command-name`
Use `$ARGUMENTS` to accept user input after the command.

---

## Task 1 — Write `/add-jsdoc`
Open `starter/commands/add-jsdoc.md`. Write a skill that:
- Adds JSDoc comments to the function named `$ARGUMENTS`
- Includes `@param`, `@returns`, and optionally `@throws` tags
- Does NOT modify the function body
- Uses TypeScript types from the source where available

Test it:
```
/add-jsdoc fetchUser
```

---

## Task 2 — Fix `/security-review`
Open `starter/commands/security-review.md`. It's currently vague and unreliable.

Rewrite it to be specific:
- List exactly what vulnerabilities to check (SQL injection, XSS, secrets, auth, IDOR)
- Specify output format: filename, line, description, fix for each issue
- Add a "no issues found" fallback
- Scope it to the current git diff

---

## Task 3 — Write `/commit-msg`
Open `starter/commands/commit-msg.md`. Write a skill that:
- Reads staged changes via `git diff --staged`
- Generates a conventional commit message: `type(scope): description`
- Lists valid types: feat | fix | docs | style | refactor | test | chore | perf
- Writes the body explaining WHY (not what)
- Flags breaking changes with `BREAKING CHANGE:` footer

---

## Task 4 — Write `/explain`
Open `starter/commands/explain.md`. Write a skill using `$ARGUMENTS` that:
- Explains `$ARGUMENTS` (a function, file, or concept) in plain English
- Targets a junior developer audience
- Covers: what it does, how it works, why it exists, common pitfalls
- Uses bullet points, stays concise

Test it:
```
/explain the fetchUser function
/explain src/lib/auth.ts
```

---

## Task 5 — Test your skills on the sample file
Open `starter/sample-code/api-client.ts` in a Claude Code session and run all four skills.

---

## Validate
```bash
bash check.sh
```
