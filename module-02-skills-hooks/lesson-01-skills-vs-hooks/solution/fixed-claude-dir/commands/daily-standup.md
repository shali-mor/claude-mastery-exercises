---
description: Summarise yesterday's commits in standup format
---

# /daily-standup

Summarise my git commits from the last 24 hours in standup format.

Run: git log --since="24 hours ago" --oneline --author="$(git config user.name)"

Then format the output as:
**Yesterday:** [bullet list of commits]
**Today:** [ask me what I plan to do]
**Blockers:** [ask me if I have any]
