# Exercise: Shell Scripts & Cron Jobs

## Goal
Build three production shell automations using `claude -p`.

---

## Task 1: Daily code review script (10 min)

Complete `starter/daily-review.sh`:
- Find all `.ts` files changed in the last 24 hours using `git diff`
- For each changed file, pipe it to `claude -p "Review this TypeScript file for bugs, security issues, and code style problems. Be concise."`
- Save the review to `~/.claude-reviews/YYYY-MM-DD-filename.md`
- Print a summary at the end

---

## Task 2: Crontab setup (5 min)

Complete `starter/crontab.txt` with entries that run:
1. `daily-review.sh` every weekday at 7am
2. A `weekly-changelog.sh` every Monday at 8am
3. A cleanup of old reviews older than 30 days every Sunday at midnight

---

## Task 3: Commit hook (10 min)

Complete `starter/hooks/prepare-commit-msg`:
A git hook that uses `claude -p` to suggest a commit message based on the staged diff.
If the user already wrote a message (non-empty), skip the suggestion.

---

## Validation

`bash check.sh`
