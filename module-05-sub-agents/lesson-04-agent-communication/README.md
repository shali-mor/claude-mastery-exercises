# Lesson 04: Agent Communication Patterns

Design robust data flow between orchestrators and sub-agents.

## What you'll build
- A shared file-based communication pattern
- A result schema that sub-agents must follow
- An orchestrator that validates and aggregates sub-agent outputs

## Key concepts
- Sub-agents communicate results via their return text — no shared state
- Use structured output (JSON) so the orchestrator can parse reliably
- Define a result schema up-front and enforce it in every sub-agent prompt
- Error handling: what happens when a sub-agent fails or returns malformed output?
- The orchestrator's prompt should specify exactly what format it expects back

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
