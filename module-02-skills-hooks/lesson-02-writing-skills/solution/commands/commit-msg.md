---
description: Generate a conventional commit message from staged changes
---

# /commit-msg

Analyse the staged git diff and write a conventional commit message.

Run `git diff --staged` first to understand what changed.

Format: `type(scope): short description`

**Types:** feat | fix | docs | style | refactor | test | chore | perf

**Rules:**
- Scope is optional but recommended (e.g. `auth`, `api`, `ui`)
- Description in present tense, lowercase, no trailing period
- Body (after blank line) explains the WHY, not the what
- Add `BREAKING CHANGE: description` footer if the public API changes
- Keep the subject line under 72 characters

Output just the commit message, ready to copy-paste.
