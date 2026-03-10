# Lesson 05: Auto Model Selection

Build a smart routing layer that picks the right Claude model for each task automatically.

## What you'll build
- A `/pick-model` skill that scores tasks across 5 dimensions and recommends Haiku/Sonnet/Opus
- A `model-guard.sh` hook that warns when a premium model is used for a simple task
- A scoring rubric you can adapt for your own workflows

## Key concepts
- Not every task needs Opus — Haiku is 30× cheaper and great for simple tasks
- Score tasks on: complexity, context size, reasoning depth, output quality, latency needs
- Use hooks to enforce model hygiene at the team level
- The right model = best output per dollar, not just the most capable model

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
