---
description: Generate a conventional commit message from staged changes
---

# /commit-msg

TODO: Write a skill that generates a conventional commit message.

Requirements:
- Read staged changes via git diff --staged
- Format: type(scope): description
- Valid types: feat | fix | docs | style | refactor | test | chore | perf
- Body explains the WHY, not the what
- Flag breaking changes with BREAKING CHANGE: footer
- Description in present tense, lowercase, no period
