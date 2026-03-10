# Lesson 02: The Task Tool

Learn to delegate work to sub-agents using the Task tool.

## What you'll build
- A CLAUDE.md that describes a multi-agent code review system
- A Task tool invocation template with all required parameters
- A delegation prompt anatomy guide

## Key concepts
- Task tool parameters: `subagent_type`, `prompt`, `model`, `run_in_background`
- The `prompt` must be **self-contained** — the sub-agent has no other context
- Include: goal, relevant file paths, output format, constraints
- `model` lets you use a cheaper model for simple sub-tasks
- Sub-agents can use all the same tools as the orchestrator

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
