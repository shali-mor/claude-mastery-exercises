# daily-standup

# This "skill" runs automatically at 9am every day to remind the user of their standup.
# It reads the git log and summarises yesterday's commits.

# PROBLEM: This logic requires automatic, timed triggering.
# Skills only fire when the user explicitly types /daily-standup.
# A SessionStart hook or a cron job would be the right tool.

Summarise my git commits from the last 24 hours in standup format:
- What I did yesterday
- What I plan to do today
- Any blockers

Run: git log --since="24 hours ago" --oneline --author="$(git config user.name)"
