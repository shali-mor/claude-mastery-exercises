# Lesson 03: Parallel Analysis Agents

Implement the 3 parallel sub-agents at the heart of the capstone pipeline.

## What you'll build
- Security review agent prompt + parser
- Code quality agent prompt + parser
- Test coverage agent prompt + parser
- An orchestrator that fans out and collects results

## Key concepts
- Each agent is launched with `run_in_background: true`
- Each agent returns structured JSON (wrapped in ```json ... ```)
- The orchestrator waits for all 3 then aggregates
- Prompt caching: the long system prompt for each agent uses `cache_control`

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
