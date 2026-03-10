# Lesson 01: Shell Scripts & Cron Jobs

Automate Claude with `claude -p` in shell scripts and scheduled cron jobs.

## What you'll build
- A daily code review script using `claude -p`
- A weekly changelog generator run by cron
- A git hook that runs Claude on every commit

## Key concepts
- `claude -p "prompt"` runs Claude in one-shot mode and prints the response
- Pipe input: `cat file.ts | claude -p "review this code"`
- Use in cron: `0 9 * * 1-5 /usr/local/bin/claude -p "morning standup" >> /tmp/standup.log`
- Exit codes: 0 = success, non-zero = error
- Combine with other tools: `git log | claude -p "format as standup" | slack-notify`

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
