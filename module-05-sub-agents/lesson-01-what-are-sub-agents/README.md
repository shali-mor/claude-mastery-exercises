# Lesson 01: What Are Sub-agents?

Understand the mental model behind Claude's sub-agent architecture.

## What you'll build
- A diagram mapping orchestrator → sub-agent relationships
- A classification worksheet for when to use sub-agents vs direct calls
- A mental model document you can reference when designing multi-agent systems

## Key concepts
- The **orchestrator** is the top-level Claude instance that decides what to do
- **Sub-agents** are spawned via the `Task` tool with `subagent_type`, `prompt`, and optional `model`
- Sub-agents run in isolation — they don't share the orchestrator's context window
- Sub-agents can run in parallel (`run_in_background: true`) or sequentially
- Use sub-agents when tasks are: independent, long-running, or need a fresh context

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
