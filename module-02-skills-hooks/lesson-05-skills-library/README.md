# Lesson 05: Building a Skills Library

Build a reusable, team-shareable skills library that speeds up any project.

## What you'll build
- A structured `.claude/commands/` library with 6 production-ready skills
- A skill that generates other skills (meta!)
- Documentation so teammates know what's available

## Key concepts
- Skills live in `.claude/commands/*.md` and are invoked as `/skill-name`
- Use `$ARGUMENTS` to pass dynamic input to skills
- Commit to git so every team member inherits the library
- Skills compose — a `/release` skill can call `/pr-checklist` logic internally

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
