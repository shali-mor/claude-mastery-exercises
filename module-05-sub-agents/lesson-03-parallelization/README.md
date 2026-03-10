# Lesson 03: Parallel Sub-agents

Fan out work across multiple sub-agents running simultaneously.

## What you'll build
- A parallel PR reviewer that runs 3 sub-agents concurrently
- A fan-out/fan-in pattern with result aggregation
- A CLAUDE.md that describes the parallel architecture

## Key concepts
- Launch multiple sub-agents with `run_in_background: true`
- Each sub-agent gets a separate context window — no interference
- Collect results sequentially after all agents complete
- Parallel agents reduce wall-clock time proportionally (3 agents → ~3× faster)
- Beware: parallel agents multiply cost proportionally too

## Exercise
`cat exercise.md`

## Check your work
`bash check.sh`
