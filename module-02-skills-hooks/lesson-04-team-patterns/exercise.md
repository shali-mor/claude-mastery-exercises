# Exercise: Team Patterns & CLAUDE.md

## Goal
Create a production-ready `CLAUDE.md` and team `.claude/` configuration for a fictional SaaS startup.

---

## Context
You're the tech lead at **Acme SaaS** — a Next.js + Supabase startup with 4 engineers.
Your stack: `Next.js 15`, `TypeScript`, `Tailwind CSS`, `Supabase`, `Drizzle ORM`, `Vitest`.

---

## Task 1: Complete CLAUDE.md (15 min)

Open `starter/CLAUDE.md` and fill in every `TODO:` section:

1. **Stack** — list the technologies above with their versions
2. **Key Files** — map the main entry points (app router, DB schema, env vars)
3. **Coding Conventions** — at least 5 rules (naming, imports, error handling, etc.)
4. **What NOT to Do** — at least 4 forbidden patterns (raw SQL, `any` types, etc.)
5. **Running the Project** — dev server, test, lint, build commands
6. **CI/CD Notes** — branch strategy, PR rules, secrets policy

---

## Task 2: Team Settings (5 min)

Open `starter/settings.json` and configure:

1. Set `defaultMode` to `"acceptEdits"` (safe for senior devs)
2. Add `"bash"` to `allowedTools` so scripts can run
3. Block `"WebFetch"` for security (no arbitrary URL fetching in shared CI)
4. Add a `UserPromptSubmit` hook that logs every Claude session start to `~/.claude-sessions.log`

---

## Task 3: Shared Skill (5 min)

Open `starter/commands/pr-checklist.md` and complete the skill so it:
1. Reviews staged changes (`git diff --staged`)
2. Checks that tests pass (`npm test`)
3. Outputs a structured PR description with Summary, Test Plan, and Breaking Changes sections

---

## Validation

Run `bash check.sh` — it will verify:
- [ ] `CLAUDE.md` has all 6 required sections
- [ ] `settings.json` is valid JSON with the correct keys
- [ ] `commands/pr-checklist.md` contains `$ARGUMENTS` or `git diff`
